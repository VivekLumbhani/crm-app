import 'package:crm_app/features/notes/screens/addNewNotes.dart';
import 'package:crm_app/features/notes/screens/editCardDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,

        actions: [
          TextButton(
            onPressed: () {
              Get.to(AddNotesScreen());

            },
            child: Text(
              'Add notes',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NotesGrid(),
      ),
    );
  }
}

class NotesGrid extends StatelessWidget {
  final List<String> titles = [
    'Sales Strategy Meeting Notes',
    'Call with ABC Corp',
    'Follow-Up Tasks from Marketing Meeting',
    'Project Alpha Weekly Update',
    'Note Header',
    'Note Header',
    'Note Header',
    'Note Header',
        'Project Alpha Weekly Update',

  ];

  final List<String> contents = [
    'Adipisci iusto quis nostrum enim. Eum quae mollitia iure culpa...',
    'Delectus eius ut dignissimos ex et maxime. Sed et minus...',
    'Dicta provident velit quo quae vel hic. Ut sunt hic dolo...',
    'Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident... helloo ',
    'Adipisci iusto quis nostrum enim. Eum quae mollitia iure culpa...',
    'Delectus eius ut dignissimos ex et maxime. Sed et minus...',
    'Dicta provident velit quo quae vel hic. Ut sunt hic dolo...',
    'Unde ipsa dolorem reprehenderit sunt nihil et blanditiis impedit sit. Provident...',
    'Dicta provident velit quo quae vel hic. Ut sunt hic dolo...',

  ];

  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.red,
    Colors.brown,
    Colors.indigo
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Get.to(EditCardDetails(title: titles[index],content:contents[index]));
          },

          child: NoteCard(
            title: titles[index],
            content: contents[index],
            color: colors[index % colors.length],
          ),
        );
      },
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final Color color;

  const NoteCard({
    Key? key,
    required this.title,
    required this.content,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 2,

            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            maxLines: 3,

          ),
        ],
      ),
    );
  }
}
