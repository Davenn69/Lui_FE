import 'package:lui_fe/core/session/business/entity/session_entity.dart';
import 'package:lui_fe/core/session/data/models/session_model.dart';

class SessionMapper {
  static SessionModel toModel(SessionEntity entity) {
    return SessionModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      accessTokenExpires: entity.accessTokenExpires,
      refreshTokenExpires: entity.refreshTokenExpires,
    );
  }

  static SessionEntity toEntity(SessionModel model) {
    return SessionEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      accessTokenExpires: model.accessTokenExpires,
      refreshTokenExpires: model.refreshTokenExpires,
    );
  }
}
