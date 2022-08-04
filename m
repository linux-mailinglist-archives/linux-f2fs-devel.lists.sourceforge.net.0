Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E97589CD4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 15:38:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJb3a-0000Jc-VA; Thu, 04 Aug 2022 13:38:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJb3Z-0000JS-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8yBsOM52DjYD9uKGHFuV4F3y8nY4khcu+e1T8liWJgI=; b=DrYugRe9Q1Db/nM2AplKphuJiF
 ICov11/QA+2XyuY71iHx6GpudbUD2wFMSFYGjjULS3MNrBavmHa+3g4hkj3Onq2pczQoKRwjjvFAP
 4bJhD6amjj4PvkVm59uaP3bnwXCCFyZbg2lmgbAk7eMvswKbhrftvcpSrb3eQsdoHHq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8yBsOM52DjYD9uKGHFuV4F3y8nY4khcu+e1T8liWJgI=; b=G
 bSeHGoJHR6vk0ckUCnMBLkyByX/lr8wKRLDuwPY/dUN4DYMUObaf+qf5ve2PmPBvmFe5fJUtslibk
 3+gz3j4tas24UEIdzhaWHga3d6R9jALmOirFgAJjdfLP1BwfOtzS+neJozwMX//97S0D3c65JormE
 3l/nwLghv8scnPJs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJb3Z-003Dnp-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 471CB61856;
 Thu,  4 Aug 2022 13:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D27C43470;
 Thu,  4 Aug 2022 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659620307;
 bh=hN2vEO4O/RvdzytpOp5hZlT0WPlhC+8EIeeNd6NtzWM=;
 h=From:To:Cc:Subject:Date:From;
 b=vEO7LCpnnTN4wEaaBckHs4gKI2ONgjZrC9+As7jIamWjQfiMMDB96I0MtAo5BcRt5
 OafC53uM3ndnZfUx63ff1gb79www5f2Ql09t3Ef8AdWNz+tQH7dEY30c9BpqQyZARu
 utou3Tj4q0xZvGbKtjTOcHFZiNx09rvr742ZoyMziKSTHJKw3Ml319QBiuAQVEgMCy
 Yl6pw89TJqJSmNdAKl9xwdRtrGtaDJxk48K7r+wamUIVFqrRIIwK7hexRoz6L9YNB1
 iAREsXnKnCNEUJ1TNjsv6yzaOjuqMobMrKo5d5hVTur6cSDf3Z1JbNPfmU0AR48xdw
 mNTCyx1H8fLzg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  4 Aug 2022 21:38:21 +0800
Message-Id: <20220804133821.13956-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Yu <chao.yu@oppo.com> f2fs_abort_atomic_write()
 has checked whether current inode is atomic_write one or not, it's redundant
 to check in its caller,
 remove it for cleanup. Signed-off-by: Chao Yu <chao.yu@oppo.com>
 --- fs/f2fs/file.c | 9 +++------ fs/f2fs/inode.c | 3 +-- fs/f2fs/segment.c
 | 27 ++++++++++++++ fs/f2fs/super.c | 3 +-- 4 files changed, 19 insert [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJb3Z-003Dnp-Lx
Subject: [f2fs-dev] [PATCH] f2fs: clean up f2fs_abort_atomic_write()
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

From: Chao Yu <chao.yu@oppo.com>

f2fs_abort_atomic_write() has checked whether current inode is
atomic_write one or not, it's redundant to check in its caller,
remove it for cleanup.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/file.c    |  9 +++------
 fs/f2fs/inode.c   |  3 +--
 fs/f2fs/segment.c | 27 ++++++++++++++-------------
 fs/f2fs/super.c   |  3 +--
 4 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0c984718f3c5..24f5b02c78e7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1822,8 +1822,7 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 			atomic_read(&inode->i_writecount) != 1)
 		return 0;
 
-	if (f2fs_is_atomic_file(inode))
-		f2fs_abort_atomic_write(inode, true);
+	f2fs_abort_atomic_write(inode, true);
 	return 0;
 }
 
@@ -1837,8 +1836,7 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	 * until all the writers close its file. Since this should be done
 	 * before dropping file lock, it needs to do in ->flush.
 	 */
-	if (f2fs_is_atomic_file(inode) &&
-			F2FS_I(inode)->atomic_write_task == current)
+	if (F2FS_I(inode)->atomic_write_task == current)
 		f2fs_abort_atomic_write(inode, true);
 	return 0;
 }
@@ -2124,8 +2122,7 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	if (f2fs_is_atomic_file(inode))
-		f2fs_abort_atomic_write(inode, true);
+	f2fs_abort_atomic_write(inode, true);
 
 	inode_unlock(inode);
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index fc55f5bd1fcc..6d11c365d7b4 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -744,8 +744,7 @@ void f2fs_evict_inode(struct inode *inode)
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	int err = 0;
 
-	if (f2fs_is_atomic_file(inode))
-		f2fs_abort_atomic_write(inode, true);
+	f2fs_abort_atomic_write(inode, true);
 
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f14c5a807312..72ce00ebcede 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -190,19 +190,20 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	if (f2fs_is_atomic_file(inode)) {
-		if (clean)
-			truncate_inode_pages_final(inode->i_mapping);
-		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
-		iput(fi->cow_inode);
-		fi->cow_inode = NULL;
-		release_atomic_write_cnt(inode);
-		clear_inode_flag(inode, FI_ATOMIC_FILE);
-
-		spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-		sbi->atomic_files--;
-		spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
-	}
+	if (!f2fs_is_atomic_file(inode))
+		return;
+
+	if (clean)
+		truncate_inode_pages_final(inode->i_mapping);
+	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
+	iput(fi->cow_inode);
+	fi->cow_inode = NULL;
+	release_atomic_write_cnt(inode);
+	clear_inode_flag(inode, FI_ATOMIC_FILE);
+
+	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
+	sbi->atomic_files--;
+	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 }
 
 static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1c6203798fb4..1a0578a3f4e4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1411,8 +1411,7 @@ static int f2fs_drop_inode(struct inode *inode)
 			atomic_inc(&inode->i_count);
 			spin_unlock(&inode->i_lock);
 
-			if (f2fs_is_atomic_file(inode))
-				f2fs_abort_atomic_write(inode, true);
+			f2fs_abort_atomic_write(inode, true);
 
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
