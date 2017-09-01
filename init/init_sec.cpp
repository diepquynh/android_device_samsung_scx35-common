/*
   Copyright (c) 2016, Android Open Source Project. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "android-base/properties.h"
#include "property_service.h"
#include "log.h"
#include "vendor_init.h"

using namespace android::base;

std::string bootloader;
std::string device;

enum device_variant {
	G360H,
	G360HU,
	G361H,
	G531BT,
	G531H,
};

device_variant match(std::string bl)
{
        if (bl.find("G360H") != std::string::npos) {
                return G360H;
        } else if (bl.find("G360HU") != std::string::npos) {
                return G360HU;
        } else if (bl.find("G361H") != std::string::npos) {
                return G361H;
        } else if (bl.find("G531BT") != std::string::npos) {
                return G531BT;
        } else {
                return G531H;
        }
}

device_variant find_device_variant() {
	bootloader = GetProperty("ro.bootloader", "");
	return match(bootloader);
}

void vendor_load_properties()
{

	device_variant variant = find_device_variant();

	switch (variant) {
		case G360H:
		        /* core33gdd */
		        SetProperty("ro.product.model", "SM-G360H");
        		SetProperty("ro.product.device", "core33g");
			break;
		case G360HU:
		        /* core33gdc */
		        SetProperty("ro.product.model", "SM-G360HU");
		        SetProperty("ro.product.device", "core33g");
			break;
		case G361H:
		        /* coreprimeve3gxx */
		        SetProperty("ro.product.model", "SM-G361H");
		        SetProperty("ro.product.device", "coreprimeve3g");
			break;
		case G531BT:
		        /* grandprimeve3gdtv */
        		SetProperty("ro.product.model", "SM-G531BT");
		        SetProperty("ro.product.device", "grandprimeve3gdtv");
			break;
		case G531H:
		default:
		        /* grandprimeve3gxx */
		        SetProperty("ro.product.model", "SM-G531H");
		        SetProperty("ro.product.device", "grandprimeve3g");
			break;
	}

	/*
	 * Now is the fun part: Single SIM variant
	 */

	FILE* file;
	char* simslot_count_path = "/proc/simslot_count";
	char simslot_count[PROP_NAME_MAX] = "\0"; // Terminate NULL character

	file = fopen(simslot_count_path, "r");
	if (file != NULL) {
		simslot_count[0] = fgetc(file);
		SetProperty("ro.multisim.simslotcount", simslot_count);

		if(!strcmp(simslot_count, "0") || !strcmp(simslot_count, "1")) {
			// If only one SIM slot is detected, treat as single-SIM device
			SetProperty("persist.dsds.enabled", "false");
			SetProperty("persist.radio.multisim.config", "none");
		} else {
			// Dual-SIM device
			SetProperty("persist.dsds.enabled", "true");
			SetProperty("persist.radio.multisim.config", "dsds");
		}
		// Close the file after using it
		fclose(file);
	} else {
		// If can't open /proc/simslot_count, print an error!
		PLOG(ERROR) << "Could not open " << simslot_count_path << std::endl;
	}
}
