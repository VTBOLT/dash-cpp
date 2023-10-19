#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <iostream>
#include <chrono>
#include <thread>

#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>

#include <linux/can.h>
#include <linux/can/raw.h>


using namespace std::chrono_literals;

int main(int argc, char** argv)
{
	int s, i;
	int nbytes;
	struct sockaddr_can addr;
	struct ifreq ifr;
	struct can_frame frame;

	printf("CAN Sockets Receive Demo\r\n");

	// Create a new socket of type CAN using data CAN_RAW
	if ((s = socket(PF_CAN, SOCK_RAW, CAN_RAW)) < 0) {
		perror("Socket");
		return 1;
	}

	// Setting the name of the physical can interface (ip a)
	strcpy(ifr.ifr_name, "slcan0");
	// Converts if name to actual interface index
	ioctl(s, SIOCGIFINDEX, &ifr);

	// Reserve memory for CAN frames
	memset(&addr, 0, sizeof(addr));
	addr.can_family = AF_CAN;   // Use CAN sockets specifically
	addr.can_ifindex = ifr.ifr_ifindex;



	// Connects to the socket and locks it
	if (bind(s, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
		perror("Bind");
		return 1;
	}

	while (true) {
		// Actually reads from the socket
		nbytes = read(s, &frame, sizeof(struct can_frame));

		// Make sure it exists
		if (nbytes < 0) {
			perror("Read");
			return 1;
		}

		// Print the can ID and len of data
		printf("0x%03X [%d] ", frame.can_id, frame.can_dlc);

		// Print the data in the CAN message
		for (i = 0; i < frame.can_dlc; i++)
			printf("%02X ", frame.data[i]);

		printf("\r\n");
	}



	// Close socket
	if (close(s) < 0) {
		perror("Close");
		return 1;
	}

	return 0;
}