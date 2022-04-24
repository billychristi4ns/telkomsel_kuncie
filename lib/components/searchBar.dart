import 'package:flutter/material.dart';
import 'package:telkomsel_kuncie/state/searchState.dart';

class SearcBar extends StatelessWidget {
  final SearchState sState;
  const SearcBar(this.sState);

  @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: TextField(onSubmitted: (a)async{
              sState.searchArtist(a);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal:12),
            focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3.0),
              ),
              hintText: 'Search Artist',
          ),
          textInputAction: TextInputAction.search
          ),
        );
  }
}
