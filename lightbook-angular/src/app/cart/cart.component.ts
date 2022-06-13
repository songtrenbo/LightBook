import { Component, OnInit } from '@angular/core';
import Swal from 'sweetalert2';
import { Book } from '../model/book.model';
import { BookService } from '../service/book.service';
import { CartService } from '../service/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
})
export class CartComponent implements OnInit {
  token: any;
  cart: Book[] = [];
  totalPrice: number = 0;
  constructor(
    private bookService: BookService,
    private cartService: CartService
  ) {}

  ngOnInit(): void {
    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
    this.cartService.loadCart();
    this.cart = this.cartService.getItems();

    this.cart.map(
      (e) => {
        this.totalPrice += e.price;
      },
      { totalPrice: 0 }
    );
  }

  //----- remove specific item
  removeFromCart(item: Book) {
    this.cartService.removeItem(item);
    this.cart = this.cartService.getItems();
    this.totalPrice = 0;
    this.cart.map(
      (e) => {
        this.totalPrice += e.price;
      },
      { totalPrice: 0 }
    );
  }

  PayMent() {
    console.log(this.cart);
    this.cartService.Payment(this.cart, this.token.userId).subscribe(
      (response) => {
        console.log(response);
        Swal.fire({
          icon: 'success',
          title: 'Payment successfully',
          text: 'We will contact you to delivery!',
          showConfirmButton: true
        });
        this.cartService.clearCart(this.cart);
        this.ngOnInit();
        this.totalPrice = 0;
      },
      (error) => {
        Swal.fire({
          icon: 'error',
          title: 'Please try again',
          text: 'Something went wrong!',
        });
      }
    );
  }
}
