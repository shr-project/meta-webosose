# http://gecko.lge.com:8000/Errors/Details/832856
# python3-kivy/2.3.0/git/kivy/graphics/cgl_backend/cgl_gl.c:4568:52: error: assignment to 'void (*)(GLuint,  GLsizei,  const GLchar **, const GLint *)' {aka 'void (*)(unsigned int,  int,  const char **, const int *)'} from incompatible pointer type 'void (*)(GLuint,  GLsizei,  const GLchar * const*, const GLint *)' {aka 'void (*)(unsigned int,  int,  const char * const*, const int *)'} [-Wincompatible-pointer-types]
# python3-kivy/2.3.0/git/kivy/core/window/_window_sdl2.c:8781:23: error: passing argument 1 of 'SDL_SetEventFilter' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
