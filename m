Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF85AFD46D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovexgKMrhzzMIhO5MU87P2/D+LvaVCA7OwhGHnDNO70=; b=VW8zfnAN4PFYkSnTm9ms3EuOpb
	s1Olj5g6tAdJxRiz9UPK1zjwTEwfVcOiGwXUr8QlbUUJ8GO8fhoDZ7YM/6aOuWdvyrX8U10tyzebp
	sMaI/E8hED9K9L5qrYObwuKHjAl3FZvJbX4ZQJBpbyEbbF9UJOnP94nGboKgpfMW+loA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBl0-0005n6-CK;
	Tue, 08 Jul 2025 17:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjz-0005XL-I7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfyPNVt11EOqFTgwOBb0fRgGjdA0Q49UGuFoJATiwY8=; b=D0q0zElJAQbAfIiBpgmp4feDzy
 W97rv5L1lYekoqHvmgiQeE826fo98AEJMNo+lpHf1ZBJ3ICneCJlc0xjeZYMTUBTbS9nRBzfA7CFl
 ySVx7xOd41qjD1yxZ4ieN5tIOxOvs7b3ybgd/lr0EQ7RccWsnUNkAPeS5Ltp8X/d7fdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lfyPNVt11EOqFTgwOBb0fRgGjdA0Q49UGuFoJATiwY8=; b=WUuqm6C4F6wsPIDKyqSZhytCjs
 u5bi3a8U4dxM6Z48B16t/1MnHXRJjUUfHE/ZrlI3SNeA0SPuuUpGRpQviOACKm3IH3/QCAnoRbVWB
 uj2pd8kEbfLUGEay7jvnllt0n87T9I3ME9SyuqVGpYy7yAUdhLS5q/bQi+Ev0c6RAkfM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBju-0006Fg-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lfyPNVt11EOqFTgwOBb0fRgGjdA0Q49UGuFoJATiwY8=; b=t3dIdEnLHrcOWQZVnw8MEAKc83
 3SEiHP4anji+uCosUQMSUMcbwb4oq7URvyBhWO6qbr20rQ30dVIw3D/Z/v85R+hMTfC/9J774k1Ih
 n5fzDBeoT5xf4a+1KL2XB+s3DwVmQwdgAB+fuxFFTxZWlKA6KhOFjIpMY3FyOBl2ZVLn4PG012oYy
 lp2R45QrzIWsl6ONOygVNpm+vsOc7++BVxLCnlQeb2/Apq/dl1imFaWgoGg+LCwxvXQKMDvFmHMLx
 7WMDkmWQEU/m9GscBRGMb8XWgHZZtBSP04kRb6RDXRaoRefSnRMeVZMOG6r/z8ZAw1R2DeKAw+ope
 FPfEztXg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T6v-2y1o;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:33 +0100
Message-ID: <20250708170359.111653-37-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c
 | 18 +++++++++--------- fs/f2fs/recovery.c | 4 ++-- fs/f2fs/segment.c | 2
 +- include/linux/f2fs_fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBju-0006Fg-Bb
Subject: [f2fs-dev] [PATCH 36/60] f2fs: Pass a folio to ADDRS_PER_PAGE()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/file.c          | 18 +++++++++---------
 fs/f2fs/recovery.c      |  4 ++--
 fs/f2fs/segment.c       |  2 +-
 include/linux/f2fs_fs.h |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 198a7093d98b..8624a4eedd7f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1588,7 +1588,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	start_pgofs = pgofs;
 	prealloc = 0;
 	last_ofs_in_node = ofs_in_node = dn.ofs_in_node;
-	end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+	end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 
 next_block:
 	blkaddr = f2fs_data_blkaddr(&dn);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b37a1aae2708..c444f2e43df1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -489,7 +489,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 			}
 		}
 
-		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 
 		/* find data/hole in dnode block */
 		for (; dn.ofs_in_node < end_offset;
@@ -815,7 +815,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
-	count = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+	count = ADDRS_PER_PAGE(dn.node_folio, inode);
 
 	count -= dn.ofs_in_node;
 	f2fs_bug_on(sbi, count < 0);
@@ -1223,7 +1223,7 @@ int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end)
 			return err;
 		}
 
-		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 		count = min(end_offset - dn.ofs_in_node, pg_end - pg_start);
 
 		f2fs_bug_on(F2FS_I_SB(inode), count == 0 || count > end_offset);
@@ -1322,7 +1322,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 		goto next;
 	}
 
-	done = min((pgoff_t)ADDRS_PER_PAGE(&dn.node_folio->page, inode) -
+	done = min((pgoff_t)ADDRS_PER_PAGE(dn.node_folio, inode) -
 							dn.ofs_in_node, len);
 	for (i = 0; i < done; i++, blkaddr++, do_replace++, dn.ofs_in_node++) {
 		*blkaddr = f2fs_data_blkaddr(&dn);
@@ -1411,7 +1411,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			}
 
 			ilen = min((pgoff_t)
-				ADDRS_PER_PAGE(&dn.node_folio->page, dst_inode) -
+				ADDRS_PER_PAGE(dn.node_folio, dst_inode) -
 						dn.ofs_in_node, len - i);
 			do {
 				dn.data_blkaddr = f2fs_data_blkaddr(&dn);
@@ -1707,7 +1707,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 				goto out;
 			}
 
-			end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+			end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 			end = min(pg_end, end_offset - dn.ofs_in_node + index);
 
 			ret = f2fs_do_zero_range(&dn, index, end);
@@ -3875,7 +3875,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 			break;
 		}
 
-		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
 		count = round_up(count, fi->i_cluster_size);
 
@@ -4053,7 +4053,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 			break;
 		}
 
-		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
 		count = round_up(count, fi->i_cluster_size);
 
@@ -4217,7 +4217,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 			goto out;
 		}
 
-		end_offset = ADDRS_PER_PAGE(&dn.node_folio->page, inode);
+		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
 		count = min(end_offset - dn.ofs_in_node, pg_end - index);
 		for (i = 0; i < count; i++, index++, dn.ofs_in_node++) {
 			struct block_device *cur_bdev;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 7f5d7499bd68..11e8387419b0 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -527,7 +527,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	nid = le32_to_cpu(sum.nid);
 	ofs_in_node = le16_to_cpu(sum.ofs_in_node);
 
-	max_addrs = ADDRS_PER_PAGE(&dn->node_folio->page, dn->inode);
+	max_addrs = ADDRS_PER_PAGE(dn->node_folio, dn->inode);
 	if (ofs_in_node >= max_addrs) {
 		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%lu, nid:%u, max:%u",
 			ofs_in_node, dn->inode->i_ino, nid, max_addrs);
@@ -649,7 +649,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 	/* step 3: recover data indices */
 	start = f2fs_start_bidx_of_node(ofs_of_node(folio), inode);
-	end = start + ADDRS_PER_PAGE(&folio->page, inode);
+	end = start + ADDRS_PER_PAGE(folio, inode);
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
 retry_dn:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9bc9bdddc3e0..667611c86f8c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -334,7 +334,7 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 			goto next;
 		}
 
-		blen = min((pgoff_t)ADDRS_PER_PAGE(&dn.node_folio->page, cow_inode),
+		blen = min((pgoff_t)ADDRS_PER_PAGE(dn.node_folio, cow_inode),
 				len);
 		index = off;
 		for (i = 0; i < blen; i++, dn.ofs_in_node++, index++) {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5206d63b3386..25857877eaec 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -268,7 +268,7 @@ struct node_footer {
 /* Node IDs in an Indirect Block */
 #define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
-#define ADDRS_PER_PAGE(page, inode)	(addrs_per_page(inode, IS_INODE(page)))
+#define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(&folio->page)))
 
 #define	NODE_DIR1_BLOCK		(DEF_ADDRS_PER_INODE + 1)
 #define	NODE_DIR2_BLOCK		(DEF_ADDRS_PER_INODE + 2)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
