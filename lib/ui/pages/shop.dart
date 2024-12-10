import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _currentIndex = 0;
  TextEditingController _searchController =
      TextEditingController(); // 검색어 입력 컨트롤러
  List<Map<String, String>> filteredProducts = []; // 필터링된 상품 리스트

  // MD 추천 상품 (10개)
  final List<Map<String, String>> mdRecommendedProducts = [
    {
      'name': '인싸 고양이를 위한 멋쟁이 안경',
      'price': '5,000원',
      'image': 'assets/images/product1.png'
    },
    {
      'name': 'MD 추천 상품 2',
      'price': '32,000원',
      'image': 'assets/images/product2.png'
    },
    {
      'name': 'MD 추천 상품 3',
      'price': '89,900원',
      'image': 'assets/images/product3.png'
    },
    {
      'name': 'MD 추천 상품 4',
      'price': '100,000원',
      'image': 'assets/images/product4.png'
    },
    {
      'name': 'MD 추천 상품 5',
      'price': '25,000원',
      'image': 'assets/images/product5.png'
    },
    {
      'name': 'MD 추천 상품 6',
      'price': '5,000원',
      'image': 'assets/images/product6.png'
    },
    {
      'name': 'MD 추천 상품 7',
      'price': '21,500원',
      'image': 'assets/images/product7.png'
    },
    {
      'name': 'MD 추천 상품 8',
      'price': '100,000원',
      'image': 'assets/images/product8.png'
    },
    {
      'name': 'MD 추천 상품 9',
      'price': '220,000원',
      'image': 'assets/images/product9.png'
    },
    {
      'name': 'MD 추천 상품 10',
      'price': '399,000원',
      'image': 'assets/images/product10.png'
    },
  ];
  //전체 상품 (30ro)
  final List<Map<String, String>> allProducts = [
    {
      'name': '베베독 분유 300g',
      'price': '12,000원',
      'image': 'assets/images/item1.png'
    },
    {
      'name': '전연령용 튼튼 사료 2.5kg',
      'price': '35,000원',
      'image': 'assets/images/item2.png'
    },
    {'name': '펫안심 펜스', 'price': '57,000원', 'image': 'assets/images/item3.png'},
    {'name': '편안홈 숨숨집', 'price': '50,000원', 'image': 'assets/images/item4.png'},
    {'name': '안전 이동장', 'price': '49,900원', 'image': 'assets/images/item5.png'},
    {'name': '스테인 밥그릇', 'price': '18,000원', 'image': 'assets/images/item6.png'},
    {
      'name': '투명 유리 물그릇',
      'price': '10,000원',
      'image': 'assets/images/item7.png'
    },
    {
      'name': '통통 테니스볼 2p',
      'price': '7,000원',
      'image': 'assets/images/item8.png'
    },
    {
      'name': '컬러풀 이갈이 로프',
      'price': '15,000원',
      'image': 'assets/images/item9.png'
    },
    {
      'name': '가벼운 산책 옷',
      'price': '30,000원',
      'image': 'assets/images/item10.png'
    },
    {
      'name': '방수 개나리 우비',
      'price': '35,500원',
      'image': 'assets/images/item11.png'
    },
    {
      'name': '붕붕 반려동물 유모차',
      'price': '230,000원',
      'image': 'assets/images/item12.png'
    },
    {
      'name': '건강 구마츄잉 간식',
      'price': '6,000원',
      'image': 'assets/images/item13.png'
    },
    {
      'name': '건강 미트츄잉 간식 4종',
      'price': '7,000원',
      'image': 'assets/images/item14.png'
    },
    {
      'name': '무염색 털실타래볼',
      'price': '12,000원',
      'image': 'assets/images/item15.png'
    },
    {
      'name': '슬개골 안심 푹신매트',
      'price': '23,000원',
      'image': 'assets/images/item16.png'
    },
    {
      'name': '짱짱 야간안심 목줄(옐로우)',
      'price': '19,900원',
      'image': 'assets/images/item17.png'
    },
    {
      'name': '더스트제로 화장실 모래 4.5kg',
      'price': '45,000원',
      'image': 'assets/images/item18.png'
    },
    {
      'name': '간편관리 고양이 화장실',
      'price': '17,000원',
      'image': 'assets/images/item19.png'
    },
    {
      'name': '블링블링 고양이 샴푸',
      'price': '20,000원',
      'image': 'assets/images/item20.png'
    },
    {
      'name': '숨숨 우드 캣타워',
      'price': '150,000원',
      'image': 'assets/images/item21.png'
    },
    {
      'name': '핸드메이드 쥐 모양 인형 3종',
      'price': '5,000원',
      'image': 'assets/images/item22.png'
    },
    {
      'name': '츄츄 영양간식(참치맛) 20개 묶음',
      'price': '28,000원',
      'image': 'assets/images/item23.png'
    },
    {
      'name': '낚싯대 깃털 장난감',
      'price': '4,000원',
      'image': 'assets/images/item24.png'
    },
    {
      'name': '뱀부 천연 반려동물 칫솔 (숏/롱)',
      'price': '9,000원',
      'image': 'assets/images/item25.png'
    },
    {
      'name': '푹신푹신 중독 도넛 쿠션',
      'price': '29,900원',
      'image': 'assets/images/item26.png'
    },
    {
      'name': '점프 안심 핑크 철펜스',
      'price': '59,900원',
      'image': 'assets/images/item27.png'
    },
    {
      'name': '컬러풀 쳇바퀴',
      'price': '12,500원',
      'image': 'assets/images/item28.png'
    },
    {
      'name': '햄스터 이갈이 나뭇가지(20p)',
      'price': '9,000원',
      'image': 'assets/images/item29.png'
    },
    {
      'name': '금붕어 전용 사료 50g',
      'price': '5,000원',
      'image': 'assets/images/item30.png'
    },
  ];

  // 검색어에 맞는 상품 필터링
  void _filterProducts(String query) {
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts; // 처음에는 모든 상품을 표시
    _searchController.addListener(() {
      _filterProducts(_searchController.text); // 검색어가 변경되면 필터링
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WEPET 샵'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'MD 추천 상품',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: mdRecommendedProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        mdRecommendedProducts[index]['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(mdRecommendedProducts[index]['name']!),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mdRecommendedProducts[index]['price']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '전체 상품',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: '검색어를 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        filteredProducts[index]['image']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(filteredProducts[index]['name']!),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            filteredProducts[index]['price']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigation logic for other pages
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '샵'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onSubmitted: (value) {
                // Implement search functionality here
                print('검색어: $value');
              },
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: Center(
                child: Text('검색 결과가 여기에 표시됩니다'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}