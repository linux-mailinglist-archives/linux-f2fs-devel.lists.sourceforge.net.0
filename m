Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14723A15969
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 23:10:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYuXW-000589-DQ;
	Fri, 17 Jan 2025 22:10:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYuXV-000583-9j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 22:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2MQz5PYE1bGepMvvY7/ppLE6abM7jhSCjxeVFTu0Bq4=; b=JWvOMb36pX09cRbYg1NGePlsiD
 nlpXFxZOoclNOfgTAtFwUNNHPP6iNHHk4RPq0XhRfIjoFW6edmJuDzsDJyhXuTezROpFHf0xCu7C/
 DCayaWQsSGr06RlI6kGEKtB2hpHUvgFBXSehZ8F5rXoTqCbNjLAK/c0XCfSP1yBRv4BA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2MQz5PYE1bGepMvvY7/ppLE6abM7jhSCjxeVFTu0Bq4=; b=a
 H0vuxkAPAQzm6zc17kOuiLE4kQ4Cc6b4HTJe4qgreO0zTonfWp7USyWUEZcBgGLdNcPyuxSgUBIw1
 Ys4NeIsmovogRUv1emNLIRUPKfNkaBxpMi8rLr9P+LHQi03Q4w1XO8cfW4OH9n1H1+HG8CYSDRb+p
 vObtfSCz9GNwoE60=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYuXU-0003JO-2f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 22:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14A075C64B5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2025 22:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB6EC4CEDD;
 Fri, 17 Jan 2025 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737151798;
 bh=6kwFPoW5Q3/lJJtdP7PXibA49Ojd6NyYhUfsuy/O3yU=;
 h=From:To:Cc:Subject:Date:From;
 b=CxTp6Rlh1IISITakubsmYhzSmS0QSrHW0D+H52FbQ9ZBs+r0dyx6khNZgvgheHCgJ
 MiMN1eBGYWXRfdl/kgXETtLi80tGcHsS4X9evPTq+7uiRUMdqRV8zTBtCRjQP8BM5G
 eV2kW5FS26N1PAhALDDvZro6tUihsHcLCtiKGSmlmnq5doWQKHGm5DJolqVGeCRy9Z
 2UMhas3cua7fJqEhi+kC9PDi6dlwZAiv8bSFzz2CF26cCfZH9GgF5MBZWKUHCSGuKY
 K48oRi6nBAsTKZAaUto0S+apgksJVbf3s7IcojdKcj8541G5BHdetHg0HsLL2XH6xL
 TvpHMNUSGvquA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 17 Jan 2025 22:09:55 +0000
Message-ID: <20250117220955.2482817-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_new_inode(), if we fail to get a new inode, we go
 iput(), followed by f2fs_evict_inode(). If the inode is not marked as bad,
 it'll try to call f2fs_remove_inode_page() which tries to read the [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYuXU-0003JO-2f
Subject: [f2fs-dev] [PATCH] f2fs: avoid trying to get invalid block address
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_new_inode(), if we fail to get a new inode, we go iput(), followed by
f2fs_evict_inode(). If the inode is not marked as bad, it'll try to call
f2fs_remove_inode_page() which tries to read the inode block given node id.
But, there's no block address allocated yet, which gives a chance to access
a wrong block address, if the block device has some garbage data in NAT table.

We need to make sure NAT table should have zero data for all the unallocated
node ids, but also would be better to take this unnecessary path as well.
Let's mark the faild inode as bad.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 57d46e1439de..a278c7da8177 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -341,6 +341,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	trace_f2fs_new_inode(inode, err);
 	dquot_drop(inode);
 	inode->i_flags |= S_NOQUOTA;
+	make_bad_inode(inode);
 	if (nid_free)
 		set_inode_flag(inode, FI_FREE_NID);
 	clear_nlink(inode);
-- 
2.48.0.rc2.279.g1de40edade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
