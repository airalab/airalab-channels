{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, boost
, cpp_common
, log4cxx
, rosbuild
, rostime
, rosunit
}:

let
  pname = "rosconsole";
  version = "1.13.7";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "${pname}-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0y8avp88hq0h1qi83j9c4jhp92ir8awx82mkgh29r1cp0cyj4nfi";
  };

  propagatedBuildInputs = [ catkin boost cpp_common log4cxx rosbuild rostime rosunit ];

  meta = with stdenv.lib; {
    description = "ROS console output library";
    homepage = http://wiki.ros.org/rosconsole;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
