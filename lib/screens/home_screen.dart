import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_rikeandmo/api/model.dart';
import 'package:movie_rikeandmo/api/repository.dart';
import 'package:movie_rikeandmo/screens/widgets/character_item.dart';
import 'package:movie_rikeandmo/screens/widgets/my_text.dart';
class HomeScreen extends StatefulWidget {const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading= false;
  late Model characterData;
  late List<Model> allCharacters;
  Repository repository= Repository();

  bool _isSearching =false;//هل بعمل سيرش ولا لا
  final _searchTextController = TextEditingController();//عشان لما ابحث عحرف معين
  late List<Model> searchedForCharacter;

  Future<void> getData() async{
    setState(() {
      isLoading = true;
    });
    await repository.getCharacterData().then((value) {
      if(value.isEmpty){
        print('alaa');
      }else{
        print('not empty');
        allCharacters = value;
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Widget _buildSearchField(){
    return TextField(
      controller: _searchTextController,
      cursorColor: const Color(0xFF13152F),
      decoration: const InputDecoration(
        hintText: 'Find a character... ',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Color(0xFFFFCAC9), fontSize: 18),
      ),
      style: const TextStyle(color: Color(0xFFFFCAC9), fontSize: 18),
      onChanged: (searchedCharacter){
        if(searchedCharacter.isEmpty)
          {
            print('searchedCharacter is empty');
            getData();
          }
        else{
          print('searchedCharacter is not empty');
          addSearchedForItemsToSearchedList(searchedCharacter);//هاي فنكشن عملتها تحت وظيفتها تاخود النص الي دخلتو على السيرش واتشوف العناصر الي بتخص هاد الحرف
        }
      },
    );
  }
  void addSearchedForItemsToSearchedList(searchedCharacter){
    //اللستة الي بدي احط فيها العناصر الي هعرضهم//
    // بقدر اغيرها ل contains
    setState(() {
      allCharacters = allCharacters.where(
              (characterData) =>
              characterData.name.toLowerCase().startsWith(searchedCharacter)).toList();
    });
  }
  List<Widget> _buildAppBarActions(){
    if(_isSearching){
      return[
        IconButton(
            onPressed: (){
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: Color(0xFF13152F),))
      ];
    }else{
      //في حالة ما بعمل سيرش
      return[
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(Icons.search, color: Color(0xFF13152F),)
        ),
      ];
    }
  }
  void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching= true;
    });
  }
  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching= false;
    });
  }
  void _clearSearch(){
    setState(() {
      _searchTextController.clear();//بيمسح الداتا الي في الكونترولير
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget _buildAppBarTitel(){
    return MyText(
      text: 'Characters',color: const Color(0xFFFFCAC9),
    );
  }


  ///////////////////////////// UI /////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF737DFE),
        //title: MyText(text: 'Characters',color: const Color(0xFFFFCAC9),),
        title:  _isSearching ? _buildSearchField() : _buildAppBarTitel(),
     //   leading: _isSearching ?const BackButton(color: Color(0xFF13152F),) : Container(),
        actions: _buildAppBarActions(),
      ),
      body: isLoading ? const Center(child: Text('Loading'),) :
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            childAspectRatio: 2/3,
            crossAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: allCharacters.length,
          // _searchTextController.text.isEmpty?
          // allCharacters.length :
          // searchedForCharacter.length,//هاي عشان انفلتر الليستة لما اجي اعمل سيرش تفلترلي اياها عحسب الحرف الي ببحث عنو
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
           return CharacterItem(
             model: allCharacters[index] ,
           );
          }
      ),
    );
  }
}
