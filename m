Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654D2F396A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 20:04:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzOxz-0000ts-Cd; Tue, 12 Jan 2021 19:04:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzOxx-0000sm-A5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQ5TrnpCeXCPkqQKV+mVLg//hf/GI0fBr3zfSTZgNBw=; b=jzhbgs+NdJ++G4rnkenoe+hTsN
 APPPZ7yxMmMnFSpynKAoo00mlOcQFMf9FWyVTvQXlSe4rxYeBpk8aT04oeo65KeMDQI8ZVaZmm11A
 cPX543PF6iyDGJXgArKZeJhauV0jRvU5tAhTxHhlJewMaxmRIiiEV4anWezMkVCKEgLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQ5TrnpCeXCPkqQKV+mVLg//hf/GI0fBr3zfSTZgNBw=; b=cDIEecJtq0gg72uAb60O8nGPfP
 vacETlmArPZNODBHrr2PhZvdfOAvKPFiHXnZR5+D2A/gXEXHZldoLafvnsUNLNAoPRNhHplq+9a0r
 YdoQJK1ZBDvXkv0tOXm6QVotHKpkCQGOY5Rt4uUHt0NEzCihj5KNWjupDpQ7Le1zgyuw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzOxt-004zD2-7H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 19:04:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 250CD23123;
 Tue, 12 Jan 2021 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478250;
 bh=m55hWuVO7Kccok6ZKvWfkDaBgW4VZjCcVIhDde63id4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SqmyZM1Vj4rj6sk7BL3j8N7ZxNNj5YrQ6sKSXeRtRZ6nEUbcEB1ey4UKjs7cUY0QG
 3jxnnBrbLgk4sXulh/DgD1DBjmtZ0CLGGML2I3z87lQKnRpduuqFUjsCX3QRhmejIl
 YhOFSXc6h7XSjclkhNOndP7FEHXZ03VeUzzY89KWgPTOZ038eWia/aJgKdMtDnLct+
 vu10MdmUHnd2pxllFbzEcIaFAWeVwvyYGnTmK0j+u/MnIw6B58gbgyG2O1VZVH1uxs
 iNPiJPIxWn7IrfelsMbBi6ghOsWhcPVe7NaSltWvUEXJslJnMwukVpKAcluIldXwu2
 jSTjCkEox99zw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Jan 2021 11:02:49 -0800
Message-Id: <20210112190253.64307-8-ebiggers@kernel.org>
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
X-Headers-End: 1kzOxt-004zD2-7H
Subject: [f2fs-dev] [PATCH v3 07/11] fs: clean up __mark_inode_dirty() a bit
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

Improve some comments, and don't bother checking for the I_DIRTY_TIME
flag in the case where we just cleared it.

Also, warn if I_DIRTY_TIME and I_DIRTY_PAGES are passed to
__mark_inode_dirty() at the same time, as this case isn't handled.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 49 +++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 2e6064012f7d3..80ee9816d9df5 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2219,23 +2219,24 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
 }
 
 /**
- * __mark_inode_dirty -	internal function
+ * __mark_inode_dirty -	internal function to mark an inode dirty
  *
  * @inode: inode to mark
- * @flags: what kind of dirty (i.e. I_DIRTY_SYNC)
+ * @flags: what kind of dirty, e.g. I_DIRTY_SYNC.  This can be a combination of
+ *	   multiple I_DIRTY_* flags, except that I_DIRTY_TIME can't be combined
+ *	   with I_DIRTY_PAGES.
  *
- * Mark an inode as dirty. Callers should use mark_inode_dirty or
- * mark_inode_dirty_sync.
+ * Mark an inode as dirty.  We notify the filesystem, then update the inode's
+ * dirty flags.  Then, if needed we add the inode to the appropriate dirty list.
  *
- * Put the inode on the super block's dirty list.
+ * Most callers should use mark_inode_dirty() or mark_inode_dirty_sync()
+ * instead of calling this directly.
  *
- * CAREFUL! We mark it dirty unconditionally, but move it onto the
- * dirty list only if it is hashed or if it refers to a blockdev.
- * If it was not hashed, it will never be added to the dirty list
- * even if it is later hashed, as it will have been marked dirty already.
+ * CAREFUL!  We only add the inode to the dirty list if it is hashed or if it
+ * refers to a blockdev.  Unhashed inodes will never be added to the dirty list
+ * even if they are later hashed, as they will have been marked dirty already.
  *
- * In short, make sure you hash any inodes _before_ you start marking
- * them dirty.
+ * In short, ensure you hash any inodes _before_ you start marking them dirty.
  *
  * Note that for blockdevs, inode->dirtied_when represents the dirtying time of
  * the block-special inode (/dev/hda1) itself.  And the ->dirtied_when field of
@@ -2247,25 +2248,34 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
 void __mark_inode_dirty(struct inode *inode, int flags)
 {
 	struct super_block *sb = inode->i_sb;
-	int dirtytime;
+	int dirtytime = 0;
 
 	trace_writeback_mark_inode_dirty(inode, flags);
 
-	/*
-	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
-	 * dirty the inode itself
-	 */
 	if (flags & I_DIRTY_INODE) {
+		/*
+		 * Notify the filesystem about the inode being dirtied, so that
+		 * (if needed) it can update on-disk fields and journal the
+		 * inode.  This is only needed when the inode itself is being
+		 * dirtied now.  I.e. it's only needed for I_DIRTY_INODE, not
+		 * for just I_DIRTY_PAGES or I_DIRTY_TIME.
+		 */
 		trace_writeback_dirty_inode_start(inode, flags);
-
 		if (sb->s_op->dirty_inode)
 			sb->s_op->dirty_inode(inode, flags & I_DIRTY_INODE);
-
 		trace_writeback_dirty_inode(inode, flags);
 
+		/* I_DIRTY_INODE supersedes I_DIRTY_TIME. */
 		flags &= ~I_DIRTY_TIME;
+	} else {
+		/*
+		 * Else it's either I_DIRTY_PAGES, I_DIRTY_TIME, or nothing.
+		 * (We don't support setting both I_DIRTY_PAGES and I_DIRTY_TIME
+		 * in one call to __mark_inode_dirty().)
+		 */
+		dirtytime = flags & I_DIRTY_TIME;
+		WARN_ON_ONCE(dirtytime && flags != I_DIRTY_TIME);
 	}
-	dirtytime = flags & I_DIRTY_TIME;
 
 	/*
 	 * Paired with smp_mb() in __writeback_single_inode() for the
@@ -2288,6 +2298,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 
 		inode_attach_wb(inode, NULL);
 
+		/* I_DIRTY_INODE supersedes I_DIRTY_TIME. */
 		if (flags & I_DIRTY_INODE)
 			inode->i_state &= ~I_DIRTY_TIME;
 		inode->i_state |= flags;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
