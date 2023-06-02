import rclpy
from rclpy.node import Node

from std_msgs.msg import String


class Node2(Node):

    def __init__(self):
        super().__init__('Random_subscriber')
        self.publisher = self.create_publisher(String, "test_topic", 10)
        self.subscription = self.create_subscription(String, 'Random_number', self.listener_callback, 10)

    def listener_callback(self, msg: String):
        number = msg.data
        new_msg = String()
        new_msg.data = "This is a test topic"
        self.get_logger().info("Recieved: " + number + ", publishing: " + new_msg)
        self.publisher.publish(new_msg)


def main(args=None):
    rclpy.init(args=args)
    node = Node2()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
