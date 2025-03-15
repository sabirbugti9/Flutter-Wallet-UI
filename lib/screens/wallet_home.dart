import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/card_model.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/card_widget.dart';
import '../widgets/action_buttons.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_bottom_app_bar.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({super.key});

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  int activeIndex = 0;

  // List of CardModel instances to display in the carousel.
  final List<CardModel> cards = [
    CardModel(
        balance: "\$5250.25",
        number: "12345678",
        expiry: "10/24",
        color: 0xFF8A2BE2),
    CardModel(
        balance: "\$1200.00",
        number: "87654321",
        expiry: "12/25",
        color: 0xFF20B2AA),
    CardModel(
        balance: "\$340.50",
        number: "11223344",
        expiry: "11/23",
        color: 0xFFFF6347),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardText(),
            SizedBox(height: 20,),
            _cardSlider(),
            SizedBox(height: 10,),
            _sliderIndicator(),
            SizedBox(height: 40,),
            ActionButtons(),
            SizedBox(height: 40,),
            CustomTitle(),
          ],
        ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      floatingActionButton: CenterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
    );
  }




























  Center _sliderIndicator() {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: cards.length,
        effect: const ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.black54,
        ),
        key: const Key('pageIndicator'), // Key for testing.
      ),
    );
  }

  CarouselSlider _cardSlider() {
    return CarouselSlider.builder(
      itemCount: cards.length,
      itemBuilder: (context, index, realIndex) {
        final card = cards[index];
        return CardWidget(card: card); // Custom card widget.
      },
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.9,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      key: const Key('carouselSlider'), // Key for testing.
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      centerTitle: false,
      title: const AppBarTitle(),
      // Custom title widget.
      actions: [
        IconButton(
          icon: const Icon(Icons.add), // Icon button to add new items.
          onPressed: () {},
          key: const Key('addButton'), // Key for testing.
        ),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}

class CenterButton extends StatelessWidget {
  const CenterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      shape: const CircleBorder(),
      onPressed: () {},
      key: const Key('floatingActionButton'),
      child: const Icon(Icons.attach_money,
          color: Colors.white), // Key for testing.
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomListTile(
          icon: Icons.bar_chart,
          iconColor: Colors.orange,
          title: 'Statistics',
          subtitle: 'Payment and Income',
          key: Key('statisticsTile'), // Key for testing.
        ),
        const CustomListTile(
          icon: Icons.history,
          iconColor: Colors.green,
          title: 'Transactions',
          subtitle: 'Transaction History',
          key: Key('transactionsTile'), // Key for testing.
        ),
      ],
    );
  }
}

class CardText extends StatelessWidget {
  const CardText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'My ',
            style:
                TextStyle(fontWeight: FontWeight.bold), // Bold style for 'My'.
          ),
          TextSpan(
            text: 'Cards ',
            style:
                TextStyle(fontWeight: FontWeight.bold), // Bold style for 'My'.
          ),
        ],
      ),
    );
  }
}
