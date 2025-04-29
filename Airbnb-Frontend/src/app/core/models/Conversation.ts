import { ChatMessage } from './ChatMessage';

export interface Conversation {
    id: string;
    userId: string;
    createdAt: Date;
    lastMessageAt: Date;
    title: string;
    messages: ChatMessage[];
}
