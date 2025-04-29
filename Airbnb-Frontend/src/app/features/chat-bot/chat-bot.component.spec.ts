// import { ComponentFixture, TestBed } from '@angular/core/testing';
// import { ChatBotComponent } from './chat-bot.component';
// import { ChatService } from '../../core/services/chat.service';
// import { AuthService } from '../../core/services/auth.service';
// import { FormsModule } from '@angular/forms';
// import { RouterModule } from '@angular/router';
// import { of, throwError } from 'rxjs';

// describe('ChatBotComponent', () => {
//   let component: ChatBotComponent;
//   let fixture: ComponentFixture<ChatBotComponent>;
//   let mockChatService: jasmine.SpyObj<ChatService>;
//   let mockAuthService: jasmine.SpyObj<AuthService>;

//   const mockUser = {
//     id: 'test-user-id', 
//     email: 'test@example.com',
//     firstName: 'Test',
//     lastName: 'User',
//     dateOfBirth: new Date().toISOString(),
//     profilePictureUrl: null,
//     bio: null,
//     isHost: false,
//     isVerified: false,
//     verificationStatusId: 1,
//     isAdmin: false,
//     lastLogin: null,
//     preferredLanguage: 'en',
//     currencyId: 1,
//     userName: 'testuser',
//     normalizedUserName: 'TESTUSER',
//     normalizedEmail: 'TEST@EXAMPLE.COM',
//     emailConfirmed: false,
//     passwordHash: '',
//     securityStamp: '',
//     concurrencyStamp: '',
//     phoneNumber: null,
//     phoneNumberConfirmed: false,
//     twoFactorEnabled: false,
//     lockoutEnd: null,
//     lockoutEnabled: false,
//     accessFailedCount: 0,
//     currentPassword: '',
//     newPassword: '',
//     confirmPassword: '',
//     createdAt: null,
//     updatedAt: null,
//     bookings: null,
//     currency: null,
//     listings: null,
//     messageRecipients: [],
//     messageSenders: [],
//     payments: [],
//     reviewHosts: [],
//     reviewReviewers: null,
//     verificationStatus: null,
//     wishlists: null
//   };

//   const mockConversationId = 'test-conversation-id';

//   beforeEach(async () => {
//     mockChatService = jasmine.createSpyObj('ChatService', [
//       'createConversation',
//       'sendMessage',
//       'getConversation',
//       'getRecentConversations'
//     ]);
//     mockAuthService = jasmine.createSpyObj('AuthService', ['getCurrentUser']);

//     await TestBed.configureTestingModule({
//       imports: [ChatBotComponent, FormsModule, RouterModule],
//       providers: [
//         { provide: ChatService, useValue: mockChatService },
//         { provide: AuthService, useValue: mockAuthService }
//       ]
//     }).compileComponents();

//     // mockAuthService.getCurrentUser.and.returnValue(of(mockUser));
//     mockChatService.createConversation.and.returnValue(of(mockConversationId));
//     mockChatService.getConversation.and.returnValue(of([]));
//   });

//   beforeEach(() => {
//     fixture = TestBed.createComponent(ChatBotComponent);
//     component = fixture.componentInstance;
//     fixture.detectChanges();
//   });

//   it('should create', () => {
//     expect(component).toBeTruthy();
//   });

//   it('should initialize with a new conversation', () => {
//     expect(mockAuthService.getCurrentUser).toHaveBeenCalled();
//     expect(mockChatService.createConversation).toHaveBeenCalledWith(mockUser.id);
//     expect(mockChatService.getConversation).toHaveBeenCalledWith(mockConversationId, mockUser.id);
//   });

//   it('should toggle chat visibility', () => {
//     expect(component.isOpen).toBeFalse();
//     component.toggleChat();
//     expect(component.isOpen).toBeTrue();
//     component.toggleChat();
//     expect(component.isOpen).toBeFalse();
//   });

//   it('should send message when user is authenticated', () => {
//     const testMessage = 'Hello, world!';
//     component.newMessage = testMessage;
//     component.currentConversationId = mockConversationId;
    
//     mockChatService.sendMessage.and.returnValue(of({
//       userId: mockUser.id,
//       isFromUser: false,
//       content: 'Response message',
//       timestamp: new Date(),
//       conversationId: mockConversationId
//     }));

//     component.sendMessage();

//     expect(mockChatService.sendMessage).toHaveBeenCalledWith({
//       userId: mockUser.id,
//       message: testMessage,
//       conversationId: mockConversationId
//     });
//     expect(component.messages.length).toBe(2); // User message + response
//     expect(component.newMessage).toBe('');
//   });

//   it('should handle auth error when sending message', () => {
//     mockAuthService.getCurrentUser.and.returnValue(throwError(() => new Error('Auth Error')));
//     component.newMessage = 'Test message';
    
//     component.sendMessage();

//     expect(component.messages.length).toBe(1);
//     expect(component.messages[0].content).toContain('Error authenticating');
//   });

//   it('should end conversation and create new one', () => {
//     component.messages = [{ userId: '1', content: 'test', isFromUser: true, timestamp: new Date(), conversationId: '1' }];
//     component.isOpen = true;

//     component.endConversation();
//   });

//   it('should not send message if input is empty', () => {
//     component.newMessage = '   ';
//     component.sendMessage();
//     expect(mockChatService.sendMessage).not.toHaveBeenCalled();
//   });

//   it('should not send message if no conversation ID exists', () => {
//     component.newMessage = 'test message';
//     component.currentConversationId = null;
    
//     mockChatService.createConversation.and.returnValue(of('new-conversation-id'));
//     component.sendMessage();

//     expect(mockChatService.createConversation).toHaveBeenCalled();
//   });

//   it('should handle API error when creating conversation', () => {
//     mockChatService.createConversation.and.returnValue(
//       throwError(() => new Error('API Error'))
//     );
    
//     component.sendMessage();
    
//     expect(component.messages[0].content).toContain('An error occurred');
//   });

//   it('should handle API error when sending message', () => {
//     component.currentConversationId = mockConversationId;
//     component.newMessage = 'test message';
    
//     mockChatService.sendMessage.and.returnValue(
//       throwError(() => ({status: 500, error: {message: 'Server error'}}))
//     );

//     component.sendMessage();
    
//     expect(component.messages[1].content).toContain('Sorry, there was an error');
//   });

//   it('should handle session expired error when sending message', () => {
//     component.currentConversationId = mockConversationId;
//     component.newMessage = 'test message';
    
//     mockChatService.sendMessage.and.returnValue(
//       throwError(() => ({status: 401}))
//     );

//     component.sendMessage();
    
//     expect(component.messages[1].content).toContain('session has expired');
//   });
// });
