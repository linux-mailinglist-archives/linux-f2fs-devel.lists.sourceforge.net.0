Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56C11792C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 23:24:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieRRg-0006EW-B2; Mon, 09 Dec 2019 22:24:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieRRf-0006E7-CD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XNF60bhTAMd1Ar192Mzz7C7achsXyBLCUQVKJYgBdB4=; b=AlHJHqRSflbVis22sI9L2XIhuU
 p11H5qKW8vU1UcvkpzV164Er2wGr+AGdHxVeiCDNUMmdAcZEe9QoG3SZWtboJJWFaWqInJy/gqoN8
 9De55PfmHsxLUv/jjinxG0JXRY2qcaiyZJh3CoHfGevmIkyNcl7xnLb4Bqczhg96XK3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XNF60bhTAMd1Ar192Mzz7C7achsXyBLCUQVKJYgBdB4=; b=W
 wi2/HX7+gAYKfSPqYvzqQf6i6+5dAeROytRAU94iLiQ8Z4UzHYm2uLW7HwdYD8ZX5WqWMOpef5OV0
 QFb9/cI15cCke2lpm9/3DBuP3MzxzUNCQeUCf0JwSGb+K43qstRvfQ7cwre93upl7ghQ7p5P7kAgt
 gs5n+Kmu0PMeNAzY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieRRd-00GkrF-8e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 22:23:59 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D999420637;
 Mon,  9 Dec 2019 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575930226;
 bh=G9qjQO+B2Dn9SuDL3dmoqef8NbNq/p9c0YfBUHGG4R0=;
 h=From:To:Cc:Subject:Date:From;
 b=xI4+0U1Ugd2CKiM9SP7G7RfDwtGtjomS3HWdQrNe6MT1BVCVJJnzhkLTRw1ewyYHX
 TPNu9xc7pwGFCiAT5VPbArPvbiDLQ7nNEQqSytwMRQyMKeOpzv81Yc9zrIKe7TkudA
 AzfwuMnZRWnB20zj2rKT/D1FW2bCAgt3p9JzlA94=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 14:23:40 -0800
Message-Id: <20191209222345.1078-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ieRRd-00GkrF-8e
Subject: [f2fs-dev] [PATCH 1/6] f2fs: call f2fs_balance_fs outside of locked
 page
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, we can hit deadlock by waiting for the locked page in
move_data_block in GC.

 Thread A                     Thread B
 - do_page_mkwrite
  - f2fs_vm_page_mkwrite
   - lock_page
                              - f2fs_balance_fs
                                  - mutex_lock(gc_mutex)
                               - f2fs_gc
                                - do_garbage_collect
                                 - ra_data_block
                                  - grab_cache_page
   - f2fs_balance_fs
    - mutex_lock(gc_mutex)

Fixes: 39a8695824510 ("f2fs: refactor ->page_mkwrite() flow")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e7fcbd8c23f4..6cebc6681487 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -50,7 +50,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct page *page = vmf->page;
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct dnode_of_data dn = { .node_changed = false };
+	struct dnode_of_data dn;
 	int err;
 
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -63,6 +63,9 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		goto err;
 	}
 
+	/* should do out of any locked page */
+	f2fs_balance_fs(sbi, true);
+
 	sb_start_pagefault(inode->i_sb);
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
@@ -120,8 +123,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 out_sem:
 	up_read(&F2FS_I(inode)->i_mmap_sem);
 
-	f2fs_balance_fs(sbi, dn.node_changed);
-
 	sb_end_pagefault(inode->i_sb);
 err:
 	return block_page_mkwrite_return(err);
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
