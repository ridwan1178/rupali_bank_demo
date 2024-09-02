import 'package:flutter/cupertino.dart';

//not being used
class AbstractHighlights extends StatefulWidget {
  final List<dynamic> items;

  AbstractHighlights({Key? key, required this.items}) : super(key: key);

  @override
  State<AbstractHighlights> createState() => _AbstractHighlightsState();
}

class _AbstractHighlightsState extends State<AbstractHighlights> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
