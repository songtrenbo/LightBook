import { Component, OnInit } from '@angular/core';
import { Book } from 'src/app/model/book.model';
import { BookService } from 'src/app/service/book.service';

@Component({
  selector: 'app-popular',
  templateUrl: './popular.component.html',
  styleUrls: ['./popular.component.css'],
})
export class PopularComponent implements OnInit {
  books: Book[] = [];
  router: any;
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    this.getAll();
  }

  getAll() {
    this.bookService.getBooksByCatalogId(1, 10).subscribe((res: any) => {
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
  redirect(id: number) {
    this.router.navigate(`/detail/${id}`);
  }
}
