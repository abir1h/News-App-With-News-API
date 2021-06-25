import 'package:news_app/Models/catagorymodel.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categorieModel);





  return myCategories;

}