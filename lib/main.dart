import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_mib/color.dart';
import 'package:test_mib/extension.dart';
import 'package:test_mib/helper.dart';
import 'package:test_mib/mock_data.dart';
import 'package:test_mib/widget_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ButtonData> buttons = [
    ButtonData(
      text: "Beranda",
      color: ColorTheme.primaryColor,
      useExpanded: true,
    ),
    ButtonData(
      iconButton: Icons.share,
      color: ColorTheme.accentColor,
      width: 60,
    ),
    ButtonData(
      iconButton: Icons.star_border,
      color: ColorTheme.accentColor,
      width: 60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorTheme.primaryColor,
      child: Column(
        children: [
          //Title
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 26, bottom: 26),
            child: const Text(
              "Transaksi Sukses",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(241, 241, 241, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  //Empty Container and button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: buttons
                              .asMap()
                              .map(
                                (key, value) => MapEntry(
                                  key,
                                  value.useExpanded
                                      ? Expanded(
                                          child: bodyButton(key, value),
                                        )
                                      : bodyButton(key, value),
                                ),
                              )
                              .values
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  //main content
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 90),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.passthrough,
                        children: [
                          //Logo watermark on right side
                          Positioned(
                            right: -10,
                            top: 0,
                            bottom: 0,
                            left: 0,
                            child: ListView.separated(
                                itemBuilder: (context, index) => Align(
                                  alignment: Alignment.centerRight,
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Image.asset(
                                          "assets/logo_lengkap.png",
                                          width: 80,
                                          height: 50,
                                      color: Colors.grey.withOpacity(.5),
                                        ),
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 12,
                                    ),
                                itemCount: 6,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                          //main content
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //main logo
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 180,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: Image.asset(
                                            "assets/logo_universal_bpr.png",
                                            width: 180,
                                          ),
                                        ),
                                        const Text(
                                          "mobile",
                                          style: TextStyle(
                                            color: ColorTheme.textMobileColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(),
                                //status transaction
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorTheme.greenColor),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      "Transaksi Berhasil",
                                      style: TextStyle(
                                        color: ColorTheme.greenColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Pembayaran CREDIT CARD MEGA",
                                  style: TextStyle(
                                    color: ColorTheme.textBlueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),

                                //transaction information
                                for (var data in MockData(waktu: DateTime.now())
                                    .toJson()
                                    .entries)
                                  textShow(data.key, data.value),
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.8),
                                      border: const Border(
                                          top: BorderSide(
                                              color: Colors.white, width: 2))),
                                  child: ClipPath(
                                    clipper: MultipleRoundedPointsClipper(
                                        Sides.bottom,
                                        numberOfPoints: 15),
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ///for information about transaction
  Widget textShow(String title, dynamic content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorTheme.textBlueColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          content is String
              ? content
              : content is double
                  ? Helper.formatCurrency(content)
                  : content is DateTime
                      ? content.format
                      : content,
          style: const TextStyle(
            color: ColorTheme.textGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget bodyButton(int key, ButtonData value) {
    return Row(
      children: [
        value.useExpanded
            ? Expanded(
                child: button(
                  text: value.text,
                  iconButton: value.iconButton,
                  color: value.color,
                  onTap: value.onTap,
                  width: value.width,
                ),
              )
            : button(
                text: value.text,
                iconButton: value.iconButton,
                color: value.color,
                onTap: value.onTap,
                width: value.width,
              ),
        if (key < buttons.length - 1)
          const SizedBox(
            width: 8,
          )
      ],
    );
  }

  ///Default pick is text
  Widget button({
    String? text,
    IconData? iconButton,
    double height = 60,
    double? width,
    Color color = ColorTheme.accentColor,
    Function? onTap,
  }) {
    assert(text != null || iconButton != null,
        "Isi salah satu param text atau button. Default akan dipilih text jika disi keduanya");

    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        alignment: Alignment.center,
        child: text != null
            ? Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            : Icon(
                iconButton!,
                size: 18,
                color: Colors.white,
              ),
      ),
    );
  }
}
