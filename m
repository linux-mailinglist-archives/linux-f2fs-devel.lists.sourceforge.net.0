Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CF18DD89
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 02:48:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFTEu-000766-Ht; Sat, 21 Mar 2020 01:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chen.ying153@zte.com.cn>) id 1jFTEs-00075v-Mn
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 01:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v8Yyeel93mgWuQrGV2CTjFKAZXc1fzkpSYBx/osqwmM=; b=ecnMvFvxhB3Cg4UEJwFAbjCdfZ
 LuagQ/FeVTErea5iUwJHO5XIKJHvhA/H4P1IeXJVfrY5C8NpwHpp0LMo5veX8CqayrtqwAZcdM7UC
 q1cHaHcM5WhOIzq2abdjdW0Lyj1ZZ/jzn+r6B83z8LEOsCIp1k4L0LELRZM0v4Xzy4oQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v8Yyeel93mgWuQrGV2CTjFKAZXc1fzkpSYBx/osqwmM=; b=PUDqsmROQzI9Sqb1t51PDoTeyr
 pXTqczLNKyHk+934IsOiUe3YYI+4xEqDTKkIprl3Gv88nIaRGe75jOEmjitmoJ+8SMzUCCpSemN2B
 4e+az9eB6iteOZZMbpIS5PO+5HNqUES7OenMO/DpWjMr0fhLYgO4RFfgOlo+nkQjra/8=;
Received: from mxhk.zte.com.cn ([63.217.80.70])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFTEm-00AnNw-2d
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 01:47:50 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 265C4350981665369FE6;
 Sat, 21 Mar 2020 09:32:03 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id 02L1W2TI095392;
 Sat, 21 Mar 2020 09:32:02 +0800 (GMT-8)
 (envelope-from chen.ying153@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020032109324331-2829488 ;
 Sat, 21 Mar 2020 09:32:43 +0800 
From: chenying <chen.ying153@zte.com.cn>
To: jaegeuk@kernel.org
Date: Sat, 21 Mar 2020 09:31:48 +0800
Message-Id: <1584754308-39299-1-git-send-email-chen.ying153@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-03-21 09:32:43,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-03-21 09:32:07, Serialize complete at 2020-03-21 09:32:07
X-MAIL: mse-fl2.zte.com.cn 02L1W2TI095392
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jFTEm-00AnNw-2d
Subject: [f2fs-dev] [PATCH] ENOSPC returned but there still many free
 segments
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
Cc: wang.yi59@zte.com.cn, xue.zhihong@zte.com.cn, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, chenying <chen.ying153@zte.com.cn>,
 jiang.xuexin@zte.com.cn
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I write data to a compressed file when the disk space is almost full
and it return -ENOSPC error, but cat /sys/kernel/debug/f2fs/status
shows that there still many free segments.

Signed-off-by: chenying <chen.ying153@zte.com.cn>
---
 fs/f2fs/compress.c | 5 ++++-
 fs/f2fs/file.c     | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d8a64be..6ca058b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -854,6 +854,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 				fio.compr_blocks++;
 			if (__is_valid_data_blkaddr(blkaddr))
 				f2fs_invalidate_blocks(sbi, blkaddr);
+			else if (blkaddr != NULL_ADDR)
+				dec_valid_block_count(sbi, dn.inode, 1);
 			f2fs_update_data_blkaddr(&dn, COMPRESS_ADDR);
 			goto unlock_continue;
 		}
@@ -865,7 +867,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			if (__is_valid_data_blkaddr(blkaddr)) {
 				f2fs_invalidate_blocks(sbi, blkaddr);
 				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
-			}
+			} else if (blkaddr != NULL_ADDR)
+				dec_valid_block_count(sbi, dn.inode, 1);
 			goto unlock_continue;
 		}
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0d4da64..f07c9e2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -589,6 +589,10 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 			clear_inode_flag(dn->inode, FI_FIRST_BLOCK_WRITTEN);
 
 		f2fs_invalidate_blocks(sbi, blkaddr);
+		if (compressed_cluster &&
+			(blkaddr == NEW_ADDR || blkaddr == COMPRESS_ADDR))
+			continue;
+
 		nr_free++;
 	}
 
-- 
2.15.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
