import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'mock_heroes.dart';
import 'hero_service.dart';
import 'dart:async';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-heroes',
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  directives: [
    coreDirectives,
    formDirectives,
  ],
  pipes: [commonPipes],
)
class HeroListComponent {
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  final Router _router;

  Hero selected;
  List<Hero> heroes = mockHeroes;
  HeroListComponent(this._heroService, this._router);

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
