import module namespace j = "http://www.jsoniq.org/functions";

let $json := j:parse-json('{ "foo" : "bar" }')
let $keys := j:keys($json)
return $json($keys[1]),

j:members(j:parse-json('[ "foo" ]'))
