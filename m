Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1E52D0B4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 12:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrdaX-0005Lo-SF; Thu, 19 May 2022 10:41:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1nrdaL-0005Ki-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 10:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVV1dRw9CXbITFRFAr38oo/Tg0GD/yZ0EddEdw7HELs=; b=HUrRnRc4tU8FZYx5XF2wrWV5kp
 c2DHvvvL8U3AcMzsXBp/ayBRhZ+DmDP4FpES7GX5l0HLqKcQUxLkJ0eLtxtkoZADR/n+Ku96QB3pW
 wyGqP+0KRoZRtDODJ2RewnuiXhU6enLP+mwadx34On5qYI4bzfl9JucLJodY3cWeO0b4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WVV1dRw9CXbITFRFAr38oo/Tg0GD/yZ0EddEdw7HELs=; b=S
 7bVjQFMNBrpLyXl0Mom5MWPDcFDX32aTVnEQ+LpP9oTF/bTmvuZH9d+Fe+hFV5mZ32JbYRuRdWG0B
 AN2pMea6xnaGLDtDHbe9NbMRTQl50fXkn99rtARw+kAsNs/ARazCZJnTsOL3Egm1cw6mLzg1pGd4p
 3qiUTwanIn0zmqi0=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nrdaI-008uw4-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 10:40:46 +0000
Received: by mail-pj1-f53.google.com with SMTP id ev18so4916675pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVV1dRw9CXbITFRFAr38oo/Tg0GD/yZ0EddEdw7HELs=;
 b=DNzH6HuorMvOBHr9yxuvuIHtguwSss2h0NhcB901IipyCSG56/vKC4VNhExwsp2ON9
 oyQmliTQlX6QGf7x/cxK6xqnlYnw2IYUTCk3SOmfeICpkwMBee4X/nb7wcDqzePpAB3e
 9ksi0hOqmzy94hGGJNkHHA5gXJoyzvkm1+sGY2xvDm/wSRuDYFRaNE5qc5krz+t2baW/
 VgMx1WomNaiQ7ANz4zFpald6ez5cwo0X+hnCWMd0/QplY5l08hNe/q5bWD++WztmhBlU
 ZcXQ2ReiWszZaGO40nJBTOQDhOnH1L1MfHvdcsqqYZ6T777/dREvW84pff5gm6ZIzYH+
 FxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVV1dRw9CXbITFRFAr38oo/Tg0GD/yZ0EddEdw7HELs=;
 b=NHFEkMDbWIiVG3EwAGiBDmSCNvPGVLM0Gk0GkLJ942QZSJaxb4pvZOz2Xorrw434vS
 xPFj/RbvgxrXiBWDERkVhPlNPbFWjZEvzkHoEN+OxGyxcXzxIS5cAKLjTyfNYGqOV07W
 K/vo7Af7eycYxe77zU+ZWUjCHJYTxXp0mcF3hxN6r3MObL/WWrJUlHE19+r4rskiMHT5
 KJgjDBDT7SuxP3oMfNDmN5wtpsqkfWqE6Avs028dxYJNwyAgni3AdY7P1enbIr+PJTC2
 n7rR+7KNMDXaWL9xsZkSqDkzFbP4BO3MPkwPvRfWdgpWKkbyvua3LqKdEbCPtf6TR/i2
 xcJg==
X-Gm-Message-State: AOAM533HS2sng3x2+FDbDqsK05/mX1HU1ziBFF7fchvKfhf3yZCVNwkG
 yn8pJbl//2LbIrCPmytysow=
X-Google-Smtp-Source: ABdhPJysKe/VP1x16Pzr+Zm4BdZErNEnX40uHqCKrSLKl2eQFnwpzGs8MuQ1zEpCuSeb/8MCl4xOdg==
X-Received: by 2002:a17:902:eb90:b0:15e:b55f:d9c5 with SMTP id
 q16-20020a170902eb9000b0015eb55fd9c5mr1986867plg.33.1652956840621; 
 Thu, 19 May 2022 03:40:40 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b00161527e1d9fsm3344206pli.294.2022.05.19.03.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 03:40:40 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 May 2022 18:40:10 +0800
Message-Id: <20220519104010.2814819-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Liu In f2fs_read_inline_data(), it is confused
 with checking of inline_data flag, as we checked it before calling. So this
 patch add some comments for f2fs_has_inline_data(). Signed-off-by: Chao Liu
 --- fs/f2fs/f2fs.h | 4 ++++ 1 file changed, 4 insertions(+) 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [103.220.76.197 listed in dnsbl-1.uceprotect.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nrdaI-008uw4-Ex
Subject: [f2fs-dev] [PATCH RESEND] f2fs: make f2fs_read_inline_data() more
 readable
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
Cc: Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Liu <liuchao@coolpad.com>

In f2fs_read_inline_data(), it is confused with checking of
inline_data flag, as we checked it before calling. So this
patch add some comments for f2fs_has_inline_data().

Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
 fs/f2fs/f2fs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f579e2ed0f14..5071f6636e41 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3167,6 +3167,10 @@ static inline int inline_xattr_size(struct inode *inode)
 	return 0;
 }
 
+/*
+ * Notice: check inline_data flag without inode page lock is unsafe.
+ * It could change at any time by f2fs_convert_inline_page().
+ */
 static inline int f2fs_has_inline_data(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_INLINE_DATA);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
