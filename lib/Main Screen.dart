import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Data/News.dart';
import 'package:news_app/Data/data.dart';
import 'package:news_app/Models/Article.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Models/catagorymodel.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<CategorieModel> catagories = List<CategorieModel>();
  List<Article> articales= new List<Article>();
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catagories = getCategories();
    get();

  }
  get()async{
    News newsclass=News();
    await newsclass.getnews();
    articales=newsclass.news;
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Row(
            children: [
              SizedBox(
                width: width / 4,
              ),
              Text('News'.toUpperCase(),
                  style: GoogleFonts.lato(

                      fontWeight: FontWeight.w900,
                      color: Colors.black)),
              Text('Briefing'.toUpperCase(),
                  style: GoogleFonts.lato(

                      fontWeight: FontWeight.w800,
                      color: Colors.indigo)),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){},
        child: _loading? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ):SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 70,
                  child: ListView.builder(


                      itemCount: catagories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CatagoryTile(
                          imageUrl: catagories[index].imageUrl,
                          categorieName: catagories[index].categorieName,
                        );
                      }),
                )

                ,
                SingleChildScrollView(
                  child: Container(
                    child: ListView.builder(

                        dragStartBehavior: DragStartBehavior.start,
                        itemCount: articales.length,
                        shrinkWrap: true,
                        itemBuilder: (_,index){
                          return GestureDetector(
                              onTap: ()async{

                              },
                              child: Blogs(imageUrl: articales[index].urlToImage, title: articales[index].title, description: articales[index].description,url: articales[index].articleUrl,));
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}



class CatagoryTile extends StatelessWidget {
  final imageUrl, categorieName;
  CatagoryTile({this.imageUrl, this.categorieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRect(
              child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 60,
            width: 120,
            fit: BoxFit.cover,
          )),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black26),
            child: Text(
              categorieName,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
class Blogs extends StatelessWidget {
  final String  imageUrl,title,description,url;
  Blogs({@required this.imageUrl,@required this.title,@required this.description,this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
                onTap: ()async{
                  String loc=url;
                  launch(loc);
                },
                child: Image.network(imageUrl)),
            Text(title,style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900,fontSize:20,color: Colors.blue,),),
            Text(description,style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: Colors.black,fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

