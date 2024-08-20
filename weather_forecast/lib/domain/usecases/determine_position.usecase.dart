import 'package:geolocator/geolocator.dart';

import '../../core/usecase/usecase.dart';
import '../repositories/geolocator.repository.dart';

class DeterminePositionUsecase implements UseCase<Position, void> {
  final GeolocatorRepository _geolocatorRepository;

  DeterminePositionUsecase(this._geolocatorRepository);
  @override
  Future<Position> call(void params) {
    return _geolocatorRepository.determinePosition();
  }
}
