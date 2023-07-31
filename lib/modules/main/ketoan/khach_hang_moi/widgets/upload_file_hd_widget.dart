part of '../khach_hang_moi_layout.dart';


class UploadFileHDWidget extends ConsumerStatefulWidget {
  const UploadFileHDWidget({super.key});

  @override
  ConsumerState createState() => _UploadFileHDWidgetState();
}

class _UploadFileHDWidgetState extends ConsumerState<UploadFileHDWidget>
    with FormUIMixins {

  final TextEditingController textEditingController = TextEditingController();

  LoaiFileHD _loaiFileHD = LoaiFileHD.hopDong;
  FileHDModel _fileHD = FileHDModel();

  @override
  dispose(){
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Radio<LoaiFileHD>(
                value: LoaiFileHD.hopDong,
                groupValue: _loaiFileHD,
                onChanged: (LoaiFileHD? value) {
                  _fileHD = _fileHD.copyWith(loaiFile: value);
                  setState(() {
                    _loaiFileHD = value!;
                  });
                },
              ),
              const Text('Hợp đồng'),
              ndGapW16(),
              Radio<LoaiFileHD>(
                value: LoaiFileHD.chungTuKhac,
                groupValue: _loaiFileHD,
                onChanged: (LoaiFileHD? value) {
                  _fileHD = _fileHD.copyWith(loaiFile: value);
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
            child: inputUploadFile(
              context,
              controller: textEditingController,
              onTap: () async {
                String path = '';
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                );
                if (result != null) {
                  for(PlatformFile file in result.files){
                    _fileHD = _fileHD.copyWith(tenFile: file.name, pathFile: file.path);
                    // ref.read(fileHDProvider.notifier).addFile(fileHD: fileHD);
                  }
                  if(result.files.length>1){
                    textEditingController.text = 'Đã chọn ${result.files.length} files';
                  }else{
                    textEditingController.text = result.files.first.name;
                  }
                }else{
                  _fileHD = _fileHD.copyWith(tenFile: null, pathFile: null);
                  textEditingController.clear();
                }
                print(_fileHD.toString());
              }
            ),
          ),
        ),
        ndGapW32(),
        Expanded(
          flex: 3,
          child: Wrap(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nội dung ghi chú cho file',
                ),
                minLines: 3,
                maxLines: 3,
                onChanged: (value) {
                  _fileHD = _fileHD.copyWith(ghiChu: value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
