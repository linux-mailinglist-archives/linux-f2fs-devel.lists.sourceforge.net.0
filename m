Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A26EC515
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5J-0007IV-1T;
	Mon, 24 Apr 2023 05:49:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5H-0007IL-08 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRgCZMat6SwmbUJc5nYBP6IbIwCnK37cme83Pl+2pA8=; b=RuJs+4j3k+5DRVoUosPqnznquO
 yNHdXNw0fDZPZkK7hs/GK1ynerkXPDTDdSaWl2ELm0Zb6n41QrYk6oUddq1tw5hXMgkNUGcpF03fU
 rPI8r2XBnuZ3CN+bylxkGSvkHmYU+hTOLLnqsaNdHzWIZdnLNJHvxumpnQTliwELocq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRgCZMat6SwmbUJc5nYBP6IbIwCnK37cme83Pl+2pA8=; b=iKSrVpaV57T/fcZbJEslD68taM
 Qtxx7JoiuN52efOdr1ekpBK+b+Xe4a1gqmIbaZBIZ+imHXay4mxIzc4Sh40Nln7h1TNP0DGIEE3To
 UAAL6mWSRgBb+bAUtvtKB/N/XylBg/33DPCXNrAt8fJk6PGDVEeQzSKABoucai/7GQY4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5E-0003Ts-MJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:49:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TRgCZMat6SwmbUJc5nYBP6IbIwCnK37cme83Pl+2pA8=; b=IisOQjT9f5WFKcdC3Jd5pbj8sh
 4VxYG9fcjD21qV4vH246OoxCV6nph/mgCU3NIWP8P4y3dlViSSGAmZjXKbLou0yjIYZaM3cnIY2Kt
 mjxtvSSMGgpzOLyFt6Owfa5+glDjlrIybM/1ZBwz3b1jzQlJ1EgeUSLyfdrbYx4CDGDKxjiIrnu36
 kfJfmV8CzCSfJEL70k1/Giql2X0o5GEh/voLjYWzXCdDVciAzPcCtw1ssj+JIttdkB/PCHceRsfbT
 6ORot5jXqhFK8ewJjwizNl7JjjUwrZhWXmblesM672+/0ZZBeLqjjqHAXGNhN8Y39rALvBAMKA3jw
 wWfxZqbQ==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp51-00FOul-1F; Mon, 24 Apr 2023 05:49:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:12 +0200
Message-Id: <20230424054926.26927-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: block_page_mkwrite_return is neither block nor mkwrite
 specific, 
 and should not be under CONFIG_BLOCK. Move it to mm.h and rename it to
 errno_to_vmfault.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/ext4/inode.c | 2 +-
 fs/f2fs/file.c | 2 +- fs/gfs2/file.c | 16 ++++++++--------
 fs/iomap/buffered-io.c
 | 2 +- fs/nilfs2/file.c | 2 +- fs/udf/file.c [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pqp5E-0003Ts-MJ
Subject: [f2fs-dev] [PATCH 03/17] fs: rename and move
 block_page_mkwrite_return
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

block_page_mkwrite_return is neither block nor mkwrite specific, and
should not be under CONFIG_BLOCK.  Move it to mm.h and rename it to
errno_to_vmfault.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/inode.c             |  2 +-
 fs/f2fs/file.c              |  2 +-
 fs/gfs2/file.c              | 16 ++++++++--------
 fs/iomap/buffered-io.c      |  2 +-
 fs/nilfs2/file.c            |  2 +-
 fs/udf/file.c               |  2 +-
 include/linux/buffer_head.h | 12 ------------
 include/linux/mm.h          | 13 +++++++++++++
 8 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bf0b7dea4900af..c0f41a38bd9ca4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6343,7 +6343,7 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
 	if (err == -ENOSPC && ext4_should_retry_alloc(inode->i_sb, &retries))
 		goto retry_alloc;
 out_ret:
-	ret = block_page_mkwrite_return(err);
+	ret = errno_to_vmfault(err);
 out:
 	filemap_invalidate_unlock_shared(mapping);
 	sb_end_pagefault(inode->i_sb);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15dabeac469050..f4ab23efcf85f8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -161,7 +161,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	sb_end_pagefault(inode->i_sb);
 err:
-	return block_page_mkwrite_return(err);
+	return errno_to_vmfault(err);
 }
 
 static const struct vm_operations_struct f2fs_file_vm_ops = {
diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 300844f50dcd28..8c4fad359ff538 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -432,7 +432,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_uninit;
 	}
 
@@ -474,7 +474,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 
 	err = gfs2_rindex_update(sdp);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 
@@ -482,12 +482,12 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	ap.target = data_blocks + ind_blocks;
 	err = gfs2_quota_lock_check(ip, &ap);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 	err = gfs2_inplace_reserve(ip, &ap);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_quota_unlock;
 	}
 
@@ -500,7 +500,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	}
 	err = gfs2_trans_begin(sdp, rblocks, 0);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_trans_fail;
 	}
 
@@ -508,7 +508,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 	if (gfs2_is_stuffed(ip)) {
 		err = gfs2_unstuff_dinode(ip);
 		if (err) {
-			ret = block_page_mkwrite_return(err);
+			ret = errno_to_vmfault(err);
 			goto out_trans_end;
 		}
 	}
@@ -524,7 +524,7 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *vmf)
 
 	err = gfs2_allocate_page_backing(page, length);
 	if (err)
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 
 out_page_locked:
 	if (ret != VM_FAULT_LOCKED)
@@ -558,7 +558,7 @@ static vm_fault_t gfs2_fault(struct vm_fault *vmf)
 	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 	err = gfs2_glock_nq(&gh);
 	if (err) {
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_uninit;
 	}
 	ret = filemap_fault(vmf);
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6f4c97a6d7e9dc..2986be63d2bea6 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -1290,7 +1290,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
 	return VM_FAULT_LOCKED;
 out_unlock:
 	folio_unlock(folio);
-	return block_page_mkwrite_return(ret);
+	return errno_to_vmfault(ret);
 }
 EXPORT_SYMBOL_GPL(iomap_page_mkwrite);
 
diff --git a/fs/nilfs2/file.c b/fs/nilfs2/file.c
index a265d391ffe92d..ea35294bb158a3 100644
--- a/fs/nilfs2/file.c
+++ b/fs/nilfs2/file.c
@@ -108,7 +108,7 @@ static vm_fault_t nilfs_page_mkwrite(struct vm_fault *vmf)
 	wait_for_stable_page(page);
  out:
 	sb_end_pagefault(inode->i_sb);
-	return block_page_mkwrite_return(ret);
+	return errno_to_vmfault(ret);
 }
 
 static const struct vm_operations_struct nilfs_file_vm_ops = {
diff --git a/fs/udf/file.c b/fs/udf/file.c
index 8238f742377bab..9420284d7c0455 100644
--- a/fs/udf/file.c
+++ b/fs/udf/file.c
@@ -71,7 +71,7 @@ static vm_fault_t udf_page_mkwrite(struct vm_fault *vmf)
 		err = block_commit_write(page, 0, end);
 	if (err < 0) {
 		unlock_page(page);
-		ret = block_page_mkwrite_return(err);
+		ret = errno_to_vmfault(err);
 		goto out_unlock;
 	}
 out_dirty:
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 8f14dca5fed756..0fcc16b7f02bb4 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -281,18 +281,6 @@ int generic_cont_expand_simple(struct inode *inode, loff_t size);
 int block_commit_write(struct page *page, unsigned from, unsigned to);
 int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
 				get_block_t get_block);
-/* Convert errno to return value from ->page_mkwrite() call */
-static inline vm_fault_t block_page_mkwrite_return(int err)
-{
-	if (err == 0)
-		return VM_FAULT_LOCKED;
-	if (err == -EFAULT || err == -EAGAIN)
-		return VM_FAULT_NOPAGE;
-	if (err == -ENOMEM)
-		return VM_FAULT_OOM;
-	/* -ENOSPC, -EDQUOT, -EIO ... */
-	return VM_FAULT_SIGBUS;
-}
 sector_t generic_block_bmap(struct address_space *, sector_t, get_block_t *);
 int block_truncate_page(struct address_space *, loff_t, get_block_t *);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1f79667824eb60..03e645032c81ac 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3061,6 +3061,19 @@ extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
 		pgoff_t start_pgoff, pgoff_t end_pgoff);
 extern vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf);
 
+/* Convert errno to return value from ->page_mkwrite() call */
+static inline vm_fault_t errno_to_vmfault(int err)
+{
+	if (err == 0)
+		return VM_FAULT_LOCKED;
+	if (err == -EFAULT || err == -EAGAIN)
+		return VM_FAULT_NOPAGE;
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
+	/* -ENOSPC, -EDQUOT, -EIO ... */
+	return VM_FAULT_SIGBUS;
+}
+
 extern unsigned long stack_guard_gap;
 /* Generic expand stack which grows the stack according to GROWS{UP,DOWN} */
 extern int expand_stack(struct vm_area_struct *vma, unsigned long address);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
