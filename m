Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DBA76E3F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVi-0005eD-Gj;
	Mon, 31 Mar 2025 20:13:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVZ-0005aG-5O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RLX0s6IKxfumgkerx6lG0TcGRLN7sIg2WxICriZ6UBU=; b=EoZFHbOGC+6or9+FknlYK4yqXt
 mPsVIfLtXGk+cI3MnonHHsKEqIg69VwbEcrbjFy6JhlmEwW2vlZgj59FL+rx+PSM54P3HdYOT+7b2
 JVRxpMf1MVz2JXwLkaZ77zzLaly1sPPY8EdioeVUgazOoxvx3FHoc8vx9tJxfCGhQVFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RLX0s6IKxfumgkerx6lG0TcGRLN7sIg2WxICriZ6UBU=; b=f1/ZlCZwkVQW8UjG6eYbq9f9Qh
 /8cW1M7gKMpPjRx7EA3iNiHFn5hJ6NFi5Wuz+KGTfvp6dw9+JEg3ZNE2vNjxozOSj5uMvoDKxIcKp
 n3NQuvVLP/TFXJSWN0u7Oy9H96PLx+AMXFTMArA0B4uTlTNC3pTf6sNR5Nh3XLkut1/w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVN-0003YP-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RLX0s6IKxfumgkerx6lG0TcGRLN7sIg2WxICriZ6UBU=; b=YXE/LxM7tmsDb0h9b6vl/QNnYo
 E0Lw3pGJkFuXQi7Jl2yZvdhcnUa5EoP36BBtV8OiGxlFZQ6dp/U7guJMQUizlgU5d8yOOjktF8UdR
 PQ5iXtIfJhU5nOd7zoQTzQxnXX1D1kf05eD6z3UIa6Ksx2ZExl6XOWXQzliKf3FYY/J81AyY1/PHV
 XjE/jgQFJIdoV83kDkkUoJ0XdrCnIwm/+zw2MCshjp3nK6vIeKSOoYqFzvFOyYiY7vzvNYAk0jcAI
 3qqxRsFNk3oNi6Ho46GNIl2ReZnlV6fpmGWsEfus5lmuS4V0kAU9r47Bgx8abLVlBlb2QmWc/jD7V
 SIYQW0ZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RXg-2F6o;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:37 +0100
Message-ID: <20250331201256.1057782-18-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Pass the folio into sanity_check_node_footer() so that we
 can pass it further into next_blkaddr_of_node(). Removes a lot of conversions
 from folio->page. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/node.c | 8 +++++--- fs/f2fs/node.h | 4 ++-- fs/f2fs/recovery.c
 | 10 +++++----- 3 files changed, 12 insertions(+), 10 deletions( [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVN-0003YP-Qc
Subject: [f2fs-dev] [PATCH 017/153] f2fs: Pass a folio to
 next_blkaddr_of_node()
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

Pass the folio into sanity_check_node_footer() so that we can pass
it further into next_blkaddr_of_node().  Removes a lot of conversions
from folio->page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c     |  8 +++++---
 fs/f2fs/node.h     |  4 ++--
 fs/f2fs/recovery.c | 10 +++++-----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cda6448651fa..0b2e24ad620d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1457,9 +1457,11 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 }
 
 static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
-					struct page *page, pgoff_t nid,
+					struct folio *folio, pgoff_t nid,
 					enum node_type ntype)
 {
+	struct page *page = &folio->page;
+
 	if (unlikely(nid != nid_of_node(page) ||
 		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
 		(ntype == NODE_TYPE_XATTR &&
@@ -1469,7 +1471,7 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  ntype, nid, nid_of_node(page), ino_of_node(page),
 			  ofs_of_node(page), cpver_of_node(page),
-			  next_blkaddr_of_node(page));
+			  next_blkaddr_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 		return -EFSCORRUPTED;
@@ -1521,7 +1523,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 		goto out_err;
 	}
 page_hit:
-	err = sanity_check_node_footer(sbi, &folio->page, nid, ntype);
+	err = sanity_check_node_footer(sbi, folio, nid, ntype);
 	if (!err)
 		return folio;
 out_err:
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 103a437e6425..c58ff16f1227 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -268,9 +268,9 @@ static inline __u64 cpver_of_node(struct page *node_page)
 	return le64_to_cpu(rn->footer.cp_ver);
 }
 
-static inline block_t next_blkaddr_of_node(struct page *node_page)
+static inline block_t next_blkaddr_of_node(struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_page);
+	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
 	return le32_to_cpu(rn->footer.next_blkaddr);
 }
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 9848f0516a7e..a29bd82de93b 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -382,9 +382,9 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 		}
 
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
-					next_blkaddr_of_node(&folio->page));
+					next_blkaddr_of_node(folio));
 
-		*blkaddr_fast = next_blkaddr_of_node(&folio->page);
+		*blkaddr_fast = next_blkaddr_of_node(folio);
 		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
@@ -467,7 +467,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			entry->last_dentry = blkaddr;
 next:
 		/* check next segment */
-		blkaddr = next_blkaddr_of_node(&folio->page);
+		blkaddr = next_blkaddr_of_node(folio);
 		f2fs_folio_put(folio, true);
 
 		err = sanity_check_node_chain(sbi, blkaddr, &blkaddr_fast,
@@ -833,10 +833,10 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			list_move_tail(&entry->list, tmp_inode_list);
 next:
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
-					next_blkaddr_of_node(&folio->page));
+					next_blkaddr_of_node(folio));
 
 		/* check next segment */
-		blkaddr = next_blkaddr_of_node(&folio->page);
+		blkaddr = next_blkaddr_of_node(folio);
 		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
