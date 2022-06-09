import { Component, Input, OnInit } from '@angular/core';
import { Book } from 'src/app/model/book.model';
import { Catalog } from 'src/app/model/catalog.model';
import { BookService } from 'src/app/service/book.service';
import { CatalogService } from 'src/app/service/catalog.service';

@Component({
  selector: 'app-carousel-book-by-catalog',
  templateUrl: './carousel-book-by-catalog.component.html',
  styleUrls: ['./carousel-book-by-catalog.component.css'],
})
export class CarouselBookByCatalogComponent implements OnInit {
  @Input() catalogId: number;
  books: Book[] = [];
  catalog: Catalog;
  constructor(
    private bookService: BookService,
    private catalogService: CatalogService
  ) {}

  ngOnInit(): void {
    this.catalogService.getCatalog(this.catalogId).subscribe((res: any) => {
      this.catalog = res.items[0];
    });
    this.getAll();
  }

  getAll() {
    this.bookService
      .getBooksByCatalogId(this.catalogId)
      .subscribe((res: any) => {
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
