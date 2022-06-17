import { BookCreate } from './../../../model/bookCreate.model';
import { Book } from './../../../model/book.model';
import { AuthorService } from 'src/app/service/author.service';
import { Author } from './../../../model/author.model';
import { Category } from 'src/app/model/category.model';
import { CategoryService } from './../../../service/category.service';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { BookService } from './../../../service/book.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { CurrencyPipe } from '@angular/common';
import { invalid } from '@angular/compiler/src/render3/view/util';

@Component({
  selector: 'app-book-create',
  templateUrl: './book-create.component.html',
  styleUrls: ['./book-create.component.css']
})
export class BookCreateComponent implements OnInit {
  id: number;
  categories: Category[] = [];
  authors: Author[] = [];
  editMode = false;
  bookForm: FormGroup;

  constructor(private router: Router,
            private route:ActivatedRoute,
            private bookService:BookService,
            private categoryService:CategoryService,
            private authorService: AuthorService,
            private currencyPipe: CurrencyPipe,
            ) { }

  ngOnInit(): void {
    this.route.params.subscribe((params: Params) => {
      this.id = +params['id'];
      this.editMode = params['id'] != null;
      this.getCategory();
      this.getAuthor();
      this.initForm();
      console.log(this.categories)
    })
  }

  private initForm() {
    let bookName= '';
    let bookPrice= 0;
    let bookPicture= '';
    let bookReview = '';
    let bookContent = '';
    let bookCategory = 1;
    let bookAuthors = new FormArray([]);

    if(this.editMode){
      this.bookService.getAdminBooksById(this.id).subscribe((res:any) => {
        console.log(res);
        const result = res.items[0];
        bookName = result.name;
        bookPrice= result.price;
        bookPicture= result.picture;
        bookReview = result.review;
        bookContent = result.chapter;
        bookCategory = result.categoryID;
        if(result.authorBooks){
          for(let author of result.authorBooks){
            bookAuthors.push(
              new FormGroup({
                'authorId':new FormControl(author.authorID,Validators.required),
              })
            )
          }
        }

        this.bookForm = new FormGroup({
          'name': new FormControl(bookName, Validators.required),
          'price': new FormControl(bookPrice, Validators.required),
          'picture': new FormControl(bookPicture, Validators.required),
          'review': new FormControl(bookReview, Validators.required),
          'chapter': new FormControl(bookContent, Validators.required),
          'categoryId': new FormControl(bookCategory, Validators.required),
          'authors': bookAuthors
        });
        this.bookForm.valueChanges.subscribe(form => {
          if(form.price){
            this.bookForm.patchValue({
              price: this.currencyPipe.transform(form.price.replace(/\D/g,''),'VND', '', '1.0-0')
            },{emitEvent: false});
          }
        })
      })

      
    }

    this.bookForm = new FormGroup({
      'name': new FormControl(bookName, Validators.required),
      'price': new FormControl(bookPrice, Validators.required),
      'picture': new FormControl(bookPicture, Validators.required),
      'review': new FormControl(bookReview, Validators.required),
      'chapter': new FormControl(bookContent, Validators.required),
      'categoryId': new FormControl(bookCategory, Validators.required),
      'authors': bookAuthors
    });

    this.bookForm.valueChanges.subscribe(form => {
      if(form.price){
        this.bookForm.patchValue({
          price: this.currencyPipe.transform(form.price.replace(/\D/g,''),'VND', '', '1.0-0')
        },{emitEvent: false});
      }
    })
  }

  get controls(){
    return (<FormArray>this.bookForm.get('authors')).controls;
  }

  onAddAuthor() {
    (<FormArray>this.bookForm.get('authors')).push(
      new FormGroup({
        'authorId': new FormControl(1,Validators.required)
      })
    )
  }

  onRemoveAuthor(index:number){
    (<FormArray>this.bookForm.get('authors')).removeAt(index);
  }

  getCategory(){
    this.categoryService.getAll()
        .subscribe((res: any)=>{
          this.categories=res.items;
        })
  }

  getAuthor(){
    this.authorService.getAll()
        .subscribe((res: any)=>{
          this.authors=res.items;
        })
  }

  

  onSubmit() {
    const formData = this.bookForm.value;
    if(this.editMode){
      console.log(formData);
      if(formData.price>0){
        formData.price = formData.price.replace(/,/g,'');
      }

      var bookCreate= new BookCreate();
      bookCreate.id = this.id
      bookCreate.name = formData.name;
      bookCreate.price = formData.price;
      bookCreate.picture = formData.picture;
      bookCreate.review = formData.review;
      bookCreate.chapter = formData.chapter;
      bookCreate.categoryID = formData.categoryId;
      bookCreate.authors = new Array<number>();
      for(let author in formData.authors){
        bookCreate.authors.push(formData.authors[author].authorId);
      }
      
      const result = this.bookService.editBook(bookCreate).subscribe((res: any)=>{
        console.log(res);
      });
      if(result){
        this.router.navigate(['admin/book-management']);
      }
    } else {
      console.log(formData);
      if(formData.price>0){
        formData.price = formData.price.replace(/,/g,'');
      }

      var bookCreate= new BookCreate();
      bookCreate.name = formData.name;
      bookCreate.price = formData.price;
      bookCreate.picture = formData.picture;
      bookCreate.review = formData.review;
      bookCreate.chapter = formData.chapter;
      bookCreate.categoryID = formData.categoryId;
      bookCreate.authors = new Array<number>();
      for(let author in formData.authors){
        bookCreate.authors.push(formData.authors[author].authorId);
      }
      
      const result = this.bookService.createBook(bookCreate).subscribe((res: any)=>{
        console.log(res);
      });
      if(result){
        this.router.navigate(['admin/book-management']);
      }
    }
  }

  onCancel(){
    this.router.navigate(['admin/book-management']);
  }
}
