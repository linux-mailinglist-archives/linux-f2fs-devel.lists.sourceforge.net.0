Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D826569E4E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jul 2022 11:11:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o9NXy-0004ZA-Jn; Thu, 07 Jul 2022 09:11:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o9NXy-0004Z4-8d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jul 2022 09:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLwmhSdpdM0C2SVR68sGMkumfQBnYqE+SwvxgblZSQI=; b=fX20g3v7z209WWVG7fwuiv1uDo
 +0cEJh+1kX43D9g8yekNO6iTCXOe7K2GELXB292IfWl3N/qn7IUirGLOTCV+QtCBNKCQSMuNkdGmv
 yUtvRxBAmq16HTZmrm+z37XVSBW7FL4yx5l+/F6JoPdetiP9+A6MXAhpp2Uh29l3BbFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rLwmhSdpdM0C2SVR68sGMkumfQBnYqE+SwvxgblZSQI=; b=F
 ikMtebPb8g3gMjqWvtNryEI9UtHwMaAPXzV6JQ3I71n2jpDAyWzTyPTxde6ovdrIvWvVXE2JKZFTG
 lf2Okm4oL70jFptKhqXt+W8mSPd+SXVfhiy8ZVrFW3EcaZm3m/RyOhUrPHhco2DWME/vYOIxBAdZY
 6dhLd32l6y0asIe4=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o9NXw-0000Wh-Cn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jul 2022 09:11:40 +0000
Received: by mail-pf1-f180.google.com with SMTP id j3so5501709pfb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Jul 2022 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLwmhSdpdM0C2SVR68sGMkumfQBnYqE+SwvxgblZSQI=;
 b=Ht68Liz/PdKg9Ry0GeqLbp2oQCcabi48+LILOgsPbOxMLrLNZ2oi07LBiAGB82ZTu8
 pgWiMu6T+6H7vmy3j4gbQ9bxxbq26fco8Z2Vd/VVo3BfSUf+U7BkTBAcY63cQPvQqSIj
 7nEh8qwkng2wdUG/xIbq3AWa0Co1kd24lKfq+AOUTMR8/mW9LyF6cyMXxdo57Hjys6Gq
 JqyrBdPjyMUW1Vc0s7+sIiHGMM8z6e5zHpdTTRpsQFRPPftmdQTKKn1uNyTkZKJE8rfK
 cHrYk7TEWI8Yun0/8p5X8oQob/Tjdxk8oJOj3fcbFZQzEtlGX4yZYh31NbK7DcMKxM7k
 da4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLwmhSdpdM0C2SVR68sGMkumfQBnYqE+SwvxgblZSQI=;
 b=8LrVLq49Xn+RQ/MJpUo73Kng8MhAa5JPIxTdbYrNmkfelxG3pzu3OntGE1zo8zaHuJ
 LfRA5E+ujqld9zqRLXKAo+LrY6jv1QKdBG3oxAwWvPvedYOuC12BDxZ5Q3Xq7JanM77s
 RUsGkrrUZpnVLymmuOd4sTAwDEIr9w7ik3qMl5+Ag6ipNMHIR18qumooKx+X1sL67LFb
 DmQo1UbXQnL+2yvIaV3mfO0m9kiyHJTGYpfB3RzANeAUG0ro3uhnXbtj485MZniQJ9HE
 xiyrJECeYPrtmiHG6lLAarQK4McpbGf+jbG7MR8KNnUr1pkBh8btB2OEgXj89+jfk9jv
 mf+g==
X-Gm-Message-State: AJIora8NWRUePpvVbUfXI2cNvdQnwGlJZGumzjyd8pqhHuYfjwf9cC43
 F5FQpp8whut5msZFI9P6lVY=
X-Google-Smtp-Source: AGRyM1vbSbhepsSwLUQImCVGxM/MHJn8HE8BrF2aXTsRMMIPVGnwRPzoKRTvrhNWq7cjprjGU4/Ufw==
X-Received: by 2002:a17:902:e5c3:b0:16a:67e7:d999 with SMTP id
 u3-20020a170902e5c300b0016a67e7d999mr49837459plf.32.1657185094633; 
 Thu, 07 Jul 2022 02:11:34 -0700 (PDT)
Received: from localhost.localdomain ([156.236.96.165])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a17090a34c700b001ef8dd1315esm7788617pjf.27.2022.07.07.02.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 02:11:34 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  7 Jul 2022 17:09:24 +0800
Message-Id: <20220707090924.4183376-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Liu Files created by truncate(1) have a size but
 no blocks, so they can be allowed to enable compression. Signed-off-by: Chao
 Liu --- v2: - update commit message: truncate -> truncate(1) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o9NXw-0000Wh-Cn
Subject: [f2fs-dev] [PATCH v2] f2fs: allow compression of files without
 blocks
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

Files created by truncate(1) have a size but no blocks, so
they can be allowed to enable compression.

Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
v2:
 - update commit message: truncate -> truncate(1)

 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0f29af7876a6..f7a82858486a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1879,7 +1879,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		if (iflags & F2FS_COMPR_FL) {
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
-			if (S_ISREG(inode->i_mode) && inode->i_size)
+			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
 				return -EINVAL;

 			set_compress_context(inode);
--
2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
