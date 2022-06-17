import { Category } from './../../../model/category.model';
import { CategoryService } from './../../../service/category.service';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { PagedResponse } from 'src/app/model/paged-response';

@Component({
  selector: 'app-category-create',
  templateUrl: './category-create.component.html',
  styleUrls: ['./category-create.component.css']
})
export class CategoryCreateComponent implements OnInit {
  id: number;
  editMode = false;
  categoryForm: FormGroup;

  constructor(private router: Router,
              private route:ActivatedRoute,
              private categoryService:CategoryService,) { }

  ngOnInit(): void {
    this.route.params.subscribe((params: Params) => {
      this.id = +params['id'];
      this.editMode = params['id'] != null;
      this.initForm();
    })
  }
  private initForm() {
    let cateName="";

    if(this.editMode){
      this.categoryService.getAdminCategoriesById(this.id).subscribe((res:any) => {
        cateName = res.items[0].name;
        console.log(res);
        console.log('authorName',cateName)
        this.categoryForm = new FormGroup({
          'name': new FormControl(cateName, Validators.required),
        });
      });
    }

    this.categoryForm = new FormGroup({
      'name': new FormControl(cateName, Validators.required),
    });
  }

  onSubmit() {
    const formData = this.categoryForm.value;
    if(this.editMode){
      const cateEdit = new Category();
      cateEdit.id = this.id;
      cateEdit.name = formData.name;
      console.log(formData);
      const result = this.categoryService.editCategory(cateEdit).subscribe((res:any)=> {
        console.log(res);
      })
      if(result){
        this.router.navigate(['admin/category-management']);
      }
    } else {
      const result = this.categoryService.createCategory(formData).subscribe((res: any)=>{
        console.log(res);
      });
      if(result){
        this.router.navigate(['admin/category-management']);
      }
    }
  }

  onCancel(){
    this.router.navigate(['admin/category-management']);
  }

}
