import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_web_hello/screens/likes.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var wordf = WordPair.random();

  void _pushSaved() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Likes(_saved)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => {},
          )
        ],
        centerTitle: true,
        title: Text('Fultter Web App Hello'),
      ),
      body: _buildSuggestions(),
      bottomNavigationBar: _getBottomNavigationBar(_saved),
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Drawer getDrawer() {
    return Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _getUserHeader(),
            ListTile(
              title: Text("Mis apps y Juegos"),
              leading: Icon(Icons.apps),
            ),
            ListTile(
              title: Text("Notificaciones"),
              leading: Icon(Icons.notifications_none),
            ),
            ListTile(
              title: Text("Suscripciones"),
              leading: Icon(Icons.cached),
            ),
            ListTile(
              title: Text("Lista de deseos"),
              leading: Icon(Icons.favorite_border),
            ),
            Divider(
              color: Colors.black54,
              height: 5,
            ),
            ListTile(
              title: Text("Cuenta"),
              leading: Icon(Icons.person_outline),
            ),
            ListTile(
              title: Text("Formas de pago"),
              leading: Icon(Icons.payment),
            ),
            ListTile(
              title: Text("Play Protect"),
              leading: Icon(Icons.security),
            ),
            ListTile(
              title: Text("Configuracion"),
              leading: Icon(Icons.settings),
            ),
            Divider(
              color: Colors.black54,
              height: 5,
            ),
            ListTile(
              title: Text("Abir app de Peliculas"),
              leading: Icon(Icons.local_movies),
              trailing: Icon(Icons.exit_to_app),
            ),
            ListTile(
              title: Text("Abir app de Libros"),
              leading: Icon(Icons.book),
              trailing: Icon(Icons.exit_to_app),
            ),
            ListTile(
              title: Text("Abrir app de Musica"),
              leading: Icon(Icons.music_note),
              trailing: Icon(Icons.exit_to_app),
            ),
            Divider(
              color: Colors.black54,
              height: 5,
            ),
            ListTile(
              title: Text("Buscar Musica"),
              leading: Icon(Icons.queue_music),
            ),
            Divider(
              color: Colors.black54,
              height: 5,
            ),
            ListTile(
              title: Text("Canjear"),
            ),
            ListTile(
              title: Text("Ayuda y Comentarios"),
            ),
            ListTile(
              title: Text("Guia para Padres"),
            ),
            ListTile(
              title: Text("Acerca de..."),
            ),
          ],
        ));
  }

  UserAccountsDrawerHeader _getUserHeader() {
    return UserAccountsDrawerHeader(
      onDetailsPressed: () {
        debugPrint("Detail Account");
      },
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
            image: NetworkImage(
                "https://static.vecteezy.com/packs/media/components/home/masthead/img/lavakidneys_800x400@2x-2db5e5a0c944e2b16a11a18674570f76.jpg"),
          )),
      accountName: Text("Lopez Daimian"),
      accountEmail: Text("dennyslopez2013@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://avatars1.githubusercontent.com/u/46911625?s=400&u=d33335cce7908a2cc536161de475e5fa336746c4&v=4"),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text("FL"),
        ),
        CircleAvatar(
          child: Text("AR"),
        )
      ],
    );
  }
}

class _getBottomNavigationBar extends StatefulWidget {
  Set<WordPair> _saved = {};
  _getBottomNavigationBar(this._saved):super();
  @override
  _getBottomNavigationBarState createState() {
    return _getBottomNavigationBarState(_saved);
  }
}

class _getBottomNavigationBarState extends State<_getBottomNavigationBar> {
  Set<WordPair> _saved = {};
  int indexTap = 0;
  _getBottomNavigationBarState(this._saved):super();
void _pushSaved() {
Navigator.push(context,MaterialPageRoute(builder: (context)=>Likes(this._saved)));
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      currentIndex: indexTap,
      elevation: 10,
      showSelectedLabels: true,
      onTap: (index) {
        setState(() {
          indexTap = index;
        });
        if(index==1){
        _pushSaved();
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home,size: 30.0,),
          icon: Icon(
            Icons.home,
            size: 30.0,
            color: Colors.black45
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 30.0,
            color: Colors.black45,
          ),
          activeIcon: Icon(
            Icons.favorite,
            size: 30.0,
          ),
          title: Text(''),
        ),
      ],
    );
  }
}
