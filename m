Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200DBCF542
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 14:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gAFhYhePuA1cAuWoUzrXVmOrnYk1+YykGJYawTRL2Y=; b=CJjLmrTDCCQIhdYyvLm8TUdBPD
	UfN50csh6UeSr0cM3KNDVfwXkI4dJhc1Tl/h7Gc0UZdOFstWIf5nzFEJQa71WWH+MimyAOazwBxb+
	oUyUN6HO8vbLbK5Clzk261P5+9t+7VfSg2tHtS6ltavfbLXqIOXlv9usA2Yk1crz+cVQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7Yk7-0002b7-LV;
	Sat, 11 Oct 2025 12:30:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7Yk6-0002b0-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 12:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0MFJqeI6AuXbNVTD5xWMszlWZ1iE9qJvCzJ4kTeGPGc=; b=HZoyrFtwd3GoP6K02fza4RApVY
 UZX4UGXEnkShsVMGTECI8RuJSwdAsdCmGad4ycMjPFa7Jk341n4351LRLeO8E2F3ChYmccSyczyFa
 pfT+KpM99m3ylfVSKHVGgEwzmrxObD3W8NvKg+vh7pf2hdquXdr5PS+yoCp7/OcGWdS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0MFJqeI6AuXbNVTD5xWMszlWZ1iE9qJvCzJ4kTeGPGc=; b=O
 wr7wLUEiKutWBeZmjHts3kJG23UbDOopY8d3Uju5NB8QcnupQFgdcqJ8N/IJhrbL1kfiPcKbt9sr9
 CZMIBs16F35immUCPNAdK5bvUFQhUXRtGU6tLY8+nUu1LORY5sfx6uoooJUP3ot5kUh76oj3ejCO7
 jWLEY+bZ5i28ei98=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7Yk6-0000fF-2F for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 12:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AC7B64192F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Oct 2025 12:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE92C4CEF4;
 Sat, 11 Oct 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760185823;
 bh=fxrRNcuem9wyVJRqfPuA5LjA0AcsQ/z/YFKiVQDFmoA=;
 h=From:To:Cc:Subject:Date:From;
 b=UoWCtBkkMQ4g95l7Yx4y078CQOvHsjKgzIOj+gUu03u83pXy/yXtiDDb7EuPZyaTv
 h5KjJi2iTuj7mbSu4OH0DKxrxHViM9JoHTCNhO2amYuNLywwBpd9DVJz48Uj6Ft0Tc
 0eIrSflYWPrqH+MXokZeWZWWJ7KPrgzDD//Kd6Vd7u8w/RLcb86z9ICmnvUFjQTIa0
 qvZpLkZ+De4pb7d/tK3h5mMNVdGPnhzjRhonUxo3ujaMHOQrKT6ujtf8IYXGEs2kvY
 Ka4d3zkuSWlCxrovlopSdFdV0oLXMdbFH6pCinT5/hvDvKbXgbreK14mjPh0AyaByC
 R1tXS1xCwk24g==
To: jaegeuk@kernel.org
Date: Sat, 11 Oct 2025 20:30:15 +0800
Message-ID: <20251011123016.715964-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7Yk6-0000fF-2F
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to do sanity check on node folio
 during its writeback
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
 fs/f2fs/node.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 482a362f2625..2bb9e6d35080 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1504,20 +1504,37 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
 					enum node_type ntype)
 {
+	bool is_inode;
+
 	if (unlikely(nid != nid_of_node(folio)))
 		goto out_err;
 
+	is_inode = IS_INODE(folio);
+
 	switch (ntype) {
+	case NODE_TYPE_REGULAR:
+		if (is_inode) {
+			umode_t m = le16_to_cpu(F2FS_INODE(folio)->i_mode);
+
+			if (!S_ISLNK(m) && !S_ISREG(m) && !S_ISDIR(m) &&
+				!S_ISCHR(m) && !S_ISBLK(m) && !S_ISFIFO(m) &&
+				!S_ISSOCK(m))
+				goto out_err;
+
+			if (f2fs_has_xattr_block(ofs_of_node(folio)))
+				goto out_err;
+		}
+		break;
 	case NODE_TYPE_INODE:
-		if (!IS_INODE(folio))
+		if (!is_inode)
 			goto out_err;
 		break;
 	case NODE_TYPE_XATTR:
-		if (!f2fs_has_xattr_block(ofs_of_node(folio)))
+		if (is_inode || !f2fs_has_xattr_block(ofs_of_node(folio)))
 			goto out_err;
 		break;
 	case NODE_TYPE_NON_INODE:
-		if (IS_INODE(folio))
+		if (is_inode)
 			goto out_err;
 		break;
 	default:
@@ -1751,7 +1768,11 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
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
