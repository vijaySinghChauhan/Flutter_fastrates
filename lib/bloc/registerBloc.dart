
import 'package:flutter_razorpay/Pojo/baseResponse.dart';
import 'package:flutter_razorpay/Pojo/registerModel.dart';
import 'package:flutter_razorpay/repo/repoRegister.dart';
import 'package:rxdart/rxdart.dart';

class registerBloc {
  final registerRepository _repository = registerRepository();
  final BehaviorSubject<baseResponse> _subject =
  BehaviorSubject<baseResponse>();

  postRegister(registerModel register) async {
    baseResponse response =
    (_repository.postRegister(register)) as baseResponse;

    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<baseResponse> get subject => _subject;
}

final bloc = registerBloc();
