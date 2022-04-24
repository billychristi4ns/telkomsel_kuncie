import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:telkomsel_kuncie/models/song.dart';
import 'package:http/http.dart' as http;

class SearchState with ChangeNotifier {
  List<Song> _searchResultList=[];

  List<Song> get getSearchResult=>_searchResultList;

  void searchArtist(String name)async{
    String temp=name.replaceAll(' ', '+');
    var url = 'https://itunes.apple.com/search?term=$temp&entity=song&attribute=artistTerm';
    var response = await http.get(url,);
    Map<String,dynamic> a=jsonDecode(response.body);
    List rawList=a['results'];
    _searchResultList=rawList.map((e) => Song(e['trackName'],e['artistName'],e['collectionName'],e['artworkUrl100'],e['previewUrl'],e['trackId'].toString())).toList();
    notifyListeners();
  }
}