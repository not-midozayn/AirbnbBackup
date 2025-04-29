import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, map, catchError, tap } from 'rxjs';
import { ChatMessage, SendMessageRequest } from '../models/ChatMessage';
import { Conversation } from '../models/Conversation';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ChatService {
  public baseUrl = `${environment.apiUrl}/chat`;

  constructor(private http: HttpClient) { }

  getConversation(conversationId: string, userId: string): Observable<ChatMessage[]> {
    console.log(`[ChatService] Fetching conversation: ${conversationId}, URL: ${this.baseUrl}/conversation/${conversationId}`);
    
    if (!conversationId) {
      console.error('[ChatService] Error: conversationId is required');
      throw new Error('conversationId is required');
    }

    return this.http.get<ChatMessage[]>(`${this.baseUrl}/conversation/${conversationId}`).pipe(
      tap(messages => {
        console.log(`[ChatService] Raw response for conversation ${conversationId}:`, messages);
        console.log(`[ChatService] Response type:`, typeof messages);
        console.log(`[ChatService] Is array?`, Array.isArray(messages));
        
        if (!messages || messages.length === 0) {
          console.warn(`[ChatService] Warning: No messages returned for conversation ${conversationId}`);
        } else {
          console.log(`[ChatService] Retrieved ${messages.length} messages`);
          console.log(`[ChatService] First message:`, messages[0]);
          messages.forEach((msg, idx) => {
            console.log(`[ChatService] Message ${idx + 1}:`, {
              id: msg.id,
              content: msg.content,
              isFromUser: msg.isFromUser,
              timestamp: msg.timestamp,
              conversationId: msg.conversationId
            });
          });
        }
      }),
      catchError(error => {
        console.error(`[ChatService] Error fetching conversation ${conversationId}:`, error);
        console.error(`[ChatService] Error details:`, {
          status: error.status,
          statusText: error.statusText,
          error: error.error,
          headers: error.headers?.keys()?.map((key: string) => `${key}: ${error.headers?.get(key)}`)
        });
        throw error;
      })
    );
  }

  getMostRecentConversation(userId: string): Observable<Conversation[]> {
    console.log(`[ChatService] Fetching conversations for user: ${userId}`);
    // Get the authenticated user's conversations
    return this.http.get<Conversation[]>(`${this.baseUrl}/conversations`).pipe(
      map(response => {
        if (!response) {
          console.warn('[ChatService] No conversations returned');
          return [];
        }
        // Ensure we have an array of conversations
        const conversations = Array.isArray(response) ? response : [response];
        // Sort by lastMessageAt in descending order
        return conversations.sort((a, b) => 
          new Date(b.lastMessageAt).getTime() - new Date(a.lastMessageAt).getTime()
        );
      }),
      tap(conversations => {
        console.log('[ChatService] Raw conversations response:', conversations);
        if (conversations && conversations.length > 0) {
          console.log('[ChatService] Number of conversations:', conversations.length);
          conversations.forEach((conv, idx) => {
            console.log(`[ChatService] Conversation ${idx + 1}:`, {
              id: conv.id,
              title: conv.title,
              messagesCount: conv.messages?.length || 0,
              lastMessageAt: conv.lastMessageAt
            });
          });
        } else {
          console.warn('[ChatService] No conversations returned');
        }
      }),
      catchError(error => {
        console.error('[ChatService] Error fetching conversations:', error);
        console.error('[ChatService] Error details:', {
          status: error.status,
          statusText: error.statusText,
          error: error.error
        });
        throw error;
      })
    );
  }

  sendMessage(request: SendMessageRequest): Observable<ChatMessage> {
    console.log(`[ChatService] Sending message:`, request);
    return this.http.post<ChatMessage>(`${this.baseUrl}/send`, request).pipe(
      tap(response => {
        console.log('[ChatService] Message sent successfully, response:', response);
      }),
      catchError(error => {
        console.error('[ChatService] Error sending message:', error);
        console.error('[ChatService] Error details:', {
          status: error.status,
          statusText: error.statusText,
          error: error.error
        });
        throw error;
      })
    );
  }

  createConversation(): Observable<string> {
    console.log('[ChatService] Creating new conversation');
    console.log('[ChatService] POST URL:', `${this.baseUrl}/conversation`);
    return this.http.post<{conversationId: string}>(`${this.baseUrl}/conversation`, {}).pipe(
      tap(response => {
        console.log('[ChatService] Create conversation response:', response);
      }),
      map(response => {
        console.log('[ChatService] New conversation created with ID:', response.conversationId);
        return response.conversationId;
      }),
      catchError(error => {
        console.error('[ChatService] Error creating conversation:', error);
        console.error('[ChatService] Error details:', {
          status: error.status,
          statusText: error.statusText,
          error: error.error
        });
        throw error;
      })
    );
  }
}