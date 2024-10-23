import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('감정 선택', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('오늘의 감정을 선택하세요', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildEmotionOption(context, '행복해요'),
                _buildEmotionOption(context, '슬퍼요'),
                _buildEmotionOption(context, '화나요'),
                _buildEmotionOption(context, '지쳤어요'),
                _buildEmotionOption(context, '감사해요'),
                _buildEmotionOption(context, '두려워요'),
                _buildEmotionOption(context, '평안해요'),
                _buildEmotionOption(context, '사랑해요'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionOption(BuildContext context, String emotion) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, emotion); // 선택된 감정을 반환
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(emotion, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
