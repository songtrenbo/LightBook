import { Component, OnInit } from '@angular/core';
import { Book } from 'src/models/book.model';
import { Category } from 'src/models/category.model';
import { BookService } from 'src/services/book.service';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent implements OnInit {
  cate:Category | undefined;
  cateName!:string;
  books!: Book[];
  cates!: Category[];
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    this.cates = this.bookService.getCates();
    this.books = this.bookService.getBooksByCate(1);
    this.cate = this.bookService.getCate(1);
    this.cateName = this.cate!.name;
  }
  getIndex(index: number){
    console.log(index);//clicked index
    this.books = this.bookService.getBooksByCate(index);
    this.cate = this.bookService.getCate(index);
    this.cateName = this.cate!.name;
 }
}
