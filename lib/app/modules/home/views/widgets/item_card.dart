import 'package:flutter/material.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/modules/home/views/widgets/task_container.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.anim,
    required this.index,
    required this.item,
    required this.isPersonal,
    required this.onClickRemove,
  }) : super(key: key);

  final Animation<double> anim;
  final int index;
  final Tasks item;
  final bool isPersonal;
  final void Function() onClickRemove;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: anim,
      child: TaskContainer(
        item: item,
        index: index,
        isPersonal: isPersonal,
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: onClickRemove,
        ),
      ),
    );
  }
}
