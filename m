Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681DCA962D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Dec 2025 22:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jdr2b9OIChuE3c6Kc+8PpOH0Js6yzZw086cfFbLiyCA=; b=NqdOaYMhkr2T6f8bP73ajDb/Zn
	G5oOA1CtVafsygfB0mkkMYjJBxxZwJkU7PYHbr93dKvA42+ATJWGfAbL+/6yJoUCIfHkhev77pk5D
	ay9APZqS2DdhQkPrlWzLW5gOdbWYQR9eBltnNJbzBVGbc6aOL8xzBlrI31lL/m0WCCO0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRdMe-0004ro-6Q;
	Fri, 05 Dec 2025 21:29:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vRdMb-0004rg-V7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Dec 2025 21:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=izQ2PV1VirYKgENlCwSJ2bUPb0kMvKcoea4vv2UMQno=; b=DklP9I6NuBghEM35IHMujErmdd
 L9jc59mxJ9L5KxCEoe01m61flcGXyu5Es3HpbZbD2pecpAk1e0B6JzaslrYMlJI1F3qTuTqorm11s
 Z2SYbElNkKVfd1yK3yniZILdt5c6qYUJafsMvr/wwo7opChriB95++qGdCV6BTEfJ6MI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=izQ2PV1VirYKgENlCwSJ2bUPb0kMvKcoea4vv2UMQno=; b=h
 ne48HHcPx57Ba8ciQJaKV0TMt1/fiaxAeFwiHp42Md1t/A5AAxQwC/V5clidbOQp1y9haRBxg0FtQ
 UB6DbpuSWYKFgpfKTtWYCFZWsqpMscaFsAWCRNg8BkK1I0ILxyhzm8x8lTgoiIBh99TDuvTJI6ZNT
 qyX8xjnWzmecNXYM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vRdMb-0005Yy-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Dec 2025 21:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C33341A9D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Dec 2025 21:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFECC4CEF1;
 Fri,  5 Dec 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764970152;
 bh=3MEeSB+tL+nPmJ0UwxkPPir86FJ40OMgsk0PPwQsiuI=;
 h=From:To:Cc:Subject:Date:From;
 b=U/KfsgQdLBAYy+MOVGAJ/bHj/XtmAx1bVSa9JgJGXoXn2EdLF1fqcJzaQ366bwcz+
 NCvBhuxvlmRuuRVAAvfwuhL2Pw4Zo6pnii6Fq39HyyC6MY9nKMSPwRIPbC6Du/5EpK
 vXAOnWY228FAA71uDh5YQQJ182cTvfELBmcCePjtyhyXIRV37kN8eMA30tdMe7fNUc
 m7YN9/gFI6ugb/efgrKi3+Pq4TTyMyPOqfNwoHhNQImsrYgjTCfxj4or0WIWUifIiM
 h8CzoCOcihB0tCYtSil39e65NXTbUd4+lRDE5zWWtAJ8lBSCIfO6qlCas38kVxaFP/
 lfQVtW3rXFB5g==
To: jaegeuk@kernel.org
Date: Sat,  6 Dec 2025 05:28:58 +0800
Message-ID: <20251205212900.3969665-1-chao@kernel.org>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vRdMb-0005Yy-Hx
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to do sanity check on node
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
v2:
- fix to not check i_mode due to new inode page may not have valid i_mode
- add more check condition for NODE_TYPE_INODE case
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
