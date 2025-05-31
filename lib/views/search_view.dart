import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  // قائمة باقتراحات المدن
  static final List<String> citySuggestions = [
    'caro',
    'alex',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ابحث عن مدينة'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return citySuggestions.where((city) => city
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()));
          },
          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
            return Container(
              decoration: BoxDecoration(
                color: theme.inputDecorationTheme.fillColor ??
                    Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onSubmitted: (value) {
                  // ممكن تضيف منطق هنا عند اختيار المدينة
                  print('بحث عن: $value');
                },
                decoration: const InputDecoration(
                  hintText: 'اكتب اسم المدينة...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            );
          },
          onSelected: (String selection) {
            print('تم اختيار المدينة: $selection');
            // هنا ممكن تنقله للنتيجة أو تجيب بيانات الطقس
          },
        ),
      ),
    );
  }
}
