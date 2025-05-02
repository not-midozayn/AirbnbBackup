import { Component, OnInit, ViewChild, ElementRef, OnDestroy, ChangeDetectorRef, NgZone } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { ChatService } from '../../core/services/chat.service';
import { AuthService } from '../../core/services/auth.service';
import { SendMessageRequest } from './chat-bot.types';
import { ChatMessage } from '../../core/models/ChatMessage';
import { MessageFormatterService } from '../../shared/services/message-formatter.service';
import { SafeHtmlPipe } from '../../shared/pipes/safe-html.pipe';
import { HttpClient } from '@angular/common/http';
import { Conversation } from '../../core/models/Conversation';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-chat-bot',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule, SafeHtmlPipe],
  templateUrl: './chat-bot.component.html',
  styleUrls: ['./chat-bot.component.css']
})
export class ChatBotComponent implements OnInit, OnDestroy {
  environment = environment;
  isOpen = false;
  newMessage = '';
  messages: ChatMessage[] = [];
  currentConversationId: string | null = null;
  isRecording = false;
  mediaRecorder: MediaRecorder | null = null;
  audioChunks: Blob[] = [];
  isLoadingConversation = false;
  private subscriptions: any[] = [];
  private hasShownWelcomeMessage = false;
  isProcessingAudio = false;

  @ViewChild('chatInput') chatInput!: ElementRef<HTMLInputElement>;

  constructor(
    private chatService: ChatService,
    private authService: AuthService,
    private router: Router,
    private messageFormatter: MessageFormatterService,
    private http: HttpClient,
    private cdr: ChangeDetectorRef,
    private ngZone: NgZone
  ) {}

  ngOnInit() {
    // No automatic conversation creation on init
    // Only subscribe to track user auth status
    const sub = this.authService.getCurrentUser().subscribe({
      next: (user) => {
        // Just validate user but don't create conversation
        this.validateUser(user);
      },
      error: (error) => this.handleAuthError(error)
    });
    this.subscriptions.push(sub);
  }

  ngOnDestroy() {
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }

  toggleChat() {
    this.isOpen = !this.isOpen;
    if (this.isOpen) {
      this.authService.getCurrentUser().subscribe({
        next: (user) => {
          if (!user || !user.id) {
            this.messages = [];
            this.addSystemMessage("Hi! Please log in to start a conversation. You can still see how the chat interface works, but your messages won't be saved.");
            return;
          }

          // Don't create a conversation immediately, just show the welcome message if there's no existing conversation
          if (!this.currentConversationId && this.messages.length === 0) {
            this.addSystemMessage("Hello! I'm your Airbnb assistant. How can I help you today?");
          }

          if (this.chatInput) {
            this.chatInput.nativeElement.focus();
          }
        },
        error: (error) => this.handleAuthError(error)
      });
    }
  }

  private createNewConversation() {
    this.isLoadingConversation = true;
    const sub = this.chatService.createConversation().subscribe({
      next: (conversationId) => {
        this.currentConversationId = conversationId;
        this.loadConversation();
        this.isLoadingConversation = false;
      },
      error: (error) => {
        this.handleApiError('Error creating conversation:', error);
        this.isLoadingConversation = false;
      }
    });
    this.subscriptions.push(sub);
  }

  private loadConversation() {
    if (!this.currentConversationId) return;

    this.messages = [];
    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!this.validateUser(user)) return;

        const convSub = this.chatService.getConversation(this.currentConversationId!, user.id).subscribe({
          next: (messages) => {
            if (!messages) {
              this.addSystemMessage('Error loading messages. Please try again.');
              return;
            }
            this.messages = messages;
            setTimeout(() => {
              const chatContainer = document.querySelector('.overflow-y-auto');
              if (chatContainer) {
                chatContainer.scrollTop = chatContainer.scrollHeight;
              }
            });
          },
          error: (error) => this.handleApiError('Error loading conversation:', error)
        });
        this.subscriptions.push(convSub);
      },
      error: (error) => this.handleAuthError(error)
    });
  }

  sendMessage() {
    if (!this.newMessage.trim()) return;

    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!user || !user.id) {
          // For non-logged in users, just show the message in UI without creating a conversation
          this.addUserMessage(this.newMessage);
          this.addSystemMessage("To save your conversations and get personalized assistance, please log in first.");
          this.newMessage = '';
          return;
        }

        // For logged in users, proceed with normal flow
        if (!this.currentConversationId) {
          this.createNewConversationAndSendMessage();
        } else {
          this.sendMessageToApi();
        }
      },
      error: (error) => {
        this.handleAuthError(error);
        this.newMessage = '';
      }
    });
  }

  private createNewConversationAndSendMessage() {
    const sub = this.chatService.createConversation().subscribe({
      next: (conversationId) => {
        this.currentConversationId = conversationId;
        this.sendMessageToApi();
      },
      error: (error) => this.handleApiError('Error creating conversation:', error)
    });
    this.subscriptions.push(sub);
  }

  private sendMessageToApi() {
    if (!this.currentConversationId) return;

    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!user || !user.id) {
          this.handleAuthError(new Error('User not authenticated'));
          return;
        }

        const request: SendMessageRequest = {
          userId: user.id,
          message: this.newMessage.trim(),
          conversationId: this.currentConversationId! // Using non-null assertion since we checked above
        };

        this.addUserMessage(request.message);
        this.newMessage = '';

        const sub = this.chatService.sendMessage(request).subscribe({
          next: (response) => {
            response.content = this.messageFormatter.formatMessage(response.content);
            this.messages.push(response);

            setTimeout(() => {
              const chatContainer = document.querySelector('.overflow-y-auto');
              if (chatContainer) {
                chatContainer.scrollTop = chatContainer.scrollHeight;
              }
            });
          },
          error: (error) => this.handleMessageError(error)
        });
        this.subscriptions.push(sub);
      },
      error: (error) => this.handleAuthError(error)
    });
  }

  async startRecording() {
    if (!('mediaDevices' in navigator) || !('MediaRecorder' in window)) {
      this.addSystemMessage('Audio recording is not supported in this browser.');
      return;
    }
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      this.mediaRecorder = new MediaRecorder(stream);
      this.audioChunks = [];
      this.mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          this.audioChunks.push(event.data);
        }
      };
      this.mediaRecorder.start();
      this.isRecording = true;
    } catch (error) {
      this.addSystemMessage('Error accessing microphone. Please check your permissions.');
    }
  }

  async stopRecording() {
    if (!this.mediaRecorder) return;

    return new Promise<void>((resolve) => {
      this.mediaRecorder!.onstop = () => {
        this.ngZone.run(async () => {
          const audioBlob = new Blob(this.audioChunks, { type: 'audio/mp3' });
          this.isProcessingAudio = true;
          this.cdr.detectChanges();

          try {
            await this.sendAudioMessage(audioBlob);
          } finally {
            this.isProcessingAudio = false;
            this.audioChunks = [];
            this.cdr.detectChanges();
            resolve();
          }
        });
      };

      this.mediaRecorder!.stop();
      this.isRecording = false;
      if (this.mediaRecorder!.stream) {
        this.mediaRecorder!.stream.getTracks().forEach(track => track.stop());
      }
    });
  }

  private async sendAudioMessage(audioBlob: Blob): Promise<void> {
    // Create a new conversation if one doesn't exist
    if (!this.currentConversationId) {
      const sub = this.chatService.createConversation().subscribe({
        next: (conversationId) => {
          this.currentConversationId = conversationId;
          this.sendAudioToServer(audioBlob);
        },
        error: (error) => this.handleApiError('Error creating conversation:', error)
      });
      this.subscriptions.push(sub);
      return;
    }

    await this.sendAudioToServer(audioBlob);
  }

  private async sendAudioToServer(audioBlob: Blob): Promise<void> {
    const formData = new FormData();
    formData.append('audioFile', audioBlob, 'audio.mp3');
    formData.append('conversationId', this.currentConversationId!);

    return new Promise((resolve, reject) => {
      const sub = this.http.post<any>(`${this.chatService.baseUrl}/audio`, formData)
        .subscribe({
          next: (response) => {
            this.ngZone.run(() => {
              if (response && response.transcription) {
                this.newMessage = response.transcription;
                this.sendMessage();
              }
              resolve();
            });
          },
          error: (error) => {
            this.ngZone.run(() => {
              this.addSystemMessage('Error processing audio message. Please try again.');
              this.cdr.detectChanges();
              reject(error);
            });
          }
        });
      this.subscriptions.push(sub);
    });
  }

  endConversation() {
    this.messages = [];
    this.currentConversationId = null;
    this.isOpen = false;
    this.hasShownWelcomeMessage = false;
  }

  showRecentConversations() {
    this.router.navigate(['/conversations']);
  }

  private validateUser(user: { id?: string } | null): user is { id: string } {
    return !!(user && user.id); // Simple boolean check, no side effects
  }

  private addUserMessage(content: string) {
    this.messages.push({
      userId: 'user',
      isFromUser: true,
      content: this.messageFormatter.formatMessage(content),
      timestamp: new Date(),
      conversationId: this.currentConversationId || ''
    });
  }

  private addSystemMessage(content: string) {
    this.messages.push({
      userId: 'system',
      isFromUser: false,
      content: this.messageFormatter.formatMessage(content),
      timestamp: new Date(),
      conversationId: this.currentConversationId || ''
    });
  }

  private handleApiError(prefix: string, error: any) {
    const errorMessage = error.error?.message || 'Please log in to continue.';
    this.addSystemMessage(errorMessage);
  }

  private handleAuthError(error: any) {
    this.addSystemMessage('Error authenticating. Please try logging in again.');
  }

  private handleMessageError(error: any) {
    if (error.status === 401) {
      this.addSystemMessage('Your session has expired. Please log in again.');
    } else {
      this.addSystemMessage(error.error?.message || 'Sorry, there was an error sending your message. Please try again.');
    }
  }
}
