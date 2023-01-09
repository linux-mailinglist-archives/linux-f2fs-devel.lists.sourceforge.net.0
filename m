Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC79661CDD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 04:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEjAG-0006oQ-FJ;
	Mon, 09 Jan 2023 03:49:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pEjAF-0006oK-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWbsLOrxWTFiqQfMeqCVPDHd30PUivdO48Wj9KerfHs=; b=A9xpj8bdWp5a1Bn1UMpNxg/Ta9
 JZv3FOHLMNY90wdIBt3yT07jjRikriIVD+G13GpJag7/zFkBgWQLWSVLgD84FNysfQ5dFniGmU11c
 vKq2ATgVeLjBryXrkclUpVu9QK3jmiJ0mM8Hbkkmf7GfC2XM2kGQP+w3Hi/oaAmprzDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EWbsLOrxWTFiqQfMeqCVPDHd30PUivdO48Wj9KerfHs=; b=m
 Uv+Gjq7QLqLBJkoy1fBgw/+tOY0lpA2/I56d6NKvWpuImwRCpb8t1jTJIkGlNkwo3xhyuiQJ9hgVC
 HkCJGznU+E/iTGxJT0yvvS3Hw04VpybttcHpUFc/Q6GNrVHnOulqRafl/JRtSZ+KZsXO/67RVVCNd
 QpMpJeBSCYfXD4Mo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEjAF-0003nv-CR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:49:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02EF960C38
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 03:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A10C433EF;
 Mon,  9 Jan 2023 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673236169;
 bh=XDnCVXGXzYassBSR7qHkIyje/nQ1gYWjET1uSxSAlPU=;
 h=From:To:Cc:Subject:Date:From;
 b=QF0kQZFGD4IGR1HiSBf3nfIBQguOfRQngtDixAdlAUnAV+BatyEQTKxsIS3Kfd/z0
 R6+IGFXydUKl+pYhhvbB6Dyl+gjsI1dxSENzXEOUcadIpYC6+0zev16t5ePdY6Es63
 RegS/rIqusgco2qRB673yEyKjNwgvUCvJwPdu2EtL5IH4fWzSBwKBr56JWfkI5r6Yl
 gk6SUmKiZ9H6rA814DjgEYIVLqgWG7deCvyk7IRKtbng+7QvDK2mragDgAaWMM7RHe
 qhxqhg7T+CAPpCDaNSAAb1HLl88jXrgqMGHL+7POu9Gzt7479aJnRggNVwEjNmDQQn
 jB+eB64wvQVVw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Jan 2023 11:49:20 +0800
Message-Id: <20230109034920.492914-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In do_read_inode(), sanity_check_inode() should be called
 after f2fs_init_read_extent_tree(),
 fix it. Fixes: 72840cccc0a1 ("f2fs: allocate
 the extent_cache by default") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/inode.c | 12 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pEjAF-0003nv-CR
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on extent cache
 correctly
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

In do_read_inode(), sanity_check_inode() should be called after
f2fs_init_read_extent_tree(), fix it.

Fixes: 72840cccc0a1 ("f2fs: allocate the extent_cache by default")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index de5cd311ca79..574dee5d44e0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -413,12 +413,6 @@ static int do_read_inode(struct inode *inode)
 		fi->i_inline_xattr_size = 0;
 	}
 
-	if (!sanity_check_inode(inode, node_page)) {
-		f2fs_put_page(node_page, 1);
-		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
-		return -EFSCORRUPTED;
-	}
-
 	/* check data exist */
 	if (f2fs_has_inline_data(inode) && !f2fs_exist_data(inode))
 		__recover_inline_status(inode, node_page);
@@ -482,6 +476,12 @@ static int do_read_inode(struct inode *inode)
 	f2fs_init_read_extent_tree(inode, node_page);
 	f2fs_init_age_extent_tree(inode);
 
+	if (!sanity_check_inode(inode, node_page)) {
+		f2fs_put_page(node_page, 1);
+		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
+		return -EFSCORRUPTED;
+	}
+
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
