/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云rds
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : rm-uf6431u6v7t3223q0bo.mysql.rds.aliyuncs.com:3306
 Source Schema         : vueblog

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 23/07/2021 12:23:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
INSERT INTO `m_blog` VALUES (1, 1, 'Hello World', '记录我的刷题日常，分享学习心得。', '### 本站初衷\n记录我的刷题日常，分享学习心得。\n\n本网站目前可以手把手带你解决 150 道 LeetCode 算法问题，而且在不断更新，全部基于 LeetCode 的题目，涵盖了所有题型和技巧。', '2021-07-21 21:39:32', 0);
INSERT INTO `m_blog` VALUES (18, 1, '567.字符串的排列', '给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列', '## 题目\n\n给定两个字符串 **s1** 和 **s2**，写一个函数来判断**s2**是否包含**s1**的排列。\n换句话说，第一个字符串的排列之一是第二个字符串的子串 。\n\n[![WwGtiV.png](https://z3.ax1x.com/2021/07/21/WwGtiV.png)](https://imgtu.com/i/WwGtiV)\n\n## 思路\n\n还是一个滑动窗口题，我们对 s2 字符串进行滑动窗口，窗口大小为 s1 字符串的长度。在 s2 中以 s1 字符串长度为窗口大小向右滑动，每次滑动判断 s1 和 s2 中的字符个数是否相等（排列不会改变字符个数），相等则 True，反之亦然。\n\n## 代码\n\n```cpp\nclass Solution {\n    public boolean checkInclusion(String s1, String s2) {\n        int n = s1.length(),m = s2.length();\n        // s2不可能包含s1\n        if(n > m) return false;		\n        int [] c1 = new int[26];\n        int [] c2 = new int[26];\n        // 确定滑动区间大小\n        for(int i=0 ; i<n ;i++){\n            c1[s1.charAt(i) - \'a\']++;\n            c2[s2.charAt(i) - \'a\']++;\n        }\n        // 特判\n        if(Arrays.equals(c1, c2)) return true;\n        // 向右滑滑滑！\n        for(int i=n ; i<m ;i++){\n            c2[s2.charAt(i) - \'a\']++;   // 右指针字符加入\n            c2[s2.charAt(i-n) - \'a\']--; // 删除上个左指针字符\n            if(Arrays.equals(c1, c2)) return true;\n        }\n        return false;\n    }\n}\n```\n\n\n', '2021-07-21 22:15:26', 0);
INSERT INTO `m_blog` VALUES (19, 1, 'Latex入门级教程 ', 'LaTex入门级教程，将文章的排版以代码的形式呈现，符合程序员的审美和工作习惯', 'LaTex入门级教程，将文章的排版以代码的形式呈现，符合程序员的审美和工作习惯。\n\nLaTex下载地址：[清华大学镜像源2021版](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive2021.iso)\n\n**群①：974338156（未满）**\n\n### 1.Latex基本框架\n\n```latex\n% 导言区\n\\documentclass{article} % 支持book,report,letter\n\\title{My First Article}\n\\author{Xiner}\n\\date{\\today}	%\\today 取当前时间\n\n% 正文区\n\\begin{document}\n	\\maketitle\n	Content.\n\\end{document}\n```\n\n- Latex默认只支持**英文** ，要想使用中文，往下继续看哦！\n- %相当于注释\n\n![image-20210414164002106](https://i.loli.net/2021/04/14/piPL2VnatIRj1Or.png)\n\n### 2.Latex中文处理方法\n\n- 导入ctex包（自带，无需下载）\n\n  我们在导言区，加入以下代码。\n\n```latex\n\\usepackage{ctex}	% 加入中文包\n```\n\n- 编译器修改为 **XeLaTeX**  [我使用的是TeXworks，其他的软件类似]\n\n![image-20210414164935933](https://i.loli.net/2021/04/14/cvk5YfAjEICJ69b.png)\n\n 好的，现在我们可以插入中文啦！赶快来试试\n\n![image-20210414165143476](https://i.loli.net/2021/04/14/QqOTgKDaReCucf7.png)\n\n 大功告成，我溜了。。。QAQ\n\n### 3.Latex字体字号设置\n\n```latex\n% 字体族设置 \n\\textrm{罗马Apple} - \\textsf{无衬线Apple} -  \\texttt{打字机Apple}\n\n% 字体形状 \n\\textup{直立Apple} -  \\textit{斜体Apple} -  \\textsl{伪斜体Apple} -  \\textsc{小型大写Apple}\n\n% 中文字体\n\\songti{宋体} \\kaishu{楷书}\n\n% 字体大小\n\\tiny Hello\n\\scriptsize Hello\n\\footnotesize Hello\n\\small Hello\n\\normalsize Hello\n\\large Hello\n\\large Hello\n\\LARGE Hello\n\\huge Hello\n\\Huge Hello\n\n% 中文字号设置\n\\zihao{5} 你好！\n```\n\n 效果如下\n\n![image-20210414165740186](https://i.loli.net/2021/04/14/g7P6i9jWMCzXcKd.png)\n\n### 4.Latex文档结构\n\n- $\\section$创建小结\n- $\\subsection$创建子小结\n- 以此类推\n\n```latex\n	\\section{引言}\n	今年前面的这些日子，我利用上班之余的空挡时间，喜欢走走停停，寻山问水。或行走于溪谷，垂钓于江河；或漫步于山野，观草木泅渡于春秋。\n	人生天地间，当坦然面对生活给你的一切，好比站在北极点上的时候，任意跨出的一步都是南方。风吹日晒，虽然皮肤黝黑了一点，却精神饱满活力充沛，就像充电宝一样，时时不忘记充电。\n	\\section{实验结果}\n	\\subsection{数据}\n	\\subsubsection{实验条件}\n	\\subsubsection{实验过程}\n	\\section{结论}\n```\n\n![image-20210414175458684](https://i.loli.net/2021/04/14/qnVdN91Dt3sybao.png)\n\n- $\\tableofcontentss$生成目录\n\n```latex\n	\\tableofcontents\n	\\section{引言}\n	\\section{实验结果}\n	\\subsection{实验条件}\n	\\subsection{实验过程}\n	\\section{结论}\n```\n\n![image-20210414181714250](https://i.loli.net/2021/04/14/Xj1d5FGcPorqQiU.png)\n\n### 5.Latex特殊字符\n\n```latex\n	\\section{空格字符}\n	Are you love me?\n	\n	\\section{\\LaTeX 控制符}\n	\\# \\$ \\% \\{ \\} \\~{} \\_{} \\^{} \\textbackslash\n\n	\\section{排版符号}\n	\\S \\P \\dag \\ddag \\copyright \\pounds\n\n	\\section{\\TeX 标志符号}\n	\\TeX{} \\LaTeX{} \\LaTeXe{}\n	\n	\\section{引号}\n	`Hello\' ``Hello\'\'\n\n	\\section{连字符}\n	- -- ---\n\n	\\section{非英文字符}\n	\\oe \\OE \\ae \\AE \\aa \\AA \\o \\O \\l \\L \\ss \\SS !`?`\n```\n\n![image-20210414203901605](https://i.loli.net/2021/04/14/D7w1mCLITy6OSpY.png)![image-20210414203915638](https://i.loli.net/2021/04/14/Sk36TzpiQJZdmgD.png)\n\n### 6.Latex插图\n\n- 导入graphicx包\n\n  ```latex\n  \\usepackage{graphicx}  % 导包\n  \\graphicspath{{img/}}  % 设置图片路径\n  ```\n\n- 导入图片\n\n  ```latex\n  LaTex的插图:\\\\			% \\\\用来换行\n  \\includegraphics{xiao}		% 图片路径 img/xiao.eps\n  ```\n\n  ![image-20210414210419118](https://i.loli.net/2021/04/14/mwTZvHPJzEKsDq7.png)\n\n- 可选参数\n\n  - 缩放\n\n    ```latex\n    \\includegraphics[scale=0.3]{xiao}  % 原图缩放原始30%\n    ```\n\n  - 高度、宽度\n\n    ```latex\n    \\includegraphics[height=2cm]{xiao}   % 原图高度2cm\\includegraphics[width=5cm]{xiao}    % 原图宽度5cm\n    ```\n\n  - 旋转\n\n    ```latex\n    \\includegraphics[angle=45]{xiao}    % 原图顺时针旋转45°\n    ```\n\n### 7.Latex表格\n\n```latex\n	\\begin{tabular}{ | l | c | c | c | r |}  % {填写对齐方式l、c、r} , | 代表显示列线	\\hline		% 显示行线	姓名 & 高数 & 英语 & 计网 & 数据库 \\\\	\\hline	Xiner & 100 & 100 & 100 & 100 \\\\	\\hline	Hert & 85 & 90 & 74 & 44 \\\\	\\hline 	Pop & 99 & 47 & 77 & 25 \\\\	\\hline	\\end{tabular}\n```\n\n![image-20210414211452222](https://i.loli.net/2021/04/14/ZKs3zvw4jHEnPAR.png)\n\n### 8.Latex浮动体\n\n 当我们一起使用图片和表格，可能是这样的。\n\n```latex\n	插图:\\\\				\\includegraphics{peo}		% 图片	成绩:	\\begin{tabular}{ | l | c | c | c | r |}  	% 表格	\\hline			姓名 & 高数 & 英语 & 计网 & 数据库 \\\\	\\hline	Xiner & 100 & 100 & 100 & 100 \\\\	\\hline	Hert & 85 & 90 & 74 & 44 \\\\	\\hline 	Pop & 99 & 47 & 77 & 25 \\\\	\\hline	\\end{tabular}\n```\n\n![image-20210414212313141](https://i.loli.net/2021/04/14/dUyKPbDn3kuf6jW.png)\n\n 可是想想平时做的试卷，是不是图片放在一起，文字放在一起呢？\n\n 那么如何做呢，这就要用到神奇的**浮动体**。\n\n```latex\n	第一题:请问图片中的人物是谁？	\\begin{figure}					% 浮动体		\\centering  % 居中		\\includegraphics{peo}		\\caption{蜡笔小新}	% 插图标题	\\end{figure}	第二题:谁的成绩最高？	\\begin{table}					% 浮动体		\\centering 		\\begin{tabular}{ | l | c | c | c | r |} 		\\hline		姓名 & 高数 & 英语 & 计网 & 数据库 \\\\		\\hline		Xiner & 100 & 100 & 100 & 100 \\\\		\\hline		Hert & 85 & 90 & 74 & 44 \\\\		\\hline 		Pop & 99 & 47 & 77 & 25 \\\\		\\hline		\\end{tabular}		\\caption{成绩单}		% 表格标题	\\end{table}\n```\n\n![image-20210414213158635](https://i.loli.net/2021/04/14/9xXFC8uMv6O3ncd.png)\n\n 是不是有那味了？数学试卷的排版，图文并茂的数学题就是这么来的！\n\n### 9.Latex数学公式初步\n\n```latex\n\\section{上标}   \n$7x^4 + 2x + 1 = 0$  $3x^{20} + x - 1 = 0$\n\n\\section{下标}\n$O_2 , H_2 , a_1 , a_2 ,...,a_{100} $\n\n\\section{希腊字母}\n$\\alpha$ $\\beta$ $\\gamma$ $\\epsilon$ $\\pi$ $\\Delta$ $\\Theta$\n\n\\section{数学函数}\n$\\log$ $\\sin$ $\\cos$ $\\arcsin$ $\\arccos$ $\\tan$ $\\ln$ \n$\\sin^2 + \\cos^2 = 1$\n\n\\section{分式}\n$\\frac{x^2}{x^2+1}$\n\n\\section{行间公式}\n$$7x^4 + 2x + 1 = 0$$\n```\n\n![image-20210414231759647](https://i.loli.net/2021/04/14/JMICsNqSGdXaDUe.png)![image-20210414231923054](https://i.loli.net/2021/04/14/EBVTit5FK39dnsO.png)\n\n', '2021-07-21 22:23:57', 0);
INSERT INTO `m_blog` VALUES (20, 1, 'Hello 丁润东', '无', '小呆批', '2021-07-21 22:31:14', 0);

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, 'asugar', 'e10adc3949ba59abbe56e057f20f883e', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', 0, '2021-07-20 18:11:32', '2021-07-20 18:11:36', '987599519@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
