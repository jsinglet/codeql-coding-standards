//** THIS FILE IS AUTOGENERATED, DO NOT MODIFY DIRECTLY.  **/
import cpp
import RuleMetadata
import codingstandards.cpp.exclusions.RuleMetadata

newtype Strings2Query = TToCharacterHandlingFunctionsRepresentableAsUCharQuery()

predicate isStrings2QueryMetadata(Query query, string queryId, string ruleId, string category) {
  query =
    // `Query` instance for the `toCharacterHandlingFunctionsRepresentableAsUChar` query
    Strings2Package::toCharacterHandlingFunctionsRepresentableAsUCharQuery() and
  queryId =
    // `@id` for the `toCharacterHandlingFunctionsRepresentableAsUChar` query
    "c/cert/to-character-handling-functions-representable-as-u-char" and
  ruleId = "STR37-C" and
  category = "rule"
}

module Strings2Package {
  Query toCharacterHandlingFunctionsRepresentableAsUCharQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `toCharacterHandlingFunctionsRepresentableAsUChar` query
      TQueryC(TStrings2PackageQuery(TToCharacterHandlingFunctionsRepresentableAsUCharQuery()))
  }
}
