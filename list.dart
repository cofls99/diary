import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiaryWriteScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiaryListScreen()),
            );
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
    return Container(
      width: 80,
      height: 80,
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
    );
  }
}

class DiaryWriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일기 쓰기', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '오늘의 감정',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '오늘의 감정을 기록하세요',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save diary entry logic
              },
              child: Text('저장하기'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiaryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일기 목록', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDiaryListItem('2024.07.22', '오늘은 기분이 정말 좋았어요!'),
          _buildDiaryListItem('2024.07.21', '조금 우울한 하루였어요.'),
          _buildDiaryListItem('2024.07.20', '친구들과 즐거운 시간을 보냈어요.'),
          _buildDiaryListItem('2024.07.19', '많이 피곤한 하루였습니다.'),
        ],
      ),
    );
  }

  Widget _buildDiaryListItem(String date, String summary) {
    return Card(
      child: ListTile(
        title: Text(date),
        subtitle: Text(summary),
        onTap: () {
          // Diary detail page logic
        },
      ),
    );
  }
}
