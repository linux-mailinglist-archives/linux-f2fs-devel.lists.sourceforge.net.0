Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512E2EFE67
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9Ar-0004Gw-6a; Sat, 09 Jan 2021 08:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9Aj-0004Ez-9M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t47piFyuKgUsbOQZSZCZIhQxetm+8p12GP1zCLQtkNc=; b=jM+iVYHspC493ghDlXip7WJGup
 8AczMea/g2+vmjlk2TZ8iEhknIpBuUIsu4tHMnSDqavbe390P36Mi609oWsB4zLRH1mzNWttzkbYo
 4uMlt4usob4fWYYEZv8SEJGBmWTnvTP7WIRsq6c6pscOJRmBOkBDu21vIhjjIG220hIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t47piFyuKgUsbOQZSZCZIhQxetm+8p12GP1zCLQtkNc=; b=QH0PLIrY60V2idrQmro9kAvinY
 qt8r6MrMW5JnRgwmK91WUOxnx8DVZkdCoCwFtBZLcjxTRRSM+p0QFMObSh3vOisk5K1il/uQ2qsFU
 nz0cmUDlt6QimYoLtgWbChXBZCJm4Vtwsoo66sPTtJEv7t4AbBead2xGgymQ6IPnDdfc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AW-00DnF1-EO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEF0923A75;
 Sat,  9 Jan 2021 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179186;
 bh=f1IRzjNhqEyjuW1h5W+eMv7y7CvKJNHHEP0p7XPwbsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uo/6gdoDMggzj6Fc6Jq6RuNZvTc6ZXoyueSBp6hIBATRV5BZCKOQ+IuTezLoA0r/9
 8Puye+GnhKa8dVphMklQFYbjGq5a6WgBwkFXeRA35B/Xh7wKSmfeAqiLV6H9oa6PXw
 H3Mb3X55rrhnI5XRM179thaocF2KHgRVpqWo6GjV+EMDsupqE2u4QLv6AYHiVcy5he
 3u0SR66vXtRSGCIUDYLq2478Oq9ioXVv2ko3ELDBIm/nP5zCf986jobvQO6yWOMJ5g
 eYikzMpeWlKocfbpVKHMrw2NotkC3BsjO+UiuOKslb2jsostmIB+ps+vtqNEZfRgTt
 Sxa79yr1KZXTg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:58 -0800
Message-Id: <20210109075903.208222-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
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
X-Headers-End: 1ky9AW-00DnF1-EO
Subject: [f2fs-dev] [PATCH v2 07/12] fs: clean up __mark_inode_dirty() a bit
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

Improve some comments, and don't bother checking for the I_DIRTY_TIME
flag in the case where we just cleared it.

Also, warn if I_DIRTY_TIME and I_DIRTY_PAGES are passed to
__mark_inode_dirty() at the same time, as this case isn't handled.

Reviewed-by: Christoph Hellwig <hch@lst.de>
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
