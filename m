Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B60452EA1B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadG-0001ZP-MG; Tue, 05 Jan 2021 00:55:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadF-0001ZI-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/yLO2uBPsiqtuswFudcFrvlcv6aAUwxrjsbELom8ASY=; b=ART+KRbBQF0m47Kh+K1wQp/pEX
 m3iDOa/mPNixqSDQCS4s140IUpL4HdIZMb3R71mR/FjjfHoIlbpY00bpZtuxY/6ac8ueo6SZsas2I
 gFDXaXsb4vK/uqMk9eRaehySEoue06XxyibvEp81Von3kv5E/2VZkzAXma5nxJk11SOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/yLO2uBPsiqtuswFudcFrvlcv6aAUwxrjsbELom8ASY=; b=nVl1NZ0Jnj0/K5jghgzoPeTD8q
 eoYCo2/0U/ZJPOTVvMq9QPJWzDImjOFD7kHGqDsdmkcq2FkKJNsx42JPZkcWrJZwMsh6DD9TO5wp8
 /mhT7iAH9aHxVd1Aqn7Zu3V545hGJJJBBJ7Tk6JYzwXy5ZnMj2uNaDa0Gc08wyfsSDVA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadB-008Hku-9o
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D69D622573;
 Tue,  5 Jan 2021 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808107;
 bh=yfLor65DiiDuUyAFfmLknF94i9VyZ+d0RMnYmOcXc4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bcHKHrhaoruYAQ5HHU5nfeR3wPqWWJRuX9SdUqzWXifBuynZRhAtxo2xi1I9ryELL
 jYk6KvnE5QMyEiyeHAI3hRYCQILCytEhaOfPVjfXreCFemcvnM/Nkq/iq5Q+RtkaZs
 FREWALhhzmJ/GUgLJp5mIG1Yxi6coO7FsXLWzisbVwJM+KeK7uPQyfmumSJ2f9w81e
 HW5IKeMMrfvPE1S+tMNafipk6MHE7F2WSksulFTT8sNGigCoztUjO6ThghPZs3+eWU
 kOgtkaqdduPXOiRgahNp8ljEYKSiIq2KPfLo4pr7ZLNHalGDepljvOaxQXxDFbKpsh
 Bo4e5vfoJCM7w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:40 -0800
Message-Id: <20210105005452.92521-2-ebiggers@kernel.org>
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
X-Headers-End: 1kwadB-008Hku-9o
Subject: [f2fs-dev] [PATCH 01/13] fs: avoid double-writing inodes on
 lazytime expiration
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
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When lazytime is enabled and an inode with dirty timestamps is being
expired, either due to dirtytime_expire_interval being exceeded or due
to a sync or syncfs system call, we need to inform the filesystem that
the inode is dirty so that the inode's timestamps can be copied out to
the on-disk data structures.  That's because if the filesystem supports
lazytime, it will have ignored the ->dirty_inode(inode, I_DIRTY_TIME)
notification when the timestamp was modified in memory.

Currently this is accomplished by calling mark_inode_dirty_sync() from
__writeback_single_inode().  However, this has the unfortunate side
effect of also putting the inode the writeback list.  That's not
appropriate in this case, since the inode is already being written.

That causes the inode to remain dirty after a sync.  Normally that's
just wasteful, as it causes the inode to be written twice.  But when
fscrypt is used this bug also partially breaks the
FS_IOC_REMOVE_ENCRYPTION_KEY ioctl, as the ioctl reports that files are
still in-use when they aren't.  For more details, see the original
report at https://lore.kernel.org/r/20200306004555.GB225345@gmail.com

Fix this by calling ->dirty_inode(inode, I_DIRTY_SYNC) directly instead
of mark_inode_dirty_sync().

This fixes xfstest generic/580 when lazytime is enabled.

A later patch will introduce a ->lazytime_expired method to cleanly
separate out the lazytime expiration case, in particular for XFS which
uses the VFS-level dirtiness tracking only for lazytime.  But that's
separate from fixing this bug.  Also, note that XFS will incorrectly
ignore the I_DIRTY_SYNC notification from __writeback_single_inode()
both before and after this patch, as I_DIRTY_TIME was already cleared in
i_state.  Later patches will fix this separate bug.

Fixes: 0ae45f63d4ef ("vfs: add support for a lazytime mount option")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index acfb55834af23..081e335cdee47 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1509,11 +1509,22 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 
 	spin_unlock(&inode->i_lock);
 
-	if (dirty & I_DIRTY_TIME)
-		mark_inode_dirty_sync(inode);
 	/* Don't write the inode if only I_DIRTY_PAGES was set */
 	if (dirty & ~I_DIRTY_PAGES) {
-		int err = write_inode(inode, wbc);
+		int err;
+
+		/*
+		 * If the inode is being written due to a lazytime timestamp
+		 * expiration, then the filesystem needs to be notified about it
+		 * so that e.g. the filesystem can update on-disk fields and
+		 * journal the timestamp update.  Just calling write_inode()
+		 * isn't enough.  Don't call mark_inode_dirty_sync(), as that
+		 * would put the inode back on the dirty list.
+		 */
+		if ((dirty & I_DIRTY_TIME) && inode->i_sb->s_op->dirty_inode)
+			inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_SYNC);
+
+		err = write_inode(inode, wbc);
 		if (ret == 0)
 			ret = err;
 	}

base-commit: e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
