Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4606552B57
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jun 2022 08:56:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3Xnn-0001MK-6R; Tue, 21 Jun 2022 06:55:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o3Xnm-0001ME-7r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jun 2022 06:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lrtTaXmDH4j2G9DmDgYy3Hx6WoOoJlaM6bssxvYmN/s=; b=eXqEwG+ugZfl4bRPi5X6ifslNb
 QOjb9U/3/lcBOlcVtxBgWTLaBrhe93L/aNPv5M485qcNEgHjc96YXHRrqQz/Am3TgOFisXIcGsEsZ
 B7hf7+LDhhGujNiJLvdm45gXYJ06eYJXeKBCFqKHkviLDXJrKs0kqQZAlCkF+WIwbEXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lrtTaXmDH4j2G9DmDgYy3Hx6WoOoJlaM6bssxvYmN/s=; b=k
 +5fcd0tgb/PG7i+cRIvhytjfvxvJPyntjAr0qcT9+74GMdUl/SVCVsBKkdbSMee5AhtvnR8Iz+x8n
 +mWdYlyfdWvnJVbmUQYmaxXqAX94xwp2UsPa8J/CWykhP7ZLM6jIhLL2Gr2bDn2hxpSMcE4mb/kZT
 BJcvCziieEJUlJpE=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o3Xni-00966H-OO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jun 2022 06:55:54 +0000
Received: by mail-pl1-f176.google.com with SMTP id i15so11707674plr.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jun 2022 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrtTaXmDH4j2G9DmDgYy3Hx6WoOoJlaM6bssxvYmN/s=;
 b=U/6RCn5/rnlCWPEvZmw/CvlDBd7e7AuS8iDEETwq+hrEH+sdjwYLrsXxea6i48NMrs
 Us2vRiB6BQRD8MOtGP7RS1KLIB0GU00JbD87+Fsk0BkmrLxxQE2R+0IGo6HfLaVl+15w
 W7ol69OS3VwQEgHJMGDwVjZQRkVm0tr6EuTz/OKifAyh1KsRlHB5EOEZ0GEz8LnAvNws
 u2fDrLpN2sOA/dvHcR7+7241kVt3vpHpYnIGGxKY3rJrpYM7iVwImg6BZfwrAxtSnM9m
 YBqRn5/b8rdrdidYVsr2xvfc/2grb8CTwV39h0O3LDATqjVDB6UMoNNWTgVTSM1Pc48v
 5Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrtTaXmDH4j2G9DmDgYy3Hx6WoOoJlaM6bssxvYmN/s=;
 b=xHy2VbKBWfDJ4JVKEzd+QGjvftIL5b9MHhrrIjJAePCIiqWdtqIFaNFZ3n8lnBwZ81
 jEXsApbelcpUzM19sv+6RasmfJKVcq2xS7Ys2mvBC2BRE2xmjPFsgOxWk5wzfRh0Xzz0
 jghWQop0J+Nc4kX2H6X5mbsUlD0ikfIllOdBYernICQYL1XE5Skv4quJBA8HGHC+2VIt
 /OVgOiD2f5v0/Y4YpJyEzxwA7qakLSj0uT+vSvMbEkfL5HVfJ7hfvph2kQ5Ln5TBWO42
 J+CBQP0BzcD/EwO5B15RsNB4W8ktX4/aX17kPVxXzpno+vqOo9xk5eIn9BErQGvDH4S6
 semw==
X-Gm-Message-State: AJIora9Tw3IPywBfw13jztnY42rA9D6ieQo0oglW5QwNyArhYXlHZx5o
 u8OKsNZwnD3TJVTmJZJAh2k=
X-Google-Smtp-Source: AGRyM1sbObkSlzAr84nXXCiR0sZIUcKAWYxHwt27RpCXoFi8PVJJ46244mVxNRT+sShWIgXpygECKQ==
X-Received: by 2002:a17:902:d2d0:b0:168:b0b2:f068 with SMTP id
 n16-20020a170902d2d000b00168b0b2f068mr26766089plc.45.1655794545155; 
 Mon, 20 Jun 2022 23:55:45 -0700 (PDT)
Received: from localhost.localdomain ([156.236.96.165])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a1709028eca00b0016368840c41sm8230471plo.14.2022.06.20.23.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 23:55:43 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 21 Jun 2022 14:48:33 +0800
Message-Id: <20220621064833.1079383-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Liu If the inode has the compress flag, it will
 fail to use 'chattr -c +m' to remove its compress flag and tag no compress
 flag. However, the same command will be successful when executed again, as
 shown [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o3Xni-00966H-OO
Subject: [f2fs-dev] [PATCH] f2fs: fix to remove F2FS_COMPR_FL and tag
 F2FS_NOCOMP_FL at the same time
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Liu <liuchao@coolpad.com>

If the inode has the compress flag, it will fail to use
'chattr -c +m' to remove its compress flag and tag no compress flag.
However, the same command will be successful when executed again,
as shown below:

  $ touch foo.txt
  $ chattr +c foo.txt
  $ chattr -c +m foo.txt
  chattr: Invalid argument while setting flags on foo.txt
  $ chattr -c +m foo.txt
  $ f2fs_io getflags foo.txt
  get a flag on foo.txt ret=0, flags=nocompression,inline_data

Fix this by removing some checks in f2fs_setflags_common()
that do not affect the original logic. I go through all the
possible scenarios, and the results are as follows. Bold is
the only thing that has changed.

+---------------+-----------+-----------+----------+
|               |            file flags            |
+ command       +-----------+-----------+----------+
|               | no flag   | compr     | nocompr  |
+---------------+-----------+-----------+----------+
| chattr +c     | compr     | compr     | -EINVAL  |
| chattr -c     | no flag   | no flag   | nocompr  |
| chattr +m     | nocompr   | -EINVAL   | nocompr  |
| chattr -m     | no flag   | compr     | no flag  |
| chattr +c +m  | -EINVAL   | -EINVAL   | -EINVAL  |
| chattr +c -m  | compr     | compr     | compr    |
| chattr -c +m  | nocompr   | *nocompr* | nocompr  |
| chattr -c -m  | no flag   | no flag   | no flag  |
+---------------+-----------+-----------+----------+

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Liu <liuchao@coolpad.com>
---

This patch depends on the the patch
"f2fs: allow compression of files without blocks" sent earlier this day.

 fs/f2fs/file.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index daaa0dfd2d2e..0c3ae5993b7a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1873,10 +1873,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		if (masked_flags & F2FS_COMPR_FL) {
 			if (!f2fs_disable_compressed_file(inode))
 				return -EINVAL;
-		}
-		if (iflags & F2FS_NOCOMP_FL)
-			return -EINVAL;
-		if (iflags & F2FS_COMPR_FL) {
+		} else {
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
 			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
@@ -1885,10 +1882,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			set_compress_context(inode);
 		}
 	}
-	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
-		if (masked_flags & F2FS_COMPR_FL)
-			return -EINVAL;
-	}

 	fi->i_flags = iflags | (fi->i_flags & ~mask);
 	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
--
2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
