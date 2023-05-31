Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362071730F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 03:19:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4AVF-0003Yj-0T;
	Wed, 31 May 2023 01:19:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q4AVD-0003Yd-AV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 01:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Shpqgvg1/t/xRyjf9D9oIzI8l3pmWBbIDRDvzRxFKv0=; b=TW86QOved6umKHCsEKksCI2dor
 NFKOQd3BkffnDWkTqfPD1ztnC3MV11/l0pLjLHUHXzrTBYbeviX7LwmrnrK3/89jhXuk7xq7N7YQb
 fLnyW10P3Ls0OqfxMdUNG/FVSRsrQ53vT9FQXKxpv6eaoUoMltN0lmBE/Kn+6TmHA7ZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Shpqgvg1/t/xRyjf9D9oIzI8l3pmWBbIDRDvzRxFKv0=; b=W
 I25/b5PC6hpLINU2k3j7poQfhEX2aVNVcsnIXJ9ogRZrrOIGVRgEB8Tt9MQ5ZMjZXfnGqy1lRt5ML
 9cfBc6yQQHdJwM90bdLVyhT0yZZVGpcof1FERquPUSl1fUKYCCK19JmiMMBALxDjhJe9+yeqWWpj0
 sXndZ+tuDLxtU410=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4AV9-007091-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 01:19:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8143C635D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 May 2023 01:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC80C433D2;
 Wed, 31 May 2023 01:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685495981;
 bh=qPesv+gDQwyJygz7MUpv8QR6PDLe9xVDOqE4RDBXh2A=;
 h=From:To:Cc:Subject:Date:From;
 b=Xd18mxeQP50zaTdvdSXHAF9sReFkiFQ2/EznPjnLy7kh1fhw8WiCCUxAXHHDyCB8k
 um0MeceWqBvmg8U+VfzHZG0wQcz83y2IhhSCfCJlBuNchpwqrV9GEGAkYvqhX0pjvo
 3soqL9l7FmQenAQ9VuzG4+JJ09smoy5A7vh5DcqZwLtupcVi4cId3i/J6FwLj9rQfb
 /T1a+ply0LMUubzpPzzl92TXWteFXGgAgShziaOpwKZix5za7sYRtblkU/SgX0/S3d
 JV9jZIyBKzZEIKg4SzfDksdpMfm+yrudXufPFs84b+ZPZk8yU7gWkmOEIbxNs7aPqR
 0QnZegA2xdW3Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 31 May 2023 09:19:36 +0800
Message-Id: <20230531011936.3888803-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: and change return value's type of IS_INODE() from int to
 bool.
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - remove unnecessary
 le32_to_cpu()
 - change return value's type of IS_INODE() fsck/fsck.c | 7 +++----
 fsck/mount.c | 4 ++-- fsck/node.h | 4 ++-- 3 file [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4AV9-007091-T5
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: clean up codes with IS_INODE()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

and change return value's type of IS_INODE() from int to bool.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- remove unnecessary le32_to_cpu()
- change return value's type of IS_INODE()
 fsck/fsck.c  | 7 +++----
 fsck/mount.c | 4 ++--
 fsck/node.h  | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e6ad71d..a4db2a3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -247,7 +247,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		goto out;
 
 	/* check its block address */
-	if (node_blk->footer.nid == node_blk->footer.ino) {
+	if (IS_INODE(node_blk)) {
 		int ofs = get_extra_isize(node_blk);
 
 		if (ofs + ofs_in_node >= DEF_ADDRS_PER_INODE)
@@ -447,8 +447,7 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 				nid, ni->ino, le32_to_cpu(node_blk->footer.ino));
 		return -EINVAL;
 	}
-	if (ntype != TYPE_INODE &&
-			node_blk->footer.nid == node_blk->footer.ino) {
+	if (ntype != TYPE_INODE && IS_INODE(node_blk)) {
 		ASSERT_MSG("nid[0x%x] footer.nid[0x%x] footer.ino[0x%x]",
 				nid, le32_to_cpu(node_blk->footer.nid),
 				le32_to_cpu(node_blk->footer.ino));
@@ -3080,7 +3079,7 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
 			ASSERT(err >= 0);
 
 			/* reconnection will restore these nodes if needed */
-			if (node->footer.ino != node->footer.nid) {
+			if (!IS_INODE(node)) {
 				DBG(1, "Not support non-inode node [0x%x]\n",
 				    nid);
 				continue;
diff --git a/fsck/mount.c b/fsck/mount.c
index 25cec67..7aaedaa 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2394,7 +2394,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	ASSERT(ret >= 0);
 
 	/* check its block address */
-	if (node_blk->footer.nid == node_blk->footer.ino) {
+	if (IS_INODE(node_blk)) {
 		int ofs = get_extra_isize(node_blk);
 
 		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
@@ -2409,7 +2409,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	}
 
 	/* check extent cache entry */
-	if (node_blk->footer.nid != node_blk->footer.ino) {
+	if (!IS_INODE(node_blk)) {
 		get_node_info(sbi, le32_to_cpu(node_blk->footer.ino), &ni);
 
 		/* read inode block */
diff --git a/fsck/node.h b/fsck/node.h
index 99139b1..d38c322 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -18,9 +18,9 @@
 
 #include "fsck.h"
 
-static inline int IS_INODE(struct f2fs_node *node)
+static inline bool IS_INODE(struct f2fs_node *node)
 {
-	return ((node)->footer.nid == (node)->footer.ino);
+	return node->footer.ino == node->footer.nid;
 }
 
 static inline unsigned int ADDRS_PER_PAGE(struct f2fs_sb_info *sbi,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
