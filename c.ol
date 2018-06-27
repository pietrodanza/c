include "console.iol"
include "locations.iol"

interface cInterface {
RequestResponse:
  identification(string)(string)
OneWay:
}

interface dInterface {
RequestResponse: identification(string)(string)
OneWay:
}

execution{concurrent}

inputPort cIn {
Location: JDEP_LOCATION_c_cIn
Protocol: sodep
Interfaces: cInterface
}

outputPort dOut {
Location: JDEP_LOCATION_c_dOut
Protocol: sodep
Interfaces: dInterface
}

main
{

  [identification(request)(response){
    request = request + " C ";
    identification@dOut(request)(response);
    println@Console( request )()
  }]
}
