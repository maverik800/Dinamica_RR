function YtY = RR_regressor_YtY(a_1,a_2,w_1,w_2,t,gy)
%RR_REGRESSOR_YTY
%    YTY = RR_REGRESSOR_YTY(A_1,A_2,GY,T,W_1,W_2)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    26-May-2020 13:03:14

t2 = t.*w_1;
t3 = t.*w_2;
t4 = a_1.^2;
t5 = a_2.^2;
t6 = w_1.^2;
t7 = w_2.^2;
t8 = cos(t2);
t9 = cos(t3);
t10 = sin(t2);
t11 = sin(t3);
t12 = t8.^2;
t13 = t9.^2;
t14 = a_1.*t10;
t15 = a_2.*t11;
t18 = a_1.*t8.*w_1;
t19 = a_2.*t9.*w_2;
t16 = cos(t14);
t17 = cos(t15);
t20 = sin(t15);
t24 = t6.*t14;
t25 = t7.*t15;
t38 = t14+t15;
t40 = t18+t19;
t21 = t17.*2.0;
t22 = t17+1.0;
t26 = gy.*t16;
t27 = t24.*2.0;
t28 = t24.*3.0;
t29 = t24.*4.0;
t30 = t25.*2.0;
t31 = t25.*4.0;
t32 = -t24;
t34 = -t25;
t39 = cos(t38);
t41 = t17.*t25;
t51 = t24+t25;
t52 = t18.*t19.*t20;
t56 = t4.*t6.*t12.*t20;
t57 = t5.*t7.*t13.*t20;
t63 = t19.*t20.*t40;
t23 = t22+1.0;
t33 = -t27;
t35 = -t30;
t36 = t21+2.0;
t37 = -t26;
t42 = gy.*t39;
t43 = t17.*t28;
t47 = t22.*t24;
t49 = t22.*t25;
t53 = t22.*t32;
t58 = t26+t32;
t60 = t52.*2.0;
t61 = -t56;
t62 = t24.*t51;
t44 = t42.*2.0;
t45 = -t42;
t48 = t23.*t24;
t50 = t23.*t25;
t54 = t23.*t32;
t55 = t24.*t36;
t59 = t26+t33;
t64 = t32.*(t24+t37);
t66 = t24.*(t24+t37);
t68 = -t51.*(t24+t37);
t71 = t51.*(t24+t37);
t73 = t34+t42+t53+t56;
t46 = -t44;
t65 = t24.*t59;
t67 = t32.*t59;
t69 = t51.*t59;
t70 = -t59.*(t24+t37);
t74 = t35+t42+t54+t56;
t75 = t45+t50+t52+t55+t63;
t77 = t37+t45+t49+t52+t55+t63;
t84 = (t25+t45+t47+t61).*(t30+t45+t48+t61);
t72 = -t69;
t76 = t24.*t75;
t78 = t24.*t77;
t79 = -t75.*(t24+t37);
t80 = t59.*t75;
t81 = t75.*(t24+t37);
t83 = t29+t31+t41+t43+t46+t57+t60+t61;
t85 = -t77.*(t24+t37);
t86 = t59.*t77;
t87 = t77.*(t24+t37);
t89 = t28+t30+t37+t41+t43+t46+t57+t60+t61;
t92 = t75.*t77;
t82 = -t80;
t88 = -t86;
t90 = t51.*t83;
t91 = t51.*t89;
t93 = t84+t92;
YtY = reshape([(t24+t37).^2,t70,t66,t87,t81,t71,t70,t59.^2,t67,t88,t82,t72,t66,t67,t4.*t6.^2.*t10.^2,t78,t76,t62,t87,t88,t78,(t25+t45+t47+t61).^2+t77.^2,t93,t91,t81,t82,t76,t93,(t30+t45+t48+t61).^2+t75.^2,t90,t71,t72,t62,t91,t90,t51.^2.*2.0],[6,6]);
