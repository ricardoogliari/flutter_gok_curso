import 'package:flutter/material.dart';
import 'package:flutter_gok_curso/model/history.dart';
import 'package:flutter_gok_curso/model/tagsHistory.dart';
import 'package:flutter_gok_curso/model/tagsHistoryExt.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<History> histories = List();

  @override
  void initState() {
    super.initState();
    histories.add(History.fromJson({
      "title": "Título de exemplo",
      "description": "Descrição de exemplo",
      "city": "Passo Fundo",
      "address": "Rua Padre Acnhieta",
      "site": "Site exemplo",
      "mainSocialNetwork": "Linkedin",
      "otherSocialNetwork": "Facebook",
      "numberTrue": 10,
      "numberFalse": 1,
      "tags": [
        TagsHistory.FOOD.about
      ]
    }));
  }

  @override
  Widget build(BuildContext context) {
    return buildListView();
  }

  ListView buildListView() => ListView.separated(
      itemBuilder: (context, index) => buildItem(histories[0]),
      separatorBuilder: (context, index) => Divider(height: 1),
      itemCount: 20);

  Widget buildItem(History history) => Card(
    child: ListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: new BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black
          )
        ),
        child: Center(child: Text("10")),
      ),
      trailing: Container(
        width: 32,
        height: 32,
        decoration: new BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
                color: Colors.black
            )
        ),
        child: Center(child: Text("1")),
      ),
      title: Text(history.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(history.description),
          buildChips(history.tags),
          Text(history.city),
          Text(history.address),
        ],
      ),
      isThreeLine: true,
    ),
  );

  Widget buildChips(List<String> chips) => Wrap(
    spacing: 12.0,
    runSpacing: 2.0,
    children: buildChildrenChips(chips),
  );

  List<Widget> buildChildrenChips(List<String> chips) =>
      List.generate(
        chips.length,
        (i) => Chip(label: Text(chips[i]))
      );

}