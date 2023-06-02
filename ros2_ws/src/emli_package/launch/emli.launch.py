from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    ld = LaunchDescription()

    Random_pub=Node(
        package='emli_package',
        namespace='Initial_publisher',
        executable='random_talker',
        name='talker'
    )

    Random_sub=Node(
        package='emli_package',
        namespace='Initial_subscriber',
        executable='random_listener',
        name='listener'
    )

    ld.add_action(Random_pub)
    ld.add_action(Random_sub)

    return ld