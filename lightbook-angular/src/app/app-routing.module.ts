import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BookDetailComponent } from './book-detail/book-detail.component';
import { CartComponent } from './cart/cart.component';
import { CategoryComponent } from './category/category.component';
import { HomeComponent } from './home/home.component';
import { ListBookByCatalogComponent } from './home/list-book-by-catalog/list-book-by-catalog.component';
import { LibraryComponent } from './library/library.component';
import { VideosComponent } from './videos/videos.component';
const appRoutes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'library', component: LibraryComponent },
  { path: 'cart', component: CartComponent },
  { path: 'category', component: CategoryComponent },
  { path: 'detail', component: BookDetailComponent },
  { path: 'videos', component: VideosComponent },
  { path: 'detail/:id', component: BookDetailComponent },
  { path: 'popular', component: ListBookByCatalogComponent },
  { path: 'best-sellers', component: ListBookByCatalogComponent },
  { path: 'newest', component: ListBookByCatalogComponent },
  { path: 'free-to-read', component: ListBookByCatalogComponent },
];
@NgModule({
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
