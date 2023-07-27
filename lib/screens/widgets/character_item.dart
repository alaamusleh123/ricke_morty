import 'package:flutter/material.dart';
import 'package:movie_rikeandmo/api/model.dart';
import 'package:movie_rikeandmo/screens/widgets/constant.dart';

import 'my_text.dart';

//templete design pattern
class CharacterItem extends StatelessWidget {
 final Model model;
   CharacterItem({Key? key, required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: const Color(0xFFFFCAC9),
          borderRadius: BorderRadius.circular(8)
      ),
      child: InkWell( //ضفتها عشان اقدر اضغط على الصورة
        onTap: ()=> Navigator.pushNamed(context, characterDetailsScreen, arguments: model),
        child: GridTile(
          child: Hero( //عشان لما اضغط على الصورة تكبر
            tag: model.id,
            child: Container(
              color: const Color(0xFFFFCAC9),
              child: Column(
                children: [
                  Expanded(
                    child:Image.network(
                      model.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: MyText(
              text: model.name ,
              color: Colors.white,) ,
          ),
        ),
      ),
    ) ;

  }
}
