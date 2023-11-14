#include <iostream>
#include <string.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <cmath>
#include <string>
#include <limits>
#include <tuple>
#include <filesystem>
#include <algorithm>
#include <cerrno> // for errno
#include <cstring> // for strerror

#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#endif
using namespace std;

class Vector3 { //vector3D class for saving input
    public:
        Vector3() : x_(), y_(), z_() {} // default constructor
        Vector3(float x, float y, float z) : x_(x), y_(y), z_(z) {
            // this->x_ = x;
            // this->y_ = y;
            // this->z_ = z;
        }//constructor
        float x() const { return x_; }// Accessor functions for x_
        float y() const { return y_; }// Accessor functions for y_
        float z() const { return z_; }// Accessor functions for z_

        bool empty() const { return x_ == 0.0f && y_ == 0.0f && z_ == 0.0f;}

        void set_x(float x) {this->x_ = x; } // set function for x, y, z
        void set_y(float y) {this->y_ = y; }
        void set_z(float z) {this->z_ = z; }

        Vector3 operator+(const Vector3& v) const {
            return Vector3(x_ + v.x_, y_ + v.y_, z_ + v.z_);
        }

        Vector3 operator-(const Vector3& v) const {
            return Vector3(x_ - v.x_, y_ - v.y_, z_ - v.z_);
        }

        Vector3 operator*(float scalar) const {
            return Vector3(x_ * scalar, y_ * scalar, z_ * scalar);
        }

        Vector3 operator/(float scalar) const {
            return Vector3(x_ / scalar, y_ / scalar, z_ / scalar);
        }

        float Dot(const Vector3& v) const {
            return x_ * v.x_ + y_ * v.y_ + z_ * v.z_;
        }

        Vector3 Cross(const Vector3& v) const {
            return Vector3( (y_ * v.z_) - (z_ * v.y_),
                            (z_ * v.x_) - (x_ * v.z_),
                            (x_ * v.y_) - (y_ * v.x_) );
        }

        float Magnitude() const {
            return sqrt(x_ * x_ + y_ * y_ + z_ * z_);
        }

        void Normalize() {
            float magnitude = Magnitude();
            x_ /= magnitude;
            y_ /= magnitude;
            z_ /= magnitude;
        }

        void print() const{
            cout << "(" << x_ << "," << y_ << ", " << z_ << ")" << endl;  
        }
    private:
        float x_, y_, z_;// x_, y_, z_ indicate that they are private variabale
};

class Sphere{ //Sphere class
    public:
        Sphere() : x_(), y_(), z_(), r_(), 
                   odr_(), odg_(), odb_(), 
                   osr_(), osg_(), osb_(), 
                   ka_(), kd_(), ks_(), 
                   n_(), textured_() {} // default constructor
        
        Sphere(float x, float y, float z, float r, 
               float odr, float odg, float odb, 
               float osr, float osg, float osb, 
               float ka, float kd, float ks, 
               float n, bool textured = false) : x_(x), y_(y), z_(z), r_(r), 
                          odr_(odr), odg_(odg), odb_(odb), 
                          osr_(osr), osg_(osg), osb_(osb), 
                          ka_(ka), kd_(kd), ks_(ks), 
                          n_(n), textured_(textured) {} 

        float x() const { return x_; }// Accessor functions for x_
        float y() const { return y_; }// Accessor functions for y_
        float z() const { return z_; }// Accessor functions for z_
        float r() const { return r_; }// Accessor functions for r_
        float odr() const { return odr_; }// Accessor functions for odr_
        float odg() const { return odg_; }// Accessor functions for odg_
        float odb() const { return odb_; }// Accessor functions for odb_
        float osr() const { return osr_; }// Accessor functions for osr_
        float osg() const { return osg_; }// Accessor functions for osg_
        float osb() const { return osb_; }// Accessor functions for osb_
        float ka() const { return ka_; }// Accessor functions for ka_
        float kd() const { return kd_; }// Accessor functions for kd_
        float ks() const { return ks_; }// Accessor functions for ks_
        float n() const { return n_; }// Accessor functions for n_
        bool textured() const {return textured_;}

    private: 
        float x_, y_, z_, r_, odr_, odg_, odb_, osr_, osg_, osb_, ka_, kd_, ks_, n_;
        bool textured_;
};

class Color{
    public:
        Color() : r_(), g_(), b_() {} // default constructor
        Color(float r, float g, float b) : r_(r), g_(g), b_(b){}

        bool empty() const { return r_ == 0.0f && g_ == 0.0f && b_ == 0.0f;}

        float r() const { return r_; }// Accessor functions for r_
        float g() const { return g_; }// Accessor functions for g_
        float b() const { return b_; }// Accessor functions for b_
    private: 
        float r_, g_, b_;
};

class Ray{
    public:
        Ray() : origin_(), raydir_() {}// default constructor
        Ray(const Vector3& origin_, const Vector3& raydir_) : origin_(origin_), raydir_(raydir_) {}

        Vector3 GetOrigin() const { return origin_; }
        Vector3 GetDirection() const { return raydir_; }

    private:
        Vector3 origin_, raydir_;
};

class Light{
    public:
        Light() : x_(), y_(), z_(), w_(), r_(), g_(), b_() {}
        Light(float x, float y, float z, int w, float r, float g, float b) : x_(x), y_(y), z_(z), w_(w), r_(r), g_(g), b_(b) {}

        float x() const { return x_; }// Accessor functions for x_
        float y() const { return y_; }// Accessor functions for y_
        float z() const { return z_; }// Accessor functions for z_
        int w() const { return w_; }
        float r() const { return r_; }// Accessor functions for r_
        float g() const { return g_; }// Accessor functions for g_
        float b() const { return b_; }// Accessor functions for b_

    private:
        float x_, y_, z_, r_, g_, b_;
        int w_;
};

class ShadeColor{
    public:
        ShadeColor() : odr_(), odg_(), odb_(), 
                       osr_(), osg_(), osb_(), 
                       ka_(), kd_(), ks_(), 
                       n_() {}
        
        ShadeColor(float odr, float odg, float odb, 
                   float osr, float osg, float osb, 
                   float ka, float kd, float ks, float n) : odr_(odr), odg_(odg), odb_(odb), 
                                                            osr_(osr), osg_(osg), osb_(osb), 
                                                            ka_(ka), kd_(kd), ks_(ks), 
                                                            n_(n) {}
        
        bool empty() const { return odr_ == 0.0f && odg_ == 0.0f 
                                 && odb_ == 0.0f && osr_ == 0.0f 
                                 && osg_ == 0.0f && osb_ == 0.0f 
                                 && ka_ == 0.0f && kd_ == 0.0f && ks_ == 0.0f
                                 && n_ == 0.0f;}
        
        float odr() const { return odr_; }// Accessor functions for odr_
        float odg() const { return odg_; }// Accessor functions for odg_
        float odb() const { return odb_; }// Accessor functions for odb_
        float osr() const { return osr_; }// Accessor functions for osr_
        float osg() const { return osg_; }// Accessor functions for osg_
        float osb() const { return osb_; }// Accessor functions for osb_
        float ka() const { return ka_; }// Accessor functions for ka_
        float kd() const { return kd_; }// Accessor functions for kd_
        float ks() const { return ks_; }// Accessor functions for ks_
        float n() const { return n_; }// Accessor functions for n_

    private:
        float odr_, odg_, odb_, osr_, osg_, osb_, ka_, kd_, ks_, n_;
};



class Triangle{
    public:
        Triangle() : v1_(), v2_(), v3_(), vn1_(), vn2_(), vn3_(), vt1_(), vt2_(), vt3_(),
                     odr_(), odg_(), odb_(), osr_(), osg_(), osb_(), ka_(), kd_(), ks_(), n_(),
                     smoothshaded(), textured(){}
        
        
        
        
        Triangle(Vector3 v1,Vector3 v2,Vector3 v3,Vector3 vn1, Vector3 vn2, Vector3 vn3, Vector3 vt1, Vector3 vt2, Vector3 vt3,
                 float odr,float odg,float odb,float osr,float osg,float osb,float ka,float kd,float ks,float n,
                 bool smoothshaded = false, bool textured = false):v1_(v1), v2_(v2), v3_(v3),
                                                                   vn1_(vn1), vn2_(vn2), vn3_(vn3),
                                                                   vt1_(vt1), vt2_(vt2), vt3_(vt3),
                                                                   odr_(odr), odg_(odg), odb_(odb), 
                                                                   osr_(osr), osg_(osg), osb_(osb), 
                                                                   ka_(ka), kd_(kd), ks_(ks), n_(n),
                                                                   smoothshaded(smoothshaded), textured(textured) {}
    Vector3 v1() const{return v1_;}
    Vector3 v2() const{return v2_;}
    Vector3 v3() const{return v3_;}
    Vector3 vn1() const{return vn1_;}
    Vector3 vn2() const{return vn2_;}
    Vector3 vn3() const{return vn3_;}
    Vector3 vt1() const{return vt1_;}
    Vector3 vt2() const{return vt2_;}
    Vector3 vt3() const{return vt3_;}
    bool get_smoothshaded() const{return smoothshaded;}
    bool get_textured() const{return textured;}
    float odr() const { return odr_; }
    float odg() const { return odg_; }
    float odb() const { return odb_; }
    float osr() const { return osr_; }
    float osg() const { return osg_; }
    float osb() const { return osb_; }
    float ka() const { return ka_; }
    float kd() const { return kd_; }
    float ks() const { return ks_; }
    float n() const { return n_; }
    bool empty() const {
        return v1_.empty() && v2_.empty() && v3_.empty() &&
               vn1_.empty() && vn2_.empty() && vn3_.empty() &&
               vt1_.empty() && vt2_.empty() && vt3_.empty() &&
               odr_ == 0 && odg_ == 0 && odb_ == 0 &&
               osr_ == 0 && osg_ == 0 && osb_ == 0 &&
               ka_ == 0 && kd_ == 0 && ks_ == 0 && n_ == 0 &&
               !smoothshaded && !textured;
    }

    void set_smoothshaded(bool smoothshade) {this->smoothshaded = smoothshade;}
    void set_textured(bool texture) {this->textured = texture;}
    void print() const{
         cout << "(" << v1_.x() << ", " << v1_.y() << ", " << v1_.z() << ") "
                    << "(" << v2_.x() << ", " << v2_.y() << ", " << v2_.z() << ") "
                    << "(" << v3_.x() << ", " << v3_.y() << ", " << v3_.z() << ") "
                    << "(" << vn1_.x() << ", " << vn1_.y() << ", " << vn1_.z() << ") "
                    << "(" << vn2_.x() << ", " << vn2_.y() << ", " << vn2_.z() << ") "
                    << "(" << vn3_.x() << ", " << vn3_.y() << ", " << vn3_.z() << ") " << endl;
        
        cout        << "(" << vt1_.x() << ", " << vt1_.y() << ", " << vt1_.z() << ") "
                    << "(" << vt2_.x() << ", " << vt2_.y() << ", " << vt2_.z() << ") "
                    << "(" << vt3_.x() << ", " << vt3_.y() << ", " << vt3_.z() << ") " << endl;

         cout       << smoothshaded << " " << textured << endl;
         cout       << odr_ << " " << odg_ << " " << odb_ << " "  << osr_ << " " << osg_<< " " << osb_ << " " << ka_ << " " << kd_ << " " << ks_ << " " << n_ << ")" << endl;
    }

    private:
        Vector3 v1_, v2_, v3_, vn1_, vn2_, vn3_, vt1_, vt2_, vt3_;
        bool smoothshaded, textured;
        float odr_, odg_, odb_, osr_, osg_, osb_, ka_, kd_, ks_, n_;
}; // triangle class

class Texture {
public:
    Texture() : magic_(), width_(), height_(), textures_() {}
    
    Texture(string magic, int width, int height,  const vector<Color>& textures)
        : magic_(magic), width_(width), height_(height), textures_(textures) {}

    string magic() const { return magic_; }
    int width() const { return width_; }
    int height() const { return height_; }
    Color textures_color(int index) const { return textures_.at(index); }
    bool empty() const { return textures_.empty(); }


private:
    string magic_;
    int width_;
    int height_;
    vector<Color> textures_;
};

vector<string> split(const string &s, char delimiter) { // string split for getting the file name and keywords
    vector<string> tokens;
    string token;
    istringstream token_stream(s);
    while (getline(token_stream, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens; // return a vector -> keyword = token.at(0)
}

Color Trace_Ray(Ray ray); // reference Trace_Ray
Color Shade_Ray_sphere(Ray ray, Vector3 intersection, ShadeColor spherecolor, Sphere curr_sphere, int sphereID); // reference Shade_Ray_sphere 
Color Shade_Ray_triangle(Ray ray, Vector3 intersection, ShadeColor trianglecolor, Triangle curr_triangle, int triangleID, Vector3 plane_dir, Vector3 bary_co);// reference Shade_Ray_triangle
tuple<float, int> Sphere_Intersection(vector<Sphere> spheres, Ray ray, bool w, int sphereID);
tuple<float, int> Triangle_Intersection(vector<Triangle> triangles, Ray ray, bool w, int triangleID);

vector<Sphere> spheres; // gobal variable, define after Sphere class
Color bkgcolor; // gobal variable bkgcolor
vector<Light> lights; //  gobal variable lights
vector<Triangle> triangles; // gobal varibale triangles
Texture text_colors;// gobal variable textuer.

int main(int argc, char *argv[]){
    if (argc != 2 ){
        cout << "please input only one file in terminal!" << endl;
        return 0;
    }
    else{
        std::cout << "Current Working Directory: " << std::filesystem::current_path() << std::endl;
        cout << "loading file..." << endl;
        vector<string> file_name = split(argv[1], '.'); // file name -> file_name.at(0)
        ifstream input_file;      
        input_file.open(argv[1]);
        if(!input_file){// if file not open
            cout << "file does not exist" << endl;
            return 0;
        } 
        string texfile_name;
        string line;
        int width;
        int height;
        float hfov;
        Vector3 eye;
        Vector3 viewdir;
        Vector3 updir;
        ShadeColor mtlcolor;
        Vector3 vt;
        Vector3 vertex;
        Vector3 vn;
        vector <Vector3> vts;
        vector<Vector3> vertices; // vertices
        vector<Vector3> vns;// normal direction for all vertices
        Triangle triangle;
        bool smoothshade = false;
        bool textured = false;
        int index_v = 0; 
        int index_vn = 0;
        int index_vt= 0;
        int index_triagnles = 0;  
        while(getline(input_file, line)){
            vector<string> line_vec = split(line, ' '); // get each line in file
            if (line_vec.empty()) {
                continue; // skip empty line
            }
            if (line_vec.at(0) == "imsize"){
                width = stof(line_vec.at(1));
                height = stof(line_vec.at(2));
                if(width <=0 || height <=0){ // width and height can't be negative num
                    cout << "please input valid imsize" << endl;
                    return 0;
                }
                else{
                    cout << "imsize: pass" << endl;
                }
            }
            else if (line_vec.at(0) == "eye"){
                eye = Vector3(stof(line_vec.at(1)),stof(line_vec.at(2)), stof(line_vec.at(3)));
                cout << "eye: pass" << endl;
            }
            else if (line_vec.at(0) == "viewdir"){
                viewdir = Vector3(stof(line_vec.at(1)),stof(line_vec.at(2)), stof(line_vec.at(3)));
                cout << "viewdir: pass" << endl;
            }
            else if (line_vec.at(0) == "hfov"){ // can see nothing if hfov is over than 180
                hfov = stof(line_vec.at(1));
                if(hfov >= 180 || hfov < 0){
                    cout << "Can't not see that wide" << endl;
                    return 0;
                }
                else{
                    cout << "hfov: pass" << endl;
                }
            }
            else if (line_vec.at(0) == "updir"){
                updir = Vector3(stof(line_vec.at(1)),stof(line_vec.at(2)), stof(line_vec.at(3)));
                cout << "updir: pass" << endl;
            }
            else if (line_vec.at(0) == "bkgcolor"){ // bkgcolor must between 0 ~ 1
                bkgcolor = Color(stof(line_vec.at(1)),stof(line_vec.at(2)), stof(line_vec.at(3)));
                if(bkgcolor.r() > 1 || bkgcolor.r() < 0 
                || bkgcolor.g() > 1 || bkgcolor.g() < 0 
                || bkgcolor.b() > 1 || bkgcolor.b() < 0){
                    cout << "please enter valid bkgcolor" << endl;
                    return 0;
                }
                else{
                    cout << "bkgcolor: pass" << endl;
                }
            }
            else if (line_vec.at(0) == "mtlcolor"){ // mtlcolor must between 0 ~ 1
                mtlcolor = ShadeColor(stof(line_vec.at(1)),stof(line_vec.at(2)), stof(line_vec.at(3)), stof(line_vec.at(4)), 
                                      stof(line_vec.at(5)), stof(line_vec.at(6)), stof(line_vec.at(7)), stof(line_vec.at(8)), 
                                      stof(line_vec.at(9)), stof(line_vec.at(10)));
                if(mtlcolor.odr() > 1 || mtlcolor.odr() < 0 
                || mtlcolor.odg() > 1 || mtlcolor.odg() < 0 
                || mtlcolor.odb() > 1 || mtlcolor.odb() < 0
                || mtlcolor.osr() > 1 || mtlcolor.osr() < 0
                || mtlcolor.osg() > 1 || mtlcolor.osg() < 0
                || mtlcolor.osb() > 1 || mtlcolor.osb() < 0
                || mtlcolor.ka() > 1 || mtlcolor.ka() < 0
                || mtlcolor.kd() > 1 || mtlcolor.kd() < 0
                || mtlcolor.ks() > 1 || mtlcolor.ks() < 0
                || mtlcolor.n() <= 0)
                {
                    cout << "please enter valid mtlcolor" << endl;
                    return 0;
                }
                else{
                    cout << "mtlcolor: pass" << endl;
                }
            }
            else if (line_vec.at(0) == "sphere"){
                if (mtlcolor.empty()){
                    cout << "please set mtlcolor before shpere" << endl;
                    return 0;
                } 
                spheres.push_back(Sphere(stof(line_vec.at(1)), stof(line_vec.at(2)), stof(line_vec.at(3)), stof(line_vec.at(4)), 
                                        mtlcolor.odr(), mtlcolor.odg(), mtlcolor.odb(), 
                                        mtlcolor.osr(), mtlcolor.osg(), mtlcolor.osb(), 
                                        mtlcolor.ka(), mtlcolor.kd(), mtlcolor.ks(), 
                                        mtlcolor.n(), textured));
                cout << "sphere: pass" << endl; 
                
            }
            else if (line_vec.at(0) == "light"){ // vector<Light>
                int w = stoi(line_vec.at(4));
                float r = stof(line_vec.at(5));
                float g = stof(line_vec.at(6));
                float b = stof(line_vec.at(7));
                if ((w != 1 && w != 0) || r > 1 || r < 0 || g > 1 || g < 0 || b > 1 || b < 0){
                    cout << "please enter valid light" << endl;
                    return 0;
                }
                else{
                   lights.push_back(Light(stof(line_vec.at(1)), stof(line_vec.at(2)), stof(line_vec.at(3)), 
                                          stoi(line_vec.at(4)), stof(line_vec.at(5)), stof(line_vec.at(6)),
                                          stof(line_vec.at(7)))); 
                }
                cout << "light: pass" << endl; 
            }
            else if (line_vec.at(0) == "v"){
                index_v += 1;
                vertex = Vector3(stof(line_vec.at(1)), stof(line_vec.at(2)), stof(line_vec.at(3))); 
                vertices.push_back(vertex); // read vertices and save it into vector, index start from 1
                cout << "v" << index_v << ": pass" << endl; 

            }// reaf vertex coordinate
            else if (line_vec.at(0) == "vn"){
                index_vn += 1;
                vn = Vector3(stof(line_vec.at(1)), stof(line_vec.at(2)), stof(line_vec.at(3)));
                vn.Normalize();
                vns.push_back(vn); //read vertices normal direction and save it into vector, index start from 1
                cout << "vn" << index_vn << ": pass" << endl;
            } // read normal vector for each vertex 
            else if (line_vec.at(0) == "vt"){
                index_vt += 1;
                vt = {stof(line_vec.at(1)), stof(line_vec.at(2)), -1}; 
                vts.push_back(vt);
                cout << "vt" << index_vt << ": pass" << endl;
            }
            else if (line_vec.at(0) == "f"){
                cout << "construct triagnles..." << endl;
                if (mtlcolor.empty()){
                    cout << "please set mtlcolor before triangles" << endl;
                    return 0;
                } 
                if (vertices.empty()){
                    cout << "please set vertices before triangles" << endl;
                    return 0;
                }
                Vector3 temp = Vector3(-1,-1,-1);
                string str;
                int v1, v2, v3, vn1, vn2, vn3, vt1, vt2, vt3;

                // for (int i = 0; i < line_vec.size(); i++) {
                //         cout << line_vec[i] << " ";
                // }
                // cout << endl;

                line_vec.erase(line_vec.begin());// remove the first element "f" in file
                str.reserve(line_vec.size()); // set vector to a string
                for (const string& s : line_vec){
                    str += " ";
                    str += s;
                }
                
                // for (int i = 0; i < line_vec.size(); i++) {
                //     cout << line_vec[i] << " ";
                // }
                // cout << endl;

                // cout << str << endl;

                if (sscanf(str.c_str(), "%d/%d/%d %d/%d/%d %d/%d/%d", &v1,&vt1,&vn1, &v2,&vt2,&vn2, &v3,&vt3,&vn3) == 9) {// smooth shade and texture
                //sscanf expect a const char* instead of a str:: string, so we have to convert set to a char pointer useing .c_str()
                    if (vns.empty() || vts.empty()){
                        cout << "please set vn and vt before compute smooth shade and texture" << endl;
                        return 0;
                    }
                    if (text_colors.empty()){
                        cout << "No texture image! Can not compute texture! Please add texture image before triangiles." << endl;
                        return 0;
                    }  
                    index_triagnles += 1;
                    cout << "triangle" << index_triagnles << ": has been constructed!" << endl;
                    triangle = Triangle(vertices.at(v1 - 1), vertices.at(v2 - 1), vertices.at(v3 - 1), 
                                        vns.at(vn1 - 1), vns.at(vn2 - 1), vns.at(vn3 - 1), 
                                        vts.at(vt1 - 1), vts.at(vt2 - 1), vts.at(vt3 - 1),
                                        mtlcolor.odr(), mtlcolor.odg(), mtlcolor.odb(), 
                                        mtlcolor.osr(), mtlcolor.osg(), mtlcolor.osb(), 
                                        mtlcolor.ka(), mtlcolor.kd(), mtlcolor.ks(), mtlcolor.n(), 
                                        smoothshade, textured);
                    triangle.set_smoothshaded(true);
                    triangle.set_textured(true);
                }
                else if (sscanf(str.c_str(), "%d//%d %d//%d %d//%d", &v1,&vn1, &v2,&vn2, &v3,&vn3) == 6) { // smooth shade only
                    if (vns.empty()){
                        cout << "please set vn before compute smooth shade" << endl;
                        return 0;
                    }
                    index_triagnles += 1;
                    cout << "triangle" << index_triagnles << ": has been constructed!" << endl;
                    triangle = Triangle(vertices.at(v1 - 1), vertices.at(v2 - 1), vertices.at(v3 - 1), 
                                        vns.at(vn1 - 1), vns.at(vn2 - 1), vns.at(vn3 - 1), 
                                        temp, temp, temp,
                                        mtlcolor.odr(), mtlcolor.odg(), mtlcolor.odb(), 
                                        mtlcolor.osr(), mtlcolor.osg(), mtlcolor.osb(), 
                                        mtlcolor.ka(), mtlcolor.kd(), mtlcolor.ks(), mtlcolor.n(), 
                                        smoothshade, textured);
                    triangle.set_smoothshaded(true);                    
                }
                else if (sscanf(str.c_str(), "%d/%d %d/%d %d/%d", &v1,&vt1, &v2,&vt2, &v3,&vt3) == 6) { // texture only
                    if (vts.empty()){
                        cout << "please set vt before compute texture" << endl;
                        return 0;
                    }
                    if (text_colors.empty()){
                        cout << "No texture image! Please add texture image before triangiles." << endl;
                        return 0;
                    }
                    index_triagnles += 1;
                    cout << "triangle" << index_triagnles << ": has been constructed!" << endl;                    
                    triangle = Triangle(vertices.at(v1 - 1), vertices.at(v2 - 1), vertices.at(v3 - 1), 
                                        temp, temp, temp, 
                                        vts.at(vt1 - 1), vts.at(vt2 - 1), vts.at(vt3 - 1), 
                                        mtlcolor.odr(), mtlcolor.odg(), mtlcolor.odb(), 
                                        mtlcolor.osr(), mtlcolor.osg(), mtlcolor.osb(), 
                                        mtlcolor.ka(), mtlcolor.kd(), mtlcolor.ks(), mtlcolor.n(), 
                                        smoothshade, textured);
                    triangle.set_textured(true); 
                }
                else if (sscanf(str.c_str(), "%d %d %d", &v1, &v2, &v3) == 3) { // flat shade only
                    index_triagnles += 1;
                    cout << "triangle" << index_triagnles << ": has been constructed!" << endl;
                    triangle = Triangle(vertices.at(v1 - 1), vertices.at(v2 - 1), vertices.at(v3 - 1), 
                                        temp, temp, temp, 
                                        temp, temp, temp, 
                                        mtlcolor.odr(), mtlcolor.odg(), mtlcolor.odb(), 
                                        mtlcolor.osr(), mtlcolor.osg(), mtlcolor.osb(), 
                                        mtlcolor.ka(), mtlcolor.kd(), mtlcolor.ks(), mtlcolor.n(), 
                                        smoothshade, textured); 
                }
                else{
                     cout << "input file illegal! - f format wrong!!!" << endl;
                }
                triangles.push_back(triangle);// save all triangle to a vector     
            }  // read triangle 
            else if(line_vec.at(0) == "texture"){
                textured = true; 
                texfile_name = line_vec.at(1);
                cout << texfile_name << endl;
                texfile_name.erase(std::remove_if(texfile_name.begin(), texfile_name.end(), [](char c) { return c == '\r'; }), texfile_name.end());
                // std::ifstream file;
                // if(texfile_name == "umn.ppm"){
                //     cout << 1 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/umn.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "wood.ppm"){
                //     cout << 2 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/wood.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "redwood.ppm"){
                //     cout << 3 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/redwood.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "soccerball.ppm"){
                //     cout << 4 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/soccerball.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "grass.ppm"){
                //     cout << 5 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/grass.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "earthtexture.ppm"){
                //     cout << 6 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/earthtexture.ppm", std::ios::binary);
                // }
                // else if(texfile_name == "space.ppm"){
                //     cout << 7 << endl;
                //     file.open("/home/xiao0265/Desktop/csci5607/1d/test/raytracer/raytracer1c/space.ppm", std::ios::binary);
                // }
                // else{
                //     break;
                // }
                ifstream file(texfile_name);
                 if (!file.is_open()) {
                    string errorMessage = "Unable to open file: " + string(strerror(errno));
                    throw runtime_error(errorMessage);
                }

                string magic;
                int width, height, maxval;
                file >> magic >> width >> height >> maxval;
                cout << "magic: " << magic << " " << "maxval: " << maxval << endl;
                if (magic != "P3" || maxval != 255) {
                    throw runtime_error("Invalid PPM file format");
                }
                // cout << "width: " << width << " " << "height: " << height << endl;


                vector<Color> pixels_colors;
                pixels_colors.reserve(height*width); // 512 X 78 
                for (int i = 0; i < height; i++) {
                    for (int j = 0; j < width; j++){
                        int r, g, b;
                        file >> r >> g >> b;
                        pixels_colors.push_back(Color(r / 255.0f, g / 255.0f, b / 255.0f));
                    }  
                }
                file.close();
                text_colors = Texture(magic, width, height, pixels_colors);
                cout << "texture: pass" << endl;
            }// read PPM file
            else {
                cout << "input file illegal!" << endl;
            }
    }
    
    if (!vertex.empty() && triangle.empty()){
        cout << "As a reminder, you only entered the vertices, but you did not construct triangles." << endl;
    }
        // vertices.at(1).print();
        // vertices.at(2).print();
        // vertices.at(3).print();
        // vertices.at(4).print();
        // triangles.at(0).print();
        // triangles.at(1).print();
        // cout << text_colors.magic() << endl;
        // cout << text_colors.width() << endl;
        // cout << text_colors.height() << endl; 
        // cout << text_colors.textures()[0][0].r() << endl;
        // cout << text_colors.textures()[0][0].g() << endl;
        // cout << text_colors.textures()[0][0].b() << endl;
        // cout << text_colors.textures()[2070601].r() << endl;
        // cout << text_colors.textures()[1919][1079].r() << endl;
        // cout << text_colors.textures()[1919][1079].r() << endl;
        // cout << text_colors.textures()[10][10].g() << endl;
        // cout << text_colors.textures()[10][10].b() << endl;
        // cout << sizeof(text_colors.textures())<< endl;
        // cout << text_colors.width() << " " << text_colors.height() << " " << text_colors.magic() << " " << endl; 
        // cout << spheres.at(0).textured() << endl; 
        

    Vector3 u = viewdir.Cross(updir) / viewdir.Cross(updir).Magnitude();
    Vector3 v = u.Cross(viewdir)/u.Cross(viewdir).Magnitude();
    Vector3 n = viewdir/viewdir.Magnitude();   

    float aspect_ratio = (1.0 * width) / (1.0 * height);
    float d = 5.0;       
    float hfov_radians = hfov * (M_PI) / 180;
    float w = 2 * d * tan(0.5 * hfov_radians);
    float h = w / aspect_ratio;

    Vector3 ul = eye + n*(d) - u*(0.5*w) + v*(0.5*h);
    Vector3 ur = eye + n*(d) + u*(0.5*w) + v*(0.5*h);
    Vector3 ll = eye + n*(d) - u*(0.5*w) - v*(0.5*h);
    Vector3 lr = eye + n*(d) + u*(0.5*w) - v*(0.5*h);

    Vector3 delta_h = (ur - ul) / (width - 1);
    Vector3 delta_v = (ll - ul) / (height - 1);
    Vector3 delta_ch = (ur - ul) / (2 * width);
    Vector3 delta_cv = (ll - ul) / (2 * height);

    string out_file_name = file_name.at(0) + ".ppm";
    ofstream out_file(out_file_name);// write a ppm file for output
    out_file << "P3" << endl; // write ppm file header here
    out_file << width << " " << height << endl;
    out_file << "255" <<endl;
    int index_main = 0;
// ############
// for progress bar
    int num_iterations_j = height;
    int num_iterations_i = width;
    int total_iterations = num_iterations_i * num_iterations_j;
    int counter = 0;
    int bar_length = 50;

    cout << "Generating Image..." << endl;
    for (int j = 0; j < height; j++){ // check each pixel if it's cross the sphere or not
            for (int i = 0; i < width; i++){

       // Calculate percentage of iterations completed
                float percentage = (counter / (float) total_iterations) * 100.0;

        // Calculate number of completed and remaining iterations for progress bar
                int num_completed = (int) ((percentage / 100.0) * bar_length);
                int num_remaining = bar_length - num_completed;

        // Build progress bar string
                string progress_bar = "[";
                for (int k = 0; k < num_completed; k++) {
                    progress_bar += "=";
                }
                for (int k = 0; k < num_remaining; k++) {
                    progress_bar += "-";
                }
                    progress_bar += "]";

        // Print progress bar to console
                cout << "\r" << progress_bar << " " << percentage << "%" << flush;

        // Increment counter
                counter++;


                // cout << "i: " << i << " " << "j: " << j << endl;
                Vector3 pix_pos = ul + delta_h*(i) + delta_v*(j); // located the current pixel
                Vector3 ray_dir = (pix_pos - eye) / (sqrt((pix_pos.x() - eye.x())*(pix_pos.x() - eye.x()) 
                                                        + (pix_pos.y() - eye.y())*(pix_pos.y() - eye.y()) 
                                                        + (pix_pos.z() - eye.z())*(pix_pos.z() - eye.z())));
                ray_dir.Normalize();
                Ray ray = {eye, ray_dir};
                Color color = Trace_Ray(ray);
                out_file << int(255 * color.r()) << " " << int(255 * color.g()) << " " << int(255 * color.b()) << endl; // out put color
            }
        }   
        cout << "\r[========================================] 100% Completed! Image Generate Successfully!" << endl;
    }
    return 0;
}

 

Color Trace_Ray(Ray ray){
    float min_dist = numeric_limits<float>::max();
    float t = numeric_limits<float>::max();
    Color pixelcolor = {bkgcolor.r(),bkgcolor.g(),bkgcolor.b()};
    ShadeColor spherecolor;
    Vector3 n;
    float theta;
    float phi;

    for (int k = 0;  k < spheres.size(); k++){
        float v;
        float u;
        int ui;
        int vj;
        float A = ((ray.GetDirection().x() * ray.GetDirection().x()) 
                 + (ray.GetDirection().y() * ray.GetDirection().y()) 
                 + (ray.GetDirection().z() * ray.GetDirection().z()));
                    
        float B = 2*( ray.GetDirection().x()*(ray.GetOrigin().x() - spheres.at(k).x()) 
                    + ray.GetDirection().y()*(ray.GetOrigin().y() - spheres.at(k).y()) 
                    + ray.GetDirection().z()*(ray.GetOrigin().z() - spheres.at(k).z()));
                    
        float C = ((ray.GetOrigin().x() - spheres.at(k).x()) * (ray.GetOrigin().x() - spheres.at(k).x()) 
                 + (ray.GetOrigin().y() - spheres.at(k).y()) * (ray.GetOrigin().y() - spheres.at(k).y()) 
                 + (ray.GetOrigin().z() - spheres.at(k).z()) * (ray.GetOrigin().z() - spheres.at(k).z())
                 - (spheres.at(k).r() * spheres.at(k).r()));
                    
        float discriminant = (B * B) - (4 * A * C);
        if(discriminant == 0){ 
            t = (-1 * B) / 2 * A;
        }
        else if(discriminant > 0){ 
            float root1 = ((-1 * B) + sqrt(discriminant)) / 2 * A;
            float root2 = ((-1 * B) - sqrt(discriminant)) / 2 * A;
            if (root1 > 0 && root2 > 0){ // drop the negative solution
                if(root1 > root2){
                    t = root2;
                }
                else{
                     t = root1;
                }
            }
            else if(root1 > 0 && root2 < 0){// drop the negative solution
                            t = root1;
            }
            else if(root1 < 0 && root2 > 0){// drop the negative solution
                            t = root2;
            }
        } // t 
        if (t > 0 && t <= min_dist && discriminant >= 0){// if one ray cross mutiple sphere, set the sphere's color that cloest to origin
            Vector3 intersection = ray.GetOrigin() + (ray.GetDirection() * t);
            if (spheres.at(k).textured()){
                //cout << "ok~ goog good" << endl;
                n = (Vector3((intersection.x() - spheres.at(k).x()), 
                             (intersection.y() - spheres.at(k).y()), 
                             (intersection.z() - spheres.at(k).z()))) / spheres.at(k).r();   // set vector N
                n.Normalize();
                
                phi = acos((intersection.z() - spheres.at(k).z())/spheres.at(k).r());
                theta = atan2((intersection.y() - spheres.at(k).y()), (intersection.x() - spheres.at(k).x())); 

                // cout << "theta: " << theta << " " << "phi: " << phi << endl;
                
                v = phi / M_PI;
                if (theta > 0){
                    u = theta / (2 * M_PI);
                }
                else if (theta < 0){
                    u = (theta + (2 * M_PI)) / (2 * M_PI);
                }
                else{
                    u = 0;
                }

                // cout << "v: " << v << " " << "u " << u << endl;

                ui = round(u * (text_colors.width() - 1));
                vj = round(v * (text_colors.height() - 1));
                
                // cout << "i: " << ui << " " << "j: " << vj << endl;

                int index_texture = (text_colors.width() * vj) + ui; 

                // cout << "index: " << index_texture << endl;

                // cout << text_colors.textures()[ui][vj].r() << " " << text_colors.textures()[ui][vj].g() << " " << text_colors.textures()[ui][vj].b() << endl;
                
                Color currpix_text_color = text_colors.textures_color(index_texture); //############################################


                spherecolor = ShadeColor(currpix_text_color.r(), currpix_text_color.g(), currpix_text_color.b(), 
                                         spheres.at(k).osr(), spheres.at(k).osg(), spheres.at(k).osb(), 
                                         spheres.at(k).ka(), spheres.at(k).kd(), spheres.at(k).ks(), 
                                         spheres.at(k).n()); // save color for current sphere
            }
            else{
                spherecolor = ShadeColor(spheres.at(k).odr(), spheres.at(k).odg(), spheres.at(k).odb(), 
                                         spheres.at(k).osr(), spheres.at(k).osg(), spheres.at(k).osb(), 
                                         spheres.at(k).ka(), spheres.at(k).kd(), spheres.at(k).ks(), 
                                         spheres.at(k).n()); // save color for current sphere
            }
            // pixelcolor =  {spheres.at(k).odr(), spheres.at(k).odg(), spheres.at(k).odb()};  //  -> shade_ray -> 
            min_dist = t; // update the min-distance 
            pixelcolor = Shade_Ray_sphere(ray, intersection, spherecolor, spheres.at(k), k);  // call shade_ray
        }
   }// sphere for loop

   for (int k = 0;  k < triangles.size(); k++){
        float alpha;
        float beta;
        float gama;
        Vector3 p;
        ShadeColor trianglecolor;
        Vector3 bary_co;
        Vector3 intersection;
        Vector3 e1;
        Vector3 e2;
        Vector3 n;
        float A;
        float B;
        float C;
        float D;
        float denominator;
        Vector3 ep;
        float d11;
        float d22;
        float d12;
        float d1p;
        float d2p;
        float det;
        float v = 0;
        float u = 0;
        int ui = 0;
        int vj = 0;
        
        e1 = triangles.at(k).v2() - triangles.at(k).v1(); // v1 - v0 
        e2 = triangles.at(k).v3() - triangles.at(k).v1(); // v2 - v0
        n = e1.Cross(e2); // plane direction
        A = n.x();
        B = n.y();
        C = n.z();
        D = ((-1.0)* A *triangles.at(k).v1().x()) + 
                  ((-1.0)* B *triangles.at(k).v1().y()) +
                  ((-1.0)* C *triangles.at(k).v1().z()); // Ax1 + By1 + Cz1 + D = 0 -> D = -Ax1 - By1 - Cz1  if we alway plug v1 to find D
        // cout << D << endl;
        denominator = A * ray.GetDirection().x() + 
                            B * ray.GetDirection().y() + 
                            C * ray.GetDirection().z();
        if (denominator != 0.0){
            t = (-1.0) * (A * ray.GetOrigin().x() + B * ray.GetOrigin().y() + C * ray.GetOrigin().z() + D) / denominator;
            // cout << t << endl;
            if (t > 0.0){
                p = Vector3(ray.GetOrigin().x() + t * ray.GetDirection().x(),
                                    ray.GetOrigin().y() + t * ray.GetDirection().y(),
                                    ray.GetOrigin().z() + t * ray.GetDirection().z());
                ep = p - triangles.at(k).v1(); // p - v0
                d11 = e1.Dot(e1);
                d22 = e2.Dot(e2);
                d12 = e1.Dot(e2);
                d1p = e1.Dot(ep);
                d2p = e2.Dot(ep);
                det = d11 * d22 - d12 * d12;
                // cout << d11 << " " << d22 << " " << d12 << " " << d1p << " " << d2p << " " << det <<  endl; 
                if (det != 0.0){
                    beta = (d22 * d1p - d12 * d2p) / det; 
                    gama = (d11 * d2p - d12 * d1p) / det;
                    alpha = 1 - (beta + gama);
                }
            }
        }
        if (alpha > 0 && alpha < 1 && beta > 0 && beta < 1 && gama > 0 && gama < 1){
            // cout << t << endl;
            if ( t < min_dist){
                min_dist = t;
                intersection = p;
                bary_co = Vector3(alpha, beta, gama); 
                if (triangles.at(k).get_textured()){
                    int u1 = triangles.at(k).vt1().x();
                    int u2 = triangles.at(k).vt2().x();
                    int u3 = triangles.at(k).vt3().x();
                    u = (alpha * u1) + (beta * u2) + (gama * u3);

                    int v1 = triangles.at(k).vt1().y();
                    int v2 = triangles.at(k).vt2().y();
                    int v3 = triangles.at(k).vt3().y();
                    v = (alpha * v1) + (beta * v2) + (gama * v3);

                    ui = floor(u * (text_colors.width() - 1));
                    vj = floor(v * (text_colors.height() - 1));
                    
                    int index_texture = (text_colors.width() * vj) + ui;
                    Color currpix_text_color = text_colors.textures_color(index_texture);

                    trianglecolor = ShadeColor(currpix_text_color.r(), currpix_text_color.g(), currpix_text_color.b(), 
                                               triangles.at(k).osr(), triangles.at(k).osg(), triangles.at(k).osb(), 
                                               triangles.at(k).ka(), triangles.at(k).kd(), triangles.at(k).ks(), 
                                               triangles.at(k).n());
                }
                else{
                trianglecolor = ShadeColor(triangles.at(k).odr(), triangles.at(k).odg(), triangles.at(k).odb(), 
                                           triangles.at(k).osr(), triangles.at(k).osg(), triangles.at(k).osb(), 
                                           triangles.at(k).ka(), triangles.at(k).kd(), triangles.at(k).ks(), 
                                           triangles.at(k).n());
                }


                // cout << min_dist << endl;
 
                // cout << trianglecolor.odr() << " " << trianglecolor.odg() << " " << trianglecolor.odb() << endl;
                // cout << trianglecolor.osr() << " " << trianglecolor.osg() << " " << trianglecolor.osb() << endl;
                // cout << trianglecolor.ka() << " " << trianglecolor.kd() << " " << trianglecolor.ks() << " " << trianglecolor.n() << endl;
            }
            pixelcolor = Shade_Ray_triangle(ray, intersection, trianglecolor, triangles.at(k), k, n, bary_co);
        }// triangle for loop
        
    }
   return pixelcolor;
}

tuple<float, int> Sphere_Intersection(vector<Sphere> spheres, Ray ray, bool w, int sphereID){ // return the cloest distance and it's sphere ID
    // w represent the w value in light to determine if it's point light or directional light.
    float min_dist = numeric_limits<float>::max();
    float t = numeric_limits<float>::max();
    float cloest_d = 0;
    tuple<float, int> sphere_t;
    int index = 0;
    for (int k = 0;  k < spheres.size(); k++){
        float A = ((ray.GetDirection().x() * ray.GetDirection().x()) 
                 + (ray.GetDirection().y() * ray.GetDirection().y()) 
                 + (ray.GetDirection().z() * ray.GetDirection().z()));
                    
        float B = 2*( ray.GetDirection().x() * (ray.GetOrigin().x() - spheres.at(k).x()) 
                    + ray.GetDirection().y() * (ray.GetOrigin().y() - spheres.at(k).y()) 
                    + ray.GetDirection().z() * (ray.GetOrigin().z() - spheres.at(k).z()));
                    
        float C = ((ray.GetOrigin().x() - spheres.at(k).x()) * (ray.GetOrigin().x() - spheres.at(k).x()) 
                 + (ray.GetOrigin().y() - spheres.at(k).y()) * (ray.GetOrigin().y() - spheres.at(k).y()) 
                 + (ray.GetOrigin().z() - spheres.at(k).z()) * (ray.GetOrigin().z() - spheres.at(k).z())
                 - (spheres.at(k).r() * spheres.at(k).r()));
                    
        float discriminant = (B * B) - (4 * A * C);
        if(discriminant == 0){
            float solution = (-1 * B) / 2 * A;
            if (solution > 0 && sphereID != k && !w) { // positive solution for directinal light, set flag to 0 directly 
                sphere_t = make_tuple(-10000, k);
                return sphere_t;
            }
            else if (solution > 0 && sphereID != k && w){  // positive solution point light, save the t and wait for comparation
                t = solution;
            }
            else{
                continue;                                 // if negative solution, or ray pass the sephere itself, keep going
            }
        }
        else if(discriminant > 0){ 
            float root1 = ((-1 * B) + sqrt(discriminant)) / (2 * A);
            float root2 = ((-1 * B) - sqrt(discriminant)) / (2 * A);
            if((root1 > 0 || root2 > 0) && !w && sphereID != k){ // directinal light, w = 0 
                sphere_t = make_tuple(-10000, k); 
                return sphere_t;
            }
            else if ((root1 > 0 || root2 > 0) && w && sphereID != k){
                if (root1 > 0 && root2 > 0){ // drop the negative solution
                    if(root1 > root2){
                        t = root2;
                    }
                    else{
                        t = root1;
                    }
                }
                else if(root1 > 0 && root2 < 0){// drop the negative solution
                            t = root1;
                }
                else if(root1 < 0 && root2 > 0){// drop the negative solution
                            t = root2;
                }
            }
            else{
                continue;
            }            
        }
        else{
            continue;
        }
        
        if (t < min_dist){
            index = k;
            min_dist = t;
            cloest_d = t;
        }

    }   
        sphere_t = make_tuple(cloest_d, index); 
        return sphere_t;
}  

tuple<float, int> Triangle_Intersection(vector<Triangle> triangles, Ray ray, bool w, int triangleID){
    float min_dist = numeric_limits<float>::max();
    float t = numeric_limits<float>::max();
    float cloest_d = 0;
    tuple<float, int> triangle_t;
    int index = 0;
        for (int k = 0;  k < triangles.size(); k++){
            Vector3 e1 = triangles.at(k).v2() - triangles.at(k).v1(); // v1 - v0 
            Vector3 e2 = triangles.at(k).v3() - triangles.at(k).v1(); // v2 - v0
            Vector3 n = e1.Cross(e2); // plane direction
            float A = n.x();
            float B = n.y();
            float C = n.z();
            float D = ((-1.0)* A *triangles.at(k).v1().x()) + 
                      ((-1.0)* B *triangles.at(k).v1().y()) +
                      ((-1.0)* C *triangles.at(k).v1().z()); // Ax1 + By1 + Cz1 + D = 0 -> D = -Ax1 - By1 - Cz1  if we alway plug v1 to find D
            // cout << D << endl;
            float denominator = A * ray.GetDirection().x() + 
                                B * ray.GetDirection().y() + 
                                C * ray.GetDirection().z();
            if (denominator != 0.0){
                float solution = (-1.0) * (A * ray.GetOrigin().x() + B * ray.GetOrigin().y() + C * ray.GetOrigin().z() + D) / denominator;
                if (solution > 0.0){
                    Vector3 p = Vector3(ray.GetOrigin().x() + solution * ray.GetDirection().x(),
                                        ray.GetOrigin().y() + solution * ray.GetDirection().y(),
                                        ray.GetOrigin().z() + solution * ray.GetDirection().z());
                    Vector3 ep = p - triangles.at(k).v1(); // p - v0
                    float d11 = e1.Dot(e1);
                    float d22 = e2.Dot(e2);
                    float d12 = e1.Dot(e2);
                    float d1p = e1.Dot(ep);
                    float d2p = e2.Dot(ep);
                    float det = (d11 * d22) - (d12 * d12);
                    if (det != 0.0){
                        float beta = (d22 * d1p - d12 * d2p) / det; 
                        float gama = (d11 * d2p - d12 * d1p) / det;
                        float alpha = 1 - (beta + gama);
                        
                        // if (alpha > 0 && alpha < 1 && beta > 0 && beta < 1 && gama > 0 && gama < 1){
                        //        cout << alpha << " " << beta << " " << gama << endl;}
                        // if (triangleID != k && w){    
                        //     cout << "ID: " << triangleID << endl;
                        //     cout << "k: " << k << endl; 
                        //     cout << "w: " << w <<endl;}
                        // cout << "###############" << endl; 

                        if ( alpha > 0 && alpha < 1 && beta > 0 && beta < 1 && gama > 0 && gama < 1  && (!w)){ 
                            if (triangleID != k){
                            triangle_t = make_tuple(-10000, k);
                            return triangle_t;
                            }
                            
                        }
                        else if(alpha > 0 && alpha < 1 && beta > 0 && beta < 1 && gama > 0 && gama < 1 && w){
                            if (triangleID != k){
                            t = solution;
                            }
                        }else {continue;}//p in triangle or not
                    } else {continue;}// det
                }else { continue;}// positive solution
            } else { continue;}// denominator
            if (t < min_dist){
                index = k;
                min_dist = t;
                cloest_d = t;
            }
        }// for loop triangle
        triangle_t = make_tuple(cloest_d, index); 
        return triangle_t;
}

Color Shade_Ray_sphere(Ray ray, Vector3 intersection, ShadeColor spherecolor, Sphere curr_sphere, int sphereID){  // current sphere, intersection point, Light   ->
    Vector3 n; // [intersection - sphere(x,y,z)] / sphere(r)
    
    Vector3 l; // -(light(x,y,z))                                                  if directional light sources; 
               //(light(x,y,z) - intersection) / || light(x,y,z) - intersection)|| if positional light sources 
    
    Vector3 h; // l + v / || l + v ||
    
    Vector3 v; // V = (ray.origin - intersection) / ||viewer_position - surface_point||

    // Vector3 light_color; // Save in the light, last 3 digits
    
    float dot_nl; // use to save Dot(n, l)
    float dot_nh; // use to save Dot(n, h)

    float lambda_r; // final color for red
    float sum_r = 0.0;   // sum of diffuse and specular color for red, for all light
    float curr_r; // sum of diffuse and specular color for red, for current light
    
    float lambda_g; // final color for green
    float sum_g = 0.0;   // sum of diffuse and specular color for green, for all light
    float curr_g; // sum of diffuse and specular color for red, for current light
    
    float lambda_b; // final color for blue
    float sum_b = 0.0;   // sum of diffuse and specular color for blue, for all light
    float curr_b; // sum of diffuse and specular color for red, for current light
    // initil sum_r, sum_g, sum_b !!!

    Ray shadow_ray;
    float cloest_d = 0;
    int t_ID = 0;
    Vector3 new_intersection;

    for (int k = 0;  k < lights.size(); k++){
        int flag_s = 1; 
        n = (Vector3((intersection.x() - curr_sphere.x()), 
                     (intersection.y() - curr_sphere.y()), 
                     (intersection.z() - curr_sphere.z()))) / curr_sphere.r();   // set vector N
        n.Normalize();
        
        if (lights.at(k).w() == 1){ // positional light sources
            float distance = sqrt(pow((lights.at(k).x() - intersection.x()), 2) 
                                + pow((lights.at(k).y() - intersection.y()), 2)
                                + pow((lights.at(k).z() - intersection.z()), 2));// distance between light-point and intersaction point
            
            l = Vector3((lights.at(k).x() - intersection.x()), 
                        (lights.at(k).y() - intersection.y()), 
                        (lights.at(k).z() - intersection.z())); // light direction
            l.Normalize();
            
            shadow_ray = {intersection, l};
            // cloest_d = Fun_Intersection(spheres, shadow_ray);
            cloest_d = get<0>(Sphere_Intersection(spheres, shadow_ray, lights.at(k).w(), sphereID)); // d
            t_ID = get<1>(Sphere_Intersection(spheres, shadow_ray, lights.at(k).w(), sphereID)); // id
            
            new_intersection = shadow_ray.GetOrigin() + (shadow_ray.GetDirection() * cloest_d);
            float distance_sphere = sqrt(pow((new_intersection.x() - intersection.x()), 2) 
                                       + pow((new_intersection.y() - intersection.y()), 2)
                                       + pow((new_intersection.z() - intersection.z()), 2));

            if (distance_sphere < distance && t_ID != sphereID && cloest_d > 0){
                flag_s = 0;
            }
        }
        else if (lights.at(k).w() == 0){ // directional light sources
            l = Vector3((-1) * lights.at(k).x(), 
                        (-1) * lights.at(k).y(), 
                        (-1) * lights.at(k).z());
            l.Normalize();
            if(l.x() >-0.0001 && l.x() < 0.0001) l.set_x(0); // set '-0' to '0' if it happen  
            if(l.y() >-0.0001 && l.y() < 0.0001) l.set_y(0);
            if(l.z() >-0.0001 && l.z() < 0.0001) l.set_z(0);
            

            shadow_ray = {intersection, l};
            cloest_d = get<0>(Sphere_Intersection(spheres, shadow_ray, lights.at(k).w(), sphereID)); // d
            t_ID = get<1>(Sphere_Intersection(spheres, shadow_ray, lights.at(k).w(), sphereID)); // id

            if(cloest_d == -10000){
                flag_s = 0;
            }
            // cout << "l: " << l.x() << " " << l.y() << " " << l.z() << endl;
            // cout << "t_ID: " << t_ID << "sphereID: " << sphereID << endl;
            // if (cloest_d >  0 && t_ID != sphereID){
            // if (cloest_d >  0 && t_ID != sphereID){
            //     flag_s = 0;
            // }
        }
        
        v = ray.GetOrigin() - intersection;
        v.Normalize();
        
        h = l + v;
        h.Normalize();
        // n, l, h have been computed already
       
        dot_nl = n.Dot(l); // dot product of vector N and L, use to compute I-lambda
        dot_nh = n.Dot(h); // dot product of vector N and H, use to compute I-lambda
        
        if (dot_nl < 0){ // dot_nl have to be >= 0
            dot_nl = 0;
        }
        if (dot_nh < 0){ // dot_nh have to be >= 0
            dot_nh = 0;
        }

        // light_color = Vector3(lights.at(k).r(), lights.at(k).g(), lights.at(k).b());
        curr_r = flag_s * lights.at(k).r() * ((spherecolor.kd() * spherecolor.odr() * dot_nl) 
                                   + (spherecolor.ks() * spherecolor.osr() * pow(dot_nh, spherecolor.n())));
        sum_r = sum_r + curr_r;
        // compute for red, for diffuse and specular

        curr_g = flag_s * lights.at(k).g() * ((spherecolor.kd() * spherecolor.odg() * dot_nl) 
                                   + (spherecolor.ks() * spherecolor.osg() * pow(dot_nh, spherecolor.n())));
        sum_g = sum_g + curr_g;
        // compute for green, for diffuse and specular

        curr_b = flag_s * lights.at(k).b() * ((spherecolor.kd() * spherecolor.odb() * dot_nl) 
                                   + (spherecolor.ks() * spherecolor.osb() * pow(dot_nh, spherecolor.n())));
        sum_b = sum_b + curr_b;
        // compute for green, for diffuse and specular
    }//light for loop
        lambda_r = (spherecolor.ka() * spherecolor.odr()) + sum_r; 
        lambda_g = (spherecolor.ka() * spherecolor.odg()) + sum_g;
        lambda_b = (spherecolor.ka() * spherecolor.odb()) + sum_b;

        if(lambda_r > 1){
            lambda_r = 1;
        }
        
        if(lambda_g > 1){
            lambda_g = 1;
        }

        if(lambda_b > 1){
            lambda_b = 1;
        }

        // cout << "light" << " " <<  lights.at(0).r() << " " << lights.at(0).g() << " " << lights.at(0).b()<< endl;
        // cout << "lambda_r: " << lambda_r << endl;
        // cout << "lambda_g: " << lambda_g << endl;
        // cout << "lambda_b: " << lambda_b << endl;

    return {lambda_r, lambda_g, lambda_b};
}

Color Shade_Ray_triangle(Ray ray, Vector3 intersection, ShadeColor trianglecolor, Triangle curr_triangle, int triangleID, Vector3 plane_dir, Vector3 bary_co){
    Vector3 n; // if smooth-shade n = (a*n0+b*n1+g*n2) / ||a*n0+b*n1+g*n2||
               // if flat-sahde n = e1 x e2. normalize()
    
    Vector3 l; // -(light(x,y,z))                                                  if directional light sources; 
               //(light(x,y,z) - intersection) / || light(x,y,z) - intersection)|| if positional light sources 
    
    Vector3 h; // l + v / || l + v ||
    
    Vector3 v; // V = (ray.origin - intersection) / ||viewer_position - surface_point||

    // Vector3 light_color; // Save in the light, last 3 digits
    
    float dot_nl; // use to save Dot(n, l)
    float dot_nh; // use to save Dot(n, h)

    float lambda_r; // final color for red
    float sum_r = 0.0;   // sum of diffuse and specular color for red, for all light
    float curr_r; // sum of diffuse and specular color for red, for current light
    
    float lambda_g; // final color for green
    float sum_g = 0.0;   // sum of diffuse and specular color for green, for all light
    float curr_g; // sum of diffuse and specular color for red, for current light
    
    float lambda_b; // final color for blue
    float sum_b = 0.0;   // sum of diffuse and specular color for blue, for all light
    float curr_b; // sum of diffuse and specular color for red, for current light
    // initil sum_r, sum_g, sum_b !!!
    float alpha = bary_co.x();
    float beta = bary_co.y();
    float gama = bary_co.z();
    
    Ray shadow_ray;
    float cloest_d = 0;
    int t_ID = 0;
    Vector3 new_intersection;
    for (int k = 0;  k < lights.size(); k++){  
        int flag_s = 1;
        // cout << alpha << " " << beta << " " << gama << endl;
        if (curr_triangle.get_smoothshaded()){
            n = (curr_triangle.vn1() * alpha) + (curr_triangle.vn2() * beta) + (curr_triangle.vn3() * gama);
        }
        else{
            n = plane_dir;
        }
        n.Normalize();
        
        if (lights.at(k).w() == 1){ // positional light sources
            float distance = sqrt(pow((lights.at(k).x() - intersection.x()), 2) 
                                + pow((lights.at(k).y() - intersection.y()), 2)
                                + pow((lights.at(k).z() - intersection.z()), 2));// distance between light-point and intersaction point
            
            l = Vector3((lights.at(k).x() - intersection.x()), 
                        (lights.at(k).y() - intersection.y()), 
                        (lights.at(k).z() - intersection.z())); // light direction
            l.Normalize();
            
            shadow_ray = {intersection, l};

            cloest_d = get<0>(Triangle_Intersection(triangles, shadow_ray, lights.at(k).w(), triangleID)); // d
            t_ID = get<1>(Triangle_Intersection(triangles, shadow_ray, lights.at(k).w(), triangleID)); // id
            
            new_intersection = shadow_ray.GetOrigin() + (shadow_ray.GetDirection() * cloest_d);
            float distance_triangle = sqrt(pow((new_intersection.x() - intersection.x()), 2) 
                                         + pow((new_intersection.y() - intersection.y()), 2)
                                         + pow((new_intersection.z() - intersection.z()), 2));

            if (distance_triangle < distance && t_ID != triangleID && cloest_d > 0){
                flag_s = 0;
            }
        }
        else if (lights.at(k).w() == 0){ // directional light sources
            l = Vector3((-1) * lights.at(k).x(), 
                        (-1) * lights.at(k).y(), 
                        (-1) * lights.at(k).z());
            l.Normalize();
            if(l.x() >-0.0001 && l.x() < 0.0001) l.set_x(0); // set '-0' to '0' if it happen  
            if(l.y() >-0.0001 && l.y() < 0.0001) l.set_y(0);
            if(l.z() >-0.0001 && l.z() < 0.0001) l.set_z(0);
            

            shadow_ray = {intersection, l};
            cloest_d = get<0>(Triangle_Intersection(triangles, shadow_ray, lights.at(k).w(), triangleID)); // d
            t_ID = get<1>(Triangle_Intersection(triangles, shadow_ray, lights.at(k).w(), triangleID)); // id

            if(cloest_d == -10000){
                flag_s = 0;
            }
            
            // cout << "l: " << l.x() << " " << l.y() << " " << l.z() << endl; ***** no needed
            // cout << "t_ID: " << t_ID << "sphereID: " << sphereID << endl;
            // if (cloest_d >  0 && t_ID != sphereID){
            // if (cloest_d >  0 && t_ID != sphereID){
            //     flag_s = 0;
            // }
        }
        v = ray.GetOrigin() - intersection;
        v.Normalize();
        
        h = l + v;
        h.Normalize();
        // n, l, h have been computed already
       
        dot_nl = n.Dot(l); // dot product of vector N and L, use to compute I-lambda
        dot_nh = n.Dot(h); // dot product of vector N and H, use to compute I-lambda
        
        if (dot_nl < 0){ // dot_nl have to be >= 0
            dot_nl = 0;
        }
        if (dot_nh < 0){ // dot_nh have to be >= 0
            dot_nh = 0;
        }
        flag_s = 1; // for test ###############################################################################################
        // light_color = Vector3(lights.at(k).r(), lights.at(k).g(), lights.at(k).b());
        curr_r = flag_s * lights.at(k).r() * ((trianglecolor.kd() * trianglecolor.odr() * dot_nl) 
                                   + (trianglecolor.ks() * trianglecolor.osr() * pow(dot_nh, trianglecolor.n())));
        sum_r = sum_r + curr_r;
        // compute for red, for diffuse and specular

        curr_g = flag_s * lights.at(k).g() * ((trianglecolor.kd() * trianglecolor.odg() * dot_nl) 
                                   + (trianglecolor.ks() * trianglecolor.osg() * pow(dot_nh, trianglecolor.n())));
        sum_g = sum_g + curr_g;
        // compute for green, for diffuse and specular

        curr_b = flag_s * lights.at(k).b() * ((trianglecolor.kd() * trianglecolor.odb() * dot_nl) 
                                   + (trianglecolor.ks() * trianglecolor.osb() * pow(dot_nh, trianglecolor.n())));
        sum_b = sum_b + curr_b;
        // compute for green, for diffuse and specular
    }//light for loop
        lambda_r = (trianglecolor.ka() * trianglecolor.odr()) + sum_r; 
        lambda_g = (trianglecolor.ka() * trianglecolor.odg()) + sum_g;
        lambda_b = (trianglecolor.ka() * trianglecolor.odb()) + sum_b;

        if(lambda_r > 1){
            lambda_r = 1;
        }
        
        if(lambda_g > 1){
            lambda_g = 1;
        }

        if(lambda_b > 1){
            lambda_b = 1;
        }

        // cout << "light" << " " <<  lights.at(0).r() << " " << lights.at(0).g() << " " << lights.at(0).b()<< endl;
        // cout << "lambda_r: " << lambda_r << endl;
        // cout << "lambda_g: " << lambda_g << endl;
        // cout << "lambda_b: " << lambda_b << endl;

    return {lambda_r, lambda_g, lambda_b};
}