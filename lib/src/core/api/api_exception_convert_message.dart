import 'api_exception.dart';

class ApiExceptionHelper {
  static ApiException convertMessage(String message) {
    switch (message) {
      case 'TENANT_ALREADY_EXISTS':
        return AlreadyExistsException('Tenant is already exists');
      case 'TEMPLATE_ALREADY_EXISTS':
        return AlreadyExistsException('Template is already exists');
      case 'BRANCH_ALREADY_EXISTS':
        return AlreadyExistsException('Branch is already exists');
      case 'TENANT_ALREADY_DEACTIVATED':
        return AlreadyDeactivatedException('Tenant is already deactivated');
      case 'BRANCH_ALREADY_DEACTIVATED':
        return AlreadyDeactivatedException('Branch is already deactivated');
        case 'ACCOUNT_INCORRECT' :
        return AccountIncorrect('Account is incorrect');
      default:
        return ApiException(message);
    }
  }
}
