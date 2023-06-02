
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<TriggerSettingEvent>(_triggerSettings);
  }

 _triggerSettings(TriggerSettingEvent event, Emitter<SettingState> emit) {
  emit(SettingInitial());
  }
}
