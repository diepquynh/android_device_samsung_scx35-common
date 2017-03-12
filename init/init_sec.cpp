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

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    std::string bootloader = property_get("ro.bootloader");

    if (bootloader.find("G360H") != std::string::npos) {
        /* core33gdd */
        property_set("ro.product.model", "SM-G360H");
        property_set("ro.product.device", "core33g");
    } else if (bootloader.find("G360HU") != std::string::npos) {
        /* core33gdc */
        property_set("ro.product.model", "SM-G360HU");
        property_set("ro.product.device", "core33g");
    } else if (bootloader.find("G361H") != std::string::npos) {
        /* coreprimeve3gxx */
        property_set("ro.product.model", "SM-G361H");
        property_set("ro.product.device", "coreprimeve3g");
    } else if (bootloader.find("G531BT") != std::string::npos) {
        /* grandprimeve3gdtv */
        property_set("ro.product.model", "SM-G531BT");
        property_set("ro.product.device", "grandprimeve3gdtv");
    } else {
        /* grandprimeve3gxx */
        property_set("ro.product.model", "SM-G531H");
        property_set("ro.product.device", "grandprimeve3g");
    }

    std::string device = property_get("ro.product.device");
    ERROR("Found bootloader id %s setting build properties for %s device\n", bootloader.c_str(), device.c_str());
}
