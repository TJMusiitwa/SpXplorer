library spacex_api;

import 'package:dio/dio.dart';

import 'src/endpoints.dart';
import 'src/requestor.dart';

class SpaceXAPI {
  final _req = Requestor();

  /// Company
  Future<Response> getCompany() {
    return _req.getData(endpoint: Endpoints.company);
  }

  /// Crews
  Future<Response> getAllCrews() {
    return _req.getData(endpoint: Endpoints.crew);
  }

  Future<Response> getCrewById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.crew, id: id);
  }

  /// Dragons
  Future<Response> getAllDragons() {
    return _req.getData(endpoint: Endpoints.dragons);
  }

  Future<Response> getDragonById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.dragons, id: id);
  }

  /// History
  Future<Response> getAllHistory() {
    return _req.getData(endpoint: Endpoints.history);
  }

  Future<Response> getHistoryById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.history, id: id);
  }

  /// Landpads
  Future<Response> getAllLandpads() {
    return _req.getData(endpoint: Endpoints.landpads);
  }

  Future<Response> getLandpadById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.landpads, id: id);
  }

  /// Launches
  Future<Response> getAllLaunches() {
    return _req.getData(endpoint: Endpoints.launches);
  }

  Future<Response> getLaunchById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.launches, id: id);
  }

  /// Launchpads
  Future<Response> getAllLaunchPads() {
    return _req.getData(endpoint: Endpoints.launchpads);
  }

  Future<Response> getLaunchPadById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.launchpads, id: id);
  }

  /// Payloads
  Future<Response> getAllPayloads() {
    return _req.getData(endpoint: Endpoints.payloads);
  }

  Future<Response> getPayloadsById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.payloads, id: id);
  }

  /// Rockets
  Future<Response> getAllRockets() {
    return _req.getData(endpoint: Endpoints.rockets);
  }

  Future<Response> getRocketById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.rockets, id: id);
  }

  Future<Response> queryRockets({
    required Object query,
    Object? headers,
  }) {
    return _req.getData(
      endpoint: Endpoints.rockets,
      query: query,
      header: headers,
    );
  }

  /// Roadster
  Future<Response> getRoadster() {
    return _req.getData(endpoint: Endpoints.roadster);
  }

  /// Ships
  Future<Response> getAllShips() {
    return _req.getData(endpoint: Endpoints.ships);
  }

  Future<Response> getShipsById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.ships, id: id);
  }

  Future<Response> queryShips({
    required Object query,
    Object? headers,
  }) {
    return _req.getData(
      endpoint: Endpoints.ships,
      query: query,
      header: headers,
    );
  }

  /// Starlinks
  Future<Response> getAllStarlinks() {
    return _req.getData(endpoint: Endpoints.starlink);
  }

  Future<Response> getStarlinkById({
    required String id,
  }) {
    return _req.getData(endpoint: Endpoints.starlink, id: id);
  }

  Future<Response> queryStarlinks({
    required Object query,
    Object? headers,
  }) {
    return _req.getData(
      endpoint: Endpoints.starlink,
      query: query,
      header: headers,
    );
  }
}
