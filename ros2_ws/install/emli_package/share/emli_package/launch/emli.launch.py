from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    ld = LaunchDescription()
    '''
    Random_pub=Node(
        package='emli_package',
	#namespace='init_random',
        executable='random_talker',
        name='talker'
    )

    Random_sub=Node(
        package='emli_package',
	#namespace='init_random',
        executable='random_listener',
        name='listener'
    )

    ld.add_action(Random_pub)
    ld.add_action(Random_sub)
    '''

    L_Sensor_Pub=Node(
        package='emli_package',
	#namespace='init_random',
        executable='Sensor_Pub',
        name='read_sensor'

    )
    ld.add_action(L_Sensor_Pub)	
    return ld
