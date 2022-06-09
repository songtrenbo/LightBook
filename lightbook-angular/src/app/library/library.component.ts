import { Component, OnInit } from '@angular/core';
import { Book } from '../model/book.model';
import { BookService } from '../service/book.service';

@Component({
  selector: 'app-library',
  templateUrl: './library.component.html',
  styleUrls: ['./library.component.css']
})
export class LibraryComponent implements OnInit {
  books: Book[];
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    // this.listBooks();
    this.bookService.getBooks().subscribe((res: any) => {
      this.books = res.items;
    });
  }


}
