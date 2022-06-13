import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { BookService } from '../service/book.service';
import { Book } from '../model/book.model';
import Swal from 'sweetalert2';
import { CartService } from '../service/cart.service';

@Component({
  selector: 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrls: ['./book-detail.component.css'],
})
export class BookDetailComponent implements OnInit {
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

  addToCart(item:Book) {
    if (!this.cartService.itemInCart(item)) {
      this.cartService.addToCart(item); //add cart in cart
      this.cart = [...this.cartService.getItems()];
      Swal.fire({
        icon: 'success',
        title: 'Add book to cart successfully',
        showConfirmButton: false,
        timer: 1400
      })
    }
  }

  addToLibrary(id:number){
    this.bookService.addToLibrary(id, this.token.userId).subscribe(
      (response) => {
        Swal.fire({
          icon: 'success',
          title: 'Add book to library successfully',
          showConfirmButton: false,
          timer: 1400
        })
      },
      (error) => {        
        Swal.fire({
          icon: 'error',
          title: 'Please try again',
          text: 'Something went wrong!'
        })
      }
    );
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
