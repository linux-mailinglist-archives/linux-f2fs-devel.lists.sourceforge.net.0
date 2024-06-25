Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF4915D2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwdK-0001Fc-9D;
	Tue, 25 Jun 2024 03:14:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwdJ-0001FW-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SMIzjambBpVjpM5+hgPKK8w+gOiakAacXZNeJc+H6r4=; b=TzyjRSX7nUf2O6nnUb9fjfGvT/
 phDyBZ8mH7UWYqE8C0UFkgpf3jg3yziPiOoEF4wqaIl0JN9/X0IR9DvHQg/82QL4ycq/l0sWHDPWX
 njJADZ+V2bZDb0azL5y/Q7v9Ur+QsHWl5iRRkgV4mm7QOb7ghMt7vOBP1IoK/ZbZFoRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SMIzjambBpVjpM5+hgPKK8w+gOiakAacXZNeJc+H6r4=; b=hDSk9qZviSgExsLPKfXOU7FTvT
 jBOQUeuWXPAUDuNGfTbJwMD9PoVTtaSwZQFLArS0DYK3zj5GMdXlWZjCVHo6I7FUueEdDIwS4WCvv
 +hw/P80gCaH16mEZxZOj8GnIETxSjaQ/S+pB5xed283VPQpfZrEy9DpxbGaQWuJoXL6E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwdK-0001V8-CH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41442611D4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E693C32782;
 Tue, 25 Jun 2024 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285242;
 bh=0eAJUXNK7k0eoACdFcWnWupZI7JhpdKON3unr3Ao0hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lf7SrOlMH/1fEKjba/eCJe0GgTpp/YFjevK0bmG7R/INKvyLnfOh5bydYmK0UhmoM
 tRv/KFUhVuxJyyeQoRaN4haiaFbF2l5UDtHwdadhr36XAgXdi42ABihvOfjsGIOyW1
 2oMOEz87gwmnR6X65K97gDnoWMhzYn4cq2sO0SWGC279axHqGU6pN7+11QwCcNSe1Z
 JIUei08+j9earKDKpzvr9DkYsQvJ/0iImPzhWd2lu1SWeJSx5WDRcRI4Jh/Mx1kVK8
 bPMhnTvGzNWSKZULg/EYKgXaIk+HwDZrzm7z3n08ItJQ7K8m+uS/O6oEqayP9SAMqJ
 oTFfMN7RBp+ag==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:13:49 +0800
Message-Id: <20240625031351.3586955-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625031351.3586955-1-chao@kernel.org>
References: <20240625031351.3586955-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: SQLite App GC Thread Shrinker - f2fs_ioc_start_atomic_write
 - f2fs_ioc_commit_atomic_write - f2fs_commit_atomic_write -
 filemap_write_and_wait_range
 : write atomic_file's data to cow_inode echo 3 > drop_caches - f2fs_gc -
 gc_data_segment - move_data_page - set [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwdK-0001V8-CH
Subject: [f2fs-dev] [PATCH 2/4] f2fs: atomic: fix to not allow GC to pollute
 atomic_file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SQLite App			GC Thread	Shrinker
- f2fs_ioc_start_atomic_write

- f2fs_ioc_commit_atomic_write
 - f2fs_commit_atomic_write
  - filemap_write_and_wait_range
  : write atomic_file's data to cow_inode
						echo 3 > drop_caches
				- f2fs_gc
				 - gc_data_segment
				  - move_data_page
				   - set_page_dirty
				   : it may load data of previous
				     transaction into pagecache.
  - f2fs_down_write(&fi->i_gc_rwsem[WRITE])
  - __f2fs_commit_atomic_write
  - f2fs_up_write(&fi->i_gc_rwsem[WRITE])

During committing atomic_file, GC may be triggered to migrate
atomic_file's block, so it may contain data of previous transaction
in page cache, we should drop atomic_file's cache once it was
migrated by GC.

And also, we should writeback atomic_file and cow_file's data
w/ i_gc_rwsem lock held, in order to avoid block address change
during __f2fs_commit_atomic_write().

Meahwhile, this patch adds f2fs_wait_on_block_writeback_range()
to wait completion of block migration.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v1:
- this patch can fix in-memory data consistency issue caused by f2fs/003
 fs/f2fs/segment.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..914a13bfc2ab 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -236,6 +236,9 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 		return err;
 	}
 
+	if (__is_valid_data_blkaddr(dn.data_blkaddr))
+		f2fs_wait_on_block_writeback_range(inode, dn.data_blkaddr, 1);
+
 	if (recover) {
 		/* dn.data_blkaddr is always valid */
 		if (!__is_valid_data_blkaddr(new_addr)) {
@@ -339,6 +342,9 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 				goto out;
 			}
 
+			f2fs_wait_on_block_writeback_range(cow_inode,
+								blkaddr, 1);
+
 			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
 							true, NULL);
 
@@ -379,16 +385,28 @@ int f2fs_commit_atomic_write(struct inode *inode)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	int err;
 
+	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
+
 	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (err)
 		return err;
 
-	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
-	f2fs_lock_op(sbi);
+	/* writeback GCing page of cow_inode */
+	err = filemap_write_and_wait_range(fi->cow_inode->i_mapping,
+							0, LLONG_MAX);
+	if (err)
+		return err;
 
-	err = __f2fs_commit_atomic_write(inode);
+	filemap_invalidate_lock(inode->i_mapping);
+
+	/* don't allow clean page loaded by GC to pollute atomic_file */
+	truncate_pagecache(inode, 0);
 
+	f2fs_lock_op(sbi);
+	err = __f2fs_commit_atomic_write(inode);
 	f2fs_unlock_op(sbi);
+
+	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	return err;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
