import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import subprocess


class ButtonPubNode(Node):

    def __init__(self):
        super().__init__('Button_Pub')
        self.publisher_ = self.create_publisher(String, 'Button_Info', 10)
        timer_period = 2.0  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)

    def timer_callback(self):
        msg = String()
        msg.data = str(subprocess.run(['~/Embedded_Linux_Project/Bash_Files/Button_Reader.sh'], shell=True, capture_output=True, text=True).stdout)
        #self.get_logger().info("Publishing Button Data: " + msg.data)
        self.publisher_.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = ButtonPubNode()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
