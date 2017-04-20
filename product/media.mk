# Media config
MEDIA_XML_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_XML_CONFIGS),$(f):system/etc/$(notdir $(f)))

PRODUCT_PACKAGES += \
	media_codecs.xml \
	media_codecs_performance.xml