Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A32EFE66
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9Ap-0004GJ-AE; Sat, 09 Jan 2021 08:00:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9Aj-0004Ey-9M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fib+yNaUwm3fyxJlhAJ0f83XSW+AXNg2HgUF1ettCQg=; b=A1DJOsukNEwAg7bGaAyN0ghbw0
 ZGoLw5Ge2UNj7VIYDVAm37GY+dkqsuKQYm+tBseLRdF2g1/1Yji/n6MIg+suFOAp3GZBLpbctaWSc
 sNxN2Pjvb5xODgJnJjwnDzYOfAUA3ZugJ/m3ZGC/aj46bzIex6UH8nOKy6u6KOCur5Bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fib+yNaUwm3fyxJlhAJ0f83XSW+AXNg2HgUF1ettCQg=; b=f9T5sIfJGDICs0p1EWAcu+2X4s
 sVJe0Czzrq+Kz24GR18gdSZDV1mGkHBdUd5peUdmwz1kK3FVHRUOszCBVPiCqtidLbGZiv22q5yzZ
 Z8wQJS7DcrTLzsX67x2Hxx09bKrTLl7d/RVO8U5Qh38/7sCYSQ+ULTTF9mNx6sWXNwLc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AW-00DnF0-EP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 971DF23A7C;
 Sat,  9 Jan 2021 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179186;
 bh=D2cLsgvBZJFGW9YnFrwrA+vuwvsBuSsiyb+lhDCp2YA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r5QndVHWjZk6u7rqhVsoxams/JD8MNoS8E8134pGAOKcfy/W4HnDInVFwg8sbEEFp
 7CHWAHWyQGIZoZ94yydkwzpAYhvMJVjbbgEVWlnMuxDKf7+Z2i0RO0Iv7oxCRhCAII
 AAktC4bPG7raefyxI2t2J3xz9PNXgYIHwLsRDAy+EIJc4gnOYAEg9v30npfco7nljx
 GorEyuHhWKODU/RpYM79+YYzl5L5vAf1Wdp0QxuBxG+91+l0APfc5JobO+OM+DATCD
 12YJuHKBOJhm05uzuD/Za3XLnD6cU5qNsKwkodBMng8GKiyR1lQSs4XDmiU2uqfyk8
 G/LTIYYbI+Svw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:59:00 -0800
Message-Id: <20210109075903.208222-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AW-00DnF0-EP
Subject: [f2fs-dev] [PATCH v2 09/12] fs: improve comments for
 writeback_single_inode()
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

Some comments for writeback_single_inode() and
__writeback_single_inode() are outdated or not very helpful, especially
with regards to writeback list handling.  Update them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/fs-writeback.c | 57 +++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index cee1df6e3bd43..e91980f493884 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1442,9 +1442,15 @@ static void requeue_inode(struct inode *inode, struct bdi_writeback *wb,
 }
 
 /*
- * Write out an inode and its dirty pages. Do not update the writeback list
- * linkage. That is left to the caller. The caller is also responsible for
- * setting I_SYNC flag and calling inode_sync_complete() to clear it.
+ * Write out an inode and its dirty pages (or some of its dirty pages, depending
+ * on @wbc->nr_to_write), and clear the relevant dirty flags from i_state.
+ *
+ * This doesn't remove the inode from the writeback list it is on, except
+ * potentially to move it from b_dirty_time to b_dirty due to timestamp
+ * expiration.  The caller is otherwise responsible for writeback list handling.
+ *
+ * The caller is also responsible for setting the I_SYNC flag beforehand and
+ * calling inode_sync_complete() to clear it afterwards.
  */
 static int
 __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
@@ -1487,9 +1493,10 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 	}
 
 	/*
-	 * Some filesystems may redirty the inode during the writeback
-	 * due to delalloc, clear dirty metadata flags right before
-	 * write_inode()
+	 * Get and clear the dirty flags from i_state.  This needs to be done
+	 * after calling writepages because some filesystems may redirty the
+	 * inode during writepages due to delalloc.  It also needs to be done
+	 * after handling timestamp expiration, as that may dirty the inode too.
 	 */
 	spin_lock(&inode->i_lock);
 	dirty = inode->i_state & I_DIRTY;
@@ -1524,12 +1531,13 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 }
 
 /*
- * Write out an inode's dirty pages. Either the caller has an active reference
- * on the inode or the inode has I_WILL_FREE set.
+ * Write out an inode's dirty data and metadata on-demand, i.e. separately from
+ * the regular batched writeback done by the flusher threads in
+ * writeback_sb_inodes().  @wbc controls various aspects of the write, such as
+ * whether it is a data-integrity sync (%WB_SYNC_ALL) or not (%WB_SYNC_NONE).
  *
- * This function is designed to be called for writing back one inode which
- * we go e.g. from filesystem. Flusher thread uses __writeback_single_inode()
- * and does more profound writeback list handling in writeback_sb_inodes().
+ * To prevent the inode from going away, either the caller must have a reference
+ * to the inode, or the inode must have I_WILL_FREE or I_FREEING set.
  */
 static int writeback_single_inode(struct inode *inode,
 				  struct writeback_control *wbc)
@@ -1544,23 +1552,23 @@ static int writeback_single_inode(struct inode *inode,
 		WARN_ON(inode->i_state & I_WILL_FREE);
 
 	if (inode->i_state & I_SYNC) {
-		if (wbc->sync_mode != WB_SYNC_ALL)
-			goto out;
 		/*
-		 * It's a data-integrity sync. We must wait. Since callers hold
-		 * inode reference or inode has I_WILL_FREE set, it cannot go
-		 * away under us.
+		 * Writeback is already running on the inode.  For WB_SYNC_NONE,
+		 * that's enough and we can just return.  For WB_SYNC_ALL, we
+		 * must wait for the existing writeback to complete, then do
+		 * writeback again if there's anything left.
 		 */
+		if (wbc->sync_mode != WB_SYNC_ALL)
+			goto out;
 		__inode_wait_for_writeback(inode);
 	}
 	WARN_ON(inode->i_state & I_SYNC);
 	/*
-	 * Skip inode if it is clean and we have no outstanding writeback in
-	 * WB_SYNC_ALL mode. We don't want to mess with writeback lists in this
-	 * function since flusher thread may be doing for example sync in
-	 * parallel and if we move the inode, it could get skipped. So here we
-	 * make sure inode is on some writeback list and leave it there unless
-	 * we have completely cleaned the inode.
+	 * If the inode is already fully clean, then there's nothing to do.
+	 *
+	 * For data-integrity syncs we also need to check whether any pages are
+	 * still under writeback, e.g. due to prior WB_SYNC_NONE writeback.  If
+	 * there are any such pages, we'll need to wait for them.
 	 */
 	if (!(inode->i_state & I_DIRTY_ALL) &&
 	    (wbc->sync_mode != WB_SYNC_ALL ||
@@ -1576,8 +1584,9 @@ static int writeback_single_inode(struct inode *inode,
 	wb = inode_to_wb_and_lock_list(inode);
 	spin_lock(&inode->i_lock);
 	/*
-	 * If inode is clean, remove it from writeback lists. Otherwise don't
-	 * touch it. See comment above for explanation.
+	 * If the inode is now fully clean, then it can be safely removed from
+	 * its writeback list (if any).  Otherwise the flusher threads are
+	 * responsible for the writeback lists.
 	 */
 	if (!(inode->i_state & I_DIRTY_ALL))
 		inode_io_list_del_locked(inode, wb);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
