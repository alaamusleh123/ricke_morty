import 'package:flutter/material.dart';
import 'package:movie_rikeandmo/screens/widgets/my_text.dart';

import '../api/model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Model model;
  const CharacterDetailsScreen({Key? key, required this.model}) : super(key: key);
  Widget buildSliverAppBar(){
    //السيلفر اب بتتحكملي بالصورة لما تكبر و النص او الاسم الي بيكون تحت بالنص
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Color(0xFF737DFE),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: MyText(text: model.name,color: Color(0xFF1C2050),),
        //هاي الهيرو الي حطيتها في الهوم سكرين فوق الجردل فانا بدي استقبلها هان عشان امررلو الصورة فيها انيميشن
        background: Hero(
          tag: model.id,
          child: Image.network(model.image, fit: BoxFit.cover,),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value){
    return RichText(
      maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: Color(0xFFFFCAC9),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              TextSpan(
                  children: [
                    TextSpan(
                      text: value,
                      style: TextStyle(
                          color: Color(0xFFFFCAC9),
                          fontSize: 16
                      ),
                    ),
                  ]),
            ]),

    );
  }

  Widget buildDivider(double endIndent){
    return Divider(
      height: 30,
      color: Color(0xFF1C2050),
      endIndent: endIndent,
      thickness: 2, //سمك الخط

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAF5957),
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          // من خلال السليفر ليست هبدا اتحكم بالعناصر الي عندي الي تحت الصورة في البار
          SliverList(delegate:SliverChildListDelegate([ //هاي العناصر الي هبدا اشتغل عليها تحت في البار فاعطيتو ليست
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('name: ', model.name),
                  buildDivider(300),//هاي عشان الخط الاصفر الي تحت الاسم او الكلام في البار
                  characterInfo('gendr: ', model.gender),
                  buildDivider(300),
                  characterInfo('species: ', model.species),
                  buildDivider(290),
                  characterInfo('status: ', model.status),
                  buildDivider(300),
                  characterInfo('description: ', 'The series follows the misadventures of alcoholic scientist Rick and his overly nervous grandson Morty, who split their time between domestic family life and intergalactic trave'),
                  buildDivider(260),
                  characterInfo('seasons: ', model.id.toString()),
                  buildDivider(280),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            SizedBox(height: 500,)
          ]),),
        ],
      ),
    );
  }
}
