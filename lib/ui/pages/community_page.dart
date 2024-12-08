import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'dart:io'; // File 클래스 관련
import 'package:image_picker/image_picker.dart';
>>>>>>> 111f93d (flutter)

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: '앱 제목',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        backgroundColor: const Color(0xFF009223),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 커뮤니티 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CommunityPage()),
            );
          },
          child: const Text('커뮤니티'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF7DD4A6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
=======
      title: '커뮤니티',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CommunityPage(),
>>>>>>> 111f93d (flutter)
    );
  }
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
<<<<<<< HEAD
  // 게시글 리스트
  List<Map<String, String>> posts = [
    {
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 세상 너무 이쁜거 같아 진짜 너무 귀엽지 않아 ㅠㅠ??',
      'imageUrl': 'https://via.placeholder.com/50',
    },
    {
      'title': '**서울 잠실 산책로 추천**',
      'content': '1. 잠실 석촌호수\n2. 송파 둘레길\n3. 잠실 한강공원 ...',
    },
    {
      'title': '우리 동네 동물병원 생겼는데',
      'content': '엄청 크고 되게 깔끔한 것 같아. 여기 병원 위치는 대전광역시 서구에 있어!',
    },
    {
      'title': '우리 강아지 눈이 충혈됐어',
      'content': '울 강아지 눈이 충혈 됐는데 어떻게 해야 해 ㅠㅠ?\n우리 집 근처에는 24시 동물병원이 없어서 ...',
    },
    {
      'title': '오늘은 강아지의 날',
      'content': '오늘은 강아지의 날입니다! 다들 오늘 본인들 강아지에게 더 많이 사랑해주세요 ❤❤❤',
    },
    {
      'title': '우리 강아지 생일인데 축하해줘',
      'content': '울 강아지 오늘 생일이야! 축하해줘 ❤❤❤',
    },
    {
      'title': '강아지 산책 예절',
      'content': '산책할 때 리드줄 길이 조절 중요해요. 다른 강아지와 만날 때도 주의해야 한답니다!',
    },
  ];

  // 새 게시글 추가하는 함수
  void addPost(Map<String, String> newPost) {
    setState(() {
      posts.add(newPost); // 게시글 추가 후 화면 갱신
=======
  List<Map<String, dynamic>> posts = [
    {
      'id': 1,
      'title': '우리 강아지 귀여운거 봐봐',
      'content': '나 처음으로 강아지 키우는데 너무 귀엽지 않아?',
      'author': '나의 반려견',
      'profileUrl': 'https://via.placeholder.com/50',
      'imageUrl': 'https://via.placeholder.com/200',
      'likes': 45,
      'comments': [],
    },
  ];

  void addPost(Map<String, dynamic> newPost) {
    setState(() {
      posts.add(newPost);
>>>>>>> 111f93d (flutter)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('커뮤니티'),
        backgroundColor: const Color(0xFF009223),
      ),
<<<<<<< HEAD
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // 새 게시글 작성 페이지로 이동하고, 새 게시글 데이터를 받아옴
              final newPost = await Navigator.push<Map<String, String>>(
                context,
                MaterialPageRoute(builder: (context) => const WritePostPage()),
              );
              if (newPost != null) {
                addPost(newPost); // 새로운 게시글이 있으면 추가
              }
            },
            child: const Text('작성하기', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xFF7DD4A6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(
                          title: posts[index]['title']!,
                          content: posts[index]['content']!,
                          post: posts[index],
                        ),
                      ),
                    );
                  },
                  child: CommunityPost(
                    title: posts[index]['title']!,
                    content: posts[index]['content']!,
                    imageUrl: posts[index]['imageUrl'],
                  ),
                );
              },
            ),
          ),
        ],
=======
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(
                    post: post,
                    onUpdate: (updatedPost) {
                      setState(() {
                        posts[index] = updatedPost;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        posts.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
            child: CommunityPost(post: post),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final newPost = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (context) => const WritePostPage()),
          );
          if (newPost != null) {
            addPost(newPost);
          }
        },
        child: const Text('글쓰기', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7DD4A6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
>>>>>>> 111f93d (flutter)
      ),
    );
  }
}

class CommunityPost extends StatelessWidget {
<<<<<<< HEAD
  final String title;
  final String content;
  final String? imageUrl;

  const CommunityPost({
    Key? key,
    required this.title,
    required this.content,
    this.imageUrl,
  }) : super(key: key);
=======
  final Map<String, dynamic> post;

  const CommunityPost({Key? key, required this.post}) : super(key: key);
>>>>>>> 111f93d (flutter)

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
<<<<<<< HEAD
        contentPadding: const EdgeInsets.all(16),
        leading: imageUrl != null
            ? Image.network(imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
            : null,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
=======
        leading: Image.network(post['profileUrl'], width: 50, height: 50),
        title: Text(post['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post['content']),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 14),
                const SizedBox(width: 4),
                Text(post['likes'].toString(), style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 16),
                Icon(Icons.comment, size: 14),
                const SizedBox(width: 4),
                Text(post['comments'].length.toString(), style: const TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
>>>>>>> 111f93d (flutter)
      ),
    );
  }
}

<<<<<<< HEAD
class PostDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final Map<String, dynamic> post;

  const PostDetailPage({
    Key? key,
    required this.title,
    required this.content,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF009223),
=======
class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;
  final void Function(Map<String, dynamic>) onUpdate;
  final VoidCallback onDelete;

  const PostDetailPage({
    Key? key,
    required this.post,
    required this.onUpdate,
    required this.onDelete,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final TextEditingController commentController = TextEditingController();

  void addComment(String comment) {
    setState(() {
      widget.post['comments'].add(comment);
    });
    widget.onUpdate(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post['title']),
        backgroundColor: const Color(0xFF009223),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // 수정 로직
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WritePostPage(
                    initialTitle: widget.post['title'],
                    initialContent: widget.post['content'],
                    initialImagePath: widget.post['imageUrl'],
                  ),
                ),
              ).then((updatedPost) {
                if (updatedPost != null) {
                  widget.onUpdate(updatedPost);
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
>>>>>>> 111f93d (flutter)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            Text(content, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text("작성자: ${post['author'] ?? '익명'}",
                style: const TextStyle(color: Colors.grey)),
=======
            Row(
              children: [
                Image.network(widget.post['profileUrl'], width: 50, height: 50),
                const SizedBox(width: 10),
                Text(widget.post['author'], style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Text(widget.post['content'], style: const TextStyle(fontSize: 16)),
            if (widget.post['imageUrl'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.network(widget.post['imageUrl']),
              ),
            const SizedBox(height: 20),
            const Text('댓글', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: widget.post['comments'].length,
                itemBuilder: (context, index) {
                  final comment = widget.post['comments'][index];
                  return ListTile(
                    title: Text(comment),
                  );
                },
              ),
            ),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(labelText: '댓글 작성'),
            ),
            ElevatedButton(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  addComment(commentController.text);
                  commentController.clear();
                }
              },
              child: const Text('댓글 작성'),
            ),
>>>>>>> 111f93d (flutter)
          ],
        ),
      ),
    );
  }
}

class WritePostPage extends StatefulWidget {
<<<<<<< HEAD
  const WritePostPage({Key? key}) : super(key: key);
=======
  final String? initialTitle;
  final String? initialContent;
  final String? initialImagePath;

  const WritePostPage({
    Key? key,
    this.initialTitle,
    this.initialContent,
    this.initialImagePath,
  }) : super(key: key);
>>>>>>> 111f93d (flutter)

  @override
  _WritePostPageState createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
<<<<<<< HEAD
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  // 새 게시글 작성 함수
=======
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

>>>>>>> 111f93d (flutter)
  void _submitPost() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      final newPost = {
<<<<<<< HEAD
        'title': title,
        'content': content,
        'imageUrl': 'https://via.placeholder.com/50',
      };
      Navigator.pop(context, newPost); // 작성된 게시글을 CommunityPage로 전달
=======
        'id': DateTime.now().millisecondsSinceEpoch,
        'title': title,
        'content': content,
        'author': '나의 반려견',
        'profileUrl': 'https://via.placeholder.com/50',
        'imageUrl': _imagePath,
        'likes': 0,
        'comments': [],
      };
      Navigator.pop(context, newPost);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialTitle != null) {
      _titleController.text = widget.initialTitle!;
      _contentController.text = widget.initialContent!;
      _imagePath = widget.initialImagePath;
>>>>>>> 111f93d (flutter)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('새 게시글 작성'),
=======
        title: const Text('게시글 작성'),
>>>>>>> 111f93d (flutter)
        backgroundColor: const Color(0xFF009223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '제목'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: '내용'),
              maxLines: 5,
            ),
<<<<<<< HEAD
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('게시글 작성'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF7DD4A6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
=======
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('이미지 첨부'),
            ),
            if (_imagePath != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.file(
                  File(_imagePath!),
                  height: 200,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('저장'),
>>>>>>> 111f93d (flutter)
            ),
          ],
        ),
      ),
    );
  }
}
