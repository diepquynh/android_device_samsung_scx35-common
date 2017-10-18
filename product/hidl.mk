# HIDL (HAL Interface Definition Language)
PRODUCT_PACKAGES += \
	android.hardware.camera.provider@2.4-impl \
	camera.device@3.2-impl \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.mapper@2.0-impl \
	android.hardware.gnss@1.0-impl \
	android.system.net.netd@1.0 \
	android.hardware.power@1.0-impl \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.broadcastradio@1.0-impl \
	android.hardware.radio@1.0-impl \
	android.hardware.sensors@1.0-impl \
	android.hardware.usb@1.0-service \
	android.hardware.vibrator@1.0-impl \
	android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/manifest.xml:system/vendor/manifest.xml