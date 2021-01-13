import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/banner_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerCubit extends Cubit<BannerState>{
  BannerCubit() : super(BannerInitial());

  Future<void> getBanners() async {
    ApiReturnValue<List<Banner>> result = await BannerServices.getBanners();
    if(result != null){
      emit(BannerLoaded(result.value));
    }else{
      emit(BannerLoadFailed(result.message));
    }
  }

}


class BannerState extends Equatable{
  const BannerState();
  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState{}

class BannerLoaded extends BannerState{
  final List<Banner> banners;

  BannerLoaded(this.banners);
  @override
  List<Object> get props => [banners];
}

class BannerLoadFailed extends BannerState{
  final String error;

  BannerLoadFailed(this.error);
  @override
  List<Object> get props => [error];
}