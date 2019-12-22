package com.itany.zshop.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Controller
@RequestMapping("/backend/code")
public class CodeController {

    @RequestMapping("/image")
    public void image(HttpServletRequest request, HttpServletResponse response)throws UnsupportedEncodingException , IOException {
        request.setCharacterEncoding("utf-8");

        BufferedImage bfi=new BufferedImage(80,25,BufferedImage.TYPE_INT_RGB);
        Graphics g=bfi.getGraphics();
        g.fillRect(0,0,80,25);

        char[] ch="0123456789".toCharArray();
        Random r=new Random();
        int index;
        StringBuffer sb=new StringBuffer();//保存字符串
        for (int i=0;i<4;i++){
            index=r.nextInt(ch.length);
            g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
            g.setFont(new Font("宋体",30,20));
            g.drawString(ch[index]+"",(i*20)+2,23);
            sb.append(ch[index]);
        }
        //添加干扰点
        int area=(int)(0.02*60*25);
        for (int i=0;i<area;i++){
            int x=(int)(Math.random()*80);
            int y=(int)(Math.random()*25);
            bfi.setRGB(x,y,(int)(Math.random()*255));
        }
        //设置验证码中干扰线
        for (int i=0;i<3;i++){
            int xstart=(int)(Math.random()*80);
            int ystart=(int)(Math.random()*25);
            int xend=(int)(Math.random()*80);
            int yend=(int)(Math.random()*25);
            g.setColor(interLine(1,255));
            g.drawLine(xstart,ystart,xend,yend);
        }
        HttpSession session=request.getSession();
        session.setAttribute("verificationCode",sb.toString());//保存到session
        ImageIO.write(bfi, "JPG", response.getOutputStream());//写到输出流
    }
    @RequestMapping("/checkCode")
    @ResponseBody
    public boolean checkCode(String code,HttpSession session){
        String verificationCode=(String)session.getAttribute("verificationCode");
        for (int i=0;i<verificationCode.length();i++){
            String AA=code.substring(i,i+1),BB=verificationCode.substring(i,i+1);
            if (AA.equals(BB.toLowerCase())||AA.equals(BB.toUpperCase()))
                continue;
            else
                return false;
        }
        return true;
    }
    private static  Color interLine(int low,int high){
        if (low>255)
            low=255;
        if (high>255)
            high=255;
        if (low<0)
            low=0;
        if (high<0)
            high=0;
        int interval=high-low;
        int r=low+(int)Math.random()*interval;
        int g=low+(int)Math.random()*interval;
        int b=low+(int)Math.random()*interval;
        return new Color(r,g,b);
    }
}
