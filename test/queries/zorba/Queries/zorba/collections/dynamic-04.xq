import module namespace ddl = "http://zorba.io/modules/store/dynamic/collections/ddl";
import module namespace dml = "http://zorba.io/modules/store/dynamic/collections/dml";

ddl:create(xs:QName("ddl:test2"),(<center1/>,<oldlast/>));

dml:insert-before(xs:QName("ddl:test2"), dml:collection(xs:QName("ddl:test2"))[2], (<c1/>,<c2/>));
dml:collection(xs:QName("ddl:test2"))/self::node()
