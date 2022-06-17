import { BookService } from 'src/app/service/book.service';
import { Component, OnInit } from '@angular/core';
import { Book } from 'src/app/model/book.model';
import { PagedResponse } from 'src/app/model/paged-response';
import { ActivatedRoute, Router } from '@angular/router';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-book-management',
  templateUrl: './book-management.component.html',
  styleUrls: ['./book-management.component.css']
})
export class BookManagementComponent implements OnInit {
  books: Book[] = [];
  p: number = 1;
  limit: number = 6;
  total: number = 0;
  search: String ='';
  searchForm: FormGroup;

  constructor(private bookService: BookService,
              private router: Router,
              private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.getBooks();
    this.initForm();
  }

  private initForm() {
    let search= '';

    this.searchForm = new FormGroup({
      'search': new FormControl(search),
    });

    this.searchForm.valueChanges.subscribe(form => {
      this.search = form.search;
      this.getBooks();
    })
  }

  getBooks() {
    this.bookService.getAdminBooks(this.limit,this.p,this.search)
        .subscribe((res: PagedResponse<Book>)=>{
          this.books=res.items;
          this.total = res.totalItems;
        })
  }

  pageChangeEvent(event: number){
    this.p = event;
    this.getBooks();
  }

  onNewBook() {
    this.router.navigate(['admin/book-create']);
    }
}
