Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 865AE3C60F0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jul 2021 18:56:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2zEI-0005Lx-Lv; Mon, 12 Jul 2021 16:56:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m2zEI-0005Lk-91
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QEFMUcS9qjUtKezhyR8KVCgUDuuKy80h1wOdNoRHn94=; b=mCOLStjiAqg1ANRoQWwSH/zyB1
 Z7KuiN6IJeeSR+IY/Pu3+cXcssb0ln4hnO+OIpI/4nUyWAAlTz6l0e9teAwHBdcXu/Fuht8HawTeB
 iJTJcHHIFstEfP70h2xd5lvSz/0uTlqbWcpDWKwpvx/z81ocehjKzyiLUzQEJG7KrY18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QEFMUcS9qjUtKezhyR8KVCgUDuuKy80h1wOdNoRHn94=; b=h+nM3lS/3EIg920KNbm/DdkWRc
 MLbaGMm2NdQvPjo9Ed5X4BY5MaQyJGcg8frpeMsXDAVJciJK0HRnPdVCS4JacP05ss0k67Jmk4+8f
 a+GLbZAJ6J27k+kSo9UFAwloGX5Cdl1hg295UrLXjDJcmmDLQOWHAYKHmRWFRJXDC+7Y=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2zEB-005zK8-Pn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Jul 2021 16:56:26 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4319322126;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626108970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEFMUcS9qjUtKezhyR8KVCgUDuuKy80h1wOdNoRHn94=;
 b=13qOM53Y88NqjOt7nLwytud/jIuZxO+WBjggf5l/f6ZS+Hlg+NEgOraFaWjytJPotpmzwB
 6BZNzqhv7RENRWaX/KCz8VoxwpI4Q1t9EylDND4ClFFe5JsDv8U6BDCalefCILHXaZzeiR
 A/NGvFbZc9Mz0qHR/PtDALVKfsA06Mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626108970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEFMUcS9qjUtKezhyR8KVCgUDuuKy80h1wOdNoRHn94=;
 b=4wxJN1TZ3/u8romzh/c+IqlN6r+ns20ASJT61VZWBeTlhmCtt0oVzZQKYWUZaKyruDPEB/
 joqaZVtCG/f4jYAw==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 26D3AA3B93;
 Mon, 12 Jul 2021 16:56:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D70661F2CDA; Mon, 12 Jul 2021 18:56:09 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Mon, 12 Jul 2021 18:56:00 +0200
Message-Id: <20210712165609.13215-9-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210712163901.29514-1-jack@suse.cz>
References: <20210712163901.29514-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4962; h=from:subject;
 bh=BkFIeDQJLt3VUlGxHPiHMbNyQjSPAglxlFXoJSefPwA=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBg7HQgrmnnYiDuJLkZN6B9soYAFPxL773Kba3F9V27
 njF+av+JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYOx0IAAKCRCcnaoHP2RA2Uk3CA
 CrlIJtcp4UNOMs4dDA5AJ0Pn5WqCtPUtrnzgZlMLSAVPgfZUZqD7fZ87xakhbK+hncNtbLf4jqpeqs
 ZcuNM2SmdJFp1Dug15XUQo3qClA2TGyQX+lD3OZUfl0PJHq37s8vE88dZtD7PJ/4sFdmqgKCnfyO7C
 Qj/krgPrX79hwCGfxkxFYu6g0jiW9Xrj90H2kPl6ltdWNNBWX07ZvUcGCQk+ew4uBmjGxagDE6yPXz
 ycqbCSZATHxK3JwGpD0BNw+wuQZkf4zPDHpIDMHLHyiyHwvSmcUyVAvKQbATFL5hu2aXRW62AXpy4e
 oPebIZhd7xAtbZHzBi6estmuyONJrn
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m2zEB-005zK8-Pn
Subject: [f2fs-dev] [PATCH 09/14] xfs: Convert double locking of MMAPLOCK to
 use VFS helpers
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jan Kara <jack@suse.cz>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert places in XFS that take MMAPLOCK for two inodes to use helper
VFS provides for it (filemap_invalidate_down_write_two()). Note that
this changes lock ordering for MMAPLOCK from inode number based ordering
to pointer based ordering VFS generally uses.

CC: "Darrick J. Wong" <djwong@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/xfs/xfs_bmap_util.c | 15 ++++++++-------
 fs/xfs/xfs_inode.c     | 37 +++++++++++--------------------------
 2 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
index 213a97a921bb..1cd3f940fa6a 100644
--- a/fs/xfs/xfs_bmap_util.c
+++ b/fs/xfs/xfs_bmap_util.c
@@ -1626,7 +1626,6 @@ xfs_swap_extents(
 	struct xfs_bstat	*sbp = &sxp->sx_stat;
 	int			src_log_flags, target_log_flags;
 	int			error = 0;
-	int			lock_flags;
 	uint64_t		f;
 	int			resblks = 0;
 	unsigned int		flags = 0;
@@ -1638,8 +1637,8 @@ xfs_swap_extents(
 	 * do the rest of the checks.
 	 */
 	lock_two_nondirectories(VFS_I(ip), VFS_I(tip));
-	lock_flags = XFS_MMAPLOCK_EXCL;
-	xfs_lock_two_inodes(ip, XFS_MMAPLOCK_EXCL, tip, XFS_MMAPLOCK_EXCL);
+	filemap_invalidate_lock_two(VFS_I(ip)->i_mapping,
+				    VFS_I(tip)->i_mapping);
 
 	/* Verify that both files have the same format */
 	if ((VFS_I(ip)->i_mode & S_IFMT) != (VFS_I(tip)->i_mode & S_IFMT)) {
@@ -1711,7 +1710,6 @@ xfs_swap_extents(
 	 * or cancel will unlock the inodes from this point onwards.
 	 */
 	xfs_lock_two_inodes(ip, XFS_ILOCK_EXCL, tip, XFS_ILOCK_EXCL);
-	lock_flags |= XFS_ILOCK_EXCL;
 	xfs_trans_ijoin(tp, ip, 0);
 	xfs_trans_ijoin(tp, tip, 0);
 
@@ -1830,13 +1828,16 @@ xfs_swap_extents(
 	trace_xfs_swap_extent_after(ip, 0);
 	trace_xfs_swap_extent_after(tip, 1);
 
+out_unlock_ilock:
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+	xfs_iunlock(tip, XFS_ILOCK_EXCL);
 out_unlock:
-	xfs_iunlock(ip, lock_flags);
-	xfs_iunlock(tip, lock_flags);
+	filemap_invalidate_unlock_two(VFS_I(ip)->i_mapping,
+				      VFS_I(tip)->i_mapping);
 	unlock_two_nondirectories(VFS_I(ip), VFS_I(tip));
 	return error;
 
 out_trans_cancel:
 	xfs_trans_cancel(tp);
-	goto out_unlock;
+	goto out_unlock_ilock;
 }
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index d6a8ac76b45d..3c0bb21453dc 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -552,12 +552,10 @@ xfs_lock_inodes(
 }
 
 /*
- * xfs_lock_two_inodes() can only be used to lock one type of lock at a time -
- * the mmaplock or the ilock, but not more than one type at a time. If we lock
- * more than one at a time, lockdep will report false positives saying we have
- * violated locking orders.  The iolock must be double-locked separately since
- * we use i_rwsem for that.  We now support taking one lock EXCL and the other
- * SHARED.
+ * xfs_lock_two_inodes() can only be used to lock ilock. The iolock and
+ * mmaplock must be double-locked separately since we use i_rwsem and
+ * invalidate_lock for that. We now support taking one lock EXCL and the
+ * other SHARED.
  */
 void
 xfs_lock_two_inodes(
@@ -575,15 +573,8 @@ xfs_lock_two_inodes(
 	ASSERT(hweight32(ip1_mode) == 1);
 	ASSERT(!(ip0_mode & (XFS_IOLOCK_SHARED|XFS_IOLOCK_EXCL)));
 	ASSERT(!(ip1_mode & (XFS_IOLOCK_SHARED|XFS_IOLOCK_EXCL)));
-	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
-	       !(ip0_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
-	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
-	       !(ip1_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
-	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
-	       !(ip0_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
-	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
-	       !(ip1_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
-
+	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)));
+	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)));
 	ASSERT(ip0->i_ino != ip1->i_ino);
 
 	if (ip0->i_ino > ip1->i_ino) {
@@ -3748,11 +3739,8 @@ xfs_ilock2_io_mmap(
 	ret = xfs_iolock_two_inodes_and_break_layout(VFS_I(ip1), VFS_I(ip2));
 	if (ret)
 		return ret;
-	if (ip1 == ip2)
-		xfs_ilock(ip1, XFS_MMAPLOCK_EXCL);
-	else
-		xfs_lock_two_inodes(ip1, XFS_MMAPLOCK_EXCL,
-				    ip2, XFS_MMAPLOCK_EXCL);
+	filemap_invalidate_lock_two(VFS_I(ip1)->i_mapping,
+				    VFS_I(ip2)->i_mapping);
 	return 0;
 }
 
@@ -3762,12 +3750,9 @@ xfs_iunlock2_io_mmap(
 	struct xfs_inode	*ip1,
 	struct xfs_inode	*ip2)
 {
-	bool			same_inode = (ip1 == ip2);
-
-	xfs_iunlock(ip2, XFS_MMAPLOCK_EXCL);
-	if (!same_inode)
-		xfs_iunlock(ip1, XFS_MMAPLOCK_EXCL);
+	filemap_invalidate_unlock_two(VFS_I(ip1)->i_mapping,
+				      VFS_I(ip2)->i_mapping);
 	inode_unlock(VFS_I(ip2));
-	if (!same_inode)
+	if (ip1 != ip2)
 		inode_unlock(VFS_I(ip1));
 }
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
