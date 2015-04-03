# WebGL Video Questions

1) What is meant by `in`, `out`, `uniform` variable “types” in OpenGL programming?

2) In the rotating cube example, what data/parameters is passed from the main display routine (which is running in the CPU) to the GPU? How would this scale if the model is an object with millions of vertices instead of just a cube?


3) When doing lighting/illumination computations, what do they say is the key trade-off between using the vertex shader versus using the fragment shader? 

Using the fragment shader you would compute the colour per fragment (every pixel in screen), and get much finer results, but a performance penalty because there is a whole lot more fragments in the screen in comparison to the number of triangles that go with it.
