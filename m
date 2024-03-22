Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5514A886F50
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 16:00:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rngNW-0003kU-5g;
	Fri, 22 Mar 2024 15:00:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rngNU-0003jh-H5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 15:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dy7L95vF0YOm58TqxRr/46fQTBlb6GNuRD3PFCS0580=; b=Xj7g+mcJHM37xfycBuo13OnIka
 +f6FZqPCIKE3ZRAqPlwHcmizv5kTsEIKZl07ZNvoTwDew9t1aV7XITYQpbfk7GBXfeF+WLf3Zzn7Q
 AEMIYMfCafQAZWjxQaUPBu4tooMbmzcHE7gW+ZghBf+9HunuKmBOSjRSoUSzoBtSpUwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dy7L95vF0YOm58TqxRr/46fQTBlb6GNuRD3PFCS0580=; b=d
 pTmI6kJZ/cZWIIVPQwu3FbF0EB1ll2V0BsbUhQ00Xp92H4JXkAeT6jlB1uLBljO9yl6rQaYhyvYK0
 5lZDKNJsohlxUzf65GfJr3CFh6yWkpl9521gph2R1JA9zrq/hIYrJIi/7qx/XdLzBUy25n0oVch1a
 fNwXz6Wi+6L7KE5k=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rngNS-0000Au-O9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 15:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA3BFCE1718;
 Fri, 22 Mar 2024 15:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ED1C433F1;
 Fri, 22 Mar 2024 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711119602;
 bh=n0MJ4YjaOKX2Bd1ABkqsW07WnDRYW7ulWQqb4AqpGVc=;
 h=From:To:Cc:Subject:Date:From;
 b=cyou0njs8x7Vs9rk8sEBi7YG32eFPaf4JbVqDon8/i8hPEwTr+tI7PX1NjNRI6FGV
 qKcHs9Oa+MvockmwtqL7C4bNeiI/TTt5BS0p4zIAJYTou+MuQ7bj1mrOfJSCcXFCzZ
 HSJMHxqDXd2vO8I953ErmC3IGPHvr30u0S3LnBCBtTYkTrPHNZGvBD9/iAQLj2gDfp
 E+EmuzrmCG60FpTljylD3mFQra33ZOu4xqlrdCT7TeaPaFPh+n82CJaKa47azNE0H3
 wpLNM0wA64oiRcRtbpssPCWZouRATPEngnQsm1jypdWmsgN5IgsFisq3F8IjXxGDp6
 +LZ/MkMzy1a2w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 22 Mar 2024 22:59:55 +0800
Message-Id: <20240322145955.2959257-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As Roman Smirnov reported as below: " There is a possible
 bug in f2fs_truncate_inode_blocks(): if (err < 0 && err != -ENOENT) goto fail; 
 ... offset[1] = 0; offset[0]++; nofs += err; 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rngNS-0000Au-O9
Subject: [f2fs-dev] [PATCH] f2fs: fix to detect inconsistent nat entry
 during truncation
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
Cc: Roman Smirnov <r.smirnov@omp.ru>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Roman Smirnov reported as below:

"
There is a possible bug in f2fs_truncate_inode_blocks():

    if (err < 0 && err != -ENOENT)
    			goto fail;
        ...
        offset[1] = 0;
        offset[0]++;
        nofs += err;

If err = -ENOENT then nofs will sum with an error code,
which is strange behaviour. Also if nofs < ENOENT this will
cause an overflow. err will be equal to -ENOENT with the
following call stack:

truncate_nodes()
  f2fs_get_node_page()
     __get_node_page()
        read_node_page()
"

If nat is corrupted, truncate_nodes() may return -ENOENT, and
f2fs_truncate_inode_blocks() doesn't handle such error correctly,
fix it.

Reported-by: Roman Smirnov <r.smirnov@omp.ru>
Closes: https://lore.kernel.org/linux-f2fs-devel/085b27fd2b364a3c8c3a9ca77363e246@omp.ru
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b3de6d6cdb02..bb57bbaff7b4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1187,7 +1187,17 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		default:
 			BUG();
 		}
-		if (err < 0 && err != -ENOENT)
+		if (err == -ENOENT) {
+			set_sbi_flag(F2FS_P_SB(page), SBI_NEED_FSCK);
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+			f2fs_err_ratelimited(sbi,
+				"truncate node fail, ino:%lu, nid:%u, "
+				"offset[0]:%d, offset[1]:%d, nofs:%d",
+				inode->i_ino, dn.nid, offset[0],
+				offset[1], nofs);
+			err = 0;
+		}
+		if (err < 0)
 			goto fail;
 		if (offset[1] == 0 &&
 				ri->i_nid[offset[0] - NODE_DIR1_BLOCK]) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
