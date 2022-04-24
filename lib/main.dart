
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telkomsel_kuncie/components/bottomPlayer.dart';
import 'package:telkomsel_kuncie/components/musicCard.dart';
import 'package:telkomsel_kuncie/components/searchBar.dart';
import 'package:telkomsel_kuncie/state/mediaPlayerState.dart';
import 'package:telkomsel_kuncie/state/searchState.dart';

  void main() {
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider<SearchState>(create: (_)=>SearchState()),
      ChangeNotifierProvider<MediaPlayerState>(create: (_)=>MediaPlayerState())
    ],
    child: MyApp()));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telkomsel Kuncie',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchState sState;
  MediaPlayerState mpState;
  bool needSetListener=true;

  @override
  void didChangeDependencies() {
    sState=context.watch<SearchState>();
    mpState=context.watch<MediaPlayerState>();
    if(needSetListener){
      mpState.setListenerPlayer();
      needSetListener=false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SearcBar(sState)
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom:mpState.isNoSong?0:45.0), // 45 so last title and singer still visible but still "on top of the list as shown"
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sState.getSearchResult.map((e) => MusicCard(e,mpState,sState)).toList(),
              ),
            ),
          ),
          if(!mpState.isNoSong)
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomPlayer())
        ],
      ),
    );
  }
}

