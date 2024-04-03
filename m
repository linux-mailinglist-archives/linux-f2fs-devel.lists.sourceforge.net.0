Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 994DF89727C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 16:25:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rs1Xu-0005Kn-RT;
	Wed, 03 Apr 2024 14:24:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rs1Xs-0005Kh-UM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 14:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=08tdGDn/YbVgivOQdbwsN8tJkVGMa960FjEswE1bqmI=; b=ZAviWKnwULDUVUhG+4B/Bz6THD
 4HQ58eTKAt6DFQF11ygNcLj65/bmyQYBX84msmFnMMCxWsoz8gpWXdh6UkJXezhLKWDRjWgJngU6z
 ILOf7x7FbGWkrI/VLSR38uZNizlQMyPEw36xoMLS+SHIt/xka04r49M5jHjf8OF+zVQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=08tdGDn/YbVgivOQdbwsN8tJkVGMa960FjEswE1bqmI=; b=C
 wny0xSBRz3aDgNI/34bfj5cBSjz4SjefmF6Mn5L2iuGXSbeLCB+MgJirneLme8jf7Ke4otOoha8LP
 kIH4gg7gGfAM01cSR8FcKYukLpBTfh/1z/y1+9HWV7w1LIjTnfYLZXeJ/zBuLxs8HyrmVkuTXz6nT
 KCVrfOves8EAn83U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rs1Xs-0004fM-86 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 14:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26DB0CE2AFD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Apr 2024 14:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A697EC433F1;
 Wed,  3 Apr 2024 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712154267;
 bh=Et6k9jnpHCmh8RkVkmceF4DfrHtMEGLOP0mlzrDQVTg=;
 h=From:To:Cc:Subject:Date:From;
 b=q4FhDPtznoIvgxXYNNTmflJkwAz5zan8MN7d5DCZWR+npG9lvlELY4xhniWJF/Qr3
 0tBjo2D4tiAqrDQ4Rho1DCjgp6l02JntfbQHocIYDsjgS0reSS1LG2L4ePy/GXXjdI
 vIRvLmR2buLiB+Pwq7dWnNA8fJtOb346RXmWYp5lTbQXMV5w5bbfhD6bwTJp8PWxLj
 xiTRi0rOYinFu9xwTQKgv3s1yzPt26/hnQRViMAYSYqMRr+ogGAkiWPm9YiL8+zwZD
 Xk0fy0Fhfp8tlRbW405XaVYRrghfX+WAUNdDWHa3sCJRGl50At2akdoDrIDPSaIXZM
 BGBNC92fMR8Sw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  3 Apr 2024 22:24:19 +0800
Message-Id: <20240403142420.2042498-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: compress and pinfile flag should be checked after inode lock
 held to avoid race condition, fix it. Fixes: 4c8ff7095bef ("f2fs: support
 data compression") Fixes: 5fed0be8583f ("f2fs: do not allow partial truncation
 on pinned file") Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/file.c
 | 20 +++ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rs1Xs-0004fM-86
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to relocate check condition in
 f2fs_fallocate()
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

compress and pinfile flag should be checked after inode lock held to
avoid race condition, fix it.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 5fed0be8583f ("f2fs: do not allow partial truncation on pinned file")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 148bfe3effdf..83a807e25e31 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1820,15 +1820,6 @@ static long f2fs_fallocate(struct file *file, int mode,
 		(mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
 		return -EOPNOTSUPP;
 
-	/*
-	 * Pinned file should not support partial truncation since the block
-	 * can be used by applications.
-	 */
-	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
-		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
-			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE)))
-		return -EOPNOTSUPP;
-
 	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
 			FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
 			FALLOC_FL_INSERT_RANGE))
@@ -1836,6 +1827,17 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	inode_lock(inode);
 
+	/*
+	 * Pinned file should not support partial truncation since the block
+	 * can be used by applications.
+	 */
+	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
+		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
+			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	ret = file_modified(file);
 	if (ret)
 		goto out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
