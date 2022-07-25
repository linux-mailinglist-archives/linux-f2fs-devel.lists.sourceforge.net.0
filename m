Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2557FD46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Jul 2022 12:19:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFvBj-0006iy-VS; Mon, 25 Jul 2022 10:19:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1oFvBY-0006iX-I1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 10:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h8vFO57HHWS7qwyEQBYh03ndUw4GyOD/NZFyb9S7lBc=; b=Wg+82fwVyfwyXEvujBCHWmEyWc
 ZeZl9b+qVvgBCcYbI+mXa3p1J4GvbAhzDqCSvTTk2CgtGhXkhUQ26B6JJJbg9UfvFMRd74C6or8RG
 kwrfOIm1SRt/AYu9XQ/MHRx2VkZGXsEQzq2+PmbcqHnpL5V6/S39VTX0cXgfftzdxLk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h8vFO57HHWS7qwyEQBYh03ndUw4GyOD/NZFyb9S7lBc=; b=I
 iJvGeX7AnCYtWZ4xIbf+fWlxRidXxzm7YAxfJz7qGCijhCfEGDjrnWrv7Kzlh5LALvF7ggog/LXch
 PYirUuH+CtDSyQXmrDit0BqPnTg+61DztvNt/PVMC0ND/j9W7N68poAlNgWrmQPAXbVxj/7tpHlET
 d/kxvxxepedPzW9U=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oFvBX-009j4R-Eq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 10:19:37 +0000
Received: by mail-pf1-f182.google.com with SMTP id b9so10011137pfp.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Jul 2022 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=h8vFO57HHWS7qwyEQBYh03ndUw4GyOD/NZFyb9S7lBc=;
 b=ibGbRhtFwGpqm+iND5PFg5YLbEgCzhQ5X2eUbHDyxR5NP+75nL1T+W53yQlvfNrBKw
 wGGL6uhic+9Cy1ev1n9wsmvjZ4CyMoO5HahttoLSmCdCyYpUML9PW4HFSO3njbJ1Jgyu
 VpfkfJMUzcw/9srk6aDtVyJ+/POs7wH+BT/ugwRm/dei12tOhnA1RiYHjYR+Xief+M2G
 SK7XPdZpTZoSYZN3fFfpfUBn5YOHypp6VTTkJbdpRjA/8C9/CYa6SuKFfVbXOaYwcz6X
 xLKZIDyMT7CR+7JflLHAHN7zr2I6s6tjvzinS6Rs4NtiYcKTWVWu8Km4WR2gmm3/mcxp
 7aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=h8vFO57HHWS7qwyEQBYh03ndUw4GyOD/NZFyb9S7lBc=;
 b=6MkQnRviJNsOeN0GNZVLBOzBUgno3pmXyu5d1jBR8aKou9epWxrN+Neir8/MSv0ICe
 8Aojk/a6lSn7dBEjTUg5i40M57i+yUGJvUEdXmK0dgiTWRknbduD5iSWOLFpUfXf+oQT
 JdWI9FfS8V3t+CnCsUpNdGmkZS+4P+NHIfQh4rsun6542lAG5vuiqW0knltldyhY4AhI
 84qcI+snSLUsTl0CgqU6uA8Na0XV7gu41VhGW/cE5n98trqGsQds4vDXJXtqkaER7GJD
 dMrQrkejO6quJIyLZkZWUpiq5jv6q9ck4Pv/7BD38IlRbHewAZzW1p0wV9ulvvsmp05I
 rsGw==
X-Gm-Message-State: AJIora8f7RhWOY0hAwV2H6uBnXqWhmfm+03Vq6b4cvoSZC4bs7Xi3a3O
 IN7JRinaPUu8wF2PSkOZRw4=
X-Google-Smtp-Source: AGRyM1vjjP6XoEnhfKbcOOTRq6bBlhgLcOIagCKRCrGdUz9DkcwYO4u+/fUyZO+Z/e6ixdBg3O/wMw==
X-Received: by 2002:a62:7bd7:0:b0:52b:1d57:e098 with SMTP id
 w206-20020a627bd7000000b0052b1d57e098mr11835857pfc.19.1658744369804; 
 Mon, 25 Jul 2022 03:19:29 -0700 (PDT)
Received: from localhost.localdomain ([156.236.96.165])
 by smtp.gmail.com with ESMTPSA id
 w205-20020a627bd6000000b005286697ec68sm9087618pfc.133.2022.07.25.03.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 03:19:29 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 25 Jul 2022 18:16:33 +0800
Message-Id: <20220725101633.213733-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oFvBX-009j4R-Eq
Subject: [f2fs-dev] [PATCH RESEND] f2fs: fix to remove F2FS_COMPR_FL and tag
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
Cc: Chao Liu <liuchao@coolpad.com>, Wayne Zhang <zhangwen@coolpad.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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

Link: https://lore.kernel.org/linux-f2fs-devel/20220621064833.1079383-1-chaoliu719@gmail.com/
Fixes: 4c8ff7095bef ("f2fs: support data compression")
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
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
