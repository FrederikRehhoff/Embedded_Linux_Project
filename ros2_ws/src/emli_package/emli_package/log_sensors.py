import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import subprocess
import time

class log_sensor(Node):

    def __init__(self):
        super().__init__('Log_Info')
        self.pump_subscription = self.create_subscription(String, 'run_pump', self.pump_listener_callback, 10)
        self.alarm_subscription = self.create_subscription(String, 'Sensor_Info', self.sensor_listener_callback, 10)
        self.pump = 0


    def pump_listener_callback(self, msg: String):
        pump_bool = msg.data
        #self.get_logger().info("run_pump were recived in log_sensor: " + msg.data)
        if pump_bool == "True":
            self.pump = 1

    def sensor_listener_callback(self, msg: String):
        if msg is None or msg.data == "":
            # Handle the case when msg is empty or None
            return
        sensor_dat = msg.data
        sensor = [int(num) for num in sensor_dat.split(",")]
        arg = str(sensor[2]) + ' ' + str(sensor[3]) + ' ' + str(self.pump) + ' ' + str(sensor[1]) + ' ' + str(sensor[0])
        self.get_logger().info("log sensor recived these arguments: " + arg)
        command = '~/Embedded_Linux_Project/Bash_Files/Logging/Logger.sh '
        input = command + arg
        did_pump_run = str(subprocess.run([input],shell=True, capture_output=True, text=True).stdout)
        if self.pump == 1:
            self.pump = 0







def main(args=None):
    rclpy.init(args=args)
    node = log_sensor()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
