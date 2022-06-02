Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD253B44C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jun 2022 09:25:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwfCy-0007lr-IW; Thu, 02 Jun 2022 07:25:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1nwfCy-0007ll-5z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 07:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8s3LJw5xicbUhVaH0XHYNaSTkuhFS4Q1fnoIihiiOA=; b=afdf6RUv3HjtCC3oH7cSnsR4jd
 ar7c9HupzQoztSMBI3eFjMiG3lPpKHf557izsHJOpIfUPA6X/HKitNa9b4atM54Q3eTDojHSpEKFH
 BiH1++ZAy/+l2vTl5QhqhwqLE92TWXnggAPJqtrtCd6g3IpPXDsBpkibuNHcK52B7YHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L8s3LJw5xicbUhVaH0XHYNaSTkuhFS4Q1fnoIihiiOA=; b=g
 yG3iwBJrai+9/UKU+L8nBQsfVnKe9UpxOEMCxRs0J3m41DgZG0Ue/Bc9zuN2ba5rmkrDFxSSe+QxV
 9FWX4peHykjA7vDZ/0Yqp4Kv042Ad7rIOseeqHD53f8T3MVeUz69lRE2beQQ7nBrbPvAJc21W25qA
 ydpcEoGV57QK+Cao=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nwfCu-001oGH-7m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 07:25:28 +0000
Received: by mail-pf1-f175.google.com with SMTP id w21so4087488pfc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jun 2022 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8s3LJw5xicbUhVaH0XHYNaSTkuhFS4Q1fnoIihiiOA=;
 b=PpUcfnTeCjQJpRRld4d2NkaZOQ+giQuHJCn1hzgzAqhdn6283vgJycubVJLHBz7MeO
 gpk/zLenJxp9+0MjyREOYZrTUaH4ZO3CsgN4B/2kYGrIj6WtCgBd5Vxj0NprmFh3iOOe
 qqRccxugpbcmvhBLur+sbcAxdL9UkwfInmnoeaMIK2j9IL2G1v/EK4XC0099v5nGhbkY
 /2oUDiJzag2krbBJswpFIJ3ox1IVAQFwEzgpbd8EIB6GMv/imk1bfRNdh4pLljzCnbL8
 FDMiOweeEvMn8jEeguFjd4Y2npkd0rr0Xc5o3TwFXpAyvU45XvDEGAVctirlyucvMIvv
 M6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L8s3LJw5xicbUhVaH0XHYNaSTkuhFS4Q1fnoIihiiOA=;
 b=lyYLPUlCKncMACt7Yqj6fqSjM6LqG20PQywADgeJLZx5qk8tcneeBIO7ixtgS6dh//
 oZ87v5DhP9zijGNw/a6TVPUDBrBrzrGeoKEKHkXZLu6gxxFFTozo+pGpls01oXsd22gB
 OSmTgGoCYOniH4IR99vmTxaI6FjN9gJplV5EXf+1bjOtHAWUZP3gOTTd5Sm/Ob3G9UIA
 33wINi66h6toX6GqM1Nv54TSwpkaNKC0IhA2RPrCeOTuIPtI6XbLMbPs5uipu3dAPNBL
 onOdCkFYaIXYo6f9BketwOoJSwDBvRC7B6mVVkpNjFDx8/Uhp9VqbEP6vRMhUHARuaJc
 Hkxw==
X-Gm-Message-State: AOAM533YBaSO0mVrsE3zvFZ2gAYBwqRonYTKw5glzu7YLmTEdfiR1fL4
 ITga031G5ckUB9eHWg2XtcvFa8khF3cB3czWi0U=
X-Google-Smtp-Source: ABdhPJzF76sBp7B+RevVSJ6GLP6kQU1DDA5WxDEyBKWr3d793qldOtmxxXG4GU+oPlNcprYzx09L2g==
X-Received: by 2002:a63:e60e:0:b0:3fc:7753:ed89 with SMTP id
 g14-20020a63e60e000000b003fc7753ed89mr3032900pgh.70.1654154718717; 
 Thu, 02 Jun 2022 00:25:18 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001637997d0d4sm2725018plw.206.2022.06.02.00.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:25:18 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  2 Jun 2022 15:24:49 +0800
Message-Id: <20220602072449.998303-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Liu Currently, we use f2fs_has_inline_xattr() to
 check whether the inode can store inline xattr. However,
 it might be misinterpreted
 as the inode has at least one inline xattr. The same is true for
 f2fs_has_inline_data()
 and f2fs_has_inline_dentry(). To be more intuitive and specific,
 refine comments of inline flags. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nwfCu-001oGH-7m
Subject: [f2fs-dev] [PATCH] f2fs: refine comments for inline flags
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Chao Liu <liuchao@coolpad.com>, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Liu <liuchao@coolpad.com>

Currently, we use f2fs_has_inline_xattr() to check whether the
inode can store inline xattr. However, it might be misinterpreted
as the inode has at least one inline xattr.

The same is true for f2fs_has_inline_data() and
f2fs_has_inline_dentry(). To be more intuitive and specific,
refine comments of inline flags.

Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
 fs/f2fs/f2fs.h          | 6 +++---
 include/linux/f2fs_fs.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e10838879538..e0205d42588d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -730,9 +730,9 @@ enum {
 	FI_NO_ALLOC,		/* should not allocate any blocks */
 	FI_FREE_NID,		/* free allocated nide */
 	FI_NO_EXTENT,		/* not to use the extent cache */
-	FI_INLINE_XATTR,	/* used for inline xattr */
-	FI_INLINE_DATA,		/* used for inline data*/
-	FI_INLINE_DENTRY,	/* used for inline dentry */
+	FI_INLINE_XATTR,	/* inode can store inline xattr */
+	FI_INLINE_DATA,		/* inode can store inline data */
+	FI_INLINE_DENTRY,	/* inode can store inline dentry */
 	FI_APPEND_WRITE,	/* inode has appended data */
 	FI_UPDATE_WRITE,	/* inode has in-place-update data */
 	FI_NEED_IPU,		/* used for ipu per file */
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index d445150c5350..a3c6750a66ae 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -223,9 +223,9 @@ struct f2fs_extent {
 #define	NODE_IND2_BLOCK		(DEF_ADDRS_PER_INODE + 4)
 #define	NODE_DIND_BLOCK		(DEF_ADDRS_PER_INODE + 5)
 
-#define F2FS_INLINE_XATTR	0x01	/* file inline xattr flag */
-#define F2FS_INLINE_DATA	0x02	/* file inline data flag */
-#define F2FS_INLINE_DENTRY	0x04	/* file inline dentry flag */
+#define F2FS_INLINE_XATTR	0x01	/* file can store inline xattr */
+#define F2FS_INLINE_DATA	0x02	/* file can store inline data */
+#define F2FS_INLINE_DENTRY	0x04	/* file can store inline dentry */
 #define F2FS_DATA_EXIST		0x08	/* file inline data exist flag */
 #define F2FS_INLINE_DOTS	0x10	/* file having implicit dot dentries */
 #define F2FS_EXTRA_ATTR		0x20	/* file having extra attribute */
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
