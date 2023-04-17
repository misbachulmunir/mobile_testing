import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void alertOpenSetting({String message = "Izin kamera"}) {
  Get.dialog(
    AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Perhatian"),
          const Divider(),
          const SizedBox(height: 10),
          Text(message),
        ],
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            if (Get.isDialogOpen ?? false) Get.back();
          },
          child: Text("Batal"),
        ),
        InkWell(
          onTap: () async {
            if (Get.isDialogOpen ?? false) Get.back();
            await openAppSettings();
          },
          child: Text("Izinkan"),
        ),
      ],
    ),
  );
}

openAppSettings() {}

class Helper {
  static void showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

// class CurrencyTextInputFormatter extends TextInputFormatter {
//   CurrencyTextInputFormatter({required this.maxDigits});
//   final int maxDigits;

//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     if (maxDigits != null && newValue.selection.baseOffset > maxDigits) {
//       return oldValue;
//     }

//     double value = double.parse(newValue.text);
//     final formatter = new NumberFormat("#,##0.00", "IDR");
//     String newText = "Rp " + formatter.format(value / 100);
//     return newValue.copyWith(
//         text: newText,
//         selection: new TextSelection.collapsed(offset: newText.length));
//   }
// }

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/loading_tlive.gif',
        width: MediaQuery.of(context).size.width / 4,
      ),
    );
  }
}

class Nohistori extends StatelessWidget {
  const Nohistori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/no_histori.png',
        width: MediaQuery.of(context).size.width / 4,
      ),
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/no_data.png',
        width: MediaQuery.of(context).size.width / 4,
      ),
    );
  }
}

Widget myLoading() {
  return Center(
    child: CircularProgressIndicator(color: Colors.green),
  );
}

void dismissProgressDialog() {
  if (Get.isDialogOpen ?? false) Get.back();
}

void showProgressDialog(
    {String message = "Loading..", bool dismissible = true}) async {
  await Get.dialog(
    AlertDialog(
      content: Container(
        height: 40,
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            myLoading(),
            const SizedBox(width: 24),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: dismissible,
  );
  return;
}

const _DefaultDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
  return Colors.white;
}

// ignore: must_be_immutable
class LoadingMyDialog extends StatelessWidget {
  /// Dialog will be closed when [future] task is finished.
  @required
  final Future future;

  /// [BoxDecoration] of [LoadingMyDialog].
  final BoxDecoration? decoration;

  /// opacity of [LoadingMyDialog]
  final double opacity;

  /// If you want to use custom progress widget set [progress].
  final Widget? progress;

  /// If you want to use message widget set [message].
  final Widget? message;
  String? imageLoading;
  String? textLoading;

  LoadingMyDialog(
    this.future, {
    this.decoration,
    this.opacity = 1.0,
    this.progress,
    this.message,
    this.imageLoading = "assets/images/loading_tlive.gif",
    this.textLoading = "Loading...",
  });

  @override
  Widget build(BuildContext context) {
    future.then((val) {
      Navigator.of(context).pop(val);
    }).catchError((e) {
      Navigator.of(context).pop();
    });

    return WillPopScope(
      child: _buildDialog(context),
      onWillPop: () {
        return Future(() {
          return false;
        });
      },
    );
  }

  Widget _buildDialog(BuildContext context) {
    var content;
    if (message == null) {
      content = Center(
        child: Container(
          width: 165,
          height: 130,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  imageLoading.toString(),
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(height: 8),
              Text(textLoading.toString(),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      );
    } else {
      content = Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: decoration ?? _DefaultDecoration,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          progress ?? CircularProgressIndicator(),
          SizedBox(width: 20),
          _buildText(context)
        ]),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Opacity(
        opacity: opacity,
        child: content,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    if (message == null) {
      return SizedBox.shrink();
    }
    return Expanded(
      flex: 1,
      child: message!,
    );
  }
}

Future<void> showLoadingDialog({
  bool cancelable = true,
  String textLoading = "Loading...",
  String imageLoading = 'assets/images/loading_tlive.gif',
}) async {
  await Get.dialog(
    AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: 165,
        height: 130,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                imageLoading,
                width: 70,
                height: 70,
              ),
            ),
            SizedBox(height: 8),
            Text(textLoading,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}
