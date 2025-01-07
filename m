Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD900A0352A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2025 03:33:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tUzOt-0004d1-KS;
	Tue, 07 Jan 2025 02:32:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tUzOs-0004ct-1O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 02:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=51RqwQSSdFmCN4XI86tMGBG/P/aCj/q/L9aJyIsiFYI=; b=O6rryRYAKf6WXFbCi4I09nHyiS
 ldXxd05pnnh7d02h6qb+2TZKdD+8pZiPRExXFowI6ZdYwyLbOE6YVICaah1LPAComBDtNt+qRInvA
 eqpnr5I9XKL27BpmTJviIz+3Kn5JKj4rdJ5p+DjsZDJLVP953aJOHnqBFpmI3c2XdcrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=51RqwQSSdFmCN4XI86tMGBG/P/aCj/q/L9aJyIsiFYI=; b=M
 AP7Zjm4a0BDWz90ocWi36thVrwBQD3+Ew2k3qiJIe+ObwgX8IL3zrpv8iWO0vMwBn0XEnnzhxI37O
 7XB1ILe+TRgJIOWD6KwBd52tCQ6aXvH+8h2WHugQsxbzHgI5JWLuOc6yO6FoJuEl51gd7Q6+rNS0C
 TwBRHluvmuZUNu8A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tUzOq-0000V7-RA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 02:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58F6B5C55A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Jan 2025 02:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B34C4CED2;
 Tue,  7 Jan 2025 02:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736217171;
 bh=d+uKXaQ5aoFSAXUvVUg8z0pyNWkqnM2vS7sjAT0OzN8=;
 h=From:To:Cc:Subject:Date:From;
 b=DAMCIkjGr7IxM3tQ7Gcl2krixhqd+t/BRBx+tVJ/sQ/Gskm2w0lfF56rcKaL69RiI
 mzf+BGqCZhYqQRgtLkrZQXrPHtUaNXIEzqQcCZ0ttg1DYjUGnPdy8GhgtzfQgF4Xqq
 p04RVrUFlPvjjgne75w7nGnu5gbmqETKD1tI6PBBD/jtoCWY8cAun03ymiz/Fma7eJ
 zphK1K6VEv12UB5AWlJzMA+Bt7p0ZF7Lof5G3YfgoAqabnUFMxeZBvRNWza2vA0hV+
 GORXe9jw2Z0eulPy7yhYbb3590Dij9HP25usJnSdLZDp+06ztIxPPzcoNzTZAugT1M
 yf2/qHm0The8A==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  7 Jan 2025 02:32:48 +0000
Message-ID: <20250107023248.3702924-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch should avoid the below warning which does not
 corrupt
 the metadata tho. [ 51.508120][ T253] F2FS-fs (dm-59): access invalid
 blkaddr:36
 [ 51.508156][ T253] __f2fs_is_valid_blkaddr+0x330/0x384 [ 51.508162][ T253]
 f2fs_is_valid_blkaddr_raw+0x10/0x24 [ 51.508163][ T253] f2fs_ [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tUzOq-0000V7-RA
Subject: [f2fs-dev] [PATCH] f2fs: don't call block truncation for aliased
 file
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

This patch should avoid the below warning which does not corrupt the metadata
tho.

[   51.508120][  T253] F2FS-fs (dm-59): access invalid blkaddr:36
[   51.508156][  T253]  __f2fs_is_valid_blkaddr+0x330/0x384
[   51.508162][  T253]  f2fs_is_valid_blkaddr_raw+0x10/0x24
[   51.508163][  T253]  f2fs_truncate_data_blocks_range+0x1ec/0x438
[   51.508177][  T253]  f2fs_remove_inode_page+0x8c/0x148
[   51.508194][  T253]  f2fs_evict_inode+0x230/0x76c

Fixes: 128d333f0dff ("f2fs: introduce device aliasing file")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c04ee1a7ce57..06313e1eb884 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1274,6 +1274,12 @@ int f2fs_remove_inode_page(struct inode *inode)
 		return err;
 	}
 
+	/* The aliase file must be truncated successfully. */
+	if (unlikely(IS_DEVICE_ALIASING(inode))) {
+		f2fs_put_dnode(&dn);
+		return 0;
+	}
+
 	/* remove potential inline_data blocks */
 	if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
 				S_ISLNK(inode->i_mode))
-- 
2.47.1.613.gc27f4b7a9f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
