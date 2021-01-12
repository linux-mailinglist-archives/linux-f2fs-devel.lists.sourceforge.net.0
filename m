Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA82F396F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 20:04:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzOy1-0005fL-Ps; Tue, 12 Jan 2021 19:04:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzOy0-0005f9-BC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nXJuYu4jGoS1Z3s6c+gliaJMk7NA/xWMAybJ4nDKP1Y=; b=WDS16CHE4ST8QOx7WxknBJ/k05
 ho4r232gAwWhRlnTNhfmmFj8EbyzEzaHMYA/J291V9KuVQ+mfby56br2O2AQTDVKyeO+ilw4cUjOs
 dhnO9hIre3ZSaceb6zRdGRmdv3TLgJqwPqm6QmvKfWq/14BrphNtWq7asLE1hq2wx4uw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nXJuYu4jGoS1Z3s6c+gliaJMk7NA/xWMAybJ4nDKP1Y=; b=VJOQz0cCdi7lE4sJhEoA7NXp8O
 OToia5pNYmrvnIuxG95KUX27aPeTWeb0XPNVWFNyQYSmZdTmBOVcfGb5hY6NhzLmUCja6NGx9Tx2m
 LcN8I72knF/t5Bb/8ufU7jAVOBwgKJhzkiVCBJHZ3Fb2Y8cn+DTre/xlpuXDcWbla23s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzOxx-004zDH-85
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A3DD2312F;
 Tue, 12 Jan 2021 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478249;
 bh=hmxMN17tKWaM2hsNCmfmSb2YECH36i4GDPyEe2gO7gw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jfP9ayF3Bht5l+XL74ExT6oANuXRjIN05trgBbs+srth9qeDfGwxeUu0QcJZv8VCE
 edaeKWIsx2TiW/iK+uEBPM8hTUTnv09wng43nlxBKFjdT8km0rqByuPKmCHPrXhFZs
 nyTTgwS7cHbByEkW3TA7q+2wLyXHvHN9Bp9wwWSHkQIECBojD9jx6ebwmDVf007wP1
 yvlBMTdo3kMFalEKHJM3sC7o2mozf3itA8TSFwN3eYT6K58qpzO08YQhxWsDNa/TIs
 3tczf7gw3/0t/yTPXN47F2C2HFSSCmaiUZGa9Z4f+VOt/tqMWuhjV8Ebz6K6RbCAD9
 rwZ6XAe3/39Cw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Jan 2021 11:02:47 -0800
Message-Id: <20210112190253.64307-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210112190253.64307-1-ebiggers@kernel.org>
References: <20210112190253.64307-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzOxx-004zDH-85
Subject: [f2fs-dev] [PATCH v3 05/11] fs: don't call ->dirty_inode for
 lazytime timestamp updates
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
Cc: Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
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
index c41cb887eb7d3..b7616bbd55336 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2255,16 +2255,16 @@ void __mark_inode_dirty(struct inode *inode, int flags)
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
