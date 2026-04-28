Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNYpKjRx8Gn9TQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:35:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDD4803A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfbcF2Y4myiAvxBlvH6f+o2T5ICl/zN0P026th+ZiNQ=; b=Kio+NxAtps5I3bm58PeutQaq4l
	TA/J9uFC14e6fuaL59Im8vJjw9vdwRGmU9ZjHWOWkC4RBaRe+vPP/zK7zOSSvU1p0kDMBcGqH37ek
	8i33lpDd2OJYOaz8XvfgBPMATFmnotB+E9iVG0OOsAPHknegQkwpcv3FtlPXVfwwOBG4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHduE-000179-13;
	Tue, 28 Apr 2026 08:34:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wHduC-00016o-L5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yvyeA2Fs6+2dDQ4dRJmx8UuxKXno+QOxhis1QtDYjfQ=; b=VP9F8XFsdqZ75nrjwlNl6v1+/9
 IDjYstE0vRVUbt+HimTHdijvicyEa7q2YMc9Xiz4uDt/1wU3gfGONb1DeQxotlunHWvXu1L+1q9ns
 Aq2idRFthx5ho0dle6oDB0sAETPHLgXH3f7yUK1f0Bd04vH1zhJx/RoLRPqpYMJwye6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yvyeA2Fs6+2dDQ4dRJmx8UuxKXno+QOxhis1QtDYjfQ=; b=aKqCV556mzcGT8gstptBFgmzhd
 s5wkG98LUeNeJIRGQllWqtwqkssy0ZgrAz4fOnj4/uQu+lx5eSyRzkj+OYX3g21utwO/ME77mneu0
 FMNvLkoC4I+zMUCi0Aj6H+D6O8jTs+4lZC8oXFgVUjqvQgPxPtmUU6nwQOZ17hKssLbA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHduB-0004hB-52 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F6BF448D1;
 Tue, 28 Apr 2026 08:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D23C2BCB9;
 Tue, 28 Apr 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777365282;
 bh=Kym6bKRbqaO8EP2n1GwfV7Ah82LxJVemaFFRn6P/i/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wz4AHt3xAXrC5vwFTUXbbUlIpLlgbpFnplwtJBMDMGLd39WM4CrgpDL8yYfwiJlTQ
 AUOvy6nH+FuQWuP+nznjRUyRbD4u6h7OL2kISn6g2tyWZQfAR0PEI95UjV1+1WS1jl
 PKjaXzwziG1PE3EI2tKPe+Ctn+mUY0/IUZ/FiILcq/0cbNyJ4NzMofHYJ2XhhEVgvH
 IHBHhuRsrfsyJ9vBACDojDCDEE43uX7G/Fu87erK2iTz/U1UCaOy+MRrZlzc8JJ/LP
 NHO1YpWDqWmKkFEfRlZY9rLr35rO7N9jF05Lhv/gZ+ftidYQPTie0YGgy72Z0QgTzi
 +kRrU+/ElW6DA==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Tue, 28 Apr 2026 10:33:22 +0200
Message-ID: <20260428083332.768693-17-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260428083332.768693-1-aalbersh@kernel.org>
References: <20260428083332.768693-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add integration with fs-verity. XFS stores fs-verity
 descriptor
 and Merkle tree in the inode data fork at first block aligned to 64k past
 EOF. The Merkle tree reading/writing is done through iomap interface. The
 data itself is read to the inode's page cache. When XFS reads from this region
 iomap doesn't call into fsverity to verify it agains [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHduB-0004hB-52
Subject: [f2fs-dev] [PATCH v9 16/22] xfs: add fs-verity support
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1ECDD4803A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Add integration with fs-verity. XFS stores fs-verity descriptor and
Merkle tree in the inode data fork at first block aligned to 64k past
EOF.

The Merkle tree reading/writing is done through iomap interface. The
data itself is read to the inode's page cache. When XFS reads from this
region iomap doesn't call into fsverity to verify it against Merkle
tree. For data, verification is done at ioend completion in a workqueue.

When fs-verity is enabled on an inode, the XFS_IVERITY_CONSTRUCTION
flag is set meaning that the Merkle tree is being build. The
initialization ends with storing of verity descriptor and setting
inode on-disk flag (XFS_DIFLAG2_VERITY). Lastly, the
XFS_IVERITY_CONSTRUCTION is dropped and I_VERITY is set on inode.

The descriptor is stored in a new block aligned to 64k after the last
Merkle tree block. The size of the descriptor is stored at the end of
the last descriptor block (descriptor can be multiple blocks).

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/xfs/xfs_bmap_util.c |   8 +
 fs/xfs/xfs_fsverity.c  | 353 ++++++++++++++++++++++++++++++++++++++++-
 fs/xfs/xfs_fsverity.h  |   2 +
 fs/xfs/xfs_message.c   |   4 +
 fs/xfs/xfs_message.h   |   1 +
 fs/xfs/xfs_mount.h     |   2 +
 fs/xfs/xfs_super.c     |   7 +
 7 files changed, 376 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
index 0ab00615f1ad..18348f4fd2aa 100644
--- a/fs/xfs/xfs_bmap_util.c
+++ b/fs/xfs/xfs_bmap_util.c
@@ -31,6 +31,7 @@
 #include "xfs_rtbitmap.h"
 #include "xfs_rtgroup.h"
 #include "xfs_zone_alloc.h"
+#include <linux/fsverity.h>
 
 /* Kernel only BMAP related definitions and functions */
 
@@ -553,6 +554,13 @@ xfs_can_free_eofblocks(
 	if (last_fsb <= end_fsb)
 		return false;
 
+	/*
+	 * Nothing to clean on fsverity inodes as they don't use prealloc and
+	 * there no delalloc as only written data is fsverity metadata
+	 */
+	if (IS_VERITY(VFS_I(ip)))
+		return false;
+
 	/*
 	 * Check if there is an post-EOF extent to free.  If there are any
 	 * delalloc blocks attached to the inode (data fork delalloc
diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
index b983e20bb5e1..a06885291412 100644
--- a/fs/xfs/xfs_fsverity.c
+++ b/fs/xfs/xfs_fsverity.c
@@ -4,14 +4,26 @@
  */
 #include "xfs_platform.h"
 #include "xfs_format.h"
-#include "xfs_inode.h"
 #include "xfs_shared.h"
 #include "xfs_trans_resv.h"
 #include "xfs_mount.h"
 #include "xfs_fsverity.h"
+#include "xfs_da_format.h"
+#include "xfs_da_btree.h"
+#include "xfs_inode.h"
+#include "xfs_log_format.h"
+#include "xfs_bmap_util.h"
+#include "xfs_log_format.h"
+#include "xfs_trans.h"
+#include "xfs_trace.h"
+#include "xfs_quota.h"
 #include "xfs_fsverity.h"
+#include "xfs_iomap.h"
+#include "xfs_error.h"
+#include "xfs_health.h"
 #include <linux/fsverity.h>
 #include <linux/iomap.h>
+#include <linux/pagemap.h>
 
 loff_t
 xfs_fsverity_metadata_offset(
@@ -28,3 +40,342 @@ xfs_fsverity_is_file_data(
 	return fsverity_active(VFS_IC(ip)) &&
 			offset < xfs_fsverity_metadata_offset(ip);
 }
+
+/*
+ * Retrieve the verity descriptor.
+ */
+static int
+xfs_fsverity_get_descriptor(
+	struct inode		*inode,
+	void			*buf,
+	size_t			buf_size)
+{
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_mount	*mp = ip->i_mount;
+	__be32			d_desc_size;
+	u32			desc_size;
+	u64			desc_size_pos;
+	int			error;
+	u64			desc_pos;
+	struct xfs_bmbt_irec	rec;
+	int			is_empty;
+	uint32_t		blocksize = i_blocksize(VFS_I(ip));
+	xfs_fileoff_t		last_block_offset;
+
+	ASSERT(inode->i_flags & S_VERITY);
+	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
+	if (error)
+		return error;
+
+	if (is_empty)
+		return -ENODATA;
+
+	last_block_offset =
+		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
+	if (last_block_offset < xfs_fsverity_metadata_offset(ip))
+		return -ENODATA;
+
+	desc_size_pos = last_block_offset - sizeof(__be32);
+	error = fsverity_pagecache_read(inode, (char *)&d_desc_size,
+			sizeof(d_desc_size), desc_size_pos);
+	if (error)
+		return error;
+
+	desc_size = be32_to_cpu(d_desc_size);
+	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
+		return -ERANGE;
+	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
+		return -ERANGE;
+
+	if (!buf_size)
+		return desc_size;
+
+	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
+		return -ERANGE;
+
+	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
+	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
+	if (error)
+		return error;
+
+	return desc_size;
+}
+
+static int
+xfs_fsverity_write_descriptor(
+	struct file		*file,
+	const void		*desc,
+	u32			desc_size,
+	u64			merkle_tree_size)
+{
+	int			error;
+	struct inode		*inode = file_inode(file);
+	struct xfs_inode	*ip = XFS_I(inode);
+	unsigned int		blksize = ip->i_mount->m_sb.sb_blocksize;
+	u64			tree_last_block =
+			xfs_fsverity_metadata_offset(ip) + merkle_tree_size;
+	u64			desc_pos =
+			round_up(tree_last_block, XFS_FSVERITY_START_ALIGN);
+	u64			desc_end = desc_pos + desc_size;
+	__be32			desc_size_disk = cpu_to_be32(desc_size);
+	u64			desc_size_pos =
+			round_up(desc_end + sizeof(desc_size_disk), blksize) -
+			sizeof(desc_size_disk);
+
+	error = iomap_fsverity_write(file, desc_size_pos, sizeof(__be32),
+			(const void *)&desc_size_disk,
+			&xfs_buffered_write_iomap_ops,
+			&xfs_iomap_write_ops);
+	if (error)
+		return error;
+
+	return iomap_fsverity_write(file, desc_pos, desc_size, desc,
+			&xfs_buffered_write_iomap_ops,
+			&xfs_iomap_write_ops);
+}
+
+/*
+ * Try to remove all the fsverity metadata after a failed enablement.
+ */
+static int
+xfs_fsverity_delete_metadata(
+	struct xfs_inode	*ip)
+{
+	struct xfs_trans	*tp;
+	struct xfs_mount	*mp = ip->i_mount;
+	int			error;
+
+	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
+	if (error)
+		return error;
+
+	xfs_ilock(ip, XFS_ILOCK_EXCL);
+	xfs_trans_ijoin(tp, ip, 0);
+
+	/*
+	 * We removing post EOF data, no need to update i_size as fsverity
+	 * didn't move i_size in the first place
+	 */
+	error = xfs_itruncate_extents(&tp, ip, XFS_DATA_FORK, XFS_ISIZE(ip));
+	if (error)
+		goto err_cancel;
+
+	error = xfs_trans_commit(tp);
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+
+	return error;
+
+err_cancel:
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+	xfs_trans_cancel(tp);
+	return error;
+}
+
+
+/*
+ * Prepare to enable fsverity by clearing old metadata.
+ */
+static int
+xfs_fsverity_begin_enable(
+	struct file		*filp)
+{
+	struct inode		*inode = file_inode(filp);
+	struct xfs_inode	*ip = XFS_I(inode);
+	int			error;
+
+	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
+
+	if (IS_DAX(inode))
+		return -EINVAL;
+
+	if (inode->i_size > XFS_FSVERITY_LARGEST_FILE)
+		return -EFBIG;
+
+	/*
+	 * Flush pagecache before building Merkle tree. Inode is locked and no
+	 * further writes will happen to the file except fsverity metadata
+	 */
+	error = filemap_write_and_wait(inode->i_mapping);
+	if (error)
+		return error;
+
+	if (xfs_iflags_test_and_set(ip, XFS_VERITY_CONSTRUCTION))
+		return -EBUSY;
+
+	error = xfs_qm_dqattach(ip);
+	if (error)
+		return error;
+
+	return xfs_fsverity_delete_metadata(ip);
+}
+
+/*
+ * Complete (or fail) the process of enabling fsverity.
+ */
+static int
+xfs_fsverity_end_enable(
+	struct file		*file,
+	const void		*desc,
+	size_t			desc_size,
+	u64			merkle_tree_size)
+{
+	struct inode		*inode = file_inode(file);
+	struct xfs_inode	*ip = XFS_I(inode);
+	struct xfs_mount	*mp = ip->i_mount;
+	struct xfs_trans	*tp;
+	int			error = 0;
+	loff_t			range_start = xfs_fsverity_metadata_offset(ip);
+
+	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
+
+	/* fs-verity failed, just cleanup */
+	if (desc == NULL) {
+		error = xfs_fsverity_delete_metadata(ip);
+		goto out;
+	}
+
+	error = xfs_fsverity_write_descriptor(file, desc, desc_size,
+			merkle_tree_size);
+	if (error)
+		goto out;
+
+	/*
+	 * Wait for Merkle tree get written to disk before setting on-disk inode
+	 * flag and clearing XFS_VERITY_CONSTRUCTION
+	 */
+	error = filemap_write_and_wait_range(inode->i_mapping, range_start,
+			LLONG_MAX);
+	if (error)
+		goto out;
+
+	/*
+	 * Proactively drop any delayed allocations in COW fork, the fsverity
+	 * files are read-only
+	 */
+	if (xfs_is_cow_inode(ip))
+		xfs_bmap_punch_delalloc_range(ip, XFS_COW_FORK, 0, LLONG_MAX,
+				NULL);
+
+	/*
+	 * Set fsverity inode flag
+	 */
+	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_ichange,
+			0, 0, false, &tp);
+	if (error)
+		goto out;
+
+	/*
+	 * Ensure that we've persisted the verity information before we enable
+	 * it on the inode and tell the caller we have sealed the inode.
+	 */
+	ip->i_diflags2 |= XFS_DIFLAG2_VERITY;
+
+	xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
+	xfs_trans_set_sync(tp);
+
+	error = xfs_trans_commit(tp);
+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
+
+	if (!error)
+		inode->i_flags |= S_VERITY;
+
+out:
+	if (error) {
+		int	error2;
+
+		error2 = xfs_fsverity_delete_metadata(ip);
+		if (error2)
+			xfs_alert(ip->i_mount,
+"ino 0x%llx failed to clean up new fsverity metadata, err %d",
+					ip->i_ino, error2);
+	}
+
+	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
+	return error;
+}
+
+/*
+ * Retrieve a merkle tree block.
+ */
+static struct page *
+xfs_fsverity_read_merkle(
+	struct inode		*inode,
+	pgoff_t			index)
+{
+	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+
+	return generic_read_merkle_tree_page(inode, index);
+}
+
+/*
+ * Retrieve a merkle tree block.
+ */
+static void
+xfs_fsverity_readahead_merkle_tree(
+	struct inode		*inode,
+	pgoff_t			index,
+	unsigned long		nr_pages)
+{
+	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
+
+	generic_readahead_merkle_tree(inode, index, nr_pages);
+}
+
+/*
+ * Write a merkle tree block.
+ */
+static int
+xfs_fsverity_write_merkle(
+	struct file		*file,
+	const void		*buf,
+	u64			pos,
+	unsigned int		size,
+	const u8		*zero_digest,
+	unsigned int		digest_size)
+{
+	struct inode		*inode = file_inode(file);
+	struct xfs_inode	*ip = XFS_I(inode);
+	loff_t			position = pos +
+		xfs_fsverity_metadata_offset(ip);
+
+	if (position + size > inode->i_sb->s_maxbytes)
+		return -EFBIG;
+
+	/*
+	 * If this is a block full of hashes of zeroed blocks, don't bother
+	 * storing the block. We can synthesize them later.
+	 *
+	 * However, do this only in case Merkle tree block == fs block size.
+	 * Iomap synthesizes these blocks based on holes in the merkle tree. We
+	 * won't be able to tell if something need to be synthesizes for the
+	 * range in the fs block. For example, for 4k filesystem block
+	 *
+	 *	[ 1k | zero hashes | zero hashes | 1k ]
+	 *
+	 * Iomap won't know about these empty blocks.
+	 */
+	if (size == ip->i_mount->m_sb.sb_blocksize &&
+			/*
+			 * First digest is zero_digest
+			 */
+			memcmp(buf, zero_digest, digest_size) == 0 &&
+			/*
+			 * Every digest is same as previous, thus all are
+			 * zero_digest
+			 */
+			memcmp(buf + digest_size, buf, size - digest_size) == 0)
+		return 0;
+
+	return iomap_fsverity_write(file, position, size, buf,
+			&xfs_buffered_write_iomap_ops,
+			&xfs_iomap_write_ops);
+}
+
+const struct fsverity_operations xfs_fsverity_ops = {
+	.begin_enable_verity		= xfs_fsverity_begin_enable,
+	.end_enable_verity		= xfs_fsverity_end_enable,
+	.get_verity_descriptor		= xfs_fsverity_get_descriptor,
+	.read_merkle_tree_page		= xfs_fsverity_read_merkle,
+	.readahead_merkle_tree		= xfs_fsverity_readahead_merkle_tree,
+	.write_merkle_tree_block	= xfs_fsverity_write_merkle,
+};
diff --git a/fs/xfs/xfs_fsverity.h b/fs/xfs/xfs_fsverity.h
index ec77ba571106..6a981e20a75b 100644
--- a/fs/xfs/xfs_fsverity.h
+++ b/fs/xfs/xfs_fsverity.h
@@ -6,8 +6,10 @@
 #define __XFS_FSVERITY_H__
 
 #include "xfs_platform.h"
+#include <linux/fsverity.h>
 
 #ifdef CONFIG_FS_VERITY
+extern const struct fsverity_operations xfs_fsverity_ops;
 loff_t xfs_fsverity_metadata_offset(const struct xfs_inode *ip);
 bool xfs_fsverity_is_file_data(const struct xfs_inode *ip, loff_t offset);
 #else
diff --git a/fs/xfs/xfs_message.c b/fs/xfs/xfs_message.c
index fd297082aeb8..9818d8f8f239 100644
--- a/fs/xfs/xfs_message.c
+++ b/fs/xfs/xfs_message.c
@@ -153,6 +153,10 @@ xfs_warn_experimental(
 			.opstate	= XFS_OPSTATE_WARNED_ZONED,
 			.name		= "zoned RT device",
 		},
+		[XFS_EXPERIMENTAL_FSVERITY] = {
+			.opstate	= XFS_OPSTATE_WARNED_FSVERITY,
+			.name		= "fsverity",
+		},
 	};
 	ASSERT(feat >= 0 && feat < XFS_EXPERIMENTAL_MAX);
 	BUILD_BUG_ON(ARRAY_SIZE(features) != XFS_EXPERIMENTAL_MAX);
diff --git a/fs/xfs/xfs_message.h b/fs/xfs/xfs_message.h
index 49b0ef40d299..083403944f11 100644
--- a/fs/xfs/xfs_message.h
+++ b/fs/xfs/xfs_message.h
@@ -94,6 +94,7 @@ enum xfs_experimental_feat {
 	XFS_EXPERIMENTAL_SHRINK,
 	XFS_EXPERIMENTAL_LARP,
 	XFS_EXPERIMENTAL_ZONED,
+	XFS_EXPERIMENTAL_FSVERITY,
 
 	XFS_EXPERIMENTAL_MAX,
 };
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index 07f6aa3c3f26..84d7cfb5e2c7 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -583,6 +583,8 @@ __XFS_HAS_FEAT(nouuid, NOUUID)
 #define XFS_OPSTATE_WARNED_ZONED	19
 /* (Zoned) GC is in progress */
 #define XFS_OPSTATE_ZONEGC_RUNNING	20
+/* Kernel has logged a warning about fsverity support */
+#define XFS_OPSTATE_WARNED_FSVERITY	21
 
 #define __XFS_IS_OPSTATE(name, NAME) \
 static inline bool xfs_is_ ## name (struct xfs_mount *mp) \
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index f8de44443e81..d9d442009610 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -30,6 +30,7 @@
 #include "xfs_filestream.h"
 #include "xfs_quota.h"
 #include "xfs_sysfs.h"
+#include "xfs_fsverity.h"
 #include "xfs_ondisk.h"
 #include "xfs_rmap_item.h"
 #include "xfs_refcount_item.h"
@@ -1686,6 +1687,9 @@ xfs_fs_fill_super(
 	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
 #endif
 	sb->s_op = &xfs_super_operations;
+#ifdef CONFIG_FS_VERITY
+	sb->s_vop = &xfs_fsverity_ops;
+#endif
 
 	/*
 	 * Delay mount work if the debug hook is set. This is debug
@@ -1939,6 +1943,9 @@ xfs_fs_fill_super(
 	if (error)
 		goto out_filestream_unmount;
 
+	if (xfs_has_verity(mp))
+		xfs_warn_experimental(mp, XFS_EXPERIMENTAL_FSVERITY);
+
 	root = igrab(VFS_I(mp->m_rootip));
 	if (!root) {
 		error = -ENOENT;
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
