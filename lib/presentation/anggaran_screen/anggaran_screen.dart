import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/models/anggaran.dart'; // Pastikan mengganti import model sesuai dengan nama model yang digunakan
import 'package:moni5/presentation/database_helper.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';
import 'package:moni5/widgets/custom_text_form_field.dart';

class AnggaranScreen extends StatefulWidget {
  AnggaranScreen({Key? key}) : super(key: key);

  @override
  _AnggaranScreenState createState() => _AnggaranScreenState();
}

class _AnggaranScreenState extends State<AnggaranScreen> {
  TextEditingController inputController = TextEditingController();
  TextEditingController inputController1 = TextEditingController();
  List<Anggaran> anggaranList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 17, top: 65, right: 17),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Atur Anggaran",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 25),
              _buildAturAnggaranSection(context),
              SizedBox(height: 22),
              _buildKeteranganSection(context),
              SizedBox(height: 5),
              _buildHasilAnggaran(),
            ],
          ),
        ),
        bottomNavigationBar: _buildSimpanButtonSection(context),
      ),
    );
  }

  Widget _buildAturAnggaranSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 9),
              child: Text("Nominal Anggaran", style: theme.textTheme.titleMedium)),
          Padding(
              padding: EdgeInsets.only(left: 1),
              child: CustomTextFormField(controller: inputController))
        ]));
  }

  Widget _buildKeteranganSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 9),
              child: Text("Keterangan", style: theme.textTheme.titleMedium)),
          Padding(
              padding: EdgeInsets.only(left: 1),
              child: CustomTextFormField(
                  controller: inputController1,
                  textInputAction: TextInputAction.done))
        ]));
  }

  Widget _buildSimpanButtonSection(BuildContext context) {
    return CustomElevatedButton(
        text: "Simpan",
        margin: EdgeInsets.only(left: 19, right: 17, bottom: 41),
        onPressed: () {
          onTapSimpanButtonSection(context);
        });
  }

  Widget _buildHasilAnggaran() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Anggaran Saya",
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.lightBlue),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: anggaranList.map((anggaran) {
            return Text(
              "Nominal: ${anggaran.nominal}, Keterangan: ${anggaran.keterangan}",
              style: TextStyle(fontSize: 20),
            );
          }).toList(),
        ),
      ],
    );
  }

  onTapSimpanButtonSection(BuildContext context) async {
    String nominal = inputController.text;
    String keterangan = inputController1.text;

    Anggaran anggaran = Anggaran(id: 0, nominal: nominal, keterangan: keterangan);

    await DatabaseHelper().insertAnggaran(anggaran);

    List<Anggaran> updatedList = await DatabaseHelper().getAnggaranList();
    setState(() {
      anggaranList = updatedList;
    });
  }
}
