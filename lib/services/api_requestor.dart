import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spxplorer/models/launch/launch.dart';
import 'package:spxplorer/models/models.dart';
import 'package:spxplorer/models/rocket/rocket.dart';
import 'package:spxplorer/services/endpoints.dart';

Directory tempDir = getTemporaryDirectory() as Directory;

class SpaceXAPI {
  final Dio spacexapi = Dio()
    ..options.baseUrl = 'https://api.spacexdata.com/v4/'
    ..options.responseType = ResponseType.plain
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.forceCache,
          hitCacheOnErrorExcept: [401, 403],
          priority: CachePriority.normal,
          maxStale: const Duration(days: 7),
        ),
      ),
    );

  ///*Capsules
  Future<List<Capsule>> getAllCapsules() async {
    final capsulesResponse = await spacexapi.get(Endpoints.capsules);
    final capsules = capsuleFromJson(capsulesResponse.data);
    return capsules;
  }

  Future<Capsule> getCapsuleByID({required String id}) async {
    final capsulesResponse =
        await spacexapi.get(Endpoints.capsules, queryParameters: {'id': id});
    final capsules = capsuleFromJson(capsulesResponse.data).single;
    return capsules;
  }

  ///*Company
  Future<Company> getCompany() async {
    final companyResponse = await spacexapi.get(Endpoints.company);
    final company = companyFromJson(companyResponse.data);
    return company;
  }

  ///*Dragons
  Future<List<Dragon>> getAllDragons() async {
    final dragonsResponse = await spacexapi.get(Endpoints.dragons);
    final dragons = dragonFromJson(dragonsResponse.data);
    return dragons;
  }

  Future<Dragon> getDragonByID({required String id}) async {
    final singleDragonResponse =
        await spacexapi.get(Endpoints.dragons, queryParameters: {'id': id});
    final singleDragon = dragonFromJson(singleDragonResponse.data).single;
    return singleDragon;
  }

  ///*History
  Future<List<History>> getHistory() async {
    final historyResponse = await spacexapi.get(Endpoints.history);
    final history = historyFromJson(historyResponse.data);
    return history;
  }

  ///*Landpads
  Future<List<Landpad>> getLandPads() async {
    final landpadsResponse = await spacexapi.get(Endpoints.landpads);
    final landpads = landpadFromJson(landpadsResponse.data);
    return landpads;
  }

  Future<Landpad> getLandPadByID({required String id}) async {
    final landpadsResponse =
        await spacexapi.get(Endpoints.landpads, queryParameters: {'id': id});
    final singleLandpad = landpadFromJson(landpadsResponse.data).single;
    return singleLandpad;
  }

  ///*Launchpads
  Future<List<Launchpad>> getLaunchPads() async {
    final launchpadsResponse = await spacexapi.get(Endpoints.launchpads);
    final launchpads = launchpadFromJson(launchpadsResponse.data);
    return launchpads;
  }

  Future<Launchpad> getLaunchPadByID({required String id}) async {
    final launchpadsResponse =
        await spacexapi.get(Endpoints.launchpads, queryParameters: {'id': id});
    final singleLaunchpad = launchpadFromJson(launchpadsResponse.data).single;
    return singleLaunchpad;
  }

  ///*Launches
  Future<List<Launch>> getUpcomingLaunches() async {
    final upcomingLaunchResponse =
        await spacexapi.get(Endpoints.upcomingLaunches);
    final upcomingLaunches = launchFromJson(upcomingLaunchResponse.data);
    return upcomingLaunches;
  }

  Future<List<Launch>> getPastLaunches() async {
    final pastLaunchResponse = await spacexapi.get(Endpoints.pastLaunches,
        options: Options(extra: {'pagination': true, 'limit': 15}));
    final pastLaunches = launchFromJson(pastLaunchResponse.data);
    return pastLaunches;
  }

  Future<Launch> getLaunchByID({required String id}) async {
    final singleLaunchResponse =
        await spacexapi.get(Endpoints.launches, queryParameters: {'id': id});
    final singleLaunch = launchFromJson(singleLaunchResponse.data).first;
    return singleLaunch;
  }

  Future<Launch> getNextLaunch() async {
    final nextLaunchResponse = await spacexapi.get(Endpoints.nextLaunch);
    final nextLaunch = launchFromJson(nextLaunchResponse.data).first;
    return nextLaunch;
  }

  ///*Roadster
  Future<Roadster> getRoadster() async {
    final roadsterResponse = await spacexapi.get(Endpoints.roadster);
    final roadster = roadsterFromJson(roadsterResponse.data);
    return roadster;
  }

  ///*Ships
  Future<List<Rocket>> getRockets() async {
    final rocketsResponse = await spacexapi.get(Endpoints.rockets);
    final rockets = rocketFromJson(rocketsResponse.data);
    return rockets;
  }

  ///*Ships
  Future<List<Ship>> getShips() async {
    final shipsResponse = await spacexapi.get(Endpoints.ships);
    final ships = shipFromJson(shipsResponse.data);
    return ships;
  }

  Future<Ship> getShipByID({required String id}) async {
    final singleShipResponse =
        await spacexapi.get(Endpoints.ships, queryParameters: {'id': id});
    final singleShip = shipFromJson(singleShipResponse.data).single;
    return singleShip;
  }

  ///*Starlinks
  Future<List<Starlink>> getStarlinks() async {
    final starlinksResponse = await spacexapi.get(Endpoints.starlink);
    final starlinks = starlinkFromJson(starlinksResponse.data);
    return starlinks;
  }

  Future<List<Starlink>> queryStarlinks() async {
    final starlinksResponse = await spacexapi.get(Endpoints.starlink,
        queryParameters: {'limit': 20, 'pagination': true});
    final starlinks = starlinkFromJson(starlinksResponse.data);
    return starlinks;
  }

  Future<Starlink> getStarlinkByID({required String id}) async {
    final singleStarlinkResponse =
        await spacexapi.get(Endpoints.starlink, queryParameters: {'id': id});
    final singleStarlink = starlinkFromJson(singleStarlinkResponse.data).single;
    return singleStarlink;
  }
}
