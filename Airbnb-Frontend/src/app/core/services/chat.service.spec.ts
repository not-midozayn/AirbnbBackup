import { TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { ChatService } from './chat.service';
import { ChatMessage, SendMessageRequest } from '../models/ChatMessage';
import { Conversation } from '../models/Conversation';
import { environment } from '../../../environments/environment';

describe('ChatService', () => {
  let service: ChatService;
  let httpMock: HttpTestingController;
  const baseUrl = `${environment.apiUrl}/chat`;
  const mockUserId = 'user123';

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [ChatService]
    });
    service = TestBed.inject(ChatService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  afterEach(() => {
    httpMock.verify();
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });

  it('should get conversation by ID', () => {
    const mockConversation: ChatMessage[] = [
      { isFromUser: true, content: 'Hello', timestamp: new Date(), conversationId: '123', userId: mockUserId },
      { isFromUser: false, content: 'Hi there', timestamp: new Date(), conversationId: '123', userId: 'bot' }
    ];
    const conversationId = '123';

    service.getConversation(conversationId, mockUserId).subscribe(messages => {
      expect(messages).toEqual(mockConversation);
    });

    const req = httpMock.expectOne(`${baseUrl}/conversation/${conversationId}`);
    expect(req.request.method).toBe('GET');
    req.flush(mockConversation);
  });

  it('should send message', () => {
    const mockRequest: SendMessageRequest = {
      userId: mockUserId,
      message: 'Hello',
      conversationId: 'conv123'
    };

    const mockResponse: ChatMessage = {
      isFromUser: false,
      content: 'Hi there',
      timestamp: new Date(),
      conversationId: 'conv123',
      userId: 'bot'
    };

    service.sendMessage(mockRequest).subscribe(response => {
      expect(response).toEqual(mockResponse);
    });

    const req = httpMock.expectOne(`${baseUrl}/send`);
    expect(req.request.method).toBe('POST');
    expect(req.request.body).toEqual(mockRequest);
    req.flush(mockResponse);
  });

  it('should create new conversation', () => {
    const mockConversationId = 'new123';

    service.createConversation(mockUserId).subscribe(id => {
      expect(id).toBe(mockConversationId);
    });

    const req = httpMock.expectOne(`${baseUrl}/conversation`);
    expect(req.request.method).toBe('POST');
    expect(req.request.body).toEqual({ userId: mockUserId });
    req.flush(mockConversationId);
  });

  it('should get recent conversations', () => {
    const mockConversations: Conversation[] = [{
      id: '123',
      userId: mockUserId,
      createdAt: new Date(),
      lastMessageAt: new Date(),
      title: 'Test Conversation',
      messages: []
    }];

    service.getRecentConversations(mockUserId).subscribe(conversations => {
      expect(conversations).toEqual(mockConversations);
    });

    const req = httpMock.expectOne(`${baseUrl}/conversations/recent`);
    expect(req.request.method).toBe('GET');
    req.flush(mockConversations);
  });
});