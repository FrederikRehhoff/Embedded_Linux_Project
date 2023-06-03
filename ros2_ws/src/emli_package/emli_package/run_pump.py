import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import subprocess
import time

class run_pump_node(Node):

    def __init__(self):
        super().__init__('Activate_Pump')
        self.pump_publisher = self.create_publisher(String, "run_pump", 10)
        self.pump_subscription = self.create_subscription(String, 'run_pump', self.pump_listener_callback, 10)
        self.alarm_subscription = self.create_subscription(String, 'Sensor_Info', self.alarm_listener_callback, 10)
        self.overflow_alarm = 1
        self.water_alarm = 0


    def pump_listener_callback(self, msg: String):
        pump_bool = msg.data
        if pump_bool == "True":
            arg = '1 ' + str(self.overflow_alarm) + ' ' + str(self.water_alarm)
            command = '~/Embedded_Linux_Project/Bash_Files/Pump_Logic.sh '
            input = command + arg
            did_pump_run = str(subprocess.run([input],shell=True, capture_output=True, text=True).stdout)
            time.sleep(1)
        new_msg = String()
        new_msg.data = "False"
        self.pump_publisher.publish(new_msg)

    def alarm_listener_callback(self, msg: String):
        if msg is None or msg.data == "":
            # Handle the case when msg is empty or None
            self.overflow_alarm = 1
            self.water_alarm = 0
        else:
            sensor_dat = msg.data
            sensor = [int(num) for num in sensor_dat.split(",")]
            self.overflow_alarm = sensor[0]
            self.water_alarm = sensor[1]

def main(args=None):
    rclpy.init(args=args)
    node = run_pump_node()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
