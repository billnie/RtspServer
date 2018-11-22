
LOCAL_PATH := $(call my-dir)

EXAMOBJ = example/main.cpp

OBJS := src/AACSource.cpp \
		src/G711ASource.cpp \
		src/H264Parser.cpp  \
		src/H264Source.cpp  \
		src/H265Source.cpp  \
		src/MediaSession.cpp  \
		src/RtpConnection.cpp  \
		src/RtspConnection.cpp  \
		src/RtspMessage.cpp  \
		src/RtspPusher.cpp  \
		src/RtspServer.cpp

OBJS += src/xop/Acceptor.cpp \
		src/xop/BufferWriter.cpp  \
		src/xop/EventLoop.cpp  \
		src/xop/MemoryManager.cpp  \
		src/xop/Pipe.cpp   \
		src/xop/SocketUtil.cpp  \
		src/xop/TcpConnection.cpp  \
		src/xop/TcpSocket.cpp  \
		src/xop/Timestamp.cpp \
		src/xop/BufferReader.cpp \
		src/xop/EpollTaskScheduler.cpp \
		src/xop/Logger.cpp \
		src/xop/NetInterface.cpp \
		src/xop/SelectTaskScheduler.cpp  \
		src/xop/TcpClient.cpp \
		src/xop/TcpServer.cpp \
		src/xop/Timer.cpp \
		src/xop/xop.cpp

INCLUDES += $(LOCAL_PATH)/src
INCLUDES += $(LOCAL_PATH)/src/xop

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(EXAMOBJ)
LOCAL_MODULE = cexam
LOCAL_MODULE_TAGS = debug	
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_C_INCLUDES := $(INCLUDES)
LOCAL_SRC_FILES := $(OBJS)
LOCAL_CPPFLAGS = -std=c++11
LOCAL_MODULE = librtsp
LOCAL_MODULE_TAGS:= optional
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_C_INCLUDES := $(INCLUDES)
LOCAL_SRC_FILES := $(OBJS)

LOCAL_CPPFLAGS = -std=c++11
LOCAL_MODULE = librtsp
LOCAL_MODULE_TAGS:= optional
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_SRC_FILES := example/rtsp_pusher.cpp
LOCAL_C_INCLUDES := $(INCLUDES)
LOCAL_MODULE := rtsp_pusher
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := librtsp
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := example/rtsp_server.cpp
LOCAL_C_INCLUDES := $(INCLUDES)
LOCAL_MODULE := rtsp_server
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := librtsp
include $(BUILD_EXECUTABLE)