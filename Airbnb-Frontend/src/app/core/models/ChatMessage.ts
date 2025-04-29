export interface ChatMessage {
    id?: number;
    userId: string;
    isFromUser: boolean;
    content: string;
    timestamp: Date;
    conversationId: string;
}

export interface SendMessageRequest {
    message: string;
    conversationId: string;
}