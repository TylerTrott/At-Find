/// A popup to ask the [AtSign] which is to be added

// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/at_common_flutter.dart';
import 'package:atfind/atcontacts/utils/text_strings.dart' as contact_strings;
// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/widgets/custom_button.dart';
import 'package:atfind/atcontacts/services/contact_service.dart';
import 'package:atfind/atcontacts/utils/text_styles.dart'
    as contact_text_styles;
import 'package:atfind/atgroups/services/group_service.dart';
import 'package:flutter/material.dart';

class AddContactDialog extends StatefulWidget {
  AddContactDialog({
    Key? key,
  }) : super(key: key);

  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  String atsignName = '';
  TextEditingController atSignController = TextEditingController();
  @override
  void dispose() {
    atSignController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var _contactService = ContactService();
    var deviceTextFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      height: 100.toHeight * deviceTextFactor,
      width: 100.toWidth,
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.toWidth)),
          titlePadding: EdgeInsets.only(
              top: 20.toHeight, left: 25.toWidth, right: 25.toWidth),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  contact_strings.TextStrings().addContact,
                  textAlign: TextAlign.center,
                  style: contact_text_styles.CustomTextStyles.primaryBold18,
                ),
              )
            ],
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: (_contactService.getAtSignError == '')
                    ? 255.toHeight
                    : 310.toHeight * deviceTextFactor),
            child: Column(
              children: [
                SizedBox(
                  height: 20.toHeight,
                ),
                TextFormField(
                  autofocus: true,
                  onChanged: (value) {
                    atsignName = value;
                  },
                  // validator: Validators.validateAdduser,
                  decoration: InputDecoration(
                    prefixText: '@',
                    prefixStyle:
                        TextStyle(color: Colors.grey, fontSize: 15.toFont),
                    hintText: '\tEnter @Sign',
                  ),
                  style: TextStyle(fontSize: 15.toFont),
                ),
                SizedBox(
                  height: 10.toHeight,
                ),
                (_contactService.getAtSignError == '')
                    ? Container()
                    : Row(
                        children: [
                          Expanded(
                            child: Text(
                              _contactService.getAtSignError,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                SizedBox(
                  height: 45.toHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (isLoading)
                        ? CircularProgressIndicator()
                        : CustomButton(
                            height: 50.toHeight * deviceTextFactor,
                            buttonText:
                                contact_strings.TextStrings().addtoContact,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await _contactService.addAtSign(context,
                                  atSign: atsignName);
                              var _groupService = GroupService();
                              await _groupService.fetchGroupsAndContacts();
                              setState(() {
                                isLoading = false;
                              });
                              if (_contactService.checkAtSign != null &&
                                  _contactService.checkAtSign!) {
                                Navigator.pop(context);
                              }
                            },
                            buttonColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                          )
                  ],
                ),
                SizedBox(
                  height: 20.toHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 50.toHeight * deviceTextFactor,
                      buttonText: contact_strings.TextStrings().buttonCancel,
                      onPressed: () {
                        _contactService.getAtSignError = '';
                        Navigator.pop(context);
                      },
                      buttonColor: Colors.white,
                      fontColor: Colors.black,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
