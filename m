Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF24D3F69
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 03:52:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS8uw-0006Pw-4V; Thu, 10 Mar 2022 02:52:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nS8uv-0006Pp-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 02:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V1oeC4nusLmxbGSdtSvxcwfue4tToad/PIZRfqBjnVY=; b=NbliU+s6fiw61oJESzncEPXszP
 JQ0JoWOLyNgsvX9Otn/j2y/QpAPWoJ/PMfjzRoY/oimOufNTC0TFutNt8iynYW7mMItYLe8qaPpTS
 4BTfhG84s/SUOLuArdar88la5BVkhejejGkX33NZ/G9Yof9oLhCOUD9z9hw6adob5dX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V1oeC4nusLmxbGSdtSvxcwfue4tToad/PIZRfqBjnVY=; b=hZM/FuMYUYHJx4eCSDkB7Kcznj
 iPVJRinGnMyhbTPTflWKU6MBXBWngquHSx5RKB3WyVclzcyJXK8XKLzc/OVjWvBznE8a87rsoq5Ja
 7bg7bq0qvJa0AJtV35+Bf4CgMeehtETK6j0bZjd1j8hq4yS2qro1FaoJtUuAtVJR2X14=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS8ur-0002ZQ-8P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 02:52:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC8D5614FE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Mar 2022 02:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEBDC340E8;
 Thu, 10 Mar 2022 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646880751;
 bh=HpVTTTr8PbusXmul2H66Jzw0dd3D6fNFf0OwnRc1hII=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=f4MWATkQ+7vf8dtfeA81v0X/sgvqFAu+mM4dunCMdO8EAU2Y4LotDp/fkVC0H9HeO
 aUPaIIEPx92v6JQd7DetqSe6bQQBKE19S0mUnQcs7nSpEVh4bhsW9Yi1tNZjwWIdmR
 3CE728pFYvQ5y0l3GwP2iKSOVjIMEVXHi/RD1THzMRWHh0agFf4W5DOH6oIUz66mPr
 P4HgUoL+IeVvZ5zXdX80GHxUq6ayMUCRSPclsuJH9ZOIA10ec6X1l+dcSpQVFpgOie
 KOrjP9Q0VSmGoARLl5LhsBlIcDhOlsqpdLPCpvAZ9X+vMPncAK5WrKw/yiIV3TRCbd
 eSXe+HjxrYxwg==
Date: Wed, 9 Mar 2022 18:52:29 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Yiln7Q/YgCzw1y9G@google.com>
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309214834.3408741-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  DIO preallocates physical blocks before writing data, but
 if an error occurrs or power-cut happens, we can see block contents from the
 disk. This patch tries to fix it by 1) turning to buffered writes [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS8ur-0002ZQ-8P
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: do not expose unwritten blocks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DIO preallocates physical blocks before writing data, but if an error occurrs
or power-cut happens, we can see block contents from the disk. This patch tries
to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
unwritten blocks from error or power-cut.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 - log from v1: added documentation

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
