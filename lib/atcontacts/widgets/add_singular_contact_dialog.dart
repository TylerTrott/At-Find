// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/at_common_flutter.dart';
import 'package:atfind/atcontacts/services/contact_service.dart';
import 'package:atfind/atcontacts/utils/images.dart';
import 'package:atfind/atcontacts/utils/text_strings.dart';
import 'package:atfind/atcontacts/utils/text_styles.dart';
import 'package:atfind/atcontacts/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

/// This widgets pops up when a contact is added it takes [name]
/// [handle] to display the name and the handle of the user and an
/// onTap function named as [onYesTap] for on press of [Yes] button of the dialog


class AddSingleContact extends StatefulWidget {
  final String? atSignName;
  final String? realName;
  // final ContactProvider contactProvider;

  const AddSingleContact({Key? key, this.atSignName, this.realName}) : super(key: key);

  @override
  _AddSingleContactState createState() => _AddSingleContactState();
}

class _AddSingleContactState extends State<AddSingleContact> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 100,
      width: 100,
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
                TextStrings().addContactHeading,
                textAlign: TextAlign.center,
                style: CustomTextStyles.secondaryRegular16,
              ),
            )
          ],
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 190.toHeight),
          child: Column(
            children: [
              SizedBox(
                height: 21.toHeight,
              ),
              CustomCircleAvatar(
                image: ImageConstants.imagePlaceholder,
                size: 75,
              ),
              SizedBox(
                height: 10.toHeight,
              ),
              Text(
                widget.atSignName!.substring(1),
                style: CustomTextStyles.primaryBold16,
              ),
              SizedBox(
                height: 2.toHeight,
              ),
              Text(
                widget.realName ?? '', //TODO: UNSURE!!
                style: CustomTextStyles.secondaryRegular16,
              ),
            ],
          ),
        ),
        actions: [
          (isLoading)
              ? CircularProgressIndicator()
              : CustomButton(
                  buttonText: TextStrings().yes,
                  onPressed: () async {
                    isLoading = true;
                    await ContactService()
                        .addAtSign(context, atSign: widget.atSignName);
                    setState(() {
                      isLoading = false;
                      Navigator.pop(context);
                    });
                  },
                ),
          SizedBox(
            height: 10.toHeight,
          ),
          CustomButton(
            buttonText: TextStrings().no,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
