import { CategoryCreateComponent } from './admin/category-management/category-create/category-create.component';
import { AuthorCreateComponent } from './admin/author-management/author-create/author-create.component';
import { BookCreateComponent } from './admin/book-management/book-create/book-create.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminComponent } from './admin/admin.component';
import { AuthorManagementComponent } from './admin/author-management/author-management.component';
import { BookManagementComponent } from './admin/book-management/book-management.component';
import { CatalogManagementComponent } from './admin/catalog-management/catalog-management.component';
import { CategoryManagementComponent } from './admin/category-management/category-management.component';
import { BookDetailComponent } from './book-detail/book-detail.component';
import { ReadComponent } from './book-detail/read/read.component';
import { CartComponent } from './cart/cart.component';
import { CategoryComponent } from './category/category.component';
import { HomeComponent } from './home/home.component';
import { ListBookByCatalogComponent } from './home/list-book-by-catalog/list-book-by-catalog.component';
import { LibraryComponent } from './library/library.component';

import { VideosComponent } from './videos/videos.component';
import { BookDetailAdminComponent } from './admin/book-management/book-detail/book-detail.component';
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
  { path: 'detail/:id/read', component: ReadComponent },
  {
    path: 'admin',
    component: AdminComponent,
    children: [
      { path: 'book-management', component: BookManagementComponent},
      { path: 'book-create', component: BookCreateComponent },
      { path: 'book-detail/:id', component: BookDetailAdminComponent },
      { path: 'book-create/:id/edit', component: BookCreateComponent },
      { path: 'author-management', component: AuthorManagementComponent },
      { path: 'author-create', component: AuthorCreateComponent },
      { path: 'author-create/:id/edit', component: AuthorCreateComponent},
      { path: 'category-management', component: CategoryManagementComponent },
      { path: 'category-create', component: CategoryCreateComponent },
      { path: 'category-create/:id/edit', component: CategoryCreateComponent},
      { path: 'catalog-management', component: CatalogManagementComponent }
    ],
  },
];
@NgModule({
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
