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
        executable='Sensor_Pub',
        name='read_sensor'
    )

    L_Button_Pump=Node(
        package='emli_package',
        executable='Button_Pump',
        name='Pump_With_Button'
    )

    L_Log_Info=Node(
        package='emli_package',
        executable='Log_Info',
        name='Sensor_Log'
    )

    L_Moisture_Pump=Node(
        package='emli_package',
        executable='Moisture_Pump',
        name='Pump_With_Moisture'
    )

    L_Activate_Pump=Node(
        package='emli_package',
        executable='Activate_Pump',
        name='Run_Pump'
    )

    L_Set_LEDs=Node(
        package='emli_package',
        executable='Set_LEDs',
        name='Set_LED'
    )


    L_Button_Pub=Node(
        package='emli_package',
        executable='Button_Pub',
        name='Button_Count'
    )

    L_T12_Pump=Node(
        package='emli_package',
        executable='T12_Pump',
        name='T12_Pump'
    )


    ld.add_action(L_Sensor_Pub)
    ld.add_action(L_Button_Pump)
    ld.add_action(L_Log_Info)
    ld.add_action(L_Moisture_Pump)
    ld.add_action(L_Activate_Pump)
    ld.add_action(L_Set_LEDs)
    ld.add_action(L_Button_Pub)
    ld.add_action(L_T12_Pump)
    return ld
