import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Book } from 'src/app/model/book.model';
import { BookService } from 'src/app/service/book.service';
import { CartService } from 'src/app/service/cart.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrls: ['./book-detail.component.css']
})
export class BookDetailAdminComponent implements OnInit {
  book = new Book();
  cart: Book[] = [];
  token:any;
  constructor(
    private route: ActivatedRoute,
    private bookService: BookService,
    private cartService: CartService
  ) {}

  ngOnInit(): void {
    this.getRoute(this.route.snapshot.params['id']);

    this.cartService.loadCart();
    this.cart = this.cartService.getItems();
    
    this.route.params.subscribe((params: Params) => {
      this.getRoute(+params['id']);
    })

    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
  }
  getRoute(id: any) {
    this.bookService.getById(id).subscribe((res: any) => {
      console.log(res.item); 
      this.book = res.items[0];
    });
  }
  createRange(number: number) {
    return new Array(number);
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
