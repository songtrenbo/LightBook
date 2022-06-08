import { HttpParams } from '@angular/common/http';
import { Component, Input, OnInit } from '@angular/core';
import { Book } from 'src/models/book.model';
import { BookService } from 'src/services/book.service';

@Component({
  selector: 'app-free-to-read',
  templateUrl: './free-to-read.component.html',
  styleUrls: ['./free-to-read.component.css'],
})
export class FreeToReadComponent implements OnInit {
  books!: Book[];
  // books: any;
  currentBook = null;
  currentIndex = -1;
  name = '';
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    // this.listBooks();
    this.books = this.bookService.getBooks();
  }

  // listBooks(): void {
  //   const params = new HttpParams({
  //     fromString: `catalogId=4&Limit=6&Page=1`,
  //   });
  //   this.bookService.listBooks(params).subscribe(
  //     (books) => {
  //       books = books.items;
  //       this.books = books;
  //     },
  //     (error) => {
  //       console.log(error);
  //     }
  //   );
  // }
  AddStar(number: number) {
    var items: number[] = [];
    for (var i = 1; i <= number; i++) {
      items.push(i);
    }
    return items;
  }
  AddGrayStar(number: number) {
    var items: number[] = [];
    for (var i = 5 - number; i > 0; i--) {
      items.push(i);
    }
    return items;
  }
}
