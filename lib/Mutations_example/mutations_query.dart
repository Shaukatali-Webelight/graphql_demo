

class MutationQueryClass{

String addUser = """
mutation createUser(\$input: CreateUserInput!) {
  createUser(input: \$input) {
    id
    name
    username
    email
  }
}
""";

} 