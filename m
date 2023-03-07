Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317C6AE437
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 16:14:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZZ1K-0007Fu-EA;
	Tue, 07 Mar 2023 15:14:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pZZ1I-0007Ff-Be
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2vcEVoAREZUUkBDOXjxp8pa/RAGf3dIVj8UnS+wFwM=; b=cYJLMHMh++nKLl1y/+L9d213m3
 kzww3ttFm5lmU+l0hF6gfQJSkRQaP28DpXwgOlenpjV6g3nXgDTUv063f6ghyKyMTvfhD8SpARYTN
 kMyQ7YOfZpkh9hCuNFzY7+TwQ6cqlSS6jnmG/BhB2TD/1mLQ+mvgQRKMY2PsJ5f8s9yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G2vcEVoAREZUUkBDOXjxp8pa/RAGf3dIVj8UnS+wFwM=; b=b
 RqKOPp5MbJTty3nmEXkTjxCYdfI+jJHa7b1FpaFSzOOEJbWgfcUdGipXZq7l6mzWCp8FKS6rEhFDF
 i10DSnMHK/oZzfj/azWjzPH1cdrcrlMa4cGR6vejzpM53QKDK9cUjKgyAEM9M/D7rna+JiW2SQrRp
 /IkokwSxTB/aR4TI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZZ1F-0004sx-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 15:14:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E7CD6145B;
 Tue,  7 Mar 2023 15:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB31C4339B;
 Tue,  7 Mar 2023 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678202060;
 bh=bxU+hOiIjssyJGKPM24O0mCCSmIiA+TBoXRf2lB8e1M=;
 h=From:To:Cc:Subject:Date:From;
 b=AFUVp94n/6H6wCmMRVWpMVY28wdcHDusmYUVqrnS/PddbglmSoXaqQ5Woas/0IZHy
 sRXaOxFOTh1tnW70t6pCEne154DfMP7GXihFrPQen44zAU+UXaRxxog6VOUKclv83/
 LR8p56SJOhuTgplmWh0g9NV33t2QkhM6uXV0bcOM2BaTwNR5cg9RgVZQiOeVFUkQfc
 TTODcBOnbPl+fpIeyMTTust1tFxmGpolFApiTJ7OkgfIW05mB/QNMLCUe+Mg/dUOCz
 qT9eaMqrm8mfh1U3dJwOVooNkILRmoVcsJoJOIZTjCqXkYXUph8wwtWMJho8QfTAxI
 mKtEyr0hi5tVw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  7 Mar 2023 23:14:08 +0800
Message-Id: <20230307151408.58490-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS-fs (dm-x): inconsistent rbtree,
 cur(3470333575168) next(3320009719808)
 [ cut here ] kernel BUG at fs/f2fs/gc.c:602! Internal error: Oops - BUG:
 0 [#1] PREEMPT SMP ARM PC i [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZZ1F-0004sx-W1
Subject: [f2fs-dev] [PATCH] f2fs: fix unaligned field offset in 32-bits
 platform
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
------------[ cut here ]------------
kernel BUG at fs/f2fs/gc.c:602!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
PC is at get_victim_by_default+0x13c0/0x1498
LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
....
[<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
[<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
[<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
[<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)

The reason is there is __packed attribute in struct rb_entry, but there
is no __packed attribute in struct victim_entry, so wrong offset of key
field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
it describes memory layouts of struct rb_entry and struct victim_entry in
32-bits platform as below:

struct rb_entry {
   [0] struct rb_node rb_node;
       union {
           struct {...};
  [12]     unsigned long long key;
       } __packed;
}
size of struct rb_entry: 20

struct victim_entry {
   [0] struct rb_node rb_node;
       union {
           struct {...};
  [16]     struct victim_info vi;
       };
  [32] struct list_head list;
}
size of struct victim_entry: 40

This patch tries to add __packed attribute in below structure:
- discard_info, discard_cmd
- extent_info, extent_node
- victim_info, victim_entry
in order to fix this unaligned field offset issue in 32-bits platform.

Fixes: 004b68621897 ("f2fs: use rb-tree to track pending discard commands")
Fixes: 13054c548a1c ("f2fs: introduce infra macro and data structure of rb-tree extent cache")
Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++---
 fs/f2fs/gc.h   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..17fa7572ceed 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -349,7 +349,7 @@ struct discard_info {
 	block_t lstart;			/* logical start address */
 	block_t len;			/* length */
 	block_t start;			/* actual start address in dev */
-};
+} __packed;
 
 struct discard_cmd {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
@@ -361,7 +361,7 @@ struct discard_cmd {
 		};
 		struct discard_info di;	/* discard info */
 
-	};
+	} __packed;
 	struct list_head list;		/* command list */
 	struct completion wait;		/* compleation */
 	struct block_device *bdev;	/* bdev */
@@ -660,7 +660,7 @@ struct extent_info {
 			unsigned long long last_blocks;
 		};
 	};
-};
+} __packed;
 
 struct extent_node {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 15bd1d680f67..304937d9a084 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -58,7 +58,7 @@ struct gc_inode_list {
 struct victim_info {
 	unsigned long long mtime;	/* mtime of section */
 	unsigned int segno;		/* section No. */
-};
+} __packed;
 
 struct victim_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
@@ -68,7 +68,7 @@ struct victim_entry {
 			unsigned int segno;		/* segment No. */
 		};
 		struct victim_info vi;	/* victim info */
-	};
+	} __packed;
 	struct list_head list;
 };
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
