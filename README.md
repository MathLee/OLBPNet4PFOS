# PFOS
   This project provides the code and results for 'Personal Fixations-Based Object Segmentation with Object Localization and Boundary Preservation', IEEE TIP 2021. [IEEE Link](https://ieeexplore.ieee.org/document/9298925) or [arxiv Link](https://arxiv.org/abs/2101.09014).
   
   Our code is implemented based on the Caffe of Amulet. You can first install and compile the caffe according to our previous work [CFPS](https://github.com/MathLee/CFPS) or [original Amulet](https://github.com/Pchank/caffe-sal). 


# PFOS Dataset
   We build a new dataset based on OSIE dataset for 'Personal Fixations-based Object Segmentation' (PFOS) task, you can downlown the PFOS dataset [here](https://pan.baidu.com/s/1Ah7MmxSzYwFj5h_nLkYdLA) (code: npqn).
   
   PFOS dataset contains 700 images and 10,500 free-view personal fixation maps, each image has 15 personal fixation maps from 15 subjects and the transformed binary groundtruths.It is divided into training set (600 images with 9,000 free-view personal fixation maps) and testing set (100 images with 1,500 free-view personal fixation maps).


# PFOS task and OLBPNet
   PFOS task:
   
   <div align=center>
   <img src="https://github.com/MathLee/OLBPNet4PFOS/blob/main/Images/PFOS_task.png">
   </div>

   OLBPNet Overview:

   ![Image](https://github.com/MathLee/OLBPNet4PFOS/blob/main/Images/Network_Overview.png)


# Testing
1. Install and compile the caffe according to our previous work [CFPS](https://github.com/MathLee/CFPS) or [original Amulet](https://github.com/Pchank/caffe-sal). 
2. Download the [trained model](https://pan.baidu.com/s/1XRcb1myPo4IryAPaiQ0QSg) (code: evk9) (`FDMAttBlock_iter_30000.caffemodel`), and put it under `models/OLBPNet/`.
3. Put the PFOS testing set under `models/OLBPNet/PFOS/test/`.
4. The measure code is under `matlab/OLBPNet_test/`, run `matlab/OLBPNet_test/test_model.m`.
5. Results of PFOS testing set are under `models/OLBPNet/PFOS/binary_test/`.
6. The measure code is under `matlab/OLBPNet_test/Measure_all_FDM.m`.


# Results on PFOS Testing Set
   We provide [results](https://pan.baidu.com/s/1cAyuMRWbcBdswegHdHdnEg) (code: jios) of the compared 17 methods and our method on PFOS testing set.


# Performance

   ![Image](https://github.com/MathLee/OLBPNet4PFOS/blob/main/Images/Performance.png)
   
   
# Related works on this task 
   (**NEUCOM_2019_CFPS**) [Constrained Fixation Point based Segmentation via Deep Neural Network](https://github.com/MathLee/CFPS).



# Citation
        @ARTICLE{Li_2021_OLBP,
                author = {Gongyang Li and Zhi Liu and Ran Shi and Zheng Hu and Weijie Wei and Yong Wu and Mengke Huang and Haibin Ling},
                title = {Personal Fixations-Based Object Segmentation With Object Localization and Boundary Preservation},
                journal = {IEEE Transactions on Image Processing},
                volume = {30},
                pages = {1461-1475},
                year = {2021}}


If you encounter any problems with the code, want to report bugs, etc.

Please contact me at lllmiemie@163.com or ligongyang@shu.edu.cn.
