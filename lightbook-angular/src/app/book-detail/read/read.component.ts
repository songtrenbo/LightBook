import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Book } from 'src/app/model/book.model';
import { BookService } from 'src/app/service/book.service';

@Component({
  selector: 'app-read',
  templateUrl: './read.component.html',
  styleUrls: ['./read.component.css']
})
export class ReadComponent implements OnInit {
  book = new Book();
  chapter: any;

  constructor(
    private route: ActivatedRoute,
    private bookService: BookService
  ) { }

  ngOnInit(): void {
    this.getRoute(this.route.snapshot.params['id']);
    this.route.params.subscribe((params: Params) => {
      this.getRoute(+params['id']);
    })
  }
  getRoute(id: any) {
    this.bookService.getById(id).subscribe((res: any) => {
      this.book = res.items[0];
      this.chapter = this.book.chapter.replace(new RegExp('\/n', 'g'), '<br/>');
    });
  }

}
