Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4652D872DAB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 04:48:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhiGh-0007S5-7M;
	Wed, 06 Mar 2024 03:48:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Xiuhong.Wang@unisoc.com>) id 1rhiGf-0007Rs-DB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 03:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E/EG/9OUysCCu2EIMuyX5R2856qMq7OXIrJcnhG3wx0=; b=a12gGR8/dlRt/ueiPyGtFSJUUL
 RuYgMEawX3ny4If5VfkQU0GbaB8CgMB0bpAXfHeovJZ0ksh/0D3WhN84tdGseUh8GsGF/YFhcypxQ
 OzqTngRSKsGpHKQpNam14/0pFah/T8s1hM12oU9++gYHLk7X242LYLSHXlngi4Wk9M44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E/EG/9OUysCCu2EIMuyX5R2856qMq7OXIrJcnhG3wx0=; b=iKr0Mh4KkkOpGUFoEPgW0VwX1Y
 BNZB99K45ALxsqVjPqyUN30BS/5PGraPoqHrHiGPXpDtLd6ZH1K7YQNHGMfrHtdRNLcs0LFSj2Rmo
 3MVFitpGncWvsdU6kPYRYkvr9a9O9mh2P3BZ/0D/FB4zDdn9AerwB2kjv+wbEc/oYWUk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhiGY-0003NC-6h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 03:48:33 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4263m2C3002928;
 Wed, 6 Mar 2024 11:48:02 +0800 (+08)
 (envelope-from Xiuhong.Wang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TqJK02Dtrz2KZgsX;
 Wed,  6 Mar 2024 11:47:00 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 6 Mar 2024 11:48:00 +0800
From: Xiuhong Wang <xiuhong.wang@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Wed, 6 Mar 2024 11:47:46 +0800
Message-ID: <20240306034746.3722986-2-xiuhong.wang@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
References: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 4263m2C3002928
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When a file only needs one direct_node,
 performing the following
 operations will cause the file to be unrepairable: unisoc # ./f2fs_io compress
 test.apk unisoc #df -h | grep dm-48 /dev/block/dm-48 112G 112G 1.2M 100%
 /data Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rhiGY-0003NC-6h
Subject: [f2fs-dev] [PATCH V2 2/2] f2fs: compress: fix reserve_cblocks
 counting error when out of space
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When a file only needs one direct_node, performing the following
operations will cause the file to be unrepairable:

unisoc # ./f2fs_io compress test.apk
unisoc #df -h | grep dm-48
/dev/block/dm-48 112G 112G 1.2M 100% /data

unisoc # ./f2fs_io release_cblocks test.apk
924
unisoc # df -h | grep dm-48
/dev/block/dm-48 112G 112G 4.8M 100% /data

unisoc # dd if=/dev/random of=file4 bs=1M count=3
3145728 bytes (3.0 M) copied, 0.025 s, 120 M/s
unisoc # df -h | grep dm-48
/dev/block/dm-48 112G 112G 1.8M 100% /data

unisoc # ./f2fs_io reserve_cblocks test.apk
F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device

adb reboot
unisoc # df -h  | grep dm-48
/dev/block/dm-48             112G 112G   11M 100% /data
unisoc # ./f2fs_io reserve_cblocks test.apk
0

This is because the file has only one direct_node. After returning
to -ENOSPC, reserved_blocks += ret will not be executed. As a result,
the reserved_blocks at this time is still 0, which is not the real
number of reserved blocks. Therefore, fsck cannot be set to repair
the file.

After this patch, the fsck flag will be set to fix this problem.

unisoc # df -h | grep dm-48
/dev/block/dm-48             112G 112G  1.8M 100% /data
unisoc # ./f2fs_io reserve_cblocks test.apk
F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device

adb reboot then fsck will be executed
unisoc # df -h  | grep dm-48
/dev/block/dm-48             112G 112G   11M 100% /data
unisoc # ./f2fs_io reserve_cblocks test.apk
924

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 74c5e48fce22..dc9c6bac678d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3624,10 +3624,10 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
+static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
+		unsigned int *reserved_blocks)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	unsigned int reserved_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	block_t blkaddr;
 	int i;
@@ -3691,12 +3691,12 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 
 		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
 
-		reserved_blocks += reserved;
+		*reserved_blocks += reserved;
 next:
 		count -= cluster_size;
 	}
 
-	return reserved_blocks;
+	return 0;
 }
 
 static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
@@ -3757,7 +3757,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
 		count = round_up(count, F2FS_I(inode)->i_cluster_size);
 
-		ret = reserve_compress_blocks(&dn, count);
+		ret = reserve_compress_blocks(&dn, count, &reserved_blocks);
 
 		f2fs_put_dnode(&dn);
 
@@ -3765,13 +3765,12 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 			break;
 
 		page_idx += count;
-		reserved_blocks += ret;
 	}
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
-	if (ret >= 0) {
+	if (!ret) {
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
 		inode_set_ctime_current(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
@@ -3780,7 +3779,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 
-	if (ret >= 0) {
+	if (!ret) {
 		ret = put_user(reserved_blocks, (u64 __user *)arg);
 	} else if (reserved_blocks &&
 			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
