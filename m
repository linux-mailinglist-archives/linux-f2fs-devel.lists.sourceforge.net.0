Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CCE17A0D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Mar 2020 09:13:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j9ldX-0000II-1a; Thu, 05 Mar 2020 08:13:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j9ldW-0000I2-Ho
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 08:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=haUTShHCbVdjtfF56uQ5zEmTAsdVdtxSIGONrwMp5fM=; b=aRfvaXytkt7cW2RU5+4UgiS+GZ
 vvSnLHhF6gq5AzTNXmLBZ5D9KzQFg8x+Sp1UTtqzE2uOtj+vIaiFf5QEmRoM5CK9IaOoU+iHwSXx+
 qdTocaKc+9I5RY49qhO6r8j0tpzmoyhshnd13XIH9Kc1oP4exrqVNM0Ifn/ilfYb7+PA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=haUTShHCbVdjtfF56uQ5zEmTAsdVdtxSIGONrwMp5fM=; b=R
 flNHav2j1SZL9fduEryQzsLyYgYD9Mi2vkeDBb/VNY2BeH8+p0Wb070NnWHBvYbJBhdTNrADRg2ej
 TxuauYLqpMZe5ImurmljugKhQZAEW6VO8EvUbZP5Y+T2dle1Yu2E9mUGC5dRfAT95zNhdAwPyq/hU
 H0tzJj3e9H+N7i9U=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j9ldU-007nTU-MR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Mar 2020 08:13:42 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 76610EDB618A4066A009;
 Thu,  5 Mar 2020 16:13:32 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Mar 2020 16:13:24 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 5 Mar 2020 16:12:49 +0800
Message-ID: <20200305081249.107066-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j9ldU-007nTU-MR
Subject: [f2fs-dev] [PATCH] fsck.f2fs: account COMPRESS_ADDR as reserved
 blocks correctly
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should not account COMPRESS_ADDR as reserved block once we
released compress block on compress inode.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4d8aff0..f754858 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -860,8 +860,10 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		check_extent_info(&child, blkaddr, 0);
 
 		if (blkaddr == COMPRESS_ADDR) {
-			fsck->chk.valid_blk_cnt++;
-			*blk_cnt = *blk_cnt + 1;
+			if (node_blk->i.i_compr_blocks) {
+				fsck->chk.valid_blk_cnt++;
+				*blk_cnt = *blk_cnt + 1;
+			}
 			continue;
 		}
 
@@ -1103,8 +1105,10 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		if (blkaddr == 0x0)
 			continue;
 		if (blkaddr == COMPRESS_ADDR) {
-			F2FS_FSCK(sbi)->chk.valid_blk_cnt++;
-			*blk_cnt = *blk_cnt + 1;
+			if (inode->i_compr_blocks) {
+				F2FS_FSCK(sbi)->chk.valid_blk_cnt++;
+				*blk_cnt = *blk_cnt + 1;
+			}
 			continue;
 		}
 		ret = fsck_chk_data_blk(sbi, IS_CASEFOLDED(inode),
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
