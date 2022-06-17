import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cart } from '../model/cart';
import { CartService } from '../service/cart.service';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css'],
})
export class OrderComponent implements OnInit {
  carts: Cart[];
  token: any;
  constructor(private cartService: CartService, private router: Router) {}

  ngOnInit(): void {
    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
    if (this.token != null) {
      this.getCartByUserId();
    }
  }
  getCartByUserId() {
    this.cartService
      .getCartByUserId(this.token.userId)
      .subscribe((res: any) => {
        this.carts = res;
      });
  }

  getIndex(id: number) {
    this.router.navigate([`/orderDetail/${id}`]);
  }
}
