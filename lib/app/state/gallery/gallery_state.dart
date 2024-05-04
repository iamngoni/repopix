part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();
}

final class GalleryInitial extends GalleryState {
  const GalleryInitial();
  @override
  List<Object> get props => [];
}

final class GalleryStarting extends GalleryState {
  const GalleryStarting();
  @override
  List<Object> get props => [];
}

final class GalleryLoading extends GalleryState {
  const GalleryLoading();
  @override
  List<Object> get props => [];
}

final class GalleryLoaded extends GalleryState {
  const GalleryLoaded(this.gallery);
  final List<dynamic> gallery;

  @override
  List<Object> get props => [gallery];
}

final class GalleryError extends GalleryState {
  const GalleryError(this.error);
  final ApplicationError error;

  @override
  List<Object> get props => [error];
}
