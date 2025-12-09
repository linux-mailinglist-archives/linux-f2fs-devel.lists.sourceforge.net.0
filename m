Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C90ABCAFC4D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 12:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rf+qoPP10NGlqbzRgPps6KdLYFz+ew2+IwdmTjg0VUc=; b=jjqrD5EIFc+TyiMYnKBlc63ljm
	eP0B4AJx6PS7iWm+XibUVsuzgqo8Y7hL1SKvrkyEO8yN2UX9WWgGAm8VK+q8mPT6SqZIyHuY/yihx
	2KkxmboMGU3+cfpufzIPxoZ8VVj9u+G5T8pWpElNR/Y8ULx6Sn/q6l+a1mLM5gudjEAU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vSvur-0004XK-0q;
	Tue, 09 Dec 2025 11:30:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vSvup-0004XE-1a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 11:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMW7EwzcXjgroyrdI67TNKQgMWBNWPdSUKpdFZUXnIM=; b=K9CbSWz24wpD7Vp462RgDSId/x
 ZoM3EsDq9G5+uqQiD6nMEh5GXllohwA5E9LXpH0EQN3vfohCaME3ZBKKjeAfJ7jBUFM4r8hOywSkA
 OLBRiJzwS8pl4V+A80drlOnRubSABqxumGd3Uiq4obbbD5XdJB5SY31mvJL2g3fdwnoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BMW7EwzcXjgroyrdI67TNKQgMWBNWPdSUKpdFZUXnIM=; b=h
 7K7KQc0V0ZTuGsb10aY0F03I1TSKpdAr/nZ2x1vi35SIuzsuoTRyUCDQcgbzUvOdYd6UUqG7d6uV6
 efC+FlYgDEVBtnBxoqlDbdUo+ROYmqsr2YLXcLTALSLhBHieN+lx8AMhFwvXbuci5+GOvzFdmqQGv
 Lyg/dvCP/rXKFgp0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vSvuo-0006m7-KY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 11:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C31941ABE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 11:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE6C4CEF5;
 Tue,  9 Dec 2025 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765279788;
 bh=kC9wOyBmquCqAs6xK26aZTH0sJvlu7PNU//Uug8x5CU=;
 h=From:To:Cc:Subject:Date:From;
 b=mjik0iJ8aOrivS4e5eS8e04r0ljWy7gylI9npG0op37Jvrvz8fwqGNSNhp8IBdDtK
 BbxezTErceOFgJimu0HAqnfBSv3ZEMq6CYD6fsyrGHR5j8B+nclTS9ZJzSLlMiNDCL
 x+dWgAdxJ17Vta8dT1FXvu/TSMNcTmoIqiQk8Pn0IR12j0J08HZfIyVtp6B6VSS0Wy
 IBZj0ZG4dR3XzSe7jLD0jI7GgLFEfrxiwc0hbrDXl7UOOr2jygQwysihv2fQrtHqz4
 0oikXcRN4nJyEjUWihnbuLzp369TkPUYZaSUtkCMQIGJYZ+kXfxnzUzsrp7ahXpkWi
 M9DkPhmxLE6Uw==
To: jaegeuk@kernel.org
Date: Tue,  9 Dec 2025 19:29:37 +0800
Message-ID: <20251209112938.1017229-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add more sanity check on node folio during its writeback,
 if node footer indicates it is an inode: - i_mode should be consistent w/
 inode - ofs_of_node should be consistent w/ non-xattr node In addition, if
 sanity check fails, let's shutdown filesystem to avoid looping to redirty
 and writeback it. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vSvuo-0006m7-KY
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: fix to do sanity check on node
 folio during its writeback
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add more sanity check on node folio during its writeback, if node footer
indicates it is an inode:
- i_mode should be consistent w/ inode
- ofs_of_node should be consistent w/ non-xattr node

In addition, if sanity check fails, let's shutdown filesystem to avoid
looping to redirty and writeback it.

Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- rebase the code
 fs/f2fs/node.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 482a362f2625..83624c302543 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1504,20 +1504,30 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
 					enum node_type ntype)
 {
+	bool is_inode;
+	bool is_xnode;
+
 	if (unlikely(nid != nid_of_node(folio)))
 		goto out_err;
 
+	is_inode = IS_INODE(folio);
+	is_xnode = f2fs_has_xattr_block(ofs_of_node(folio));
+
 	switch (ntype) {
+	case NODE_TYPE_REGULAR:
+		if (is_inode && is_xnode)
+			goto out_err;
+		break;
 	case NODE_TYPE_INODE:
-		if (!IS_INODE(folio))
+		if (!is_inode || is_xnode)
 			goto out_err;
 		break;
 	case NODE_TYPE_XATTR:
-		if (!f2fs_has_xattr_block(ofs_of_node(folio)))
+		if (is_inode || !is_xnode)
 			goto out_err;
 		break;
 	case NODE_TYPE_NON_INODE:
-		if (IS_INODE(folio))
+		if (is_inode)
 			goto out_err;
 		break;
 	default:
@@ -1751,7 +1761,11 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	/* get old block addr of this node page */
 	nid = nid_of_node(folio);
-	f2fs_bug_on(sbi, folio->index != nid);
+
+	if (sanity_check_node_footer(sbi, folio, nid, NODE_TYPE_REGULAR)) {
+		f2fs_handle_critical_error(sbi, STOP_CP_REASON_CORRUPTED_NID);
+		goto redirty_out;
+	}
 
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
