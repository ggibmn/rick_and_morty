import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/configs/theme.dart';
import 'package:rick_and_morty/fff.dart';

class RMCharacters extends StatefulWidget {
  @override
  _RMCharactersState createState() => _RMCharactersState();
}

class _RMCharactersState extends State<RMCharacters> {
  TextEditingController editingController = TextEditingController();

  // FocusNode _focus = new FocusNode();
  ScrollController controller = ScrollController();
  String text = 'Всего персонажей: 200';
  String status_dead = "Мертвый";

  // String status_live = character[index].name;

  _RMCharactersState() {
    // _focus.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        child: Column(children: <Widget>[
          _searchBox(),
          _bnj(),
          Flexible(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
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
                          character[index].imageUrl,
                          height: 74,
                          width: 74,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                          ),
                          child: Container(
                            height: 56,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                character[index].status != null
                                    ? Container(
                                  height: 16,
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
                                  height: 16,
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
                                        color: AppTheme.additionalText),
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
      margin: const EdgeInsets.only(top: 54, left: 16, right: 16),
      height: 48,
      decoration: BoxDecoration(
        color: AppTheme.controller,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 16, color: AppTheme.additionalText),
          hintText: 'Найти персонажа',
          suffixIcon: Icon(
            Icons.filter_alt_outlined,
            color: AppTheme.additionalText,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.additionalText,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _bnj() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
            Icon(
              Icons.grid_view,
              color: AppTheme.additionalText,
            )
          ],
        ),
      ),
    );
  }
}
