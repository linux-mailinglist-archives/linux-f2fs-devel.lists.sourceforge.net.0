Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48D707CB7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 11:24:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzZrk-0004oi-Pn;
	Thu, 18 May 2023 09:24:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzZrj-0004oc-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 09:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KWx4heuWePuNjJ7fiqytUDcak0a6dBGwEP7dbi5O0eY=; b=FPJy6x4j3P5HqW04r5YD1WUKTV
 wG/RWCJ5LJgnVq3bEdoxfBOdIG355lQsnTjYmOHdjcmTLZnvo/rrQTDu2ZRwriuedOO6CHKNgrB8R
 XIj5fQvebO3734B87lWrA18cq9ns1CNfjLSYNUfUXytgp1eZVkVSQi2bpWs9CTOEE7jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KWx4heuWePuNjJ7fiqytUDcak0a6dBGwEP7dbi5O0eY=; b=c
 +hFVC7EX4oLdvGXtFnc5wl4zwvc4ocnV5iu9X5Pt7uxQtzBqoYmdaGyF5iCgBdXM7ySviu8n3l/Lh
 xmi7Wl5wXm+eDNsaisbulq73tf4sncNb6aTm2tRwALgfBAk5fJmsZBURgii9gfQL68m5fFn4TAppI
 fo/Du95RoQIDR/KY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzZrj-00CCHG-Ut for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 09:24:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A55061032
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 09:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15419C433D2;
 Thu, 18 May 2023 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684401842;
 bh=w/Xr2wWJCAtTesfxNkNitkmSiDhGjE+CTXBnlhPH0R4=;
 h=From:To:Cc:Subject:Date:From;
 b=Rpddip4oLYe6RPrhryizpa0mmF37ddUji6Bgf7TMA2wGe7amForkmU5tl6rcrJuOf
 vAQwifHL4Icc3W5Y6cD5rFPUGD6xUjOVJcp6lt3ovlR92EXSm9G5TfpiwZA0u+0eC1
 2vWgqa0+iOVhEbmRhfbJknDEgem6lidLn27oqyoAvKXcVlah18etFLUnoxVHhUQUkh
 FsjTbngP7A2byXe40uZ5UpIaBseSIHA5VCbNzLfOgv1pD0oXJ8/ggBYko1qA2kRhLE
 bnZ667olmb15z5N/F/wDpoO0tCT6McEvJRUoouwuSK3viK/E1XB4ctcry1sFypVz5p
 AXniaIBcldGnw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 18 May 2023 17:23:44 +0800
Message-Id: <20230518092344.2274468-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  And use IS_INODE() to clean up codes. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fsck/fsck.c | 7 +++---- fsck/mount.c | 4 ++--
 fsck/node.h | 3 ++- 3 files changed, 7 insertions(+),
 7 deletions(-) diff --git a/fsck/fsck.c
 b/fsck/fsck.c index d03f1da..ac4cd98 100644 --- a/fsck/fsck.c +++
 b/fsck/fsck.c
 @@ -247,7 +247,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi,
 struct f2fs_summary * [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzZrj-00CCHG-Ut
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to use le32_to_cpu() in IS_INODE()
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

And use IS_INODE() to clean up codes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c  | 7 +++----
 fsck/mount.c | 4 ++--
 fsck/node.h  | 3 ++-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index d03f1da..ac4cd98 100644
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
@@ -3081,7 +3080,7 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
 			ASSERT(err >= 0);
 
 			/* reconnection will restore these nodes if needed */
-			if (node->footer.ino != node->footer.nid) {
+			if (!IS_INODE(node)) {
 				DBG(1, "Not support non-inode node [0x%x]\n",
 				    nid);
 				continue;
diff --git a/fsck/mount.c b/fsck/mount.c
index 4c74888..70619c9 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2420,7 +2420,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	ASSERT(ret >= 0);
 
 	/* check its block address */
-	if (node_blk->footer.nid == node_blk->footer.ino) {
+	if (IS_INODE(node_blk)) {
 		int ofs = get_extra_isize(node_blk);
 
 		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
@@ -2435,7 +2435,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	}
 
 	/* check extent cache entry */
-	if (node_blk->footer.nid != node_blk->footer.ino) {
+	if (!IS_INODE(node_blk)) {
 		get_node_info(sbi, le32_to_cpu(node_blk->footer.ino), &ni);
 
 		/* read inode block */
diff --git a/fsck/node.h b/fsck/node.h
index 99139b1..2ba7b8c 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -20,7 +20,8 @@
 
 static inline int IS_INODE(struct f2fs_node *node)
 {
-	return ((node)->footer.nid == (node)->footer.ino);
+	return le32_to_cpu(node->footer.ino) ==
+			le32_to_cpu(node->footer.nid);
 }
 
 static inline unsigned int ADDRS_PER_PAGE(struct f2fs_sb_info *sbi,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
