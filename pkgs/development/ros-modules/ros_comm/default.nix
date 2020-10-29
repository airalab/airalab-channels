{ stdenv
, mkRosPackage
, fetchFromGitHub
, catkin
, message_filters
, ros
, rosbag
, rosconsole
, roscpp
, rosgraph
, rosgraph_msgs
, roslaunch
, rosmaster
, rosmsg
, rosnode
, rosout
, rosparam
, rospy
, rosservice
, rostest
, rostopic
, roswtf
, std_srvs
, topic_tools
, xmlrpcpp
}:

let
  pname = "ros_comm";
  version = "1.14.4";
  rosdistro = "melodic";

in mkRosPackage {
  name = "${pname}-${version}";

  src = fetchFromGitHub {
    owner = "ros-gbp";
    repo = "ros_comm-release";
    rev = "release/${rosdistro}/${pname}/${version}-0";
    sha256 = "0y6g50cyzx1zwr8s9ca92vn95bbchx7mmdgm5gb1mlb9wgqchzcl";
  };

  propagatedBuildInputs =
  [ catkin message_filters ros rosbag rosconsole roscpp
    rosgraph rosgraph_msgs roslaunch rosmaster rosmsg rosnode
    rosout rosparam rospy rosservice rostest rostopic roswtf
    std_srvs topic_tools xmlrpcpp ];

  meta = with stdenv.lib; {
    description = "ROS communications-related packages, including core client libraries";
    homepage = http://wiki.ros.org/ros_comm;
    license = licenses.bsd3;
    maintainers = [ maintainers.akru ];
  };
}
