import os
from glob import glob
from setuptools import setup

package_name = 'emli_package'


setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        # ... Other data files
        # Include all launch files.
        (os.path.join('share', package_name, 'launch'), glob(os.path.join('launch', '*launch.[pxy][yma]*')))
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='pi',
    maintainer_email='Andersjohannsen@outlook.com',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'test_node = emli_package.test_node:main',
            'random_talker = emli_package.publisher_member_function:main',
            'random_listener = emli_package.subscriber_member_function:main'
        ],
    },
)
