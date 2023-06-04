import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import subprocess
import datetime

class run_pump_moisture_node(Node):

    def __init__(self):
        super().__init__('Moisture_Pump')
        self.pump_publisher = self.create_publisher(String, "run_pump", 10)
        self.button_subscription = self.create_subscription(String, 'Sensor_Info', self.sensor_listener_callback, 10)
        #self.alarm_subscription = self.create_subscription(String, 'Sensor_Info', self.alarm_listener_callback, 10)
        self.one_hour_later = datetime.datetime.now() - datetime.timedelta(hours=1)

    def sensor_listener_callback(self, msg: String):
        if msg is None or msg.data == "": 
            return
        sensor_dat = msg.data
        sensor = [int(num) for num in sensor_dat.split(",")]
        if sensor[2] <= 30 and self.one_hour_later <= datetime.datetime.now():
            new_msg = String()
            new_msg.data = "True"
            self.get_logger().info("Moisture ran: ")
            self.pump_publisher.publish(new_msg)
            self.one_hour_later = datetime.datetime.now() + datetime.timedelta(hours=1)


def main(args=None):
    rclpy.init(args=args)
    node = run_pump_moisture_node()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
