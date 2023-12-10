Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 277EF80B9FE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzz-0007bO-P6;
	Sun, 10 Dec 2023 09:21:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzw-0007b7-48
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R3aWZqEI0M7+lRP4nsT2Uqgh0mdYKQJ3oRrTMQFQgoU=; b=canxjzJMgdypG3Zo0k2422tddM
 8xTrlVegZjVvwsqtKsDN6W/K1lCzl9HdsTyHhRy4Ft6TKoWHFCsoXszX8nF2Jj3fp0nu9hVmkhR9v
 uwdoasEl+oJ7y4bP4xN+1lSxQtF1F6NuqxH0G90MLYhxdFsZDJdvI8g3wOi5MPdS+xTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R3aWZqEI0M7+lRP4nsT2Uqgh0mdYKQJ3oRrTMQFQgoU=; b=MOxyygk2MkTRwHO5Uk7BUBjHak
 cl7fYz/EokqqUfsov16T9jcFsvCEPaU6JB9FWUIHriedMhZ74i4Y60M0b6X86gnwfSEInLNRxnQ9X
 3irlzkTZ0TZ5BQvovUKh9NbpgxFBggO+fvLIQrtBh46y69/0Zv2HgUzxRABbZntVWFDE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzq-0002nP-9a for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EAD3DCE0AC3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9093C433C9;
 Sun, 10 Dec 2023 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200053;
 bh=vqEZwoEd5rfiidnh92i4EHLdEHwAQGZ/XdcKXiscRKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ob1j+7BAs0/X61wciJwW/sUV+jUXQf0THBWwC3jP3ipOPJe1CkI/I/JK/aBzMHKaX
 dyifLL0VLLk7wn+QZazE6k8/3i7kZwSiWC6218uvfcyUGIx+Zg61YnwaGrvL7D6+aj
 5kaMnc8NJsDwmLan3iQNHzbMgHiTgnJzUTB3dROVLZZzS1Rlk0h/M2inR6X6r6oLh9
 q44NGfqHB08B85U1B4715rn8Che6Xa4UBsgoVwFX+lCPOBQX756T95DUHdzOVx5CAa
 6ROdXkv1oHTF2rChZxax/hz3eknBA/iSJ0RSm+nle2vkn2HMM31zHHgk57r360tofm
 Y9e8nxCeDOb5Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:38 +0800
Message-Id: <20231210092040.3374741-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210092040.3374741-1-chao@kernel.org>
References: <20231210092040.3374741-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch allows caller to pass blkaddr to
 f2fs_set_data_blkaddr()
 and let __set_data_blkaddr() inside f2fs_set_data_blkaddr() to update
 dn->data_blkaddr
 w/ last value of blkaddr. Just cleanup, no logic changes. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCFzq-0002nP-9a
Subject: [f2fs-dev] [PATCH 4/6] f2fs: update blkaddr in __set_data_blkaddr()
 for cleanup
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

This patch allows caller to pass blkaddr to f2fs_set_data_blkaddr()
and let __set_data_blkaddr() inside f2fs_set_data_blkaddr() to update
dn->data_blkaddr w/ last value of blkaddr.

Just cleanup, no logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 13 ++++++-------
 fs/f2fs/f2fs.h |  2 +-
 fs/f2fs/file.c | 12 ++++--------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ae46c4841ca9..d86419b01310 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1179,10 +1179,11 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	return 0;
 }
 
-static void __set_data_blkaddr(struct dnode_of_data *dn)
+static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	__le32 *addr = get_dnode_addr(dn->inode, dn->node_page);
 
+	dn->data_blkaddr = blkaddr;
 	addr[dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
 }
 
@@ -1192,18 +1193,17 @@ static void __set_data_blkaddr(struct dnode_of_data *dn)
  *  ->node_page
  *    update block addresses in the node page
  */
-void f2fs_set_data_blkaddr(struct dnode_of_data *dn)
+void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	f2fs_wait_on_page_writeback(dn->node_page, NODE, true, true);
-	__set_data_blkaddr(dn);
+	__set_data_blkaddr(dn, blkaddr);
 	if (set_page_dirty(dn->node_page))
 		dn->node_changed = true;
 }
 
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
-	dn->data_blkaddr = blkaddr;
-	f2fs_set_data_blkaddr(dn);
+	f2fs_set_data_blkaddr(dn, blkaddr);
 	f2fs_update_read_extent_cache(dn);
 }
 
@@ -1230,8 +1230,7 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 		block_t blkaddr = f2fs_data_blkaddr(dn);
 
 		if (blkaddr == NULL_ADDR) {
-			dn->data_blkaddr = NEW_ADDR;
-			__set_data_blkaddr(dn);
+			__set_data_blkaddr(dn, NEW_ADDR);
 			count--;
 		}
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a06b8aad5117..50e666ebd987 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3822,7 +3822,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
-void f2fs_set_data_blkaddr(struct dnode_of_data *dn);
+void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
 int f2fs_reserve_new_block(struct dnode_of_data *dn);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d0e7894e42d4..3c7e6bfc1265 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -582,8 +582,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		if (blkaddr == NULL_ADDR)
 			continue;
 
-		dn->data_blkaddr = NULL_ADDR;
-		f2fs_set_data_blkaddr(dn);
+		f2fs_set_data_blkaddr(dn, NULL_ADDR);
 
 		if (__is_valid_data_blkaddr(blkaddr)) {
 			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
@@ -1478,8 +1477,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		}
 
 		f2fs_invalidate_blocks(sbi, dn->data_blkaddr);
-		dn->data_blkaddr = NEW_ADDR;
-		f2fs_set_data_blkaddr(dn);
+		f2fs_set_data_blkaddr(dn, NEW_ADDR);
 	}
 
 	f2fs_update_read_extent_cache_range(dn, start, 0, index - start);
@@ -3454,8 +3452,7 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 			if (blkaddr != NEW_ADDR)
 				continue;
 
-			dn->data_blkaddr = NULL_ADDR;
-			f2fs_set_data_blkaddr(dn);
+			f2fs_set_data_blkaddr(dn, NULL_ADDR);
 		}
 
 		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, false);
@@ -3621,8 +3618,7 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 				continue;
 			}
 
-			dn->data_blkaddr = NEW_ADDR;
-			f2fs_set_data_blkaddr(dn);
+			f2fs_set_data_blkaddr(dn, NEW_ADDR);
 		}
 
 		reserved = cluster_size - compr_blocks;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
