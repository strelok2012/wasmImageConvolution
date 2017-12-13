struct ColorRGB {
	unsigned char r;
	unsigned char g;
	unsigned char b;
};

unsigned char clamp(double a){
	if(a >= 255.0){
		return 255;
	}
	else if(a <= 0.0){
		return 0;
	}
	return (unsigned char)a;
}


struct ColorRGB * filterImage(struct ColorRGB pixels[],struct ColorRGB result[],int w, int h, int filterWidth, int filterHeight, double core[], double factor, double bias){
	for(int x = 0; x < w; x++){
		  for(int y = 0; y < h; y++)
		  {
			double red = 0.0, green = 0.0, blue = 0.0;
			for(int filterY = 0; filterY < filterHeight; filterY++){
				for(int filterX = 0; filterX < filterWidth; filterX++)
				{
				  int imageX = (x - filterWidth / 2 + filterX + w) % w;
				  int imageY = (y - filterHeight / 2 + filterY + h) % h;
				  red += pixels[imageY * w + imageX].r * core[filterY*filterWidth+filterX];
				  green += pixels[imageY * w + imageX].g * core[filterY*filterWidth+filterX];
				  blue += pixels[imageY * w + imageX].b * core[filterY*filterWidth+filterX];
				}
			  }
			  
			result[y * w + x].r = clamp(factor * red + bias);
			result[y * w + x].g = clamp(factor * green + bias);
			result[y * w + x].b = clamp(factor * blue + bias);
			  
		}	
	}
	 
	 return result;
}

