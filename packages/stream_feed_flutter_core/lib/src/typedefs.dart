import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/src/bloc/bloc.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

/* BUILDERS */
/// {@template enrichedFeedBuilder}
/// A builder that allows building a ListView of EnrichedActivity based Widgets
/// {@endtemplate}
typedef EnrichedFeedBuilder<A, Ob, T, Or> = Widget Function(
  BuildContext context,
  List<GenericEnrichedActivity<A, Ob, T, Or>> activities,
  int idx,
);

/// {@template reactionsBuilder}
/// A builder that allows building a ListView of Reaction based Widgets
/// {@endtemplate}
typedef ReactionsBuilder = Widget Function(
    BuildContext context, List<Reaction> reactions, int idx);

/*  CONVENIENT TYPEDEFS
 for defining default type parameters. 
 Dart doesn't allow a type parameter to have a default value
 so this is a hack until it is supported
*/

///Convenient typedef for [GenericFlatFeedCore] with default parameters
///
/// {@template flatFeedCore}
/// [FlatFeedCore] is a core class that allows fetching a list of
/// enriched activities (flat) while exposing UI builders.
/// Make sure to have a [FeedProvider] ancestor in order to provide the
/// information about the activities.
/// Usually what you want is the convenient [FlatFeedCore] that already
/// has the default parameters defined for you
/// suitable to most use cases. But if you need a
/// more advanced use case use [GenericFlatFeedCore] instead
///
/// ## Usage
///
/// ```dart
/// class FlatActivityListPage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: FlatFeedCore(
///         onErrorWidget: Center(
///             child: Text('An error has occurred'),
///         ),
///         onEmptyWidget: Center(
///             child: Text('Nothing here...'),
///         ),
///         onProgressWidget: Center(
///             child: CircularProgressIndicator(),
///         ),
///         feedBuilder: (context, activities, idx) {
///           return YourActivityWidget(activity: activities[idx]);
///         }
///       ),
///     );
///   }
/// }
/// ```
/// {@endtemplate}
typedef FlatFeedCore = GenericFlatFeedCore<User, String, String, String>;

///Convenient typedef for [GenericReactionListCore] with default parameters
///
/// {@template reactionListCore}
/// [ReactionListCore] is a core class that allows fetching a list of
/// reactions while exposing UI builders.
///
/// ## Usage
///
/// ```dart
/// class FlatActivityListPage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: ReactionListCore(
///         onErrorWidget: Center(
///             child: Text('An error has occurred'),
///         ),
///         onEmptyWidget: Center(
///             child: Text('Nothing here...'),
///         ),
///         onProgressWidget: Center(
///             child: CircularProgressIndicator(),
///         ),
///         feedBuilder: (context, reactions, idx) {
///           return YourReactionWidget(reaction: reactions[idx]);
///         }
///       ),
///     );
///   }
/// }
/// ```
///
/// Make sure to have a [FeedProvider] ancestor in order to provide the
/// information about the reactions.
///
/// Usually what you want is the convenient [ReactionListCore] that already
/// has the default parameters defined for you
/// suitable to most use cases. But if you need a
/// more advanced use case use [GenericReactionListCore] instead
/// {@endtemplate}
typedef ReactionListCore
    = GenericReactionListCore<User, String, String, String>;

/// Convenient typedef for [GenericFeedProvider] with default parameters
///
/// {@template feedProvider}
/// Inherited widget providing the [FeedBloc] to the widget tree
/// Usually what you need is the convenient [FeedProvider] that already
/// has the default parameters defined for you
/// suitable to most usecases. But if you need a
/// more advanced use case use [GenericFeedProvider] instead
/// {@endtemplate}
typedef FeedProvider = GenericFeedProvider<User, String, String, String>;

/// Convenient typedef for [GenericFeedBloc] with default parameters
///
/// {@template feedBloc}
/// Widget dedicated to the state management of an app's Stream feed
/// [FeedBloc] is used to manage a set of operations
/// associated with [EnrichedActivity]s and [Reaction]s.
///
/// [FeedBloc] can be access at anytime by using the factory [of] method
/// using Flutter's [BuildContext].
///
/// Usually what you want is the convenient [FeedBloc] that already
/// has the default parameters defined for you
/// suitable to most use cases. But if you need a
/// more advanced use case use [GenericFeedBloc] instead
///
/// ## Usage
/// - query the activities stream. Checkout our core widget [FlatFeedCore]
/// to display activities
/// - query the reactions stream (like, retweet, claps). Checkout our core widget
///  [ReactionListCore] for displaying reactions
/// - add activities (a tweet for example) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onAddActivity()
/// ```
/// - remove activities (delete a tweet) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onRemoveActivity()
/// ```
/// - add reactions (comment under a tweet) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onAddReaction()
/// ```
/// - remove reacitons (delete a comment under a tweet) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onRemoveReaction()
/// ```
/// - add child reactions (like to a comment) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onAddReaction()
/// ```
/// - remove child reacitons (unlike a comment) in a reactive way
/// ```dart
/// FeedProvider.of(context).bloc.onRemoveChildReaction()
/// ```
/// {@endtemplate}
typedef FeedBloc = GenericFeedBloc<User, String, String, String>;
