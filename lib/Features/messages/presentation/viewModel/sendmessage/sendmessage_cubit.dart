import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'sendmessage_state.dart';

class SendmessageCubit extends Cubit<SendmessageState> {
  SendmessageCubit() : super(SendmessageInitial());
}
