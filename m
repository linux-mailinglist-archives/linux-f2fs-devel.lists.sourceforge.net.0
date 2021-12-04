Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DA4687A3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Dec 2021 22:27:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mtcZD-0004Lt-TU; Sat, 04 Dec 2021 21:27:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mtcZC-0004Ln-QW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Dec 2021 21:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UFvHLJvxcdBR+rr06UUq14B8V3FNwH4OuDmmAcPQxmI=; b=f1KtznGdyszoLJjF+A91wXwayh
 RSJgD0BM8eyUGIk+GGpYTC96Hy6eQFmSZJRKjuypCaPDzc3RMkXlnXhBa2OUwsZurOlPLnJfKmMTe
 7CT38vTQx+Od+Kgv6Bt8tRCl8rS6z+FMRGuGORUxZskz7MgoYX3JYNWSOQ6Pngo/XpzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UFvHLJvxcdBR+rr06UUq14B8V3FNwH4OuDmmAcPQxmI=; b=JienS0n5We5Bk/iNPAkTieIuC1
 WE4F/8u5Ndxrd09YvPIDibVHp1cTFV8zExb5MnyewF4Vp1qJOHM11cU72TM4MkvTmS/sXcInNV/pX
 08CQpRWDGZi3VcNqfvxGI9AGiBCZvN0oryJB+dZhYmpVw0SOW7nPuWI0fcMXVu+Uzl9I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mtcZC-0005h5-6g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Dec 2021 21:27:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C66B4B80CF4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  4 Dec 2021 19:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67327C341C2;
 Sat,  4 Dec 2021 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638644498;
 bh=/OqUS2W/68Rier9AJmG3+Y5Mgkk4YUPZ3IwIgNA5PPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aG6yoFAyyWmrOQfkloiO/z0i6O5Yu8gV9AXHlNgSOB58rRph0t1nuN4rT9B5OAp5Y
 JEyc9RkPbAIKN6gNg3komW0raXMd8l1mHjQtrWEW5umwcTp2lVccJhcWvN8wpHwjAK
 mhDrai0S3KzGtW2h0FJ6raeM/tdeWMvwgGG6dq99gi4KXLPhSjJQtRVRYSyrga7N/W
 axAFBndMV3yA+QBBH1+vomM8IVJCbhT6eACwtlAXrkWSclCWvnnUgEKAHYTyciq1fy
 wSG1Xlit+9m8txMqTJpgOObhbQra77h53vIuyGPAM2CAQKlGz0xFGIWzy57UNLu3Y6
 ljZKsz4IIXUXw==
Date: Sat, 4 Dec 2021 11:01:36 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yau7EPeuhlUwMQd0@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-2-jaegeuk@kernel.org>
 <6576ab84-7441-e594-a7c4-e5876a814df7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6576ab84-7441-e594-a7c4-e5876a814df7@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  DIO preallocates physical blocks before writing data, but
 if an error occurrs or power-cut happens, we can see block contents from the
 disk. This patch tries to fix it by 1) turning to buffered writes [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mtcZC-0005h5-6g
Subject: Re: [f2fs-dev] [PATCH 2/6 v2] f2fs: do not expose unwritten blocks
 to user by DIO
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

DIO preallocates physical blocks before writing data, but if an error occurrs
or power-cut happens, we can see block contents from the disk. This patch tries
to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
unwritten blocks from error or power-cut.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - fix quota xfstests failure
 - cover missing case

 fs/f2fs/data.c  |  5 ++++-
 fs/f2fs/f2fs.h  |  5 +++++
 fs/f2fs/file.c  | 27 ++++++++++++++++++---------
 fs/f2fs/inode.c |  8 ++++++++
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3db0f3049b90..9c867de1ec29 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1543,8 +1543,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
 							map->m_seg_type);
-				if (!err)
+				if (!err) {
+					if (flag == F2FS_GET_BLOCK_PRE_DIO)
+						file_need_truncate(inode);
 					set_inode_flag(inode, FI_APPEND_WRITE);
+				}
 			}
 			if (err)
 				goto sync_out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6f196621f772..d7435fcb9658 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -654,6 +654,7 @@ enum {
 #define FADVISE_KEEP_SIZE_BIT	0x10
 #define FADVISE_HOT_BIT		0x20
 #define FADVISE_VERITY_BIT	0x40
+#define FADVISE_TRUNC_BIT	0x80
 
 #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
 
@@ -681,6 +682,10 @@ enum {
 #define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
 #define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
 
+#define file_should_truncate(inode)	is_file(inode, FADVISE_TRUNC_BIT)
+#define file_need_truncate(inode)	set_file(inode, FADVISE_TRUNC_BIT)
+#define file_dont_truncate(inode)	clear_file(inode, FADVISE_TRUNC_BIT)
+
 #define DEF_DIR_LEVEL		0
 
 enum {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 808a7c24d993..e1445cf915ea 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1687,6 +1687,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
+		file_dont_truncate(inode);
 
 		up_write(&sbi->pin_sem);
 
@@ -4257,6 +4258,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
 	/* If it will be an out-of-place direct write, don't bother. */
 	if (dio && f2fs_lfs_mode(sbi))
 		return 0;
+	/*
+	 * Don't preallocate holes aligned to DIO_SKIP_HOLES which turns into
+	 * buffered IO, if DIO meets any holes.
+	 */
+	if (dio && i_size_read(inode) &&
+		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
+		return 0;
 
 	/* No-wait I/O can't allocate blocks. */
 	if (iocb->ki_flags & IOCB_NOWAIT)
@@ -4292,8 +4300,8 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
 	}
 
 	ret = f2fs_map_blocks(inode, &map, 1, flag);
-	/* -ENOSPC is only a fatal error if no blocks could be allocated. */
-	if (ret < 0 && !(ret == -ENOSPC && map.m_len > 0))
+	/* -ENOSPC|-EDQUOT are fine to report the number of allocated blocks. */
+	if (ret < 0 && !((ret == -ENOSPC || ret == -EDQUOT) && map.m_len > 0))
 		return ret;
 	if (ret == 0)
 		set_inode_flag(inode, FI_PREALLOCATED_ALL);
@@ -4359,20 +4367,21 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
 	preallocated = f2fs_preallocate_blocks(iocb, from);
-	if (preallocated < 0) {
+	if (preallocated < 0)
 		ret = preallocated;
-		goto out_unlock;
-	}
-
-	ret = __generic_file_write_iter(iocb, from);
+	else
+		ret = __generic_file_write_iter(iocb, from);
 
 	/* Don't leave any preallocated blocks around past i_size. */
-	if (preallocated > 0 && i_size_read(inode) < target_size) {
+	if (preallocated && i_size_read(inode) < target_size) {
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
-		f2fs_truncate(inode);
+		if (!f2fs_truncate(inode))
+			file_dont_truncate(inode);
 		filemap_invalidate_unlock(inode->i_mapping);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	} else {
+		file_dont_truncate(inode);
 	}
 
 	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..6998eb1d6bdb 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -544,6 +544,14 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		goto bad_inode;
 	}
 	f2fs_set_inode_flags(inode);
+
+	if (file_should_truncate(inode)) {
+		ret = f2fs_truncate(inode);
+		if (ret)
+			goto bad_inode;
+		file_dont_truncate(inode);
+	}
+
 	unlock_new_inode(inode);
 	trace_f2fs_iget(inode);
 	return inode;
-- 
2.34.1.400.ga245620fadb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
