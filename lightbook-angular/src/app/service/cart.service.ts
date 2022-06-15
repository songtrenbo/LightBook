import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import Endpoints from '../constants/Endpoints';
import { Book } from '../model/book.model';
import { Cart } from '../model/cart';
import { CartDetail } from '../model/cartDetail';

const apiUrl = `${Endpoints.urlBackend}/Cart`;
@Injectable({
  providedIn: 'root',
})
export class CartService {
  constructor(private httpClient: HttpClient) {}
  items: Book[] = [];

  addToCart(addedItem: Book) {
    this.items.push(addedItem);
    this.saveCart();
  }

  getItems() {
    return this.items;
  }

  loadCart(): void {
    this.items = JSON.parse(localStorage.getItem('cart_items')!) ?? [];
  }

  saveCart(): void {
    localStorage.setItem('cart_items', JSON.stringify(this.items));
  }

  clearCart(items: any) {
    this.items = [];

    localStorage.removeItem('cart_items');
  }

  removeItem(item: Book) {
    const index = this.items.findIndex((o) => o.id === item.id);

    if (index > -1) {
      this.items.splice(index, 1);
      this.saveCart();
    }
  }

  itemInCart(item: Book): boolean {
    return this.items.findIndex((o) => o.id === item.id) > -1;
  }

  Payment(books: Book[], userId: number): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'Application/json',
        Authorization:
          'Bearer ' + JSON.parse(localStorage.getItem('Token')!).accessToken,
      }),
    };
    return this.httpClient.post(
      `${apiUrl}?userId=${userId}`,
      books,
      httpOptions
    );
  }
  
  getCartByUserId(userId: number): Observable<Cart[]> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'Application/json',
        Authorization:
          'Bearer ' + JSON.parse(localStorage.getItem('Token')!).accessToken,
      }),
    };
    return this.httpClient.get<Cart[]>(
      `${apiUrl}/cart?userid=${userId}`,
      httpOptions
    );
  }

  getCartDetailByCartId(
    cartId: number,
    userId: number
  ): Observable<CartDetail[]> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'Application/json',
        Authorization:
          'Bearer ' + JSON.parse(localStorage.getItem('Token')!).accessToken,
      }),
    };
    return this.httpClient.get<CartDetail[]>(
      `${apiUrl}/cartDetail?cartId=${cartId}&userid=${userId}`,
      httpOptions
    );
  }
}
