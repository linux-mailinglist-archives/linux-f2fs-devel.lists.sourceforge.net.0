Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352C49F620
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 10:19:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDNQ3-0003Vj-6v; Fri, 28 Jan 2022 09:19:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nDNQ2-0003Vd-5z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 09:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WHbf04nAjgg/dOEjHJ0ylOBGrtd9Tqs0sRDS/bWaqcI=; b=S5bo1Mg0sPR9sstw7u/X1YNHFj
 vDumyPcx3BCyRvWaDmId6ykdfLdTC93YZbN+pJ3y40NDtdeBr8Gsii/4mlN3tSLclgQojNK33Hd6w
 z4KXtZZNLsEnfE8Uts3QQ+hPgiYY6B+ntDQMbrAR9J63TcqPGE7flNYJ5rnv51OFnLS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WHbf04nAjgg/dOEjHJ0ylOBGrtd9Tqs0sRDS/bWaqcI=; b=Y
 03g0B0iVw9IDyFAVsbKuyUMI2wUr2wcDgWkZMfmxE4W+kcSsx1hHtP3FT1l+zj0nN7vStKaWbHYXl
 s3zVu2U5a7SuvUBdxVBeKJ39j1u4JKkIeeU0dlbw6Wnc/IE8PNNYITnpbpWFjDFAuoNmVzSZayaZ/
 SCsrRA31/iJBpOtE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDNPz-000R2w-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 09:19:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B7D9B81998
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Jan 2022 09:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A52C340E0;
 Fri, 28 Jan 2022 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643361571;
 bh=e89zJ3Ks+YExihx0aEw7Bds3ZPThb/EP79+HngEmJ48=;
 h=From:To:Cc:Subject:Date:From;
 b=D2L9Am09fB8oibP9EhX69yytO/hj6is5BMjpQ1S2ybFVmp7N2VSIj1uc2NMjgZcch
 h9VAeXaYw/+0dritYst/fPSvLIcazB2Asr9tIFgfHxQuc5atTonZYLYsv2C0+VbR4R
 /DdBDgnLspoDe+2qFauTO1LYhELd0K2+IZdJkKr4tVuWSiCbXMBu12RSufyXljFPC2
 RswzPu3WWSQRBlvgf9yjozC3szB86AZhwUQgiXa9ts+T20DRsQZSETBg0dyAmZbQhG
 Du4PsQlGLRZyZvcELxc8uWx5wEYMr5n6FZZ4qZcT0DsgCwfOMm2hjvhwmjRd/YXYzu
 Bv81/ijI48C3A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 28 Jan 2022 17:19:20 +0800
Message-Id: <20220128091920.1556480-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Once IPU policy is enabled in some cases: a) f2fs forces to
 use F2FS_IPU_FORCE in a small-sized volume b) user configures IPU policy
 via sysfs Then we may fail to defragment file via ioctl due to IPU policy
 check, it doesn't make sense, so let's change to use IPU policy for common
 data writeback, rather than for specific data writeback, e.g. [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDNPz-000R2w-Ee
Subject: [f2fs-dev] [PATCH] f2fs: don't check IPU policy during file
 defragment
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

Once IPU policy is enabled in some cases:
a) f2fs forces to use F2FS_IPU_FORCE in a small-sized volume
b) user configures IPU policy via sysfs

Then we may fail to defragment file via ioctl due to IPU policy check,
it doesn't make sense, so let's change to use IPU policy for common
data writeback, rather than for specific data writeback, e.g. GC,
defragment, and so on.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 15 ++++++++++-----
 fs/f2fs/f2fs.h |  3 ++-
 fs/f2fs/file.c | 17 ++++++++++-------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0f124e8de1d4..bce7ecac8976 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2530,6 +2530,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 		return true;
 
+	if (is_inode_flag_set(inode, FI_DEFRAG_PROCESS))
+		return true;
+
 	if (fio) {
 		if (page_private_gcing(fio->page))
 			return true;
@@ -3154,8 +3157,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
 		goto skip_write;
 
-	/* skip writing during file defragment */
-	if (is_inode_flag_set(inode, FI_DO_DEFRAG))
+	/* skip writing in file defragment preparing stage */
+	if (is_inode_flag_set(inode, FI_DEFRAG_PREPARE))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
@@ -3733,7 +3736,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
 		f2fs_unlock_op(sbi);
 
-		set_inode_flag(inode, FI_DO_DEFRAG);
+		set_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
 			struct page *page;
@@ -3750,9 +3753,11 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 			f2fs_put_page(page, 1);
 		}
 
-		clear_inode_flag(inode, FI_DO_DEFRAG);
+		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 
+		set_inode_flag(inode, FI_DEFRAG_PROCESS);
 		ret = filemap_fdatawrite(inode->i_mapping);
+		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
 
 		f2fs_up_write(&sbi->pin_sem);
 
@@ -3761,7 +3766,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	}
 
 done:
-	clear_inode_flag(inode, FI_DO_DEFRAG);
+	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 	clear_inode_flag(inode, FI_ALIGNED_WRITE);
 
 	filemap_invalidate_unlock(inode->i_mapping);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8178a9152e49..4b905059a81e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -733,7 +733,8 @@ enum {
 	FI_DROP_CACHE,		/* drop dirty page cache */
 	FI_DATA_EXIST,		/* indicate data exists */
 	FI_INLINE_DOTS,		/* indicate inline dot dentries */
-	FI_DO_DEFRAG,		/* indicate defragment is running */
+	FI_DEFRAG_PREPARE,	/* indicate defragment is preparing */
+	FI_DEFRAG_PROCESS,	/* indicate defragment is processing */
 	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
 	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
 	FI_HOT_DATA,		/* indicate file is hot */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6ccdd6e347e2..696f4a175228 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2559,10 +2559,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	bool fragmented = false;
 	int err;
 
-	/* if in-place-update policy is enabled, don't waste time here */
-	if (f2fs_should_update_inplace(inode, NULL))
-		return -EINVAL;
-
 	pg_start = range->start >> PAGE_SHIFT;
 	pg_end = (range->start + range->len) >> PAGE_SHIFT;
 
@@ -2570,6 +2566,11 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	inode_lock(inode);
 
+	if (f2fs_is_pinned_file(inode)) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	/* writeback all dirty pages in the range */
 	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
 						range->start + range->len - 1);
@@ -2651,7 +2652,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 			goto check;
 		}
 
-		set_inode_flag(inode, FI_DO_DEFRAG);
+		set_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		idx = map.m_lblk;
 		while (idx < map.m_lblk + map.m_len && cnt < blk_per_seg) {
@@ -2676,14 +2677,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		if (map.m_lblk < pg_end && cnt < blk_per_seg)
 			goto do_map;
 
-		clear_inode_flag(inode, FI_DO_DEFRAG);
+		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 
+		set_inode_flag(inode, FI_DEFRAG_PROCESS);
 		err = filemap_fdatawrite(inode->i_mapping);
+		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
 		if (err)
 			goto out;
 	}
 clear_out:
-	clear_inode_flag(inode, FI_DO_DEFRAG);
+	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 out:
 	inode_unlock(inode);
 	if (!err)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
