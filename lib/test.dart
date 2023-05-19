// import 'package:flutter/material.dart';
//
// class ExpandableContainer extends StatefulWidget {
//   @override
//   _ExpandableContainerState createState() => _ExpandableContainerState();
// }
//
// class _ExpandableContainerState extends State<ExpandableContainer> {
//   List<bool> isExpandedList = [];
//   List<Color> containerColors = [];
//   List<String> descriptions = [
//     'Description 1: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//     'Description 2: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//     'Description 3: Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
//     'Description 4: Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     if (descriptions.isNotEmpty) {
//       for (int i = 0; i < descriptions.length; i++) {
//         isExpandedList.add(false);
//         containerColors.add(Colors.yellow); // Yellow background color
//       }
//     }
//   }
//
//   void toggleExpand(int index) {
//     setState(() {
//       isExpandedList[index] = !isExpandedList[index];
//       containerColors[index] =
//       isExpandedList[index] ? Colors.green[100]! : Colors.yellow;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (descriptions.isEmpty) {
//       return Center(
//         child: Text(
//           'No records found',
//           style: TextStyle(fontSize: 16.0),
//         ),
//       );
//     }
//
//     return ListView.separated(
//       itemCount: descriptions.length,
//       separatorBuilder: (context, index) => SizedBox(height: 8.0), // Space between items
//       itemBuilder: (context, index) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               onTap: () => toggleExpand(index),
//               title: Row(
//                 children: [
//                   Icon(
//                     isExpandedList[index]
//                         ? Icons.expand_less
//                         : Icons.expand_more,
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     isExpandedList[index] ? 'Collapse' : 'Expand',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               height: isExpandedList[index] ? null : 0,
//               decoration: BoxDecoration(
//                 color: containerColors[index],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   descriptions[index],
//                   style: TextStyle(color: Colors.black87),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expandable Container',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Expandable Container'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: ExpandableContainer(),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
