

class MutationQueryClass{

String addUser = r"""
mutation CreateUser($input: CreateUserInput!) {
  createUser(input: $input) {
    email
    id
    name
    username
  }
}
""";

} 