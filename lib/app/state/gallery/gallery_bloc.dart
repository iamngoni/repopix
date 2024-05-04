import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/models/application_error.dart';
import '../../models/repos/abs/app_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

@injectable
class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.repository}) : super(const GalleryInitial()) {
    on<InitializeGalleryEvent>(onInitializeGallery);
  }

  Future<void> onInitializeGallery(
    InitializeGalleryEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryStarting());
    try {
      final Either<ApplicationError, void> response =
          await repository.checkForRepository();
      response.fold(
        (l) => emit(GalleryError(l)),
        (r) => emit(const GalleryLoaded([])),
      );
    } catch (e, s) {
      emit(GalleryError(ApplicationError.unknownError()));
    }
  }

  final AppRepository repository;
}
