import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/local/constants.dart';
import 'package:gin_vue_admin_web/local/dimens.dart';
import 'package:gin_vue_admin_web/providers/user/user_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/asyncvalue_widget.dart';

import '../theme/exports_theme.dart';

class SidebarHeader extends StatelessWidget {
  final void Function() onAccountButtonPressed;
  final void Function() onLogoutButtonPressed;

  const SidebarHeader({
    super.key,
    required this.onAccountButtonPressed,
    required this.onLogoutButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return Container(
      color: context.colorScheme.primary,
      padding: const EdgeInsets.all(15),
      child: Consumer(builder: (context, ref, c) {
        return AsyncValueWidget(
          ref.watch(getUserInfoProvider),
          builder: (value) {
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: kDefaultPadding * 0.5),
                    Text(
                      '${lang.hi}, ${value?.username}  ${value?.roleName}',
                      style: TextStyle(
                        fontSize: 14,
                        color: context.colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kDefaultPadding * 0.5),
                Align(
                  alignment: Alignment.centerRight,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _textButton(context, Icons.manage_accounts_rounded,
                            lang.account, onAccountButtonPressed),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: VerticalDivider(
                            width: 2.0,
                            thickness: 1.0,
                            indent: kTextPadding,
                            endIndent: kTextPadding,
                          ),
                        ),
                        _textButton(context, Icons.login_rounded, lang.logout,
                            onLogoutButtonPressed),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _textButton(BuildContext context, IconData icon, String text,
      void Function() onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: context.colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? isLoading;

  const CustomIconButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      this.icon,
      this.isLoading,
      this.onPressed});

  Widget getChild(ButtonStyle style, Text textW, {bool? isLoading}) {
    final child = isLoading == true
        ? const SizedBox(
            width: 20,
            height: 20,
            child: LoadingWidget(
              color: Colors.white,
            ))
        : textW;

    final content = icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          )
        : TextButtonWithIconX(
            onPressed: onPressed,
            icon: Icon(
              icon!,
              size: 20,
            ),
            gap: 5,
            label: child,
            style: style,
          );
    ;
    return SizedBox(
      height: 30,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        foregroundColor: Colors.white);
    final textW = Text(text);
    return isLoading != null
        ? ValueListenableBuilder(
            valueListenable: isLoading!,
            builder: (context, value, child) {
              "isLoading=${isLoading!.value}".log();
              return getChild(style, textW, isLoading: value);
            })
        : getChild(style, textW);
  }
}

class LoadingWidget extends StatelessWidget {
  final Color? color;

  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? context.textTheme.titleLarge?.color,
    );
  }
}

class TextFieldWidthWidget extends StatelessWidget {
  final Widget child;

  const TextFieldWidthWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: Constants.searchContentWidth,
      child: child,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String name;
  final String? initialValue;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  const CustomTextField(
      {super.key,
      this.hint,
      required this.name,
      this.inputFormatters,
      this.validator,
      this.initialValue,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      inputFormatters: inputFormatters,
      name: name,
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      enableSuggestions: false,
      autocorrect: false,
      validator: validator,
    );
  }
}

class Base64ImageWidget extends StatelessWidget {
  final String base64String;
  final double? width, height;

  const Base64ImageWidget(
      {super.key, required this.base64String, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final base64Data = base64String.replaceFirst('data:image/png;base64,', '');
    return Image.memory(
      base64Decode(base64Data),
      //防止重绘
      gaplessPlayback: true,
      width: width ?? 180,
      height: height ?? 60,
      fit: BoxFit.cover,
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
    );
  }
}

class FormBuilderWrap extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isRequired;
  final double? titleWidth;
  final double? childWidth;
  final CrossAxisAlignment crossAxisAlignment;

  const FormBuilderWrap(
      {super.key,
      required this.child,
      required this.title,
      this.titleWidth,
      this.childWidth,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    final titleChild = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isRequired)
          const Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
        Text(title),
      ],
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (titleWidth == null)
          titleChild
        else
          SizedBox(
            width: titleWidth!,
            child: titleChild,
          ),
        const Gap.h(10),
        if (childWidth == null)
          Expanded(child: child)
        else
          SizedBox(
            width: childWidth!,
            child: child,
          )
      ],
    );
  }
}

class FormBuilderColumnWrap extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isRequired;

  const FormBuilderColumnWrap(
      {super.key,
      required this.child,
      required this.title,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(color: Colors.red),
              ),
            Text(title),
          ],
        ),
        const Gap.v(10),
        child
      ],
    );
  }
}

class WebTipDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const WebTipDialog({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "提示",
            style: context.textTheme.titleLarge,
          ),
          const Gap.v(10),
          Row(
            children: [
              const Icon(
                Icons.warning_amber,
                color: Colors.orange,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
