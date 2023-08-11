part of '../sua_phieu_thu_layout.dart';

class UploadFileHDWidget extends ConsumerStatefulWidget {
  const UploadFileHDWidget({super.key});

  @override
  ConsumerState createState() => _UploadFileHDWidgetState();
}

class _UploadFileHDWidgetState extends ConsumerState<UploadFileHDWidget>
    with FormUIMixins {
  final TextEditingController textEditingController = TextEditingController();

  String _loaiFileHD = 'hopdong';

  @override
  dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String soHopDong = ref.watch(formPhieuThuProvider.select((value) => value.soHopDong.toString()));
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Chọn loại file:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ndGapW8(),
                  Radio<String>(
                    value: 'hopdong',
                    groupValue: _loaiFileHD,
                    onChanged: (String? value) {
                      ref.read(fileHDProvider.notifier).changeLoai(value ?? '');
                      setState(() {
                        _loaiFileHD = value!;
                      });
                    },
                  ),
                  const Text('Hợp đồng'),
                  ndGapW16(),
                  Radio<String>(
                    value: 'chungtukhac',
                    groupValue: _loaiFileHD,
                    onChanged: (value) {
                      ref.read(fileHDProvider.notifier).changeLoai(value ?? '');
                      setState(() {
                        _loaiFileHD = value!;
                      });
                    },
                  ),
                  const Text('Chứng từ khác'),
                ],
              ),
            ),
            ndGapW16(),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 200,
                child: inputUploadFile(context,
                    controller: textEditingController, onTap: () async {
                  String path = '';
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                  );
                  if (result != null) {
                    for (PlatformFile file in result.files) {
                      ref.read(fileHDProvider.notifier).changeFile(file: file);
                    }
                    if (result.files.length > 1) {
                      textEditingController.text =
                          'Đã chọn ${result.files.length} files';
                    } else {
                      textEditingController.text = result.files.first.name;
                    }
                  } else {
                    ref.read(fileHDProvider.notifier).clear();
                    textEditingController.clear();
                  }
                }),
              ),
            ),
            ndGapW32(),
            Expanded(
              flex: 2,
              child: Wrap(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nội dung ghi chú cho file',
                    ),
                    minLines: 3,
                    maxLines: 3,
                    onChanged: (value) {
                      ref.read(fileHDProvider.notifier).changeGhiChu(value);
                    },
                  ),
                ],
              ),
            ),
            ndGapW32(),
            SizedBox(
              width: 150,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
                label: const Text('Thêm File'),
              ),
            ),
          ],
        ),
        ndGapH32(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TableFiles(soHopDong: soHopDong,),
        )
      ],
    );
  }
}

class TableFiles extends ConsumerStatefulWidget {
  const TableFiles({super.key, required this.soHopDong});

  final String soHopDong;

  @override
  ConsumerState createState() => _TableFilesState();
}

class _TableFilesState extends ConsumerState<TableFiles> with DataTableMixins {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), (){
      ref.read(fileHDProvider.notifier).layDanhSachFile(
          soHopDong: widget.soHopDong);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<FileModel> danhSach =
        ref.watch(fileHDProvider.select((value) => value.danhSachFile));
    return dataTableWidget(
      context: context,
      columns: [
        DataColumn(label: Text('STT'.toUpperCase())),
        DataColumn(label: Text('Ngày tháng'.toUpperCase())),
        DataColumn(label: Text('User Cập nhật'.toUpperCase())),
        DataColumn(label: Text('Loại file'.toUpperCase())),
        DataColumn(label: Text('ghi chú'.toUpperCase())),
        DataColumn(label: Text('Xoá'.toUpperCase())),
      ],
      rows: (danhSach.isNotEmpty)
          ? List.generate(danhSach.length, (index) {
              final item = danhSach[index];
              return DataRow.byIndex(
                  index: index,
                  color: MaterialStateColor.resolveWith(
                    (states) {
                      if (index % 2 == 0) {
                        return Colors.white;
                      } else {
                        return Colors.grey.shade100;
                      }
                    },
                  ),
                  cells: [
                    DataCell(Text((index+1).toString())),
                    DataCell(Text((item.createdAt as DateTime).formatDateTime(formatString: 'dd-MM-yyyy'))),
                    DataCell(Text(item.l1_lichsu_khoitao!.hoten.toString())),
                    DataCell(Text((item.loaifile.toString()=='hopdong') ? 'Hợp đồng' : 'Chứng từ khác')),
                    DataCell(Text(item.ghichu.toString())),
                    DataCell(
                      IconButton(
                        onPressed: () {

                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.trash,
                          color: Colors.redAccent,
                          size: 17,
                        ),
                      ),
                    ),
                  ]);
            })
          : [],
    );
  }
}
