import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FooterComponent } from './footer/footer.component';
import { BestSellersComponent } from './home/best-sellers/best-sellers.component';
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
import { ItemsComponent } from './category/items/items.component';
import { VideosComponent } from './videos/videos.component';

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
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
