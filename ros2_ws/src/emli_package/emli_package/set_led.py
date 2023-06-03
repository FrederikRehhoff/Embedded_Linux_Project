import rclpy
from rclpy.node import Node

from std_msgs.msg import String
import subprocess

class set_leds_node(Node):

    def __init__(self):
        super().__init__('Set_LEDs')
        self.alarm_subscription = self.create_subscription(String, 'Sensor_Info', self.sensor_listener_callback, 10)


    def sensor_listener_callback(self, msg: String):
        if msg is None or msg.data == "":
            return
        sensor_dat = msg.data
        sensor = [int(num) for num in sensor_dat.split(",")]
        arg = str(sensor[0]) + ' ' + str(sensor[1]) + ' ' + str(sensor[2])
        command = '~/Embedded_Linux_Project/Bash_Files/Remote_Control.sh '
        input = command + arg
        did_pump_run = str(subprocess.run([input],shell=True, capture_output=True, text=True).stdout)

def main(args=None):
    rclpy.init(args=args)
    node = set_leds_node()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
