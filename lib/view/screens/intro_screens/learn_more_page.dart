
import 'package:idly_factory/constants/export.dart';

class LearnMorePage extends StatefulWidget {
  @override
  _LearnMorePageState createState() => _LearnMorePageState();
}

class _LearnMorePageState extends State<LearnMorePage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> pageData = [
    {
      "image": "assets/image1.png",
      "title": "Exclusive Offers",
      "description": "Get amazing offers on your favorite items."
    },
    {
      "image": "assets/image2.png",
      "title": "Special Gifts",
      "description": "Enjoy a special gift on every purchase."
    },
    {
      "image": "assets/image3.png",
      "title": "Play and Win",
      "description": "Participate in games and win exciting prizes."
    },
    {
      "image": "assets/image4.png",
      "title": "Fast Delivery",
      "description": "Order now and get fast delivery."
    },
    {
      "image": "assets/image5.png",
      "title": "Premium Access",
      "description": "Unlock premium content with membership."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Explore the benefits"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pageData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(pageData[index]['image']!, height: 200),
                      SizedBox(height: 20),
                      Text(
                        pageData[index]['title']!,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        pageData[index]['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Page Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageData.length, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.red : Colors.grey,
                ),
              );
            }),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Maybe Later",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
