import 'package:flutter/material.dart';
import 'package:telkomsel_kuncie/models/song.dart';
import 'package:telkomsel_kuncie/state/mediaPlayerState.dart';
import 'package:telkomsel_kuncie/state/searchState.dart';

class MusicCard extends StatelessWidget {
  final Song data;
  final MediaPlayerState mpState;
  final SearchState sState;
  const MusicCard(this.data,this.mpState,this.sState);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        mpState.setPlaylist(sState.getSearchResult,data);
      },
      child: Card(child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                        child: Image.network(data.albumArt,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(data.title,overflow: TextOverflow.clip,maxLines: 2,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: Text(data.artist),
                          ),
                          Text(data.albumName,overflow: TextOverflow.clip,maxLines: 2,)
                        ],),
                      ),
                      mpState.getCurrentSongId==data.trackId?Container(width: 20,child: Icon(Icons.music_note),):Container(width: 20,) // container with width 20 still occupying the place even if true or false
                    ],
                  ),
      ),),
    );
  }
}
