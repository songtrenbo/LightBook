import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FooterComponent } from './footer/footer.component';
import { NewestComponent } from './home/newest/newest.component';
import { PopularComponent } from './home/popular/popular.component';
import { FreeToReadComponent } from './home/free-to-read/free-to-read.component';
import { RecommendedComponent } from './home/recommended/recommended.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginFormComponent } from './header/login-form/login-form.component';
import { LibraryComponent } from './library/library.component';
import { BannerComponent } from './home/banner/banner.component';
import { HeaderComponent } from './header/header.component';
import { HomeComponent } from './home/home.component';
import { BookDetailComponent } from './book-detail/book-detail.component';
import { CategoryComponent } from './category/category.component';
import { CartComponent } from './cart/cart.component';
import { BookService } from './service/book.service';
import { CategoryService } from './service/category.service';
import { ItemsComponent } from './category/items/items.component';
import { VideosComponent } from './videos/videos.component';
import { BestSellersComponent } from './home/best-sellers/best-sellers.component';
import { ListBookByCatalogComponent } from './home/list-book-by-catalog/list-book-by-catalog.component';
import { CarouselBookByCatalogComponent } from './home/carousel-book-by-catalog/carousel-book-by-catalog.component';
import { CatalogService } from './service/catalog.service';
import { UserService } from './service/user.service';
import { AuthorService } from 'src/app/service/author.service';
import { ReadComponent } from './book-detail/read/read.component';
import { AdminComponent } from './admin/admin.component';
import { BookManagementComponent } from './admin/book-management/book-management.component';
import { AuthorManagementComponent } from './admin/author-management/author-management.component';
import { CategoryManagementComponent } from './admin/category-management/category-management.component';
import { CatalogManagementComponent } from './admin/catalog-management/catalog-management.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { BookCreateComponent } from './admin/book-management/book-create/book-create.component'
import { CurrencyPipe } from '@angular/common';
import { BookDetailAdminComponent } from './admin/book-management/book-detail/book-detail.component';
import { CategoryCreateComponent } from './admin/category-management/category-create/category-create.component';
import { CatalogCreateComponent } from './admin/catalog-management/catalog-create/catalog-create.component';
import { AuthorCreateComponent } from './admin/author-management/author-create/author-create.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    HomeComponent,
    FooterComponent,
    BannerComponent,
    BestSellersComponent,
    NewestComponent,
    PopularComponent,
    FreeToReadComponent,
    RecommendedComponent,
    LoginFormComponent,
    LibraryComponent,
    BookDetailComponent,
    CategoryComponent,
    CartComponent,
    ItemsComponent,
    VideosComponent,
    ListBookByCatalogComponent,
    CarouselBookByCatalogComponent,
    ReadComponent,
    AdminComponent,
    BookManagementComponent,
    AuthorManagementComponent,
    CategoryManagementComponent,
    CatalogManagementComponent,
    BookCreateComponent,
    BookDetailAdminComponent,
    CategoryCreateComponent,
    CatalogCreateComponent,
    AuthorCreateComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    NgxPaginationModule,
  ],
  providers: [BookService, CategoryService, CatalogService, UserService, AuthorService, CurrencyPipe],
  bootstrap: [AppComponent],
})
export class AppModule {}
