import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import subprocess


class T12_Pump_Node(Node):

    def __init__(self):
        super().__init__('T12_Pump')
        self.publisher = self.create_publisher(String, 'run_pump', 10)
        timer_period = 12 * 60 * 60  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)

    def timer_callback(self):
        msg = String()
        msg.data = "True"
        self.get_logger().info("T12_Pump ran: ")
        self.publisher.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = T12_Pump_Node()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
