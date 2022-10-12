import 'package:flutter/material.dart';
import 'contato_tela.dart';
import "conversa_tela.dart";
import 'login_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text("UniTalk"),
          bottom: const TabBar(tabs: [
            Tab(text: "Conversas"),
            Tab(text: "Contatos"),
          ]),
          actions: [
            //IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const Icon(Icons.more_vert))
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text("Sair")),
              ],
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.of(context).pop();
                    break;
                }
              },
            )
          ],
        ),
        body: const TabBarView(children: [
          TelaConversas(),
          TelaContatos(),
        ]),
      ),
    );
  }
}
