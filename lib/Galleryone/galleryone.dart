import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return CardItem(
              imageAsset: 'assets/images/imageslider${index + 1}.jpg',
              scrollController: _controller);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CardItem extends StatelessWidget {
  final String imageAsset;
  final ScrollController scrollController;

  const CardItem(
      {super.key, required this.imageAsset, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    // Calculate the parallax effect by using the scroll offset
    final double offset = scrollController.offset;
    final double parallax = offset / 2.0; // Adjust the value as needed

    return Card(
      elevation: 2.0, // Add some elevation for a card-like effect
      child: Column(
        children: [
          // Apply a transform to create the parallax scrolling effect
          Transform.translate(
            offset: Offset(0, parallax),
            child: Image.asset(
              imageAsset,
              width: double.infinity,
              height: 270.0, // Fixed height
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(''),
          ),
        ],
      ),
    );
  }
}

