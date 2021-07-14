function (user, context, callback) {

  user.awsRole = 'arn:aws:iam::${account_id}:role/autho_ro,arn:aws:iam::${account_id}:saml-provider/auth0';
  user.awsRoleSession = user.name;

  context.samlConfiguration.mappings = {
    'https://aws.amazon.com/SAML/Attributes/Role': 'awsRole',
    'https://aws.amazon.com/SAML/Attributes/RoleSessionName': 'awsRoleSession'
  };

  callback(null, user, context);

}