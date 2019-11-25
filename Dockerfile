FROM python

RUN apt-get update && apt-get install -y cmake

# Install Emscripten
RUN cd / && \
    git clone --depth 1 https://github.com/emscripten-core/emsdk.git && \
    cd emsdk && \
    ./emsdk install latest && \
    ./emsdk activate latest

# Clone OpenCV.js
RUN git clone --depth 1 https://github.com/opencv/opencv.git

VOLUME ["/build"]

# Build OpenCV.

WORKDIR /opencv
ENTRYPOINT [ "python", "./platforms/js/build_js.py" ]

CMD [ "/build", "--build_wasm", "--build_test", "--emscripten_dir", "/emsdk/upstream/emscripten", "--opencv_dir", "/opencv" ]
