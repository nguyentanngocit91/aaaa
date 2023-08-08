import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../_shared/utils/form_status.dart';
import '../models/domain_model.dart';
import '../repositories/domain_repository.dart';
import 'danh_sach_domain_moi_state.dart';

final DomainRepository _domainRepository = DomainRepository();

final dsDomainMoiProvider =
NotifierProvider<DanhSachDomainMoiNotifier, DanhSachDomainMoiState>(() {
  return DanhSachDomainMoiNotifier();
});

class DanhSachDomainMoiNotifier extends Notifier<DanhSachDomainMoiState> {



  @override
  DanhSachDomainMoiState build() {
    return DanhSachDomainMoiState(status: FormStatus.submissionInProgress);
  }

  init() async {
    await getListDomain();
  }

  void resetInputSearch() async{
    await getListDomain();

  }

  void setInputDomain({required String? domain}){
    if(domain!=null) {
      state = state.copyWith(domain: domain);
    }
  }

  Future<void> actionUpdateDomain({required String idDomain, required String ngayDangKy,required int soNam}) async {

  state = state.copyWith(statusUpdate: FormStatus.submissionInProgress);

    final Map<String,dynamic> data = {};
    if(idDomain!='' && ngayDangKy!='' && soNam>0){
      CustomDateTime originalDate = CustomDateTime.fromString(ngayDangKy);
      // Tăng thêm số năm năm
      CustomDateTime newDate = originalDate.addYears(soNam);
      // Chuyển đổi thành chuỗi mới
      String ngayHetHan = newDate.toString();
      data['ngaykichhoat'] = ngayDangKy;
      data['ngayhethan'] = ngayHetHan;
      data['actived'] = soNam;

      // final response = await _domainRepository.updateDomain(idDomain: idDomain, data: data);
      // if(response==false){
      //
      // }
      await Future.delayed(const Duration(seconds: 10));
      print('OK');

    }
  state = state.copyWith(statusUpdate: FormStatus.submissionCanceled);

  }

  Future<void> actionInputSearch() async {
    var domain = state.domain;
    List<DomainModel> listDomain = [];

    domain ??= '';


    state = state.copyWith(status: FormStatus.submissionInProgress,listDomain: []);
    List<DomainModel>? temp = await searchDomain( domain:  domain);
    if(temp!=null) {
      listDomain = temp;
    }
    state = state.copyWith(status: FormStatus.submissionSuccess);
    state = state.copyWith(listDomain: listDomain);

  }

  Future<List<DomainModel>?> searchDomain({String domain = ''}) async {
    final List<DomainModel> list = [];
    final response = await _domainRepository.searchListDomain(domain: domain);
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(DomainModel.fromJson(json));
        }
        return list;
      }
    }
    return null;
  }


  Future<void> getListDomain() async {
    final List<DomainModel> list = [];
    final response = await _domainRepository.getListDomain();
    if (response!= null) {
      if (response['success']) {
        for (var json in response['data']) {
          list.add(DomainModel.fromJson(json));
        }
      }
    }
    state = state.copyWith(listDomain: list,status: FormStatus.submissionSuccess);
  }

}

class CustomDateTime {
  int year;
  int month;
  int day;

  CustomDateTime({required this.year, required this.month, required this.day});

  factory CustomDateTime.fromString(String dateString) {
    List<String> dateParts = dateString.split('-');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);
    return CustomDateTime(year: year, month: month, day: day);
  }

  @override
  String toString() {
    return '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-${year}';
  }

  bool isLeapYear() {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  int daysInMonth() {
    List<int> monthLengths = [31, isLeapYear() ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return monthLengths[month - 1];
  }

  CustomDateTime addYears(int years) {
    int newYear = year + years;
    int newDaysInMonth = CustomDateTime(year: newYear, month: month, day: day).daysInMonth();
    int newDay = day <= newDaysInMonth ? day : newDaysInMonth;
    return CustomDateTime(year: newYear, month: month, day: newDay);
  }
}
