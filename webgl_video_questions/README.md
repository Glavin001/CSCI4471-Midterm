# WebGL Video Questions

> 1) What is meant by `in`, `out`, `uniform` variable “types” in OpenGL programming?

- `in` - A parameter declared as `in` means that the value given to that parameter will be copied into the parameter when the function is called. The function may then modify that parameter as they see fit, but those changes will not affect the calling code. `in` is the default qualifier if no qualifier is specified.

- `out` - A parameter declared as `out` will not have its value initialized by the caller. The function will modify the parameter, and after the function's execution is complete, the value of the parameter will be copied out into the variable that the user specified when calling the function. Note that the initial value of the parameter at the start of the function being called is undefined, just as if one had simply created a local variable.

- `inout` - The `inout` declaration combines both, `in` and `out`. The parameter's value will be initialized by the value supplied by the user, and its final value will be output

- `uniform` - Shader-constant variable from application. Uniform variables are read-only and are shared among all processed vertices. They are used to communicate with vertex or fragment shader. They do not change from one execution of a shader program to the next within a particular rendering call.

References:
- https://youtu.be/6-9XFm7XAT8?t=1h13m50s
- https://www.opengl.org/wiki/Uniform_(GLSL)
- https://www.opengl.org/wiki/Type_Qualifier_(GLSL)
- https://www.opengl.org/sdk/docs/tutorials/ClockworkCoders/uniform.php
- https://www.opengl.org/wiki/Core_Language_%28GLSL%29#Parameters

> 2) In the rotating cube example, what data/parameters is passed from the main display routine (which is running in the CPU) to the GPU? How would this scale if the model is an object with millions of vertices instead of just a cube?

Inside of the `display` routine, the [`glDrawArrays`](https://www.opengl.org/sdk/docs/man3/xhtml/glDrawArrays.xml) function takes parameters `mode` (a primitive type), `first` (start index), and `count` (index count) and passes that from the CPU to the GPU. The GPU has already been sent the vertices to be buffered until they are drawn. A single call with a large number of vertices is more efficient for the GPU than breaking it into smaller draw calls because then the GPU does not need to repeatedly lock the screen, draw, and then release between each draw call. Instead it can batch these drawings together.

References:
- https://youtu.be/6-9XFm7XAT8?t=1h37m1s
- http://stackoverflow.com/a/19102301/2578205
- https://www.opengl.org/sdk/docs/man3/xhtml/glDrawArrays.xml
- http://gamedev.stackexchange.com/questions/53757/drawing-more-that-one-quad-with-only-one-gldrawarray-call
- http://stackoverflow.com/a/12037702/2578205
- http://gamedev.stackexchange.com/questions/47550/why-is-it-faster-to-draw-lots-of-small-arrays-than-one-big-array
- http://stackoverflow.com/questions/21942231/multiple-gldrawarrays-calls-vs-buffer-updates-performance


> 3) When doing lighting/illumination computations, what do they say is the key trade-off between using the vertex shader versus using the fragment shader?

Using the fragment shader you would compute the colour per fragment (every pixel in screen), and get much finer results, but a performance penalty because there is a whole lot more fragments in the screen in comparison to the number of triangles that go with it.

References:
- https://youtu.be/6-9XFm7XAT8?t=2h22m16s
