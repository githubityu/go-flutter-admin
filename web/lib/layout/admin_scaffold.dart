import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/api/menu_data_source.dart';
import 'package:ityu_tools/util/export_util.dart';

import '../local/dimens.dart';

class AdminScaffold extends StatefulWidget {
  const AdminScaffold({
    super.key,
    this.appBar,
    this.sideBar,
    this.endDrawer,
    required this.body,
    this.backgroundColor,
  });

  final AppBar? appBar;
  final Widget? sideBar,endDrawer;
  final Widget body;
  final Color? backgroundColor;

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold>
    with SingleTickerProviderStateMixin {
  static const _mobileThreshold = 768.0;

  late AnimationController _animationController;
  late Animation _animation;
  bool _isMobile = false;
  bool _isOpenSidebar = false;
  bool _canDragged = false;
  double _screenWidth = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    if (_screenWidth == mediaQuery.size.width) {
      return;
    }

    setState(() {
      _isMobile = mediaQuery.size.width < _mobileThreshold;
      _isOpenSidebar = !_isMobile;
      _animationController.value = _isMobile ? 0 : 1;
      _screenWidth = mediaQuery.size.width;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    setState(() {
      _isOpenSidebar = !_isOpenSidebar;
      if (_isOpenSidebar) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _onDragStart(DragStartDetails details) {
    final isClosed = _animationController.isDismissed;
    final isOpen = _animationController.isCompleted;
    _canDragged = (isClosed && details.globalPosition.dx < 60) || isOpen;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canDragged) {
      final delta =
          (details.primaryDelta ?? 0.0) / (kSliderBarWidth);
      _animationController.value += delta;
    }
  }

  void _dragCloseDrawer(DragUpdateDetails details) {
    final delta = details.primaryDelta ?? 0.0;
    if (delta < 0) {
      _isOpenSidebar = false;
      _animationController.reverse();
    }
  }

  void _onDragEnd(DragEndDetails details) async {
    const minFlingVelocity = 365.0;

    if (details.velocity.pixelsPerSecond.dx.abs() >= minFlingVelocity) {
      final visualVelocity =
          details.velocity.pixelsPerSecond.dx / (kSliderBarWidth);

      await _animationController.fling(velocity: visualVelocity);
      if (_animationController.isCompleted) {
        setState(() {
          _isOpenSidebar = true;
        });
      } else {
        setState(() {
          _isOpenSidebar = false;
        });
      }
    } else {
      if (_animationController.value < 0.5) {
        _animationController.reverse();
        setState(() {
          _isOpenSidebar = false;
        });
      } else {
        _animationController.forward();
        setState(() {
          _isOpenSidebar = true;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: widget.endDrawer,
      backgroundColor: widget.backgroundColor,
      appBar: _buildAppBar(widget.appBar, widget.sideBar),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) => widget.sideBar == null
            ? Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: widget.body,
                    ),
                  ),
                ],
              )
            : _isMobile
                ? Stack(
                    children: [
                      GestureDetector(
                        onHorizontalDragStart: _onDragStart,
                        onHorizontalDragUpdate: _onDragUpdate,
                        onHorizontalDragEnd: _onDragEnd,
                      ),
                      Visibility(
                        visible: !_isOpenSidebar,
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        child: widget.body,
                      ),
                      if (_animation.value > 0)
                        Container(
                          color: Colors.black
                              .withAlpha((150 * _animation.value).toInt()),
                        ),
                      if (_animation.value == 1)
                        GestureDetector(
                          onTap: _toggleSidebar,
                          onHorizontalDragUpdate: _dragCloseDrawer,
                        ),
                      ClipRect(
                        child: SizedOverflowBox(
                          size: Size(
                              (kSliderBarWidth) * _animation.value,
                              double.infinity),
                          child: widget.sideBar,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      widget.sideBar != null
                          ? ClipRect(
                              child: SizedOverflowBox(
                                size: Size(
                                    (kSliderBarWidth) *
                                        _animation.value,
                                    double.infinity),
                                child: widget.sideBar,
                              ),
                            )
                          : const SizedBox(),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: widget.body,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  AppBar? _buildAppBar(AppBar? appBar, Widget? sideBar) {
    if (appBar == null) {
      return null;
    }
    final leading = sideBar != null
        ? IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _toggleSidebar,
          )
        : appBar.leading;
    const shadowColor = Colors.transparent;

    return AppBar(
      leading: leading,
      automaticallyImplyLeading: appBar.automaticallyImplyLeading,
      title: appBar.title,
      actions: appBar.actions,
      flexibleSpace: appBar.flexibleSpace,
      bottom: appBar.bottom,
      elevation: appBar.elevation,
      scrolledUnderElevation: appBar.scrolledUnderElevation,
      notificationPredicate: appBar.notificationPredicate,
      shadowColor: shadowColor,
      surfaceTintColor: appBar.surfaceTintColor,
      shape: appBar.shape,
      backgroundColor: appBar.backgroundColor,
      foregroundColor: appBar.foregroundColor,
      iconTheme: appBar.iconTheme,
      actionsIconTheme: appBar.actionsIconTheme,
      primary: appBar.primary,
      centerTitle: appBar.centerTitle ?? false,
      excludeHeaderSemantics: appBar.excludeHeaderSemantics,
      titleSpacing: appBar.titleSpacing,
      toolbarOpacity: appBar.toolbarOpacity,
      bottomOpacity: appBar.bottomOpacity,
      toolbarHeight: appBar.toolbarHeight,
      leadingWidth: appBar.leadingWidth,
      toolbarTextStyle: appBar.toolbarTextStyle,
      titleTextStyle: appBar.titleTextStyle,
      systemOverlayStyle: appBar.systemOverlayStyle,
    );
  }
}
