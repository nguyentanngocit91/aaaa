part of '../../screen/them_phieuthu_screen.dart';


class UploadFileHDWidget extends ConsumerStatefulWidget {
  const UploadFileHDWidget({super.key});

  @override
  ConsumerState createState() => _UploadFileHDWidgetState();
}

class _UploadFileHDWidgetState extends ConsumerState<UploadFileHDWidget>
    with FormUIMixins {

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController _uploadController = new TextEditingController();
  final TextEditingController _noteController =  TextEditingController();
  List<PlatformFile> _files = [];
  String _radioValue = 'Chứng từ khác';
  String _loaiFileHD = 'chungtukhac';
  List<Widget> _uploadType() {
    List<Widget> radioButtons = [];
    _loaiPhiethu.forEach((key, value) {
      //print(value);
      radioButtons.add(
        Row(
          children: [
            Radio<String>(
              value: key,
              groupValue: _radioValue,
              onChanged: (value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            GestureDetector(
                child: Text(value),
                onTap: () => setState(() {
                  _radioValue = key;
                }))
          ],
        ),
      );
    });
    return radioButtons;
  }

  @override
  dispose(){
    super.dispose();
    textEditingController.dispose();
    _uploadController.dispose();
    _noteController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                lg: 12,
                xl: 4,
                md: 12,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: Row(
                    children: [
                      const Text(
                        'Loại file:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Radio<String>(
                        value: 'chungtukhac',
                        groupValue: _loaiFileHD,
                        onChanged: (value) {
                          setState(() {
                            _loaiFileHD = value!;
                          });
                        },
                      ),
                      const Text('Chứng từ khác'),

                      //..._uploadType()
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 6,
                xl: 3,
                xs: 12,
                child: Container(
                  padding: Helper.padding(),
                  child: SizedBox(
                    child: inputUploadFile(context,
                        controller: _uploadController,
                        validator: FormBuilderValidators.compose([
                          //FormBuilderValidators.required(errorText: 'Vui lòng chọn File.')
                        ]), onTap: () async {
                          String path = '';
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: [
                              'pdf',
                              'doc',
                              'docx',
                              'xls',
                              'xlsx',
                              'jpg',
                              'png',
                            ],
                          );
                          // print(result?.files.first.bytes);
                          if (result != null && result?.files.first != null) {
                            List<String> name = [];
                            for (var file in result.files) {
                              name.add(file.name);
                            }
                            _files = result.files;
                            _uploadController.text = name.join(",");
                            // print( _uploadController.text);
                          } else {
                            _uploadController.clear();
                          }
                        }),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 12,
                lg: 6,
                xl: 5,
                child: Padding(
                  padding: Helper.padding(),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 10,
                        child: TextFormField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            hintText: 'Nhập nội dung ghi chú cho file upload',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child:  SizedBox(
                          width: 150,
                          child: FilledButton.icon(
                            onPressed: () {
                              bool next = true;
                              if (_uploadController.text == '') {
                                Helper.toast(
                                    messenge: 'Vui lòng chọn file tải lên',
                                    context: context);
                                next = false;
                              }
                              if (next && _radioValue == '') {
                                Helper.toast(
                                    messenge: 'Vui lòng chọn loại file',
                                    context: context);
                                next = false;
                              }
                              if (next) {
                                List<PlatformFile> _tmpFile = [];
                                List<String> fileSelected = [];
                                List<String> pathFiles = [];
                                // print(_resultFile.length);

                                if (_resultFile.length > 0) {
                                  _resultFile.forEach((element) {
                                    pathFiles
                                        .add(element['file'].path.toString());
                                  });
                                }

                                _files.forEach((element) {
                                  if (pathFiles.indexOf(element.path!) == -1) {
                                    _tmpFile.add(element);
                                  }
                                });
                                if (_tmpFile.length == 0) {
                                  Helper.toast(
                                      messenge: 'Vui lòng chọn file tải lên',
                                      context: context);
                                  return;
                                }
                                // print(_tmpFile.length);
                                setState(() {
                                  for (PlatformFile file in _tmpFile) {
                                    Map tmp = {
                                      /*'type': _radioValue,
                                    'typeName': _loaiPhiethu[_radioValue],*/
                                      'type': "chungtukhac",
                                      'typeName': "chứng từ khác",
                                      'note': _noteController.text,
                                      'file': file
                                    };
                                    _resultFile.add(tmp);
                                  }
                                  _noteController.text = '';
                                  _uploadController.text = '';
                                  _radioValue = '';
                                });
                                // print("${_resultFile}+_resultFile");
                                ref.read(formThemPhieuThuProvider.notifier).setFile(_resultFile);
                              }
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.plus,
                              size: 15,
                            ),
                            label: const Text('Thêm File'),
                          ),
                        ),



                      ),
                    ],
                  ),
                ),
              ),
            ]),
        const SizedBox(height: 5.0),
        if (_resultFile.length > 0) ...[
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: HeaderRowItem(text: 'STT')),
                      Expanded(
                        flex: 2,
                        child: HeaderRowItem(text: 'Loại file'),
                      ),
                      Expanded(
                        flex: 3,
                        child: HeaderRowItem(text: 'Tên file'),
                      ),
                      Expanded(
                        flex: 3,
                        child: HeaderRowItem(text: 'Ghi chú'),
                      ),
                      Expanded(
                        flex: 1,
                        child: HeaderRowItem(text: 'Xoá'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                if (_resultFile.length > 0) ...[
                  ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: true,
                      itemCount: _resultFile.length,
                      itemBuilder: (BuildContext context, index) {
                        var item = _resultFile[index];
                        PlatformFile file = item['file'];

                        return Column(
                          children: [
                            Row(children: [
                              Expanded(
                                flex: 1,
                                child: BodyRowItem(Text("${index + 1}")),
                              ),
                              Expanded(
                                flex: 2,
                                child: BodyRowItem(Text(item['typeName'])),
                              ),
                              Expanded(
                                flex: 3,
                                child: BodyRowItem(Text(file.name)),
                              ),
                              Expanded(
                                flex: 3,
                                child: BodyRowItem(Text(item['note'])),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: BodyRowItem(TextButton(
                                    onPressed: () {
                                      ConfirmDialog alert = ConfirmDialog(
                                        "Xác nhận",
                                        "Xoá file đã chọn?",
                                            () {
                                          setState(() {
                                            _resultFile.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        left: 10,
                                        right: 10,
                                      ),
                                      backgroundColor: Colors.blueAccent,
                                      alignment: Alignment.center,
                                      iconColor: Colors.white,
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.delete_outline_sharp,
                                          size: 15.0,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('Xoá',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0)),
                                      ],
                                    ),
                                  ))),
                            ]),
                            _resultFile.length - 1 > index
                                ? const Divider()
                                : Container()
                          ],
                        );
                      }),
                ]
              ],
            ),
          )
        ]
      ],
    );


  }
}
