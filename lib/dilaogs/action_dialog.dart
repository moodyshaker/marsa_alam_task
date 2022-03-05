import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ActionDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? approveAction;
  final ShapeBorder? shape;
  final String? cancelAction;
  final VoidCallback? onApproveClick;
  final VoidCallback? onCancelClick;

  const ActionDialog({Key? key,
    this.title,
    this.content,
    this.shape,
    this.approveAction,
    this.cancelAction,
    this.onApproveClick,
    this.onCancelClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mq = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              title != null
                  ? Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    )
                  : Container(),
              title != null
                  ?  SizedBox(
                height: size.height * 0.04,
                    )
                  : Container(),
              content != null
                  ? Text(
                      content!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
              content != null
                  ? SizedBox(
                      height: size.height * 0.04,
                    )
                  : Container(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                onApproveClick != null || approveAction != null
                    ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor)),
                      onPressed: onApproveClick,
                      child: Text(
                        approveAction ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                    )
                    : Container(),
                ((onApproveClick != null || approveAction != null) &&
                        (onCancelClick != null || cancelAction != null))
                    ? SizedBox(
                        width: size.width * 0.02,
                      )
                    : Container(),
                onCancelClick != null || cancelAction != null
                    ? ElevatedButton(
                      onPressed: onCancelClick,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor)),
                      child: Text(
                        cancelAction ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0),
                      ),
                    )
                    : Container()
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
