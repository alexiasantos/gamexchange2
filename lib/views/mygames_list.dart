import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';
import '../provider/games.dart';
import '../widgets/game_item.dart';
import 'package:provider/provider.dart';


class MyGameList extends StatelessWidget {
  //const GameOverviewScreen({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<Games>(context, listen: false).carregarGames();
  }

  @override
  Widget build(BuildContext context) {
    final Games games = Provider.of(context);
    final game = games.items;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/icons/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                        width: double.infinity,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            //borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,

                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    color: Colors.white,
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/game-overview-screen');
                                    },
                                  )
                                )
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/icons/gamexchange.png'),
                                          fit: BoxFit.scaleDown,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 50,

                                  child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: IconButton(
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: (){
                                          Navigator.pushNamed(context, '/game-form');
                                        },
                                      )
                                  )
                              )
                            ],
                          ),
                        ),
                      ),

                          
                          SingleChildScrollView(
                            child: Container(
                                //height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  //borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      "My Games",
                                        style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.grey[200],
                                        fontFamily: 'Anton'
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 300,
                                      height: MediaQuery.of(context).size.height * 80/100,

                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          //padding: const EdgeInsets.all(10),
                                          itemCount: games.count,
                                          itemBuilder: (ctx, i) => GameItem(game[i]),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1,
                                              //maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 3 ,
                                              mainAxisSpacing: 10
                                          ),
                                        ),
                                      ),

                                  ],
                                ),
                              ),
                          ),

                      ],

            ),
          ),

      ),

    );

    /*return Scaffold(
      appBar: AppBar(
        title: Text(
            'gameXchange'
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedGames.length,
          itemBuilder: (ctx, i) => GameItem(loadedGames[i]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          )
      ),
    );*/
  }
}

/*
actions: <Widget> [
  Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(10)
    ),
    child: Center(
      child: Icon(Icons.account_box),
    ),
  ),
  )
]*/