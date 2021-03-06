import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfiniteListViewPage extends StatelessWidget {
  const InfiniteListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('无限加载列表')),
      body: const InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({Key? key}) : super(key: key);

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  final _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();

    // 检索数据
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(title: Text("商品列表")),
        Expanded(
          // Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
          // height: MediaQuery.of(context).size.height - 24 - 56 - 56 - 23,
          child: ListView.separated(
            itemCount: _words.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              // 如果到了表尾
              if (_words[index] == loadingTag) {
                // 不足100条, 继续获取数据
                if (_words.length - 1 < 100) {
                  // 获取数据
                  _retrieveData();
                  // 加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                  );
                } else {
                  // 已经加载了100条数据，不再获取数据。
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }

              // 显示单词列表项
              return ListTile(title: Text(_words[index]));
            },
          ),
        ),
      ],
    );
  }

  _retrieveData() => Future.delayed(const Duration(milliseconds: 200))
      .then((e) => setState(() {
            // 重新构建列表
            _words.insertAll(
              _words.length - 1,
              // 每次生成20个单词
              generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
            );
          }));
}
