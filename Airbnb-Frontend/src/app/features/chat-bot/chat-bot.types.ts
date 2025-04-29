export interface SendMessageRequest {
  userId: string;
  message: string;
  conversationId: string;
}

export interface ChatState {
  isOpen: boolean;
  newMessage: string;
  messages: ChatMessage[];
  currentConversationId: string | null;
}

import { ChatMessage } from '../../core/models/ChatMessage';