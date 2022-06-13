import { Component, OnInit } from '@angular/core';
import { BookUser } from '../model/bookUser.model';
import { BookService } from '../service/book.service';

@Component({
  selector: 'app-library',
  templateUrl: './library.component.html',
  styleUrls: ['./library.component.css']
})
export class LibraryComponent implements OnInit {
  books: BookUser[];
  token: any;
  constructor(private bookService: BookService) {}

  ngOnInit(): void {
    
    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
    if(this.token!=null){
    this.getLibrary()
  }
  }
  getLibrary() {
    this.bookService.getLibrary(this.token.userId).subscribe((res: any) => {
      this.books = res;
    });
  }

}
