import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import subprocess


class Node1(Node):

    def __init__(self):
        super().__init__('Random_publisher')
        self.publisher_ = self.create_publisher(String, 'Random_number', 10)
        timer_period = 1.0  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)

    def timer_callback(self):
        msg = String()
        msg.data = str(subprocess.run(['~/Dev/Embedded_Linux_Project/Bash_Files/RandNum.sh'], shell=True, capture_output=True, text=True).stdout)
        self.get_logger().info("Publishing: " + msg.data)
        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = Node1()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
