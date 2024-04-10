// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';

// // ignore: must_be_immutable
// class QuillEditorWidget extends StatelessWidget {
//   QuillController controller;
//   QuillEditorWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         QuillToolbar.simple(
//           configurations: QuillSimpleToolbarConfigurations(
//             controller: controller,
//             sharedConfigurations: const QuillSharedConfigurations(
//               locale: Locale('en'),
//             ),
//           ),
//         ),
//         Expanded(
//           child: QuillEditor.basic(
//             configurations: QuillEditorConfigurations(
//               controller: controller,
//               readOnly: false,
//               sharedConfigurations: const QuillSharedConfigurations(
//                 locale: Locale('en'),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
