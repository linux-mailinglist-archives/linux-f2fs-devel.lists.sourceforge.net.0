Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7598BAEAD1C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Jun 2025 05:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Z68m+kBs9gfo9D64lQDpVPqW/IY7daYli0gRIlH+4E=; b=RKzfBfUxayX6n9JTfyJsicv3Qv
	+hBvT9ROmRegBdr8ljNqi9tk8sCHRI3yz06+x8gtB8Q8nKQdim8lf78nGmvyyx218JZerPV8XmoS9
	3Gc2Mq7hq7wbve2gNbJTyvnb0kDqRrQRvhrIGkqldQo+yH1Hdn4lU0slF60iehvxY84k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUzJv-0004OG-MT;
	Fri, 27 Jun 2025 03:00:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uUzJr-0004O7-Vs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jun 2025 03:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ciC4DVjDW4TWZg8qvRV/6qQygRkpOTgHu2yMfNpVY8w=; b=ZKYCnC/W3mCCsrScnLBbN3LQJz
 btTjh0ywQiXRVHM06azcPHCGCFfqfH20a7PiMMGnSJRLQL2vtr23NS50IVeiAs/48Yju6ifQihY1G
 kc2tIV6hoYOVhHQMs+uT2SclCDgYrncRXBLtJPTFcwUEGcDW4yOZIWnkMfr5HX6tjAq0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ciC4DVjDW4TWZg8qvRV/6qQygRkpOTgHu2yMfNpVY8w=; b=h
 HclQdXoSfWiWPirQydFlr+krGR+5HktoNH0KbsDOuJF3dy5IUpdZh0bqmXtkadQ13XqhElebCO5d1
 sJimm77/5BgdNOFaVIWZ6lnpYnJzOx8dEML1ckG0u+vq9FuSgpLuNnYpYMrhvtXmE5YWhZYPqph8f
 ErxwInbEjtE+VWWI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUzJr-00005K-F9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jun 2025 03:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1223F5C6752
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Jun 2025 02:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F48C4CEEB;
 Fri, 27 Jun 2025 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750993192;
 bh=4NqwKliYxy8MhrsnNyN+PcNi2iyEW5+AWz1gEYnmZ54=;
 h=From:To:Cc:Subject:Date:From;
 b=j+MCvt/2FcPez/rFPZyI6bhqypUTJfQAwX2v8YBWMRudhwu/XzFe/YL9wGejK+2yc
 XIUTIeDbhxxVN4RSKl469DRbQzM3lXhYuxCaJOg8R+xhNZmypn997e2nLXGNPY92fx
 wScR4n4/f825GRadPfvf3fdIxVjwcgzxys9Kpu5NbkVL125dvue2Ca5PufIOEf6UXW
 ybuwKYBCvOPOq8Cgi0FFNM3uFi2S35d3SOMwwFAFSC1F8ngTbyg2kZTIgUyppA6K4A
 xHFu//XGI+N+gPE5/YRxXJGOBjSYfzbIyQg0+vFiFyZGIflPBAIyFSYwlMJkEcDs9F
 60AMMdVP9eoeg==
To: jaegeuk@kernel.org
Date: Fri, 27 Jun 2025 10:59:43 +0800
Message-ID: <20250627025944.152334-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS-fs (vdc): f2fs_recover_fsync_data: recovery fsync data, 
 check_only: 0 F2FS-fs (vdc): do_recover_data: start to recover dnode F2FS-fs
 (vdc): recover_inode: ino = 5, name = testfile.t2, inline = 21 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUzJr-00005K-F9
Subject: [f2fs-dev] [PATCH] f2fs: account and print more stats during
 recovery
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS-fs (vdc): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
F2FS-fs (vdc): do_recover_data: start to recover dnode
F2FS-fs (vdc): recover_inode: ino = 5, name = testfile.t2, inline = 21
F2FS-fs (vdc): recover_data: ino = 5, nid = 5 (i_size: recover), range (0, 864), recovered = 1, err = 0
F2FS-fs (vdc): do_recover_data: dnode: (recoverable: 256, fsynced: 256, total: 256), recovered: (inode: 256, dentry: 1, dnode: 256), err: 0

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/recovery.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 51ebed4e1521..f7d2fc86aeb1 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -624,7 +624,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 {
 	struct dnode_of_data dn;
 	struct node_info ni;
-	unsigned int start, end;
+	unsigned int start = 0, end = 0, index;
 	int err = 0, recovered = 0;
 
 	/* step 1: recover xattr */
@@ -679,7 +679,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		goto err;
 	}
 
-	for (; start < end; start++, dn.ofs_in_node++) {
+	for (index = start; index < end; index++, dn.ofs_in_node++) {
 		block_t src, dest;
 
 		src = f2fs_data_blkaddr(&dn);
@@ -708,9 +708,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 
 		if (!file_keep_isize(inode) &&
-			(i_size_read(inode) <= ((loff_t)start << PAGE_SHIFT)))
+			(i_size_read(inode) <= ((loff_t)index << PAGE_SHIFT)))
 			f2fs_i_size_write(inode,
-				(loff_t)(start + 1) << PAGE_SHIFT);
+				(loff_t)(index + 1) << PAGE_SHIFT);
 
 		/*
 		 * dest is reserved block, invalidate src block
@@ -765,9 +765,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 err:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_notice(sbi, "recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
-		    inode->i_ino, file_keep_isize(inode) ? "keep" : "recover",
-		    recovered, err);
+	f2fs_notice(sbi, "recover_data: ino = %lx, nid = %x (i_size: %s), "
+		    "range (%u, %u), recovered = %d, err = %d",
+		    inode->i_ino, nid_of_node(&folio->page),
+		    file_keep_isize(inode) ? "keep" : "recover",
+		    start, end, recovered, err);
 	return err;
 }
 
@@ -778,6 +780,14 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	int err = 0;
 	block_t blkaddr;
 	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
+	unsigned int recoverable_dnode = 0;
+	unsigned int fsynced_dnode = 0;
+	unsigned int total_dnode = 0;
+	unsigned int recovered_inode = 0;
+	unsigned int recovered_dentry = 0;
+	unsigned int recovered_dnode = 0;
+
+	f2fs_notice(sbi, "do_recover_data: start to recover dnode");
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
@@ -800,10 +810,12 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			f2fs_folio_put(folio, true);
 			break;
 		}
+		recoverable_dnode++;
 
 		entry = get_fsync_inode(inode_list, ino_of_node(&folio->page));
 		if (!entry)
 			goto next;
+		fsynced_dnode++;
 		/*
 		 * inode(x) | CP | inode(x) | dnode(F)
 		 * In this case, we can lose the latest inode(x).
@@ -815,6 +827,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				f2fs_folio_put(folio, true);
 				break;
 			}
+			recovered_inode++;
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, &folio->page, dir_list);
@@ -822,12 +835,14 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				f2fs_folio_put(folio, true);
 				break;
 			}
+			recovered_dentry++;
 		}
 		err = do_recover_data(sbi, entry->inode, folio);
 		if (err) {
 			f2fs_folio_put(folio, true);
 			break;
 		}
+		recovered_dnode++;
 
 		if (entry->blkaddr == blkaddr)
 			list_move_tail(&entry->list, tmp_inode_list);
@@ -840,9 +855,15 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
+		total_dnode++;
 	}
 	if (!err)
 		err = f2fs_allocate_new_segments(sbi);
+
+	f2fs_notice(sbi, "do_recover_data: dnode: (recoverable: %u, fsynced: %u, "
+		"total: %u), recovered: (inode: %u, dentry: %u, dnode: %u), err: %d",
+		recoverable_dnode, fsynced_dnode, total_dnode, recovered_inode,
+		recovered_dentry, recovered_dnode, err);
 	return err;
 }
 
@@ -855,6 +876,9 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
 
+	f2fs_notice(sbi, "f2fs_recover_fsync_data: recovery fsync data, "
+					"check_only: %d", check_only);
+
 	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "recover fsync data on readonly fs");
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
