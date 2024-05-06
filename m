Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5578BCC0E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:33:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vey-0005Ui-Pm;
	Mon, 06 May 2024 10:33:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vex-0005Uc-KK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E31uoUDJOzIfmIKHvU27ZHbfL5V9s59Wb7nHBi2/TxA=; b=GHn1NYDipcj5vAEci551am2vvc
 u1urQf2NExF6QmgFRXfWq5guYxorsMcz6ySkkPM4Bw7EtNHp2gcFVjMjNy5QuLq7hu64DGlDKRWsw
 dX1fPGF69Gc37F5YsgcrVTplajpxhG0eiYwrtVth+UBWM1KaEk9gqG9zMjq0zYAFApgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E31uoUDJOzIfmIKHvU27ZHbfL5V9s59Wb7nHBi2/TxA=; b=W
 hDwDbhU8qvtO5ljiEkXkvA4G9je40qwbJCpoItZbgNZG19W1AQzUjY3VgqyEkxs++FEyApRfQKTTa
 E76avXhKH/tOfValGIAxSelUuE8SHAGDLBvxFLWoHE7y4a2CFleNR/4PfFvdoHv1SZlz7SGnfoD/j
 bV/p7KDW0V1Hs8g8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vew-00042m-U5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 33677CE0B99
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA1BC116B1;
 Mon,  6 May 2024 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714991599;
 bh=ArQZcPL9NskSWJ33AcpZ7fqpChWS94RCsV5KimDJTWY=;
 h=From:To:Cc:Subject:Date:From;
 b=PO3HNL/NaetYrGgi4hGaAP0vK2LQfQyHtc5/VlCpgZx3gPrczk+9ZmblggC9/m3z3
 85Z76E4GjDW7N/t/6kY7dkRuAJ3BujwzquOE3LVHB3ZTgCNhqtIDxPjVfIlabMw2s9
 P1TC86GbAmremkhH1O2Vr3ed1AgbwQ+d7Y4Lm0OTFfgosuABRvprrwIN1MIU4SpKjl
 Htn29yMbng/+bMit+Ic0OEZ/gV43EjgcfojFEiiaBkHUBSaT7qt2qsjd/zZcw/hWiP
 GK8HfY+W8UNX9nazhsaKQ6INN3BtApxRKariBmzFuNCOpcvznZ4qLkEvQqW+a+W7GP
 mIEhU2Oxr68dA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:33:11 +0800
Message-Id: <20240506103313.773503-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It missed to call dec_valid_node_count() to release node
 block
 count in error path, fix it. Fixes: 141170b759e0 ("f2fs: fix to avoid use
 f2fs_bug_on() in f2fs_new_node_page()") Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/node.c | 12 ++++++------ 1 file changed, 6 insertions(+), 6 de
 [...] Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vew-00042m-U5
Subject: [f2fs-dev] [PATCH 1/3] f2fs: fix to release node block count in
 error path of f2fs_new_node_page()
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

It missed to call dec_valid_node_count() to release node block count
in error path, fix it.

Fixes: 141170b759e0 ("f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b3de6d6cdb02..ae39971825bc 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1313,15 +1313,14 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 
 #ifdef CONFIG_F2FS_CHECK_FS
 	err = f2fs_get_node_info(sbi, dn->nid, &new_ni, false);
-	if (err) {
-		dec_valid_node_count(sbi, dn->inode, !ofs);
-		goto fail;
-	}
+	if (err)
+		goto out_dec;
+
 	if (unlikely(new_ni.blk_addr != NULL_ADDR)) {
 		err = -EFSCORRUPTED;
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
-		goto fail;
+		goto out_dec;
 	}
 #endif
 	new_ni.nid = dn->nid;
@@ -1345,7 +1344,8 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 	if (ofs == 0)
 		inc_valid_inode_count(sbi);
 	return page;
-
+out_dec:
+	dec_valid_node_count(sbi, dn->inode, !ofs);
 fail:
 	clear_node_page_dirty(page);
 	f2fs_put_page(page, 1);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
