// import 'package:flutter/material.dart';

// class SearchView extends StatefulWidget {
//   const SearchView({Key? key}) : super(key: key);

//   @override
//   State<SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   final List<String> citySuggestions = [
//     'القاهرة',
//     'الرياض',
//     'دبي',
//     'الدوحة',
//     'بيروت',
//     'عمان',
//     'الدار البيضاء',
//   ];

//   String? errorText;

//   void searchCity(String city) async {
//     setState(() {
//       errorText = null;
//     });

//     // هنا بنفترض إن عندك API بيرجع true لو المدينة صح
//     bool cityFound = await fakeApiSearch(city);

//     if (!cityFound) {
//       setState(() {
//         errorText = 'لم يتم العثور على "$city". تأكد من الإملاء.';
//       });
//     } else {
//       // هنا تعمل Navigator أو تعرض النتيجة
//       print('✅ تم العثور على: $city');
//     }
//   }

//   Future<bool> fakeApiSearch(String city) async {
//     // محاكاة لرد API
//     await Future.delayed(const Duration(seconds: 1));
//     return citySuggestions.contains(city);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ابحث عن مدينة'),
//         backgroundColor: Colors.blueAccent,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           children: [
//             Autocomplete<String>(
//               optionsBuilder: (TextEditingValue textEditingValue) {
//                 if (textEditingValue.text.isEmpty) {
//                   return const Iterable<String>.empty();
//                 }
//                 return citySuggestions.where((city) => city
//                     .toLowerCase()
//                     .contains(textEditingValue.text.toLowerCase()));
//               },
//               onSelected: (String selection) {
//                 searchCity(selection);
//               },
//               fieldViewBuilder:
//                   (context, controller, focusNode, onFieldSubmitted) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: theme.inputDecorationTheme.fillColor ??
//                         Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: TextField(
//                     controller: controller,
//                     focusNode: focusNode,
//                     onSubmitted: (value) => searchCity(value),
//                     decoration: const InputDecoration(
//                       hintText: 'اكتب اسم المدينة...',
//                       prefixIcon: Icon(Icons.search),
//                       border: InputBorder.none,
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                     ),
//                   ),
//                 );
//               },
//               optionsViewBuilder: (context, onSelected, options) {
//                 return Align(
//                   alignment: Alignment.topCenter,
//                   child: Material(
//                     elevation: 4,
//                     borderRadius: BorderRadius.circular(12),
//                     child: SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         padding: EdgeInsets.zero,
//                         itemCount: options.length,
//                         itemBuilder: (context, index) {
//                           final option = options.elementAt(index);
//                           return ListTile(
//                             leading: const Icon(Icons.location_city),
//                             title: Text(option),
//                             onTap: () => onSelected(option),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             if (errorText != null) ...[
//               const SizedBox(height: 12),
//               Text(
//                 errorText!,
//                 style: const TextStyle(
//                     color: Colors.redAccent, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
