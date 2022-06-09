import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Book } from 'src/app/model/book.model';
import { BookService } from 'src/app/service/book.service';

@Component({
  selector: 'app-list-book-by-catalog',
  templateUrl: './list-book-by-catalog.component.html',
  styleUrls: ['./list-book-by-catalog.component.css'],
})
export class ListBookByCatalogComponent implements OnInit {
  books: Book[];

  constructor(private route: Router, private bookService: BookService) {}

  ngOnInit(): void {
    var url = this.route.url;
    var id = 0;
    switch (url) {
      case '/popular':
        id = 1;
        break;
      case '/best-sellers':
        id = 2;
        break;
      case '/newest':
        id = 3;
        break;
      case '/free-to-read':
        id = 4;
        break;

      default:
        break;
    }

    this.bookService.getBooksByCatalogId(id).subscribe((res: any) => {
      this.books = res.items;
    });
  }
  
}
