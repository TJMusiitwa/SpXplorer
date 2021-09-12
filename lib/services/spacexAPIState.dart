import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';
import 'package:spxplorer/models/models.dart';
import 'package:spxplorer/models/rocket/rocket.dart';
import 'package:spxplorer/services/api_requestor.dart';

var spaceXAPI = GetIt.instance.get<SpaceXAPI>();

//Fetch Company Data
final AutoDisposeFutureProvider<Company> companyFuture =
    FutureProvider.autoDispose<Company>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getCompany();
});

//Fetch History Data
final AutoDisposeFutureProvider<List<History>> allHistoryFuture =
    FutureProvider.autoDispose<List<History>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getHistory();
});

//Fetch Landpad Data
final AutoDisposeFutureProvider<List<Landpad>> allLandpadsFuture =
    FutureProvider.autoDispose<List<Landpad>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getLandPads();
});

//Fetch History Data
final AutoDisposeFutureProvider<List<Launchpad>> allLaunchpadsFuture =
    FutureProvider.autoDispose<List<Launchpad>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getLaunchPads();
});

//Fetch Company Data
final AutoDisposeFutureProvider<Roadster> roadsterFuture =
    FutureProvider.autoDispose<Roadster>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getRoadster();
});

//Fetch all Ships
final AutoDisposeFutureProvider<List<Ship>> allShipsFuture =
    FutureProvider.autoDispose<List<Ship>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getShips();
});

//Fetch One Ship
final AutoDisposeFutureProviderFamily<Ship, String>? oneShipFuture =
    FutureProvider.autoDispose.family<Ship, String>((ref, identifier) async {
  ref.maintainState = true;
  return spaceXAPI.getShipByID(id: identifier);
});

//Query all Starlinks
final AutoDisposeFutureProvider<List<Starlink>> allStarlinksQuery =
    FutureProvider.autoDispose<List<Starlink>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.queryStarlinks();
});

//* Fetch all upcoming launches
final AutoDisposeFutureProvider<List<Launch>> upcomingLaunchesFuture =
    FutureProvider.autoDispose<List<Launch>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getUpcomingLaunches();
});

//* Fetch all past launches
final AutoDisposeFutureProvider<List<Launch>> pastLaunchesFuture =
    FutureProvider.autoDispose<List<Launch>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getPastLaunches();
});

final AutoDisposeFutureProvider<Launch> nextLaunchFuture =
    FutureProvider.autoDispose<Launch>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getNextLaunch();
});

//Fetch One Ship
final AutoDisposeFutureProviderFamily<Launch, String>? oneLaunchFuture =
    FutureProvider.autoDispose.family<Launch, String>((ref, identifier) async {
  ref.maintainState = true;
  return spaceXAPI.getLaunchByID(id: identifier);
});

//Fetch all Rockets
final AutoDisposeFutureProvider<List<Rocket>> allRocketsFuture =
    FutureProvider.autoDispose<List<Rocket>>((ref) async {
  ref.maintainState = true;
  return spaceXAPI.getRockets();
});
