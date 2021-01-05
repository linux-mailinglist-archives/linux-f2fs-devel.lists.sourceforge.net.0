Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7962EA1B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadN-0001a9-Oh; Tue, 05 Jan 2021 00:55:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadL-0001Zs-JQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LfLz90Z1gNFOzbc2+OcX1AoZMItqZWEf3SxPBptinow=; b=QPJ3YSjehPPhBY54+MzT9ZsH/k
 50aV4UiJKzdN71kiN0Gz+oA1vsXmmstHIsEaWUr3Qjy+NWuYlW16wXdab81PAvBCQbxit4LQ1ij2S
 qaiiPJhYA5dTr3uqpo5cqnjtj/jsE6bah2iaDt7M/Ej4dYuGC89YEDGjrZVlXfQyOwXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LfLz90Z1gNFOzbc2+OcX1AoZMItqZWEf3SxPBptinow=; b=Cr5O51ByoXfNuk1AsamopTF006
 N+FkIKngI4yglltUTTrTB3wYzRKblWDhDVgd9NXTMANFtM4CHYHOCSWFexyqffA5BUB9OHHFt5iZS
 epV1/4YX+LCWkK1onhO08bMUMF6L6VuzmealDf5uv7NvrozzNt5YfYx2znga6NEz35+w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadH-00E0Qx-KF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3073022583;
 Tue,  5 Jan 2021 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808108;
 bh=WAClBs5Ob3X5/nQlX8DZm6OroHf7WCCbiACDxf5M2ho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C0Ghy59D3T6p16o0qRJhp5hBAinTsVREzKCRuF7Jexv31PEsxUz1Fkxdd/Mof9wSK
 fyfqBNgrAPiRUcsY3ifcjZVXzeinTyrayvQMhWzDvHJiH2r3CfCYhm3KrNTVDTZnBo
 bUJR6Loxr7pNTO0yjgTEhy1nARTJGZ8vaOjeEfZyRtTh0e//SbJcw1j7GDewwWhsAW
 2pKs7GeBbCtgUdPQi6M79OUMkgyGH/n1tVqn9mhaFcMZyePjTyPKcgVDLU1ZshD7dp
 IbJNbhKZau1h/1qm5RFLnnA4oBezHm6HRZmWBOwaXMBkyuprg1GjTaH1+R65Lyez0x
 2Wi5IaPeb84wg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:44 -0800
Message-Id: <20210105005452.92521-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105005452.92521-1-ebiggers@kernel.org>
References: <20210105005452.92521-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwadH-00E0Qx-KF
Subject: [f2fs-dev] [PATCH 05/13] fs: don't call ->dirty_inode for lazytime
 timestamp updates
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

There is no need to call ->dirty_inode for lazytime timestamp updates
(i.e. for __mark_inode_dirty(I_DIRTY_TIME)), since by the definition of
lazytime, filesystems must ignore these updates.  Filesystems only need
to care about the updated timestamps when they expire.

Therefore, only call ->dirty_inode when I_DIRTY_INODE is set.

Based on a patch from Christoph Hellwig:
https://lore.kernel.org/r/20200325122825.1086872-4-hch@lst.de

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c   | 12 +-----------
 fs/f2fs/super.c   |  3 ---
 fs/fs-writeback.c |  6 +++---
 fs/gfs2/super.c   |  2 --
 4 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 27946882d4ce4..4cc6c7834312f 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5933,26 +5933,16 @@ int __ext4_mark_inode_dirty(handle_t *handle, struct inode *inode,
  * If the inode is marked synchronous, we don't honour that here - doing
  * so would cause a commit on atime updates, which we don't bother doing.
  * We handle synchronous inodes at the highest possible level.
- *
- * If only the I_DIRTY_TIME flag is set, we can skip everything.  If
- * I_DIRTY_TIME and I_DIRTY_SYNC is set, the only inode fields we need
- * to copy into the on-disk inode structure are the timestamp files.
  */
 void ext4_dirty_inode(struct inode *inode, int flags)
 {
 	handle_t *handle;
 
-	if (flags == I_DIRTY_TIME)
-		return;
 	handle = ext4_journal_start(inode, EXT4_HT_INODE, 2);
 	if (IS_ERR(handle))
-		goto out;
-
+		return;
 	ext4_mark_inode_dirty(handle, inode);
-
 	ext4_journal_stop(handle);
-out:
-	return;
 }
 
 int ext4_change_inode_journal_flag(struct inode *inode, int val)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b4a07fe62d1a5..cc98dc49f4a26 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1196,9 +1196,6 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
 			inode->i_ino == F2FS_META_INO(sbi))
 		return;
 
-	if (flags == I_DIRTY_TIME)
-		return;
-
 	if (is_inode_flag_set(inode, FI_AUTO_RECOVER))
 		clear_inode_flag(inode, FI_AUTO_RECOVER);
 
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 081e335cdee47..e3347fd6eb13a 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2264,16 +2264,16 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
 	 * dirty the inode itself
 	 */
-	if (flags & (I_DIRTY_INODE | I_DIRTY_TIME)) {
+	if (flags & I_DIRTY_INODE) {
 		trace_writeback_dirty_inode_start(inode, flags);
 
 		if (sb->s_op->dirty_inode)
 			sb->s_op->dirty_inode(inode, flags);
 
 		trace_writeback_dirty_inode(inode, flags);
-	}
-	if (flags & I_DIRTY_INODE)
+
 		flags &= ~I_DIRTY_TIME;
+	}
 	dirtytime = flags & I_DIRTY_TIME;
 
 	/*
diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 2f56acc41c049..042b94288ff11 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -562,8 +562,6 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
 	int need_endtrans = 0;
 	int ret;
 
-	if (!(flags & I_DIRTY_INODE))
-		return;
 	if (unlikely(gfs2_withdrawn(sdp)))
 		return;
 	if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
