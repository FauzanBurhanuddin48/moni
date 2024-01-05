import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';
import 'package:moni5/models/tujuan.dart';
import 'package:moni5/presentation/database_helper.dart';
import 'package:moni5/widgets/custom_elevated_button.dart';
import 'package:moni5/widgets/custom_text_form_field.dart';

class TujuanScreen extends StatefulWidget {
  TujuanScreen({Key? key}) : super(key: key);

  @override
  _TujuanScreenState createState() => _TujuanScreenState();
}

class _TujuanScreenState extends State<TujuanScreen> {
  late TextEditingController inputController;
  late TextEditingController inputController1;
  late TextEditingController inputController2;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();
    inputController1 = TextEditingController();
    inputController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 17, top: 114, right: 17),
          child: Column(
            children: [
              _buildTujuanDetailInput(),
              SizedBox(height: 20),
              _buildTujuanList(),
            ],
          ),
        ),
        bottomNavigationBar: _buildSimpanButton(),
      ),
    );
  }

  Widget _buildTujuanDetailInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Tujuan Keuangan",
          style: theme.textTheme.titleMedium,
        ),
        CustomTextFormField(controller: inputController),
        SizedBox(height: 10),
        Text(
          "Deskripsi",
          style: theme.textTheme.titleMedium,
        ),
        CustomTextFormField(controller: inputController1),
        SizedBox(height: 10),
        Text(
          "Nominal",
          style: theme.textTheme.titleMedium,
        ),
        CustomTextFormField(
          controller: inputController2,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  Widget _buildTujuanList() {
    return FutureBuilder<List<Tujuan>>(
      future: DatabaseHelper().getTujuanList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Tidak ada data.');
        } else {
          List<Tujuan> tujuanList = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Tujuan Keuangan",
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.lightBlue),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tujuanList.map((tujuan) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nama: ${tujuan.nama}, Deskripsi: ${tujuan.deskripsi}, Nominal: ${tujuan.nominal}",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          DatabaseHelper().deleteTujuan(tujuan.id!);
                          setState(() {});
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildSimpanButton() {
    return CustomElevatedButton(
      text: "Simpan",
      margin: EdgeInsets.only(left: 19, right: 17, bottom: 41),
      onPressed: onTapSimpanButton,
    );
  }

  void onTapSimpanButton() async {
    String nama = inputController.text;
    String deskripsi = inputController1.text;
    String nominal = inputController2.text;

    Tujuan tujuan = Tujuan(nama: nama, deskripsi: deskripsi, nominal: nominal);

    await DatabaseHelper().insertTujuan(tujuan);

    // Bersihkan input setelah disimpan
    inputController.clear();
    inputController1.clear();
    inputController2.clear();

    // Setelah menyimpan, secara otomatis refresh tampilan tujuanList
    setState(() {});
  }
}
