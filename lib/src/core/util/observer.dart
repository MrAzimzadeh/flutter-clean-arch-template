import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger.dart';


// bu CLASSIN amacı, bloc'larımızın durumlarını ve değişikliklerini izlemektir. 
class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace  stackTrace) {
    logger.e('=======AppBlocObserver====== $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d(change.currentState);
    logger.d(change.nextState);
    super.onChange(bloc, change);
  }
}
