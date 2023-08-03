part of '../upgrade.dart';

enum LoaiFileHD { hopDong, chungTuKhac }


class UploadFileHDWidget extends ConsumerStatefulWidget {
  const UploadFileHDWidget({super.key});

  @override
  ConsumerState createState() => _UploadFileHDWidgetState();
}

class _UploadFileHDWidgetState extends ConsumerState<UploadFileHDWidget>
    with FormUIMixins {

  final TextEditingController textEditingController = TextEditingController();

  LoaiFileHD _loaiFileHD = LoaiFileHD.hopDong;

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
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'Vui lòng chọn File.')
                ]),
              onTap: () async {
                String path = '';
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;
                  textEditingController.text = file.name;
                }else{
                  textEditingController.clear();
                }
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
