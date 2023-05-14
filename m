Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2861701C48
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 May 2023 10:07:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1py6lO-00063Z-Sa;
	Sun, 14 May 2023 08:07:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1py6lM-00063T-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 May 2023 08:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlSZkI8ZAoTMkho0ml5s1zToqWTCuRiEtwFVcKu6X7c=; b=X4cDY/u2Durj9g+p2O2aB6NseW
 Wn3znmVe04StOQn6cn4en9zN9ip2ACoa3TOvfDSjRQQIx+C5vP0lrZFHHovUM+ty07f8KIjRxc3Df
 a6hncm8/fMCExwZcDFPG1P2WvkhdjdncTzDuc/chhZF3AjHqEFAcgJXM1BUMMD5eYTZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZlSZkI8ZAoTMkho0ml5s1zToqWTCuRiEtwFVcKu6X7c=; b=T
 8U9/RKNoEAijCUaMiVR6f+ss2wp3+5osgHyLaaQhPd+l/U4XIiNmldPwY3rqsgoRsdMxYTc0efzCr
 eQjhVY9rDqdSK9fc0oqxVOb/fEBGk1A909F5uUOJzjtS8ptFhNq+OpHpiPmkRp9twtgn9T27RlIe4
 7etWF/b/zHLM888A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1py6lM-0003VR-28 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 May 2023 08:07:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7B446091B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 May 2023 08:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B53C433EF;
 Sun, 14 May 2023 08:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684051642;
 bh=QQ3nMwGAnsCK6ZrMFJPsS/m9kGhypUyBDVn0s2ymerY=;
 h=From:To:Cc:Subject:Date:From;
 b=AuMbiVq03FYnXeHnaW80P+lJBHCjv5Om8XclL3WhesZamp3BCPrZjWejt1egHRbVF
 RRTO1o05q0DyipdYobDO+fFHNAj0EWHpBKsazhXZsGFqlG9RV9DSwkOmyyll1lUoEk
 Xtr8JRErbMTdEm9ObL0EQikJR8WsWasmeAtFkJIL5C6KhE2e9MtJnCm8q2nf3nCjMD
 hxZXOEV3PbCw3fQVrM4w82pydmObqjhAcEn/kjpIoLgqrUgu2kTTonkphz6w6teWb7
 PZB0MPj/kidIZTDxjOna867QHhv6NETN5lPtkh41lDG4Obc6pXnPhsz6rd9OtsJiU/
 LTqzh+FA1lZhA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 14 May 2023 16:07:23 +0800
Message-Id: <20230514080723.17313-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If S_NOQUOTA is cleared from inode during data page writeback
 of quota file, it may miss to unlock node_write lock, result in potential
 deadlock,
 fix to use the lock in paired. Kworker Thread - writepage if (IS_NOQUOTA())
 f2fs_down_read(&sbi->node_write); - vfs_cleanup_quota_inode - inode->i_flags
 &= ~S_NOQUOTA; if (IS_NOQUOTA()) f2fs_up_read(&sbi->node_write); 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1py6lM-0003VR-28
Subject: [f2fs-dev] [PATCH] f2fs: fix potential deadlock due to unpaired
 node_write lock use
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

If S_NOQUOTA is cleared from inode during data page writeback of quota
file, it may miss to unlock node_write lock, result in potential
deadlock, fix to use the lock in paired.

Kworker					Thread
- writepage
 if (IS_NOQUOTA())
   f2fs_down_read(&sbi->node_write);
					- vfs_cleanup_quota_inode
					 - inode->i_flags &= ~S_NOQUOTA;
 if (IS_NOQUOTA())
   f2fs_up_read(&sbi->node_write);

Fixes: 79963d967b49 ("f2fs: shrink node_write lock coverage")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 7 ++++---
 fs/f2fs/data.c     | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 11653fa79289..2ec7cf454418 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1215,6 +1215,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	unsigned int last_index = cc->cluster_size - 1;
 	loff_t psize;
 	int i, err;
+	bool quota_inode = IS_NOQUOTA(inode);
 
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -1222,7 +1223,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		goto out_free;
 	}
 
-	if (IS_NOQUOTA(inode)) {
+	if (quota_inode) {
 		/*
 		 * We need to wait for node_write to avoid block allocation during
 		 * checkpoint. This can only happen to quota writes which can cause
@@ -1344,7 +1345,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
 
 	f2fs_put_dnode(&dn);
-	if (IS_NOQUOTA(inode))
+	if (quota_inode)
 		f2fs_up_read(&sbi->node_write);
 	else
 		f2fs_unlock_op(sbi);
@@ -1370,7 +1371,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 out_put_dnode:
 	f2fs_put_dnode(&dn);
 out_unlock_op:
-	if (IS_NOQUOTA(inode))
+	if (quota_inode)
 		f2fs_up_read(&sbi->node_write);
 	else
 		f2fs_unlock_op(sbi);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7165b1202f53..4a0ee9cc43b5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2775,6 +2775,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
+	bool quota_inode = IS_NOQUOTA(inode);
 	int err = 0;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
@@ -2832,19 +2833,19 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		goto out;
 
 	/* Dentry/quota blocks are controlled by checkpoint */
-	if (S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) {
+	if (S_ISDIR(inode->i_mode) || quota_inode) {
 		/*
 		 * We need to wait for node_write to avoid block allocation during
 		 * checkpoint. This can only happen to quota writes which can cause
 		 * the below discard race condition.
 		 */
-		if (IS_NOQUOTA(inode))
+		if (quota_inode)
 			f2fs_down_read(&sbi->node_write);
 
 		fio.need_lock = LOCK_DONE;
 		err = f2fs_do_write_data_page(&fio);
 
-		if (IS_NOQUOTA(inode))
+		if (quota_inode)
 			f2fs_up_read(&sbi->node_write);
 
 		goto done;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
