import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/modules/graphql/character_list_item/character_lists.dart';
import 'package:new_flutter_assignment/modules/graphql/custom_header/custom_header.dart';
import 'package:new_flutter_assignment/modules/graphql/loading_indicator/loading_indicator.dart';
import 'package:new_flutter_assignment/modules/navbar/custom_appbar.dart';
import 'package:new_flutter_assignment/modules/navbar/custom_drawer.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';
import 'package:new_flutter_assignment/providers/graphql_provider.dart';

//sauce - https://www.youtube.com/watch?v=rJKN_880b-M
class GraphqlPage extends HookWidget {
  //change this name
  GraphqlPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _charactersProvider = useProvider(charactersProvider);
    final _scrollController = useScrollController();
    final _height = MediaQuery.of(context).size.height;
    final _constants = useProvider(constantsProvider);

// sauce - https://stackoverflow.com/questions/63832051/safe-usage-for-usescrollcontroller-flutter-hooks

    _loadData() async {
      _isLoading.value = true;

      try {
        await _charactersProvider.getCharacters();
      } on Exception catch (error) {
        print(error);
      }

      _isLoading.value = false;
    }

    _getAdditionalInfo() async {
      try {
        await _charactersProvider.getPages();
      } on Exception catch (error) {
        print(error);
      }
    }

    bool _isAllLoaded() {
      int maxpage = _charactersProvider.info['count'] ?? 0;
      if (_charactersProvider.characters.length == maxpage) {
        return true;
      }
      return false;
    }

    useEffect(() {
      _loadData();
      _getAdditionalInfo();
      return;
    }, []);

    useEffect(() {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          if (!_isAllLoaded()) {
            _loadData();
          }
        }
      });
    }, [_scrollController]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      endDrawer: CustomEndDrawer(),
      body: Container(
        color: Colors.black,
        child: Builder(
          builder: (BuildContext context) {
            if (_isLoading.value && _charactersProvider.characters.isEmpty) {
              return LoadingIndicator();
            }

            if (!_isLoading.value && _charactersProvider.characters.isEmpty) {
              return Center(child: Text('No data'));
            }
            // 648.png
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.black,
                  expandedHeight: _height * .75,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CustomHeader(),
                  ),
                  actions: [Container()], //remove enddrawer in sliverappbar
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                      top: _constants.kDefaultPadding,
                      right: _constants.kDefaultPadding,
                      left: _constants.kDefaultPadding),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final maxcount =
                            _charactersProvider.info['count']; //dummy

                        if (index == _charactersProvider.characters.length &&
                            index + 1 < maxcount) {
                          return LoadingIndicator();
                        } else if (index ==
                                _charactersProvider.characters.length &&
                            index == maxcount) {
                          return Center(
                            child: Text(
                              'Nothing to load.',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return CharacterListItem(
                          character: _charactersProvider.characters[index],
                        );
                      },
                      childCount: _charactersProvider.characters.length + 1,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.5),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
