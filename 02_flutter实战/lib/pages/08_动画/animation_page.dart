///
/// Author       : zhongaidong
/// Date         : 2022-03-22 09:56:03
/// Description  :
///

import 'package:flutter/material.dart';
import 'package:flutter_combat/core/common/widgets/grid_group_scaffold.dart';
import 'package:flutter_combat/core/const/resource.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GridGroupScaffold(
      title: '动画',
      jsonString: R.assetsJson08AnimationDataJson,
    );
  }
}
