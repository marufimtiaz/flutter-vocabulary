import 'package:flutter/material.dart';
import 'package:vocabulary/components/unfocus.dart';
import '../components/custom_textfield.dart';
import '../helper/helper_functions.dart';

class CreateVocabulary extends StatefulWidget {
  const CreateVocabulary({super.key});

  @override
  State<CreateVocabulary> createState() => _CreateVocabularyState();
}

class _CreateVocabularyState extends State<CreateVocabulary> {
  List<Widget> words = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _addWords();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addWords() {
    setState(() {
      words.add(Words(wordNumber: words.length + 1));
    });

    // Scroll to the end after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _saveWords() {
    // Implement save functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Vocabulary'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  logout(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: UnfocusOnTap(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          children: [
            ...words,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addWords,
                  child: const Text('Add Word'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save lesson logic here
                    _saveWords();
                  },
                  child: const Text('Save Lesson'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Words extends StatelessWidget {
  final int wordNumber;

  const Words({super.key, required this.wordNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Word no $wordNumber',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const CustomTextField(
          labelText: 'Word',
          hintText: '',
        ),
        const SizedBox(height: 16),
        const Text('Description'),
        const SizedBox(height: 8),
        const CustomTextField(
          labelText: 'Description',
          hintText: '',
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        const Divider(),
      ],
    );
  }
}
