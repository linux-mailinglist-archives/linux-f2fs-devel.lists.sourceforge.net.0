Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF22EA1B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Jan 2021 01:55:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwadT-0008P7-PB; Tue, 05 Jan 2021 00:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwadR-0008Oh-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhRPYWZ2x4mrygzUjiyDjp6klYAugmPB6SFzDvqIZ6Y=; b=Y6EP/SNOAstw7sk2yo070vj76d
 QQYOku3hUhwmmOxWmDoJ4eLkQAOnRux67V1gNIaGUS/IQ9LNC/xZ8iB9dN+C5aV1AEtm/wJ5f6GCT
 VTcpmS+Yh4SPSX8KJrX8GPMX7RZLwzSwte7pHaIoreK49fbmugss4fhXbreQC6v0l55M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhRPYWZ2x4mrygzUjiyDjp6klYAugmPB6SFzDvqIZ6Y=; b=WuPNLAneNbAvgpT5SKcVZk0mXM
 c/9+qddO1jt1L6dWoel7JmgB43guMSQ62gCmg75B0K0GxRudBtcxnCgJJ8NaWLgh58TWxQdOqAC48
 lGmaBV/HmH/XEP6XreAV4iXmfaq7AWsR2T0zpI207W8SQdn+UOwFPTb4B5atuBwSE2h0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwadK-008Hm5-LT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Jan 2021 00:55:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2125022795;
 Tue,  5 Jan 2021 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808110;
 bh=91nSgZ2cvoIYG1Sebm39KD0W1P3OHtZXEBiBRQSeSKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AiyfOoiEUs47PBjYYdnORuK5+uyNq9T8K8/rkbum//GtR0qLlsNmATSz0GknR9uxI
 hhBh+NHGfpYpkLHyjyml0/s2c9aJpOcQTCypFznxjYrQsk/HMBYos74Ei/IKLTNBnW
 EM7hmKuB0nw4oDbMf9dMWQvLDDomfah/68XFK+GDt/xQ6mE75eAzulS0S9MGGLuHaH
 YNyTtAWatP4RylXTOgeG/yp9/Q6IXq2gUeU/9I4uMZNtVOI2N0aVxEoVYyfLNFJdY4
 mvzW2ghf4yJN1ajl6Si45GsVbN9q9fnJlz6sc8OjQ0DeHLAwmluvEtUpFCTFZXdiBF
 hNbeXGrt4lCJQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  4 Jan 2021 16:54:50 -0800
Message-Id: <20210105005452.92521-12-ebiggers@kernel.org>
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
X-Headers-End: 1kwadK-008Hm5-LT
Subject: [f2fs-dev] [PATCH 11/13] fs: add a lazytime_expired method
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

Add a lazytime_expired method to 'struct super_operations'.  Filesystems
can implement this to be notified when an inode's lazytime timestamps
have expired and need to be written to disk.

This avoids any potential ambiguity with
->dirty_inode(inode, I_DIRTY_SYNC), which can also mean a generic
dirtying of the inode, not just a lazytime timestamp expiration.
In particular, this will be useful for XFS.

If not implemented, then ->dirty_inode(inode, I_DIRTY_SYNC) continues to
be called.

Note that there are three cases where we have to make sure to call
lazytime_expired():

- __writeback_single_inode(): inode is being written now
- vfs_fsync_range(): inode is going to be synced
- iput(): inode is going to be evicted

In the latter two cases, the inode still needs to be put on the
writeback list.  So, we can't just replace the calls to
mark_inode_dirty_sync() with lazytime_expired().  Instead, add a new
flag I_DIRTY_TIME_EXPIRED which can be passed to __mark_inode_dirty().
It's like I_DIRTY_SYNC, except it causes the filesystem to be notified
of a lazytime expiration rather than a generic I_DIRTY_SYNC.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/locking.rst |  2 ++
 Documentation/filesystems/vfs.rst     | 10 ++++++++++
 fs/fs-writeback.c                     | 27 ++++++++++++++++++++++-----
 fs/inode.c                            |  2 +-
 fs/sync.c                             |  2 +-
 include/linux/fs.h                    |  7 ++++++-
 6 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index c0f2c7586531b..53088e2a93b69 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -150,6 +150,7 @@ prototypes::
 	void (*free_inode)(struct inode *);
 	void (*destroy_inode)(struct inode *);
 	void (*dirty_inode) (struct inode *, int flags);
+	void (*lazytime_expired) (struct inode *);
 	int (*write_inode) (struct inode *, struct writeback_control *wbc);
 	int (*drop_inode) (struct inode *);
 	void (*evict_inode) (struct inode *);
@@ -175,6 +176,7 @@ alloc_inode:
 free_inode:				called from RCU callback
 destroy_inode:
 dirty_inode:
+lazytime_expired:
 write_inode:
 drop_inode:				!!!inode->i_lock!!!
 evict_inode:
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 287b80948a40b..02531b1421d01 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -231,6 +231,7 @@ filesystem.  As of kernel 2.6.22, the following members are defined:
 		void (*destroy_inode)(struct inode *);
 
 		void (*dirty_inode) (struct inode *, int flags);
+		void (*lazytime_expired) (struct inode *);
 		int (*write_inode) (struct inode *, int);
 		void (*drop_inode) (struct inode *);
 		void (*delete_inode) (struct inode *);
@@ -275,6 +276,15 @@ or bottom half).
 	not its data.  If the update needs to be persisted by fdatasync(),
 	then I_DIRTY_DATASYNC will be set in the flags argument.
 
+``lazytime_expired``
+	when the lazytime mount option is enabled, this method is
+	called when an inode's in-memory updated timestamps have
+	expired and thus need to be written to disk.  This happens
+	when the timestamps have been in memory for too long, when the
+	inode is going to be evicted, or when userspace triggers a
+	sync.  If this method is not implemented, then
+	->dirty_inode(inode, I_DIRTY_SYNC) is called instead.
+
 ``write_inode``
 	this method is called when the VFS needs to write an inode to
 	disc.  The second parameter indicates whether the write should
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index ed76112bd067b..f187fc3f854e4 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1441,6 +1441,14 @@ static void requeue_inode(struct inode *inode, struct bdi_writeback *wb,
 	}
 }
 
+static void lazytime_expired(struct inode *inode)
+{
+	if (inode->i_sb->s_op->lazytime_expired)
+		inode->i_sb->s_op->lazytime_expired(inode);
+	else if (inode->i_sb->s_op->dirty_inode)
+		inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_SYNC);
+}
+
 /*
  * Write out an inode and its dirty pages. Do not update the writeback list
  * linkage. That is left to the caller. The caller is also responsible for
@@ -1520,8 +1528,8 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 		 * isn't enough.  Don't call mark_inode_dirty_sync(), as that
 		 * would put the inode back on the dirty list.
 		 */
-		if ((dirty & I_DIRTY_TIME) && inode->i_sb->s_op->dirty_inode)
-			inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_SYNC);
+		if (dirty & I_DIRTY_TIME)
+			lazytime_expired(inode);
 
 		err = write_inode(inode, wbc);
 		if (ret == 0)
@@ -2231,8 +2239,9 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
  *
  * @inode: inode to mark
  * @flags: what kind of dirty, e.g. I_DIRTY_SYNC.  This can be a combination of
- *	   multiple I_DIRTY_* flags, except that I_DIRTY_TIME can't be combined
- *	   with I_DIRTY_PAGES.
+ *	   multiple I_DIRTY_* flags, except that:
+ *	   - I_DIRTY_TIME can't be combined with I_DIRTY_PAGES
+ *	   - I_DIRTY_TIME_EXPIRED must be used by itself
  *
  * Mark an inode as dirty.  We notify the filesystem, then update the inode's
  * dirty flags.  Then, if needed we add the inode to the appropriate dirty list.
@@ -2260,7 +2269,15 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 
 	trace_writeback_mark_inode_dirty(inode, flags);
 
-	if (flags & I_DIRTY_INODE) {
+	if (flags & I_DIRTY_TIME_EXPIRED) {
+		/*
+		 * Notify the filesystem about a lazytime timestamp expiration.
+		 * Afterwards, this case just turns into I_DIRTY_SYNC.
+		 */
+		WARN_ON_ONCE(flags & ~I_DIRTY_TIME_EXPIRED);
+		lazytime_expired(inode);
+		flags = I_DIRTY_SYNC;
+	} else if (flags & I_DIRTY_INODE) {
 		/*
 		 * Notify the filesystem about the inode being dirtied, so that
 		 * (if needed) it can update on-disk fields and journal the
diff --git a/fs/inode.c b/fs/inode.c
index d0fa43d8e9d5c..039b201a4743a 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1673,7 +1673,7 @@ void iput(struct inode *inode)
 			atomic_inc(&inode->i_count);
 			spin_unlock(&inode->i_lock);
 			trace_writeback_lazytime_iput(inode);
-			mark_inode_dirty_sync(inode);
+			__mark_inode_dirty(inode, I_DIRTY_TIME_EXPIRED);
 			goto retry;
 		}
 		iput_final(inode);
diff --git a/fs/sync.c b/fs/sync.c
index 1373a610dc784..363071a3528e3 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -196,7 +196,7 @@ int vfs_fsync_range(struct file *file, loff_t start, loff_t end, int datasync)
 	if (!file->f_op->fsync)
 		return -EINVAL;
 	if (!datasync && (inode->i_state & I_DIRTY_TIME))
-		mark_inode_dirty_sync(inode);
+		__mark_inode_dirty(inode, I_DIRTY_TIME_EXPIRED);
 	return file->f_op->fsync(file, start, end, datasync);
 }
 EXPORT_SYMBOL(vfs_fsync_range);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 45a0303b2aeb6..8c5f5c5e62be4 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1935,7 +1935,8 @@ struct super_operations {
 	void (*destroy_inode)(struct inode *);
 	void (*free_inode)(struct inode *);
 
-   	void (*dirty_inode) (struct inode *, int flags);
+	void (*dirty_inode) (struct inode *, int flags);
+	void (*lazytime_expired)(struct inode *);
 	int (*write_inode) (struct inode *, struct writeback_control *wbc);
 	int (*drop_inode) (struct inode *);
 	void (*evict_inode) (struct inode *);
@@ -2108,6 +2109,9 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
  *			(I_DIRTY_SYNC and/or I_DIRTY_DATASYNC) gets set.  I.e.
  *			either I_DIRTY_TIME *or* I_DIRTY_INODE can be set in
  *			i_state, but not both.  I_DIRTY_PAGES may still be set.
+ * I_DIRTY_TIME_EXPIRED Passed to __mark_inode_dirty() to indicate the intent to
+ *			expire the inode's timestamps.  Not stored in i_state.
+ *
  * I_NEW		Serves as both a mutex and completion notification.
  *			New inodes set I_NEW.  If two processes both create
  *			the same inode, one of them will release its inode and
@@ -2173,6 +2177,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 #define I_DIO_WAKEUP		(1 << __I_DIO_WAKEUP)
 #define I_LINKABLE		(1 << 10)
 #define I_DIRTY_TIME		(1 << 11)
+#define I_DIRTY_TIME_EXPIRED	(1 << 12)
 #define I_WB_SWITCH		(1 << 13)
 #define I_OVL_INUSE		(1 << 14)
 #define I_CREATING		(1 << 15)
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
