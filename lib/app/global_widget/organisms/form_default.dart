import 'package:flutter/material.dart';
import 'package:toolist/app/core/utils/email_validator.dart';
import 'package:toolist/app/global_widget/atoms/primary_button.dart';
import 'package:toolist/app/global_widget/molecules/default_form_field.dart';

class FormDefault extends StatefulWidget {
  final List<String> field;
  final Map<String, Widget> icons;
  final List<String> obscureField;
  final String submitButtonLabel;
  final List<String> notRequiredfield;
  final Map<String, TextInputType> inputype;
  final Map<String, String> initialValue;

  final Widget? widgetBeforeSubmitButton;
  final String? Function(String? value, String? currentfieldname,
      Map<String, String> allfieldValue)? validation;
  final InputDecoration Function(String labelText)? decorationBuilder;
  final Function(
    Map<String, String> result,
    GlobalKey<FormState> keyForm,
  ) onSubmit;
  final EdgeInsets? submitButtonMargin;
  final InputDecoration? decoration;
  final Widget? Function(
          String fieldName, void Function(String newText) changetext)?
      trailingBuilder;

  const FormDefault({
    Key? key,
    this.field = const [],
    this.obscureField = const [],
    this.notRequiredfield = const [],
    required this.onSubmit,
    this.icons = const {},
    this.submitButtonLabel = 'Submit',
    this.inputype = const {},
    this.validation,
    this.widgetBeforeSubmitButton,
    this.decoration,
    this.decorationBuilder,
    this.submitButtonMargin,
    this.initialValue = const {},
    this.trailingBuilder,
  }) : super(key: key);
  @override
  _FormDefaultState createState() => _FormDefaultState();
}

class _FormDefaultState extends State<FormDefault> {
  final Map<String, TextEditingController> _controllers = {};
  @override
  void initState() {
    for (var element in widget.field) {
      _controllers[element] =
          TextEditingController(text: widget.initialValue[element] ?? '');
    }
    super.initState();
  }

  @override
  void dispose() {
    _controllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _fKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _generateFields(),
        ),
      ),
    );
  }

  List<Widget> _generateFields() {
    var fields = <Widget>[];

    for (var i = 0; i < widget.field.length; i++) {
      var wFields = widget.field;
      fields.add(
        Row(
          children: [
            Expanded(
              child: DefaultFormField(
                trailing: widget.trailingBuilder == null
                    ? null
                    : widget.trailingBuilder!(
                        wFields[i],
                        _changeText(_controllers[wFields[i]]!),
                      ),
                decorationBuilder: widget.decorationBuilder,
                decoration: widget.decoration,
                inputType: widget.inputype[wFields[i]],
                icon: widget.icons[wFields[i]],
                isObscure: widget.obscureField.contains(wFields[i]) ||
                    wFields[i].toLowerCase().contains('password'),
                validation: (value) {
                  if (widget.validation != null) {
                    widget.validation!(value, wFields[i], getResultForm());
                  }
                  if (widget.notRequiredfield.contains(wFields[i])) {
                    return null;
                  } else if (value!.isEmpty) {
                    return 'this fields is required';
                  } else if (wFields[i].toLowerCase().contains(
                        'password',
                      )) {
                  } else if (wFields[i].toLowerCase().contains(
                            'email',
                          ) &&
                      !EmailValidator.validate(
                        value,
                      )) {
                    return 'please input a valid email';
                  }
                  return null;
                },
                labelText: wFields[i].replaceAll('_', ' '),
                textEditingController: _controllers[wFields[i]]!,
              ),
            )
          ],
        ),
      );
    }
    if (widget.widgetBeforeSubmitButton != null) {
      fields.add(widget.widgetBeforeSubmitButton!);
    }
    fields.add(Container(
      margin: widget.submitButtonMargin ?? EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
              onPressed: () {
                if (_fKey.currentState!.validate()) {
                  widget.onSubmit(getResultForm(), _fKey);
                }
              },
              text: widget.submitButtonLabel),
        ],
      ),
    ));
    return fields;
  }

  Map<String, String> getResultForm() {
    return _controllers.map<String, String>(
      (key, value) => MapEntry(
        key,
        value.text.trim(),
      ),
    );
  }

  Function(String) _changeText(
    TextEditingController textEditingController,
  ) =>
      (
        String newText,
      ) {
        setState(() {
          textEditingController.text = newText;
        });
      };
}
