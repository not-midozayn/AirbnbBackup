import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChatService } from '../../core/services/chat.service';
import { AuthService } from '../../core/services/auth.service';
import { Conversation } from '../../core/models/Conversation';
import { ChatMessage } from '../../core/models/ChatMessage';
import { MessageFormatterService } from '../../shared/services/message-formatter.service';
import { SafeHtmlPipe } from '../../shared/pipes/safe-html.pipe';

@Component({
  selector: 'app-conversations',
  standalone: true,
  imports: [CommonModule, RouterModule, FormsModule, SafeHtmlPipe],
  templateUrl: './conversations.component.html',
  styleUrls: ['./conversations.component.css']
})
export class ConversationsComponent implements OnInit {
  conversations: Conversation[] = [];
  selectedConversation: Conversation | null = null;
  loading = true;
  error: string | null = null;
  newMessage = '';

  constructor(
    private chatService: ChatService,
    private authService: AuthService,
    private messageFormatter: MessageFormatterService
  ) {}

  ngOnInit() {
    this.loadConversations();
  }

  private loadConversations(): void {
    this.loading = true;
    this.error = null;
  
    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!user?.id) {
          this.error = 'Please log in to view your conversations';
          this.loading = false;
          return;
        }
  
        this.chatService.getMostRecentConversation(user.id).subscribe({
          next: (conversations) => {
            this.conversations = conversations.sort((a, b) => 
              new Date(b.lastMessageAt).getTime() - new Date(a.lastMessageAt).getTime()
            );
            
            if (conversations.length > 0) {
              this.selectConversation(conversations[0]);
            }
            
            this.loading = false;
          },
          error: (error) => {
            console.error('Error loading conversations:', error);
            this.error = 'Failed to load conversations. Please try again.';
            this.loading = false;
          }
        });
      },
      error: (error) => {
        console.error('Error getting current user:', error);
        this.error = 'Error authenticating. Please try logging in again.';
        this.loading = false;
      }
    });
  }

  getLastMessage(conversation: Conversation): string {
    if (!conversation.messages?.length) return 'No messages';
    const lastMessage = conversation.messages[conversation.messages.length - 1];
    const formattedMessage = this.messageFormatter.formatMessage(lastMessage.content);
    // Get first line by splitting on newlines and taking first element
    const firstLine = formattedMessage.split('\n')[0];
    return firstLine;
  }

  sendMessage() {
    if (!this.newMessage.trim() || !this.selectedConversation) return;

    const messageContent = this.newMessage.trim();
    this.newMessage = ''; // Clear input immediately

    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!user?.id) {
          this.error = 'Please log in to send messages';
          return;
        }

        // Add user message immediately to the UI
        const userMessage: ChatMessage = {
          userId: user.id,
          isFromUser: true,
          content: this.messageFormatter.formatMessage(messageContent),
          timestamp: new Date(),
          conversationId: this.selectedConversation!.id
        };

        if (this.selectedConversation?.messages) {
          this.selectedConversation.messages.push(userMessage);
        }

        // Scroll to bottom after adding user message
        setTimeout(() => {
          const messageContainer = document.querySelector('#messageContainer');
          if (messageContainer) {
            messageContainer.scrollTop = messageContainer.scrollHeight;
          }
        });

        const request = {
          userId: user.id,
          message: messageContent,
          conversationId: this.selectedConversation!.id
        };

        this.chatService.sendMessage(request).subscribe({
          next: (message) => {
            if (this.selectedConversation?.messages) {
              message.content = this.messageFormatter.formatMessage(message.content);
              this.selectedConversation.messages.push(message);
              this.selectedConversation.lastMessageAt = message.timestamp;
            }
            // Scroll to bottom after receiving response
            setTimeout(() => {
              const messageContainer = document.querySelector('#messageContainer');
              if (messageContainer) {
                messageContainer.scrollTop = messageContainer.scrollHeight;
              }
            });
          },
          error: (error) => {
            console.error('Error sending message:', error);
            this.error = 'Failed to send message. Please try again.';
          }
        });
      },
      error: (error) => {
        console.error('Error getting current user:', error);
        this.error = 'Error authenticating. Please try logging in again.';
      }
    });
  }

  closeConversation() {
    this.selectedConversation = null;
  }

  selectConversation(conversation: Conversation) {
    this.selectedConversation = conversation;
    
    this.authService.getCurrentUser().subscribe({
      next: (user) => {
        if (!user?.id) {
          this.error = 'Please log in to view messages';
          return;
        }

        this.chatService.getConversation(conversation.id, user.id).subscribe({
          next: (messages) => {
            if (this.selectedConversation) {
              this.selectedConversation.messages = messages.map(msg => ({
                ...msg,
                content: this.messageFormatter.formatMessage(msg.content)
              }));
            }
            // Scroll to bottom of messages when conversation is selected
            setTimeout(() => {
              const messageContainer = document.querySelector('#messageContainer');
              if (messageContainer) {
                messageContainer.scrollTop = messageContainer.scrollHeight;
              }
            });
          },
          error: (error) => {
            console.error('Error loading messages:', error);
            this.error = 'Failed to load messages. Please try again.';
          }
        });
      },
      error: (error) => {
        console.error('Error getting user:', error);
        this.error = 'Error authenticating. Please try logging in again.';
      }
    });
  }
}