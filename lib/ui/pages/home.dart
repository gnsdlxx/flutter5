import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/ui/pages/profile.dart' as profile;
import 'package:flutter_application_2/ui/pages/community_page.dart'
    as community;
import 'package:flutter_application_2/ui/pages/shop.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({Key? key, required this.token}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // BottomNavigationBar의 현재 인덱스
  final TextEditingController _searchController = TextEditingController();

  // BEST 게시글 데이터 (5개로 확장)
  final List<Map<String, dynamic>> bestPosts = [
    {
      "title": "여기 동물병원 친절해요",
      "content": "앞으로 여기 동물병원 자주 방문할 예정~.",
      "author": "이순신",
      "likes": 150,
      "createdAt": DateTime.now().subtract(const Duration(hours: 1)),
      "imagePath": 'assets/images/A.png.png',
      "comments": [
        {"author": "박준호", "content": "저도 자주 가는 곳이에요!"}
      ],
    },
    {
      "title": "강아지 산책",
      "content": "오늘 날씨가 너무 좋아서 강아지와 산책했어요!",
      "author": "김철수",
      "likes": 200,
      "createdAt": DateTime.now().subtract(const Duration(hours: 2)),
      "imagePath": 'assets/images/C.png',
      "comments": [
        {"author": "정수진", "content": "너무 부러워요!"}
      ],
    },
    {
      "title": "새로운 장난감",
      "content": "냥이가 새로운 장난감을 정말 좋아하네요!",
      "author": "박민지",
      "likes": 180,
      "createdAt": DateTime.now().subtract(const Duration(hours: 3)),
      "imagePath": 'assets/images/B.png',
      "comments": []
    },
    {
      "title": "강아지 간식 만들기",
      "content": "직접 만든 강아지 간식, 너무 잘 먹어서 뿌듯해요!",
      "author": "이영희",
      "likes": 300,
      "createdAt": DateTime.now().subtract(const Duration(hours: 4)),
      "imagePath": 'assets/images/D.png',
      "comments": []
    },
    {
      "title": "고양이와 함께한 하루",
      "content": "고양이와 하루 종일 집에서 놀았어요.",
      "author": "홍길동",
      "likes": 120,
      "createdAt": DateTime.now().subtract(const Duration(hours: 5)),
      "imagePath": 'assets/images/E.png',
      "comments": []
    },
  ];

  // 추천 상품 데이터
  final List<Map<String, dynamic>> recommendedProducts = [
    {
      "name": "강아지 사료",
      "imagePath": 'assets/images/product1.png',
      "price": 12000,
    },
    {
      "name": "고양이 장난감",
      "imagePath": 'assets/images/product2.png',
      "price": 15000,
    },
    {
      "name": "애완동물 침대",
      "imagePath": 'assets/images/product3.png',
      "price": 30000,
    },
    {
      "name": "강아지 목줄",
      "imagePath": 'assets/images/product4.png',
      "price": 8000,
    },
    {
      "name": "고양이 화장실",
      "imagePath": 'assets/images/product5.png',
      "price": 25000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png', // 로고 이미지 경로
          height: 60, // 로고의 크기를 60으로 설정
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 알림 버튼 로직
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const community.CommunityPage(),
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const profile.Profile(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(
              icon: Icon(Icons.store), label: '샵'), // 수정된 부분
          BottomNavigationBarItem(icon: Icon(Icons.group), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage();
      default:
        return const Center(child: Text('페이지 없음'));
    }
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'BEST 게시글',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: bestPosts.length,
              itemBuilder: (context, index) {
                final post = bestPosts[index];
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(post['createdAt']);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(post: post),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(post['imagePath']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post['title'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              '작성자: ${post['author']}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            Text(
                              '$formattedDate',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '추천 상품',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: recommendedProducts.length,
              itemBuilder: (context, index) {
                final product = recommendedProducts[index];

                return GestureDetector(
                  onTap: () {
                    // 상품 클릭 시 행동 (예: 상품 상세 페이지로 이동)
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(product['imagePath']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              '\$${product['price']}',
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late TextEditingController _commentController;
  late bool isScraped;
  late bool isLiked; // 좋아요 상태 추가

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    isScraped = widget.post['isScraped'] ?? false; // 스크랩 상태 초기화
    isLiked = widget.post['isLiked'] ?? false; // 좋아요 상태 초기화
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        widget.post['comments'].add({
          'author': '현재 사용자', // 현재 사용자 이름을 실제로 설정해야 함
          'content': _commentController.text,
        });
        _commentController.clear(); // 댓글 입력란 비우기
      });
    }
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked; // 좋아요 상태 토글
      widget.post['isLiked'] = isLiked; // 좋아요 상태 저장
      if (isLiked) {
        widget.post['likes']++; // 좋아요 증가
      } else {
        widget.post['likes']--; // 좋아요 취소
      }
    });
  }

  void _toggleScrap() {
    setState(() {
      isScraped = !isScraped;
      widget.post['isScraped'] = isScraped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('yyyy-MM-dd').format(widget.post['createdAt']);
    final comments = widget.post['comments'] as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 보기'),
      ),
      body: SingleChildScrollView(
        // 여기에 스크롤 기능 추가
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단에 작성자 프로필 이미지 및 이름 추가
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage(widget.post['imagePath']), // 작성자 프로필 이미지
                    radius: 24,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post['author'], // 작성자 이름
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$formattedDate',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                widget.post['title'],
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.post['content'],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // 게시글에 사진이 있다면 사진을 표시
              if (widget.post['imagePath'] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image.asset(
                    widget.post['imagePath'], // 게시글 사진
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

              const SizedBox(height: 16),
              // 좋아요 버튼 (하트 아이콘으로 변경)
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked
                          ? Colors.red
                          : Colors.grey, // 선택된 경우 빨간색, 아니면 회색
                    ),
                    onPressed: _toggleLike, // 좋아요 토글
                  ),
                  Text('${widget.post['likes']}'),
                  const SizedBox(width: 16),
                  // 스크랩 버튼
                  IconButton(
                    icon: Icon(
                      isScraped ? Icons.bookmark : Icons.bookmark_border,
                      color: isScraped ? Colors.blue : Colors.grey,
                    ),
                    onPressed: _toggleScrap, // 스크랩 토글
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('댓글',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              // 댓글 리스트
              ListView.builder(
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return ListTile(
                    title: Text(comment['author']),
                    subtitle: Text(comment['content']),
                  );
                },
              ),
              const SizedBox(height: 16),
              // 댓글 입력란과 버튼
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: '댓글을 입력하세요',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _addComment,
                    icon: const Icon(Icons.send, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
