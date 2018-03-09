# photo-realistic single image super-resolution using a generative adversarial network

## abstract
SRGAN: Generative Adversarial Network for Super-Resolution

## introduction
使用ResNet及skip connection结构
贡献
1. 提出SRResNet，在PSNR及SSIM指标下，有了新的提高
2. 提出SRGAN，新的perceptual loss

## method
训练数据是高分辨率、低分辨率图像对，低分辨率图像由高分辨率图像高斯平滑后降采样得到。
### adversarial network architecture
交替训练Generator，Discriminator？
- $G_{\theta_G}$ generator network  
使用ResBlock，使用PReLU，使用sub-pixel 卷积来提高分辨率。
pixelShuffler？
- $D_{\theta_D}$ discrinminator network  
使用LeakyReLU($\alpha=0.2$)，
### perceptual loss
> $$perceptual\_loss=content\_loss + adversarial\_loss$$
- content loss  
经常是MSE损失，但是该损失并不注重图像的高频上的差异。这里是VGG loss。
- adversarial loss  

## experiments

## discussion and future work

## conclusion

## tips
- SISR: single image super-resolution
- PSNR: peak signal-to-noise ratio，峰值信噪比(单位为dB)
- SSIM: structural similarity