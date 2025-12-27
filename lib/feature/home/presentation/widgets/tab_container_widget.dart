import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/presentation/widgets/tab_item_widget.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({
    super.key,
    required this.categories,
    required this.products,
  });
  final List<Catergoryentity> categories;
  final List<Productentity> products;
  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            onTap: (int index) {
              final product = widget.products[index];
              print(product.toString());
              // log('Selected tab: ${widget.products[index].id}');
            },
            tabs: widget.categories
                .map(
                  (source) => TabItemWidget(
                    category: source,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
