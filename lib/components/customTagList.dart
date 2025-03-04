import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

class CustomTagWidget extends StatelessWidget {
  final ValueNotifier<List<String>> tagsNotifier;

  CustomTagWidget({Key? key, required this.tagsNotifier}) : super(key: key);

  void _addTag(String tag) {
    if (tag.isNotEmpty && !tagsNotifier.value.contains(tag)) {
      tagsNotifier.value = [...tagsNotifier.value, tag]; // Ajout du tag
    }
  }

  void _removeTag(int index) {
    tagsNotifier.value = List.from(tagsNotifier.value)..removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Écoute les changements de la liste avec ValueListenableBuilder
        ValueListenableBuilder<List<String>>(
          valueListenable: tagsNotifier,
          builder: (context, tags, _) {
            return Tags(
              itemCount: tags.length,
              itemBuilder: (int index) {
                final tag = tags[index];
                return ItemTags(
                  index: index,
                  title: tag,
                  activeColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                  combine: ItemTagsCombine.withTextBefore,
                  removeButton: ItemTagsRemoveButton(
                    onRemoved: () {
                      _removeTag(index);
                      return true;
                    },
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: "Ajouter un tag",
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            _addTag(value);
          },
        ),
      ],
    );
  }
}
