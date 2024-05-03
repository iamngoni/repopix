part of 'locale_bloc.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();
}

class SwitchLocale extends LocaleEvent {
  const SwitchLocale(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}

class LoadLocale extends LocaleEvent {
  const LoadLocale();
  @override
  List<Object?> get props => [];
}
