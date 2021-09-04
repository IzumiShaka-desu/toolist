import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  const PrimaryButton({
    Key? key,
    this.text = '',
    this.onPressed,
    this.icon,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: (icon != null ? <Widget>[icon!] : <Widget>[]) +
            [
              Padding(
                padding: padding ?? const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
      ),
    );
  }
}
