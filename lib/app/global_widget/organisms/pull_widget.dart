import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullWidget extends StatefulWidget {
  PullWidget({
    Key? key,
    required this.onLoad,
    required this.onRefresh,
    required this.child,
    this.enableLoadMore = true,
  }) : super(key: key);
  final void Function(RefreshController refreshController) onRefresh;
  final void Function(RefreshController refreshController) onLoad;
  final bool enableLoadMore;
  final Widget child;
  @override
  _PullWidgetState createState() => _PullWidgetState();
}

class _PullWidgetState extends State<PullWidget>
    with AutomaticKeepAliveClientMixin<PullWidget> {
  late final RefreshController _refreshController;
  @override
  void initState() {
    _refreshController = RefreshController();
    widget.onLoad(_refreshController);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: widget.enableLoadMore,
      header: ClassicHeader(),
      footer: ClassicFooter(),
      controller: _refreshController,
      onRefresh: () {
        widget.onRefresh(_refreshController);
      },
      onLoading: () {
        widget.onLoad(_refreshController);
      },
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
