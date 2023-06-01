from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    ld = LaunchDescription()

    turtle_1=Node(
        package='turtlesim',
        namespace='turtlesim1',
        executable='turtlesim_node',
        name='sim'
    )

    turtle_2=Node(
        package='turtlesim',
        namespace='turtlesim2',
        executable='turtlesim_node',
        name='sim'
    )
    mimic=Node(
        package='turtlesim',
        executable='mimic',
        name='mimic',
        remappings=[
            ('/input/pose', '/turtlesim1/turtle1/pose'),
            ('/output/cmd_vel', '/turtlesim2/turtle1/cmd_vel'),
        ]
    )

    ld.add_action(turtle_1)
    ld.add_action(turtle_2)
    ld.add_action(mimic)

    return ld