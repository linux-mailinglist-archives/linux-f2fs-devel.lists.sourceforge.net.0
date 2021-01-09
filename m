Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD032EFE5C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9AF-0002G8-MN; Sat, 09 Jan 2021 07:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9AD-0002Ft-Va
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 07:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vyz3PvZWX+0nrTyJk7a/rK3gYW5EZxMAqY3V4u2l0pg=; b=Ptr7KerT+v2eO+EFWgQMxoJm7X
 jagl3l2BheOrqb8OHHkh7OkY2ql/UQQUexGmwgnIb6qYMyzDja5YHbRJbC7i7oGY1AbaS0jD0N4mL
 Xtpe+9KO/7agrhmW7h/eWYfaATNEHeZlddk/qhB17W1P7Xdan0KFHQb8AVKShwHWDgXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vyz3PvZWX+0nrTyJk7a/rK3gYW5EZxMAqY3V4u2l0pg=; b=DnxrVRwwaNyj+VZMXW7kiIBVkw
 8XwEmqLxAMMVw0BMlDcPz33KlV2sYNXkimp+/9ZNrbclqBxeoN9aIg9dDUVDN9cgqJv4jr1ekKM2L
 DaAiXvEX/uOQ0zRmcY9Hxs3Sqy58m+zYsm1ACQvdDZj9WOgA1tr0/MdIwiCeiF1t8rvc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AA-00DmlM-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 07:59:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F40B223A5A;
 Sat,  9 Jan 2021 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179184;
 bh=1rb2w5b9UOxpC3OxzW9+QP89tf5CQ3zdJFICcmtU3TU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XU4zvhFa1Zu0ptpTjjqYS8ozs0xKWCB+TFS9gf093u1w81EM6X7h4H2qdOLWWE/Zw
 r+r9r2d75JEO0osibm5OsbqFmeQmEqBGWvhnpseMYlYerw5gwllg0QNPOS4+Q9hW/f
 HKKhlNjA4ZPIQzThQLG/YuHu4L1Ebkk/l/dBh/J8etQSQbebHTKWWNsLFs6LtoezSt
 ho9FJkzPYfpY2XMJztYi1ku80+d+uD5YnAV8uK/wXxExhklYJG3IPrW6K+dYgwv629
 NQe9UrO7uxQvrNkuOJCJNS6jL+Kqf0yVhY8L66xdn563eD2OVRY1r8x4DyCAWAVSnR
 OSKnQsiESAarw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:58:52 -0800
Message-Id: <20210109075903.208222-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AA-00DmlM-Fi
Subject: [f2fs-dev] [PATCH v2 01/12] fs: fix lazytime expiration handling in
 __writeback_single_inode()
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
Cc: Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When lazytime is enabled and an inode is being written due to its
in-memory updated timestamps having expired, either due to a sync() or
syncfs() system call or due to dirtytime_expire_interval having elapsed,
the VFS needs to inform the filesystem so that the filesystem can copy
the inode's timestamps out to the on-disk data structures.

This is done by __writeback_single_inode() calling
mark_inode_dirty_sync(), which then calls ->dirty_inode(I_DIRTY_SYNC).

However, this occurs after __writeback_single_inode() has already
cleared the dirty flags from ->i_state.  This causes two bugs:

- mark_inode_dirty_sync() redirties the inode, causing it to remain
  dirty.  This wastefully causes the inode to be written twice.  But
  more importantly, it breaks cases where sync_filesystem() is expected
  to clean dirty inodes.  This includes the FS_IOC_REMOVE_ENCRYPTION_KEY
  ioctl (as reported at
  https://lore.kernel.org/r/20200306004555.GB225345@gmail.com), as well
  as possibly filesystem freezing (freeze_super()).

- Since ->i_state doesn't contain I_DIRTY_TIME when ->dirty_inode() is
  called from __writeback_single_inode() for lazytime expiration,
  xfs_fs_dirty_inode() ignores the notification.  (XFS only cares about
  lazytime expirations, and it assumes that I_DIRTY_TIME will contain
  i_state during those.)  Therefore, lazy timestamps aren't persisted by
  sync(), syncfs(), or dirtytime_expire_interval on XFS.

Fix this by moving the call to mark_inode_dirty_sync() to earlier in
__writeback_single_inode(), before the dirty flags are cleared from
i_state.  This makes filesystems be properly notified of the timestamp
expiration, and it avoids incorrectly redirtying the inode.

This fixes xfstest generic/580 (which tests
FS_IOC_REMOVE_ENCRYPTION_KEY) when run on ext4 or f2fs with lazytime
enabled.  It also fixes the new lazytime xfstest I've proposed, which
reproduces the above-mentioned XFS bug
(https://lore.kernel.org/r/20210105005818.92978-1-ebiggers@kernel.org).

Alternatively, we could call ->dirty_inode(I_DIRTY_SYNC) directly.  But
due to the introduction of I_SYNC_QUEUED, mark_inode_dirty_sync() is the
right thing to do because mark_inode_dirty_sync() now knows not to move
the inode to a writeback list if it is currently queued for sync.

Fixes: 0ae45f63d4ef ("vfs: add support for a lazytime mount option")
Cc: stable@vger.kernel.org
Depends-on: 5afced3bf281 ("writeback: Avoid skipping inode writeback")
Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index acfb55834af23..c41cb887eb7d3 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1474,21 +1474,25 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 	}
 
 	/*
-	 * Some filesystems may redirty the inode during the writeback
-	 * due to delalloc, clear dirty metadata flags right before
-	 * write_inode()
+	 * If the inode has dirty timestamps and we need to write them, call
+	 * mark_inode_dirty_sync() to notify the filesystem about it and to
+	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
 	 */
-	spin_lock(&inode->i_lock);
-
-	dirty = inode->i_state & I_DIRTY;
 	if ((inode->i_state & I_DIRTY_TIME) &&
-	    ((dirty & I_DIRTY_INODE) ||
-	     wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
+	    (wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
 	     time_after(jiffies, inode->dirtied_time_when +
 			dirtytime_expire_interval * HZ))) {
-		dirty |= I_DIRTY_TIME;
 		trace_writeback_lazytime(inode);
+		mark_inode_dirty_sync(inode);
 	}
+
+	/*
+	 * Some filesystems may redirty the inode during the writeback
+	 * due to delalloc, clear dirty metadata flags right before
+	 * write_inode()
+	 */
+	spin_lock(&inode->i_lock);
+	dirty = inode->i_state & I_DIRTY;
 	inode->i_state &= ~dirty;
 
 	/*
@@ -1509,8 +1513,6 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 
 	spin_unlock(&inode->i_lock);
 
-	if (dirty & I_DIRTY_TIME)
-		mark_inode_dirty_sync(inode);
 	/* Don't write the inode if only I_DIRTY_PAGES was set */
 	if (dirty & ~I_DIRTY_PAGES) {
 		int err = write_inode(inode, wbc);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
