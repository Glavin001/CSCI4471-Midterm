# WebGL Video Questions

> 1) What is meant by `in`, `out`, `uniform` variable “types” in OpenGL programming?

- `in` - A parameter declared as `in` means that the value given to that parameter will be copied into the parameter when the function is called. The function may then modify that parameter as they see fit, but those changes will not affect the calling code. `in` is the default qualifier if no qualifier is specified.

- `out` - A parameter declared as `out` will not have its value initialized by the caller. The function will modify the parameter, and after the function's execution is complete, the value of the parameter will be copied out into the variable that the user specified when calling the function. Note that the initial value of the parameter at the start of the function being called is undefined, just as if one had simply created a local variable.

- `inout` - The `inout` declaration combines both, `in` and `out`. The parameter's value will be initialized by the value supplied by the user, and its final value will be output

- `uniform` - Uniform variables are read-only and are shared among all processed vertices. They are used to communicate with vertex or fragment shader. They do not change from one execution of a shader program to the next within a particular rendering call.

> 2) In the rotating cube example, what data/parameters is passed from the main display routine (which is running in the CPU) to the GPU? How would this scale if the model is an object with millions of vertices instead of just a cube?


> 3) When doing lighting/illumination computations, what do they say is the key trade-off between using the vertex shader versus using the fragment shader? 

Using the fragment shader you would compute the colour per fragment (every pixel in screen), and get much finer results, but a performance penalty because there is a whole lot more fragments in the screen in comparison to the number of triangles that go with it.
