import 'package:flutter/material.dart';
import 'write.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedEmotion; // 선택된 감정을 저장

  void updateEmotion(String emotion) {
    setState(() {
      selectedEmotion = emotion; // 선택된 감정 업데이트
    });
  }

  double _getSizeForEmotion(String emotion) {
    if (selectedEmotion == emotion) {
      return 120; // 선택된 감정의 크기
    }
    return 80; // 기본 크기
  }

  void _navigateToWriteScreen() async {
    final selectedEmotion = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WriteScreen()),
    );

    if (selectedEmotion != null) {
      updateEmotion(selectedEmotion);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASSIST', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2024.07.23',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              'OO님, 오늘 어떤 감정이 들었나요?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildEmotionButton('행복해요', Colors.yellow),
                _buildEmotionButton('슬퍼요', Colors.blue),
                _buildEmotionButton('화나요', Colors.red),
                _buildEmotionButton('지쳤어요', Colors.grey),
                _buildEmotionButton('감사해요', Colors.orange),
                _buildEmotionButton('두려워요', Colors.indigo),
                _buildEmotionButton('평안해요', Colors.white),
                _buildEmotionButton('사랑해요', Colors.pink),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('감정 분석표', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            _navigateToWriteScreen();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '일기 쓰기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '일기 보기',
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionButton(String label, Color color) {
    return GestureDetector(
      onTap: () {
        updateEmotion(label); // 감정 선택 시 업데이트
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _getSizeForEmotion(label),
        height: _getSizeForEmotion(label),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
