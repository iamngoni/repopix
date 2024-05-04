part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class InitializeGalleryEvent extends GalleryEvent {
  const InitializeGalleryEvent();
  @override
  List<Object> get props => [];
}
