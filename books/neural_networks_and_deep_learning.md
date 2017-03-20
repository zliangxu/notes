---
layout: post
title:  "NNADL"
date:   2017-03-20 20:54:53 +0800
categories: jekyll update
---
neural networks and deep learning  Michael Nielsen  
book [draft online](http://neuralnetworksanddeeplearning.com/index.html)  
source [code](https://github.com/mnielsen/neural-networks-and-deep-learning)
```
In 2006, neural network surpass the traditional approaches by deep neural network what we call it today neural network;    
master a solid understanding of the core principles, such as, program language has syntax, libraries and data structures;
```
### using neural nets to recognize handwritten digits
key ideas, **build your neural networks intuition**
1. two important artificial neuron  
    perceptron  
    sigmoid neuron(modified perceptron that small changes in their weights and bias cause only a small change in their output)}
2. standard learning algorithm  
    stochastic gradient descent  

    
the architecture of neural networks
     input layer, input neuron, 
     hidden layer
     output layer
                    feedforward//前馈网络，指没有闭环，never feed back
     recurrent neural network//循环神经网络，loops 
a simple network to classify handwritten digits
     digits segmentation
     digits recognization//隐藏层的具体作用？？做实验
learning with gradient descent
     hand writen digits DataBase: http://yann.lecun.com/exdb/mnist/   
     cost function, mean squared error is a smooth function of weights and biases,so it is easier to   compute.
     gradient descent: 和一个球在山谷滚动类似，最后稳定在最低处。
     stochastic gradient descent
implementing our network to classify digits
     example codes and its usage
toward deep learning
deep learning (iran goodfellow and yoshua bengio, an MIT press book) 周志华赞
deep learning tutorial downloaded(by Yann LeCun and MarcAurello Ranzato Facebook) <deep learning>
LISA Deep Learning Tutorial PPT(by Yoshua Benglo LISA Lab) https://sites.google.com/site/deeplearningcvpr2014/
