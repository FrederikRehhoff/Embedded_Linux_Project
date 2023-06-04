import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import subprocess
import time

class run_pump_button_node(Node):

    def __init__(self):
        super().__init__('Button_Pump')
        self.pump_publisher = self.create_publisher(String, "run_pump", 10)
        self.button_subscription = self.create_subscription(String, 'Button_Info', self.button_listener_callback, 10)
        #self.alarm_subscription = self.create_subscription(String, 'Sensor_Info', self.alarm_listener_callback, 10)



    def button_listener_callback(self, msg: String):
        button = msg.data
        if button == "1":
            new_msg = String()
            new_msg.data = "True"
            self.pump_publisher.publish(new_msg)
        

def main(args=None):
    rclpy.init(args=args)
    node = run_pump_button_node()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
