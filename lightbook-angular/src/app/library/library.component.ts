import { Component, OnInit } from '@angular/core';
import { Book } from 'src/models/book.model';
import { BookService } from 'src/services/book.service';

@Component({
  selector: 'app-library',
  templateUrl: './library.component.html',
  styleUrls: ['./library.component.css']
})
export class LibraryComponent implements OnInit {
  books!: Book[];
  currentBook = null;
  currentIndex = -1;
  name = '';
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    // this.listBooks();
    this.books = this.bookService.getBooks();
  }


}
