import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(5)
        ),
        child:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width/1.5,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products"
                  ),
                ),
              ),
              Container(
color: Colors.black,
                child: IconButton(onPressed: (){}, icon:const Icon(Icons.search,color: Colors.white,)),
              )
            ],
          ),
        )
    );
  }
}
