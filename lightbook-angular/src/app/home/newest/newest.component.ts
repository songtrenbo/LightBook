import { Component, OnInit } from '@angular/core';
import { Book } from 'src/app/model/book.model';
import { BookService } from 'src/app/service/book.service';

@Component({
  selector: 'app-newest',
  templateUrl: './newest.component.html',
  styleUrls: ['./newest.component.css'],
})
export class NewestComponent implements OnInit {
  books: Book[] = [];
  name = '';
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    this.getAll();
  }

  getAll() {
    this.bookService.getBooksByCatalogId(3,12).subscribe((res: any) => {
      this.books = res.items;
    });
  }

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
