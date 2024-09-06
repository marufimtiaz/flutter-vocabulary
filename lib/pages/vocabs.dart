import 'package:flutter/material.dart';
import '../helper/helper_functions.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Daily Vocabulary'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Today 10 words', style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Hund',
                englishTranslation: 'Dog',
                explanation:
                    'Hund is a common word for a domestic pet. It\'s used in everyday conversations to refer to dogs.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Katze',
                englishTranslation: 'Cat',
                explanation:
                    'Katze is the word for a cat, another popular household pet in Germany.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Haus',
                englishTranslation: 'House',
                explanation:
                    'Haus refers to a building where people live. It\'s a basic term used in real estate, architecture, and daily life.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Auto',
                englishTranslation: 'Car',
                explanation:
                    'Auto is the short form of Automobil, meaning car. It\'s commonly used when talking about vehicles.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Buch',
                englishTranslation: 'Book',
                explanation:
                    'Buch is a collection of written pages, often bound together, used for reading and learning.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Schule',
                englishTranslation: 'School',
                explanation:
                    'Schule is an institution for educating children and young adults, focusing on various subjects and skills.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Blume',
                englishTranslation: 'Flower',
                explanation:
                    'Blume refers to the colorful reproductive structure of flowering plants, often admired for their beauty.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Tisch',
                englishTranslation: 'Table',
                explanation:
                    'Tisch is a piece of furniture with a flat top and legs, used for various purposes such as dining, working, or studying.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Stuhl',
                englishTranslation: 'Chair',
                explanation:
                    'Stuhl describes a piece of furniture designed for sitting, typically with a back and four legs.',
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: VocabularyEntry(
                germanWord: 'Fenster',
                englishTranslation: 'Window',
                explanation:
                    'Fenster is an opening in a wall that allows light and air to enter a building, usually covered with glass.',
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class VocabularyEntry extends StatelessWidget {
  final String germanWord;
  final String englishTranslation;
  final String explanation;

  const VocabularyEntry({
    super.key,
    required this.germanWord,
    required this.englishTranslation,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$germanWord - $englishTranslation',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(explanation),
      ],
    );
  }
}
