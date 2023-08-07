import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/tool.dart';
import 'tool_detail_page.dart';

class ToolListPage extends StatefulWidget {
  const ToolListPage({super.key});

  @override
  State<ToolListPage> createState() => _ToolListPageState();
}

class _ToolListPageState extends State<ToolListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools'),
      ),
      body: Consumer<List<Tool>>(
        builder: (_, List<Tool> tools, __) {
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            children: List<Widget>.generate(tools.length, (int index) {
              final Tool tool = tools[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => _navigateToToolDetail(tool),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: CachedNetworkImage(
                              imageUrl: tool.imageUrl,
                              imageBuilder:
                                  (_, ImageProvider<Object> imageProvider) =>
                                      Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (_, __) => Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 40,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                              fadeOutDuration: const Duration(
                                milliseconds: 500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 4,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              tool.name,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                      // Image
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  void _navigateToToolDetail(Tool tool) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ToolDetailPage(tool: tool),
      ),
    );
  }
}
