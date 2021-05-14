import 'package:flutter/material.dart';
import 'package:rick_and_morty/configs/theme.dart';
import 'package:rick_and_morty/items/list.dart';


class RMCharacters extends StatefulWidget {
  @override
  _RMCharactersState createState() => _RMCharactersState();
}

class _RMCharactersState extends State<RMCharacters> {
  TextEditingController editingController = TextEditingController();

  String text = 'Всего персонажей: 200';
  String status_dead = "Мертвый";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        child: Column(children: <Widget>[
          _searchBox(),
          _gridView(),
          Flexible(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: character.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String status_live = character[index].status;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          character[index].image,
                          height: 74.0,
                          width: 74.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Container(
                            height: 56.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                character[index].status != null
                                    ? Container(
                                        height: 16.0,
                                        child: (Text(
                                          status_live.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppTheme.green,
                                              letterSpacing: 1.5),
                                        )),
                                      )
                                    : Container(
                                        height: 16.0,
                                        child: (Text(
                                          status_dead.toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: AppTheme.red,
                                              letterSpacing: 1.5),
                                        )),
                                      ),

                                Container(
                                  height: 24.0,
                                  child: Text(
                                    character[index].name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16, color: AppTheme.white),
                                  ),
                                ),

                                Container(
                                  height: 16.0,
                                  child: Text(
                                    character[index].gender,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.additionalText, letterSpacing: 0.5),
                                  ),
                                ),
                                // Text(character[index].gender, style: TextStyle(fontSize: 12, color: AppTheme.additionalText),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ]),
      ),
    );
  }

  Widget _searchBox() {
    return new Container(
      margin: const EdgeInsets.only(top: 54.0, left: 16.0, right: 16.0),
      height: 48.0,
      decoration: BoxDecoration(
        color: AppTheme.controller,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 16, color: AppTheme.additionalText),
          hintText: 'Найти персонажа',
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/search.png",
              height: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
              mainAxisSize: MainAxisSize.min, // added line
              children: <Widget>[
                Image.asset(
                  "assets/images/line.png",
                  height: 24.0,
                ),
                Image.asset(
                  "assets/images/filter_sort.png",
                  height: 24.0,
                ),
              ],
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _gridView() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: new Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text.toUpperCase(),
              style: TextStyle(
                  fontSize: 10,
                  color: AppTheme.additionalText,
                  letterSpacing: 1.5),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                "assets/images/grid.png",
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
