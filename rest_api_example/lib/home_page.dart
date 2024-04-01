import 'package:flutter/material.dart';
import 'package:rest_api_example/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myshowDialog(context);
          },
        ),
        body: Column(children: [
          Expanded(
            child: postListWidget(),
          )
        ]));
  }

  //postları listeleme
  ListView postListWidget() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                delete(data[index].sId.toString());
              }),
          title: Text(data[index].name.toString()),
          subtitle: Text(data[index].description.toString()),
        );
      },
    );
  }

  // yeni post oluşturma

  @override
  Future myshowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Lütfen ürün bilgilerini girin"),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                ),
                TextField(
                  controller: descController,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    create();
                    Navigator.pop(context);
                  },
                  child: const Text("Tamam")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("İptal")),
            ],
          );
        });
  }
}
