import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { CartDetail } from 'src/app/model/cartDetail';
import { CartService } from 'src/app/service/cart.service';

@Component({
  selector: 'app-detail-order',
  templateUrl: './detail-order.component.html',
  styleUrls: ['./detail-order.component.css'],
})
export class DetailOrderComponent implements OnInit {
  books: CartDetail[];
  token: any;
  constructor(
    private cartService: CartService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    var tokenStr = localStorage.getItem('Token');
    this.token = JSON.parse(tokenStr!);
    if (this.token != null) {
      this.getRoute(this.route.snapshot.params['id']);
      this.route.params.subscribe((params: Params) => {
        this.getRoute(+params['id']);
      });
    }
  }
  getRoute(id: number) {
    this.cartService
      .getCartDetailByCartId(id, this.token.userId)
      .subscribe((res: any) => {
        this.books = res;
      });
  }
}
