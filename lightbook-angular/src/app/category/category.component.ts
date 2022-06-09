import { Component, OnInit } from '@angular/core';
import { Book } from '../model/book.model';
import { Category } from '../model/category.model';
import { BookService } from '../service/book.service';
import { CategoryService } from '../service/category.service';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css'],
})
export class CategoryComponent implements OnInit {
  cate: Category | undefined;
  cateName: string;
  books: Book[];
  cates: Category[];
  constructor(
    private bookService: BookService,
    private categoryService: CategoryService
  ) {}

  ngOnInit(): void {
    this.getCategories();
    this.getBooksByCategoryId();
    this.getCategoryById();
    this.cateName = this.cate!.name;
  }
  getIndex(index: number) {
    this.getBooksByCategoryId(index);
    this.getCategoryById(index);
    this.cateName = this.cate!.name;
  }
  getCategories() {
    this.categoryService.getAll().subscribe((res: any) => {
      this.cates = res.items;
    });
  }
  getBooksByCategoryId(categoryId: number = 1) {
    this.bookService.getBookByCategoryId(categoryId).subscribe((res: any) => {
      this.books = res;
    });
  }
  getCategoryById(categoryId: number = 1) {
    this.categoryService.getById(categoryId).subscribe((res: any) => {
      this.cate = res;
    });
  }
}
