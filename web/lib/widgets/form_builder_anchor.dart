import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

class ValueMenuItemButton<T> extends MenuItemButton {
  final T value;
  final T? parentValue;

  const ValueMenuItemButton({
    required this.value,
    this.parentValue,
    required super.child,
    super.key,
    super.onPressed,
    super.onHover,
    super.style,
    super.statesController,
    super.clipBehavior,
    super.focusNode,
    super.leadingIcon,
    super.trailingIcon,
    super.shortcut,
  });
}

class ValueSubmenuButton<T> extends SubmenuButton {
  final T value;

  const ValueSubmenuButton({
    required this.value,
    required super.menuChildren,
    required super.child,
    super.key,
    super.onHover,
    super.style,
    super.statesController,
    super.clipBehavior,
    super.focusNode,
    super.leadingIcon,
    super.trailingIcon,
  });
}

typedef MenuItemOrSubmenu<T> = Widget;

class FormBuilderMenuAnchor<T> extends FormBuilderFieldDecoration<T> {
  final List<MenuItemOrSubmenu<T>> items;
  final Widget? disabledHint;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final Color? focusColor;
  final bool autofocus;
  final Color? menuColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;

  FormBuilderMenuAnchor({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    super.restorationId,
    required this.items,
    this.isExpanded = true,
    this.isDense = true,
    this.iconSize = 24.0,
    this.style,
    this.disabledHint,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.onTap,
    this.autofocus = false,
    this.menuColor,
    this.focusColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.borderRadius,
    this.alignment = AlignmentDirectional.centerStart,
  }) : super(
          builder: (FormFieldState<T?> field) {
            final state = field as _FormBuilderMenuAnchorState<T>;
            final selectedItem = _findSelectedItem(items, field.value);

            return CustomMenuAnchor<T>(
              items: items,
              initialValue: field.value,
              onChanged:
                  state.enabled ? (T? value) => state.didChange(value) : null,
              decoration: state.decoration,
              style: style,
              isDense: isDense,
              isExpanded: isExpanded,
              iconSize: iconSize,
              icon: icon,
              iconDisabledColor: iconDisabledColor,
              iconEnabledColor: iconEnabledColor,
              focusNode: state.effectiveFocusNode,
              autofocus: autofocus,
              menuColor: menuColor,
              focusColor: focusColor,
              menuMaxHeight: menuMaxHeight,
              borderRadius: borderRadius,
              alignment: alignment,
              selectedItemBuilder: (context) =>
                  _buildSelectedItemWidget(selectedItem),
            );
          },
        );

  static MenuItemOrSubmenu<T>? _findSelectedItem<T>(
      List<MenuItemOrSubmenu<T>> items, T? value) {
    for (var item in items) {
      if (item is ValueMenuItemButton<T> && item.value == value) {
        return item;
      } else if (item is ValueSubmenuButton<T> && item.value == value) {
        return item;
      } else if (item is ValueSubmenuButton<T>) {
        final foundItem = _findSelectedItem(item.menuChildren, value);
        if (foundItem != null) {
          return foundItem;
        }
      }
    }
    return null;
  }

  static Widget _buildSelectedItemWidget<T>(
      MenuItemOrSubmenu<T>? selectedItem) {
    if (selectedItem is ValueMenuItemButton<T>) {
      return selectedItem.child ?? const SizedBox.shrink();
    } else if (selectedItem is ValueSubmenuButton<T>) {
      return selectedItem.child ?? const SizedBox.shrink();
    }
    return const SizedBox();
  }

  @override
  FormBuilderFieldDecorationState<FormBuilderMenuAnchor<T>, T> createState() =>
      _FormBuilderMenuAnchorState<T>();
}

class _FormBuilderMenuAnchorState<T>
    extends FormBuilderFieldDecorationState<FormBuilderMenuAnchor<T>, T> {
  @override
  void didUpdateWidget(FormBuilderMenuAnchor<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldValues = _extractValues(oldWidget.items);
    final currentValues = _extractValues(widget.items);

    if (!currentValues.contains(initialValue) &&
        !initialValue.emptyValidator()) {
      "initialValue=$initialValue".log();
      assert(
        currentValues.contains(initialValue) && initialValue.emptyValidator(),
        'The initialValue [$initialValue] is not in the list of items or is not null or empty. '
        'Please provide one of the items as the initialValue or update your initial value. '
        'By default, will apply [null] to field value',
      );
      setValue(null);
    }
    if ((!listEquals(oldValues, currentValues) ||
            !listEquals(oldValues, currentValues)) &&
        (currentValues.contains(initialValue) ||
            initialValue.emptyValidator())) {
      setValue(initialValue);
    }
  }

  List<T> _extractValues(List<MenuItemOrSubmenu<T>> items) {
    List<T> values = [];
    for (var item in items) {
      if (item is ValueMenuItemButton<T>) {
        values.add(item.value);
      } else if (item is ValueSubmenuButton<T>) {
        values.add(item.value);
        values.addAll(_extractValues(item.menuChildren));
      }
    }
    return values;
  }
}

class CustomMenuAnchor<T> extends StatefulWidget {
  final List<MenuItemOrSubmenu<T>> items;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final InputDecoration decoration;
  final TextStyle? style;
  final bool isDense;
  final bool isExpanded;
  final double iconSize;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? menuColor;
  final Color? focusColor;
  final double? menuMaxHeight;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final Widget Function(BuildContext) selectedItemBuilder;

  const CustomMenuAnchor({
    super.key,
    required this.items,
    this.initialValue,
    this.onChanged,
    required this.decoration,
    this.style,
    this.isDense = false,
    this.isExpanded = false,
    this.iconSize = 24.0,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.focusNode,
    this.autofocus = false,
    this.menuColor,
    this.focusColor,
    this.menuMaxHeight,
    this.borderRadius,
    this.alignment = AlignmentDirectional.centerStart,
    required this.selectedItemBuilder,
  });

  @override
  _CustomMenuAnchorState<T> createState() => _CustomMenuAnchorState<T>();
}

class _CustomMenuAnchorState<T> extends State<CustomMenuAnchor<T>> {
  late MenuController _menuController;
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _menuController = MenuController();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _menuController,
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return InkWell(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: InputDecorator(
            decoration: widget.decoration,
            child: Row(
              children: [
                Expanded(child: widget.selectedItemBuilder(context)),
                Icon(
                  controller.isOpen
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  size: widget.iconSize,
                  color: widget.onChanged == null
                      ? widget.iconDisabledColor
                      : widget.iconEnabledColor,
                ),
              ],
            ),
          ),
        );
      },
      menuChildren: _buildMenuItems(widget.items),
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(widget.menuColor),
        maximumSize: widget.menuMaxHeight != null
            ? WidgetStateProperty.all(Size.fromHeight(widget.menuMaxHeight!))
            : null,
        shape: widget.borderRadius != null
            ? WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: widget.borderRadius!))
            : null,
      ),
    );
  }

  List<Widget> _buildMenuItems(List<MenuItemOrSubmenu<T>> items) {
    return items.map((item) {
      if (item is ValueMenuItemButton<T>) {
        return MenuItemButton(
          onPressed: () {
            setState(() {
              _selectedValue = item.value;
            });
            widget.onChanged?.call(_selectedValue);
            _menuController.close();
          },
          child: item.child,
        );
      } else if (item is ValueSubmenuButton<T>) {
        return SubmenuButton(
          menuChildren: _buildMenuItems(item.menuChildren),
          child: item.child,
        );
      }
      return const SizedBox(); // 默认返回一个空的SizedBox
    }).toList();
  }
}
