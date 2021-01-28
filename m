Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C0307238
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 10:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l53Dz-0003h9-GG; Thu, 28 Jan 2021 09:04:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l53Du-0003gk-6H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 09:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcG6VzWtyC5AOTfPQ4IDwCmiSozyvfGSYUO19fdzwoM=; b=kFXPU1hvGpM8falISQHtVpVZT4
 N7mm+6+3sTeLZp/Yn5pkBwmooyc4t59gJgL3PT4ymqFKtnGBp5dbb4y6LQu11KXeBksDpDlDgZyjA
 iQ5nxL3yTURWtnr65VaYTktlS8vr7qRTp2SVqSPHBDNIDXeJ7HyPUBAMXS85YP4sngUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dcG6VzWtyC5AOTfPQ4IDwCmiSozyvfGSYUO19fdzwoM=; b=S
 Q+32eLOhspSSlTLG9/pP9L5Yi6k+Tf4KQNmbwe9ifEv6MNf/gmG5dkB3iXMZ85dKFOf2kp6a377Lw
 o0YrfrDkm/FROUabcsaMrWTxv/h1kFKvoRNvHrzXLb4GbI0GulQrpjrEc2gwaT72GIW4wGBzIlPw/
 ekK/Y8DhVFex1+P0=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l53Dd-0002cX-BQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 09:04:17 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRDyG4PPgzjDQy;
 Thu, 28 Jan 2021 17:02:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 28 Jan 2021 17:03:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 28 Jan 2021 17:02:56 +0800
Message-ID: <20210128090256.73910-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l53Dd-0002cX-BQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid inconsistent quota data
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yi Chen <chenyi77@huawei.com>

Occasionally, quota data may be corrupted detected by fsck:

Info: checkpoint state = 45 :  crc compacted_summary unmount
[QUOTA WARNING] Usage inconsistent for ID 0:actual (1543036928, 762) != expected (1543032832, 762)
[ASSERT] (fsck_chk_quota_files:1986)  --> Quota file is missing or invalid quota file content found.
[QUOTA WARNING] Usage inconsistent for ID 0:actual (1352478720, 344) != expected (1352474624, 344)
[ASSERT] (fsck_chk_quota_files:1986)  --> Quota file is missing or invalid quota file content found.

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0xdf299]
[FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x2b01]
[FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x2b01]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x2665]
[FSCK] free segment_count matched with CP             [Ok..] [0xcb04]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]

The root cause is:
If we open file w/ readonly flag, disk quota info won't be initialized
for this file, however, following mmap() will force to convert inline
inode via f2fs_convert_inline_inode(), which may increase block usage
for this inode w/o updating quota data, it causes inconsistent disk quota
info.

The issue will happen in following stack:
open(file, O_RDONLY)
mmap(file)
- f2fs_convert_inline_inode
 - f2fs_convert_inline_page
  - f2fs_reserve_block
   - f2fs_reserve_new_block
    - f2fs_reserve_new_blocks
     - f2fs_i_blocks_write
      - dquot_claim_block
inode->i_blocks increase, but the dqb_curspace keep the size for the dquots
is NULL.

To fix this issue, let's call dquot_initialize() anyway in both
f2fs_truncate() and f2fs_convert_inline_inode() functions to avoid potential
inconsistent quota data issue.

Fixes: 0abd675e97e6 ("f2fs: support plain user/group quota")
Signed-off-by: Daiyue Zhang <zhangdaiyue1@huawei.com>
Signed-off-by: Dehe Gu <gudehe@huawei.com>
Signed-off-by: Junchao Jiang <jiangjunchao1@huawei.com>
Signed-off-by: Ge Qiu <qiuge@huawei.com>
Signed-off-by: Yi Chen <chenyi77@huawei.com>
---
 fs/f2fs/file.c   | 4 ++++
 fs/f2fs/inline.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7db27c81d034..00b2ce47fa37 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -771,6 +771,10 @@ int f2fs_truncate(struct inode *inode)
 		return -EIO;
 	}
 
+	err = dquot_initialize(inode);
+	if (err)
+		return err;
+
 	/* we should check inline_data size */
 	if (!f2fs_may_inline_data(inode)) {
 		err = f2fs_convert_inline_inode(inode);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 806ebabf5870..993caefcd2bb 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -192,6 +192,10 @@ int f2fs_convert_inline_inode(struct inode *inode)
 			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
 		return 0;
 
+	err = dquot_initialize(inode);
+	if (err)
+		return err;
+
 	page = f2fs_grab_cache_page(inode->i_mapping, 0, false);
 	if (!page)
 		return -ENOMEM;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
