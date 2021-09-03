import 'package:convre/export.dart';
import 'package:flutter/material.dart';




class DialogManager extends StatefulWidget {
  const DialogManager({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    final bool isConfirmationDialog = request.cancelTitle != null;
    final bool isFunction = request.onOkayClicked != null;
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: regularRobotoText(context,
            text: request.title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: request.title.contains('Error') ? Colors.red : Colors.black),
        content: regularRobotoText(context,
            text: request.description,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextGrey),
        actions: <Widget>[
          if (isConfirmationDialog)
            GestureDetector(
              onTap: () => _dialogService
                  .dialogComplete(DialogResponse(confirmed: false)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: regularRobotoText(context,
                    text: request.cancelTitle,
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          GestureDetector(
            onTap: isFunction
                ? () => request.onOkayClicked()
                : () => _dialogService
                    .dialogComplete(DialogResponse(confirmed: true)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
              margin: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.red),
              child: regularRobotoText(context,
                  text: request.buttonTitle,
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
