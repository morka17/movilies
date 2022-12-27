import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/explore.dart';
import '../services/moviles.dart';


void showModelFiter(context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    )),
    context: context,
    builder: (context) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
            )),
            child: Text("Filter By"),
          ),
          for (var value in MovieOptions.values)
            InkWell(
              onTap: () {
                Navigator.pop(context);
                context.read<ExploreProvider>().retrieveMovies(value);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value.toString()),
                    Icon(
                      Icons.circle,
                      color:
                          context.watch<ExploreProvider>().prevOption.index ==
                                  value.index
                              ? Colors.red
                              : Colors.grey,
                      size: 20,
                    )
                  ],
                ),
              ),
            )
        ],
      );
    },
  );
}
