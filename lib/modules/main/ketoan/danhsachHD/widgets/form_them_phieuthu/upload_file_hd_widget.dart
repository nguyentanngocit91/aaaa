part of '../../screen/them_phieuthu_screen.dart';


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
          child:Container(
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
                      ref.read(fileHDProvider.notifier).changeFile(file: file);
                    }
                    if(result.files.length>1){
                      textEditingController.text = 'Đã chọn ${result.files.length} files';
                    }else{
                      textEditingController.text = result.files.first.name;
                    }
                  }else{
                    ref.read(fileHDProvider.notifier).clear();
                    textEditingController.clear();
                  }
                }
            ),
          ),
        ),
        ndGapW32(),
        Expanded(
          flex: 3,
          child: Column(
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
      ],
    );
  }
}
