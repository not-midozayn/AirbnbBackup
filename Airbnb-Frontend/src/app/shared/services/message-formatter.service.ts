import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MessageFormatterService {
  constructor() {}

  formatMessage(text: string): string {
    if (!text) return '';

    // Format headers
    text = text.replace(/###\s(.+)/g, '<h3 class="text-xl font-bold my-2">$1</h3>');
    text = text.replace(/##\s(.+)/g, '<h2 class="text-2xl font-bold my-3">$1</h2>');
    text = text.replace(/#\s(.+)/g, '<h1 class="text-3xl font-bold my-4">$1</h1>');

    // Format lists - CHANGED SECTION START
    text = text.replace(/^(\d+)\.\s(.+)/gm, '<li class="ml-4 my-1">$1. $2</li>');  // Keep original numbers
    text = text.replace(/^-\s(.+)/gm, '<li class="ml-4 my-1">$1</li>');  // Bullet points unchanged

    // Wrap lists in appropriate containers
    text = text.replace(/(<li class="ml-4 my-1">\d+\..*?<\/li>\s*)+/gs, '<ol class="list-decimal my-2 pl-5">$&</ol>');  // Modified ol wrapper
    text = text.replace(/(<li class="ml-4 my-1">.*?<\/li>\s*)+/gs, '<ul class="list-disc my-2 pl-5">$&</ul>');  // Modified ul wrapper
    // CHANGED SECTION END

    // Format bold and italic text
    text = text.replace(/\*\*(.+?)\*\*/g, '<strong class="font-bold">$1</strong>');
    text = text.replace(/\*(.+?)\*/g, '<em class="italic">$1</em>');

    // Format code blocks
    text = text.replace(/```([\s\S]*?)```/g, '<pre class="bg-gray-100 p-3 rounded my-2 overflow-x-auto"><code>$1</code></pre>');
    text = text.replace(/`([^`]+)`/g, '<code class="bg-gray-100 px-1 rounded">$1</code>');

    // Format paragraphs
    text = text.replace(/([^\n]+)\n?/g, (match) => {
      if (
        match.startsWith('<h') ||
        match.startsWith('<li') ||
        match.startsWith('<pre') ||
        match.startsWith('<ul') ||
        match.startsWith('<ol')
      ) {
        return match;
      }
      return `<p class="my-2">${match}</p>`;
    });

    return text;
  }
}