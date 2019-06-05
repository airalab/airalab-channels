{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, cmake_modules
, geometry_msgs
, image_transport
, interactive_markers
, laser_geometry
, map_msgs
, media_export
, message_filters
, nav_msgs
, pluginlib
, python_qt_binding
, resource_retriever
, rosbag
, rosconsole
, roscpp
, roslib
, rospy
, sensor_msgs
, std_msgs
, std_srvs
, tf
, urdf
, urdfdom_headers
, urdfdom
, visualization_msgs
, pkgconfig
, assimp
, ogre1_9
, libGLU
, qt5Full
, libyamlcpp
, x11
, pythonPackages
}:

let
  pname = "rviz";
  version = "1.13.3";
  rosdistro = "melodic";
  pythonEnv = pythonPackages.python.withPackages (ps: [ ps.sip ps.pyqt5 ]);

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "rviz-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "1cdyylippwirr2ga62zqgyxym95hy66x0mlbqwncl5w9pw3b7ymm";
  };

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ pythonEnv ];

  propagatedBuildInputs = [ catkin cmake_modules geometry_msgs image_transport interactive_markers laser_geometry map_msgs media_export message_filters nav_msgs pluginlib python_qt_binding resource_retriever rosbag rosconsole roscpp roslib rospy sensor_msgs std_msgs std_srvs tf visualization_msgs urdf urdfdom_headers urdfdom assimp ogre1_9 libGLU qt5Full libyamlcpp x11 ];

  meta = with stdenv.lib; {
    description = "3D visualization tool for ROS.";
    homepage = http://wiki.ros.org/rviz;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru maintainers.nschoe  ];
  };
}
