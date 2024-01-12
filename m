Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D83082C948
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 04:57:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOV9V-0005vG-Vc;
	Sat, 13 Jan 2024 03:57:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rOV9U-0005v4-BE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZS356O51aGJ1N2N0Prl+HSBzuRtRUv+MzcWcawjdxZM=; b=YDNhd6cl5yi0oKut+seUPkNBGk
 w4J5Kx8qqwdYpy6Lg+iHkqtjxzGzMPOlYCj2v1/Y54J/328UWYLeJyZPknrD163whk9XkwT96TMvi
 sEfxghXa5yzoBJFxN5mhhmSwjGdcq/7FD38gqyolPLZJ8p8FmkkkEoE2dGI16GcQ1vcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZS356O51aGJ1N2N0Prl+HSBzuRtRUv+MzcWcawjdxZM=; b=ZPNRywxjvAxq3U83AY8Fw/LvQ1
 NRHuVQyUeSq2JPEm2YJppsTPyi18jSJMANHL4UjhmWjVLPnzjKvEm50hD/zWPWr2uXX2ITBioSsIB
 1/zJUOSPztCmZ3GoLB3csbMA4JZWHaSUofF+P2gE74Lc5FxwOdw6xRwQz7nibg5Yd1S4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOV9O-0003of-W6 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA782CE2591;
 Sat, 13 Jan 2024 03:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE14C43394;
 Sat, 13 Jan 2024 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705118247;
 bh=V21gcWFsGMtYKh3R/2HUCTY5gVSXqKTY8pGHYmR5nmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OTua4APuYBGQcI6gnfTPP3KBgkVKWQ6SWD2lgqSxyiRBEG5BZaeBkQ3F0L7P92cSM
 tHHcHWW8taPdMUsxw+M+ThkKTIAafdB7v9X+5/l58zp1nIxpxGsMOyQBfiMmqPFbJ3
 3GZthW7qPAUTz4ydI2mk3UyBfvP15B/x0Bzmy+PWKNgQi+ELpPG9xqKtm/TwDg52op
 XAzdPg/vTB64SMrDt04+o9tFzbdPVPcNnnd6OZV0ljKuw8kLHjcz/XcBLDn1gqHCxQ
 gi1+LeGKPwxHc+wvadWyxGBiyFeMbNtPRGQ+oCJxj2XTTVdsyHcUsCu+IwVis5hrcZ
 Yt9E3Zw1XmTdw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 13 Jan 2024 03:41:30 +0800
Message-Id: <20240112194132.25637-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240112194132.25637-1-chao@kernel.org>
References: <20240112194132.25637-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In reserve_compress_blocks(), we update blkaddrs of dnode
 in prior to inc_valid_block_count(), it may cause inconsistent status bewteen
 i_blocks and blkaddrs once inc_valid_block_count() fails. To fix this issue,
 it needs to reverse their invoking order. 
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOV9O-0003of-W6
Subject: [f2fs-dev] [PATCH v5 4/6] f2fs: compress: fix to avoid
 inconsistence bewteen i_blocks and dnode
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In reserve_compress_blocks(), we update blkaddrs of dnode in prior to
inc_valid_block_count(), it may cause inconsistent status bewteen
i_blocks and blkaddrs once inc_valid_block_count() fails.

To fix this issue, it needs to reverse their invoking order.

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    |  5 +++--
 fs/f2fs/f2fs.h    |  7 ++++++-
 fs/f2fs/file.c    | 26 ++++++++++++++------------
 fs/f2fs/segment.c |  2 +-
 4 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b171a9980f6a..8d2ace723310 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1219,7 +1219,8 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 
 	if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
 		return -EPERM;
-	if (unlikely((err = inc_valid_block_count(sbi, dn->inode, &count))))
+	err = inc_valid_block_count(sbi, dn->inode, &count, true);
+	if (unlikely(err))
 		return err;
 
 	trace_f2fs_reserve_new_blocks(dn->inode, dn->nid,
@@ -1476,7 +1477,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 
 	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 	if (dn->data_blkaddr == NULL_ADDR) {
-		err = inc_valid_block_count(sbi, dn->inode, &count);
+		err = inc_valid_block_count(sbi, dn->inode, &count, true);
 		if (unlikely(err))
 			return err;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50f3d546ded8..69e71460a950 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2252,7 +2252,7 @@ static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
 
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
-				 struct inode *inode, blkcnt_t *count)
+				 struct inode *inode, blkcnt_t *count, bool partial)
 {
 	blkcnt_t diff = 0, release = 0;
 	block_t avail_user_block_count;
@@ -2292,6 +2292,11 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 			avail_user_block_count = 0;
 	}
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
+		if (!partial) {
+			spin_unlock(&sbi->stat_lock);
+			goto enospc;
+		}
+
 		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
 			diff = *count;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4aef2310395f..a02c530c7e4b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3614,14 +3614,16 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		blkcnt_t reserved;
 		int ret;
 
-		for (i = 0; i < cluster_size; i++, dn->ofs_in_node++) {
-			blkaddr = f2fs_data_blkaddr(dn);
+		for (i = 0; i < cluster_size; i++) {
+			blkaddr = data_blkaddr(dn->inode, dn->node_page,
+						dn->ofs_in_node + i);
 
 			if (i == 0) {
-				if (blkaddr == COMPRESS_ADDR)
-					continue;
-				dn->ofs_in_node += cluster_size;
-				goto next;
+				if (blkaddr != COMPRESS_ADDR) {
+					dn->ofs_in_node += cluster_size;
+					goto next;
+				}
+				continue;
 			}
 
 			/*
@@ -3634,8 +3636,6 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 				compr_blocks++;
 				continue;
 			}
-
-			f2fs_set_data_blkaddr(dn, NEW_ADDR);
 		}
 
 		reserved = cluster_size - compr_blocks;
@@ -3644,12 +3644,14 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (reserved == 1)
 			goto next;
 
-		ret = inc_valid_block_count(sbi, dn->inode, &reserved);
-		if (ret)
+		ret = inc_valid_block_count(sbi, dn->inode, &reserved, false);
+		if (unlikely(ret))
 			return ret;
 
-		if (reserved != cluster_size - compr_blocks)
-			return -ENOSPC;
+		for (i = 0; i < cluster_size; i++, dn->ofs_in_node++) {
+			if (f2fs_data_blkaddr(dn) == NULL_ADDR)
+				f2fs_set_data_blkaddr(dn, NEW_ADDR);
+		}
 
 		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4c8836ded90f..ef5b3848426b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -248,7 +248,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 	} else {
 		blkcnt_t count = 1;
 
-		err = inc_valid_block_count(sbi, inode, &count);
+		err = inc_valid_block_count(sbi, inode, &count, true);
 		if (err) {
 			f2fs_put_dnode(&dn);
 			return err;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
