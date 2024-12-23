import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/pages/writing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '커뮤니티',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF00FF00),
        secondary: const Color(0x8800FF00),
      )),
      home: const CommunityPage(),
    ); //건들지마쇼아저씨
  } //실행 ㄱ
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<Map<String, dynamic>> posts = [
    {
      'id': 1,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileUrl': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/200',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isLiked': false, // 좋아요 상태 추가
      'isScraped': false, // 스크랩 상태 추가
    },
    {
      'id': 2,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileUrl': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/200',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isLiked': false, // 좋아요 상태 추가
      'isScraped': false, // 스크랩 상태 추가
    },
    {
      'id': 3,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileUrl': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/200',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isLiked': false, // 좋아요 상태 추가
      'isScraped': false, // 스크랩 상태 추가
    },
    {
      'id': 4,
      'author': '나의 반려견',
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'profileUrl': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/200',
      'likes': 45,
      'comments': [
        {'author': '유저1', 'content': '너무 귀여워요!'},
        {'author': '유저2', 'content': '정말 귀엽네요 ㅎㅎ'},
      ],
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isLiked': false, // 좋아요 상태 추가
      'isScraped': false, // 스크랩 상태 추가
    },
  ];

  void _navigateToPostDetail(Map<String, dynamic> post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailPage(post: post),
      ),
    );
  }

  void _navigateToWritePostPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WritePostPage(
          onPostUploaded: (String title, String content) {
            setState(() {
              // 새로운 게시글을 추가하고 시간순으로 정렬
              posts.add({
                'id': posts.length + 1,
                'author': '나의 반려견',
                'title': title,
                'content': content,
                'profileUrl': 'https://via.placeholder.com/50',
                'imageUrl': 'https://via.placeholder.com/200',
                'likes': 0,
                'comments': [],
                'createdAt': DateTime.now(),
                'isLiked': false,
                'isScraped': false,
              });

              // createdAt 기준으로 내림차순 정렬
              posts.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 보관함'),
      ),
      body: posts.isEmpty
          ? const Center(
              child: Text('보관된 게시글이 없습니다.'),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () => _navigateToPostDetail(post),
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Container(
                      height: 90, // 높이를 적당히 늘려서 시간 표시 공간 추가
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(post['profileUrl']),
                            radius: 25,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['title'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  post['content'],
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 4),
                                // 업로드 시간 표시
                                Text(
                                  '${post['createdAt'].year}/${post['createdAt'].month}/${post['createdAt'].day} '
                                  '${post['createdAt'].hour}:${post['createdAt'].minute.toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Image.network(
                              post['imageUrl'],
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToWritePostPage,
        child: const Icon(Icons.add),
        tooltip: '글쓰기',
      ),
    );
  }
}

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late Map<String, dynamic> post;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    post = Map<String, dynamic>.from(widget.post);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment(String content) {
    if (content.trim().isEmpty) return;

    setState(() {
      post['comments'].add({
        'author': '나섬이', // 현재 사용자 이름 또는 ID를 설정
        'content': content,
      });
    });

    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 작성자 정보
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post['profileUrl']),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  post['author'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 제목
            Text(
              post['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // 내용
            Text(
              post['content'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // 이미지 (글 아래에 표시)
            if (post['imageUrl'] != null && post['imageUrl'].isNotEmpty)
              Image.network(post['imageUrl']),

            const SizedBox(height: 20),

            // 좋아요 및 스크랩 버튼
            Row(
              children: [
                IconButton(
                  icon: Icon(
                      post['isLiked'] ? Icons.favorite : Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      post['isLiked'] = !post['isLiked'];
                      post['likes'] += post['isLiked'] ? 1 : -1;
                    });
                  },
                ),
                Text('${post['likes']} likes'),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(post['isScraped']
                      ? Icons.bookmark
                      : Icons.bookmark_border),
                  onPressed: () {
                    setState(() {
                      post['isScraped'] = !post['isScraped'];
                    });
                  },
                ),
              ],
            ),

            const Divider(),
            const Text(
              '댓글',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // 댓글 리스트
            Expanded(
              child: ListView.builder(
                itemCount: post['comments'].length,
                itemBuilder: (context, index) {
                  final comment = post['comments'][index];
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post['profileUrl']),
                      radius: 18,
                    ),
                    title: Text(
                      comment['author'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(comment['content']),
                  );
                },
              ),
            ),

            const Divider(),

            // 댓글 입력 TextField
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: '댓글을 입력하세요...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _addComment(_commentController.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}