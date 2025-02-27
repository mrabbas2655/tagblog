import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class HtmlContentEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quill Demo',
      home: EditorPage(),
    );
  }
}

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  final quill.QuillController _controller = quill.QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Quill Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final content = _controller.document.toDelta().toJson();
              print(content);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // نمونه نوار ابزار سفارشی
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.format_bold),
                  onPressed: () {
                    _controller.formatSelection(quill.Attribute.bold);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.format_italic),
                  onPressed: () {
                    _controller.formatSelection(quill.Attribute.italic);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.format_underline),
                  onPressed: () {
                    _controller.formatSelection(quill.Attribute.underline);
                  },
                ),
                // سایر دکمه‌ها را بر اساس نیاز اضافه کنید...
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: quill.QuillEditor(
                controller: _controller,
                focusNode: _focusNode,
                scrollController: _scrollController,
                // پارامترهای اضافی مانند padding، readOnly، autoFocus و expands در نسخه ^11.0.0 حذف شده‌اند.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
