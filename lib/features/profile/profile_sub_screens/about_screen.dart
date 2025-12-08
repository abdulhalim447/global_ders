import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About the App')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This application is a complete digital collection of seven Mathematics books written by respected teacher Ibrahim Halil Babaoğlu. With years of teaching experience and deep subject knowledge, he has prepared these books to ensure that students can learn Mathematics in a structured, clear, and practical way. The purpose of this app is to make those valuable resources easily accessible to every learner, regardless of time or place.\n\n'
          'All books inside the app are arranged chapter-wise and follow the academic curriculum step by step. Students can read specific lessons, review examples, and practice required mathematical concepts whenever needed. The content is presented in a clean and user-friendly reading interface, making it easier to focus and understand each topic properly.\n\n'
          'This platform is especially beneficial for school-level students who often need these books for both classroom study and homework practice. Additionally, learners who are preparing for school exams or trying to improve their basic to advanced mathematical skills will find this app highly supportive.\n\n'
          'Our goal is to remove obstacles to learning by keeping all essential educational materials together. Through this digital initiative, we hope to encourage learners to engage more with Mathematics and gain confidence in problem solving and logical thinking.\n\n'
          'With this app, students can now carry all seven books by Ibrahim Halil Babaoğlu Sir in their pocket and continue learning anytime, anywhere.',
        ),
      ),
    );
  }
}
