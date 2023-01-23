Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF252677560
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Jan 2023 08:05:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJqtp-0008JW-Sz;
	Mon, 23 Jan 2023 07:05:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pJqtk-0008JP-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 07:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSQJPlgvu8x/hqoEnCsQUqABOlqi7nXLlQkKGH/M4s8=; b=ROWXsq0VUEb1wKr3jho/xYdeY2
 lv1LCjdqvm5AhKQMtOyH73i7LXP8cqTCksbaojRF/HKhNVtpQMEqb6zyPvpIFP2xO/CO4qFiSKtKj
 ZhUW2aczrCqnq82hoCnC9jukrgSu0o5QQbIjPF0rr9E7BkBVqRrtPw0yUgBg4ku00XOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zSQJPlgvu8x/hqoEnCsQUqABOlqi7nXLlQkKGH/M4s8=; b=J
 uG9QJi/Svr/cmlEG+IdPnmKL90UkAh0VWc62hYc5wPbhQS3y76LETx+H7sEG9QaTR0TMbiNisfTVb
 TTP9+xxAuW0Z9E15fHBqlmEQ2oRe5T9NDKj0cqhziRwkwA/554/3AYjjRmgFfToVP3Y2jUGTRKh3L
 fTyxUm7GHCcCZorA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJqtf-0002s9-ET for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 07:05:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C794B80B56;
 Mon, 23 Jan 2023 07:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCDCC433D2;
 Mon, 23 Jan 2023 07:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674457530;
 bh=ik4H9BFLeehEHUHENH+ekDYEnVxW9h+jwxQCqF3Y5xY=;
 h=From:To:Cc:Subject:Date:From;
 b=MZ4astp6imdsZFowVuLbr8SZ1zd1Yt9BpGMpmoxlPvlwh5O4jGIq3bOzjwtjoWIzx
 FUt1Se5EXKRHXG6Av7ikOj9hSrxmRbm1RbwdGXwib/juxFioM874exSgWYzMRQJ12y
 YdofX93HEgl4qakrjaRZGeLks0UVHk4U005M2CgQrxcZeWqVz7cuASjTgE6etItJRa
 l5idirs5+QRmC9Zp9A3w0LQnokNJZkJ3sz4WFcius9s+hKpKEnMb3sSl0l5RpZ64f6
 ptVifMQzNPzflOTyCnUsM6UOeX0s/5Xp9BXk9Okr20jJ8qZOLksH17CM7aGmD8Q57L
 uEPH72hZpvwoQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Sun, 22 Jan 2023 23:04:14 -0800
Message-Id: <20230123070414.138052-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> When converting an
 inline directory to a regular one, f2fs is leaking uninitialized memory to
 disk because it doesn't initialize the entire directory block. Fix this by
 zero-initializing the block. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pJqtf-0002s9-ET
Subject: [f2fs-dev] [PATCH] f2fs: fix information leak in
 f2fs_move_inline_dirents()
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
Cc: Alexander Potapenko <glider@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When converting an inline directory to a regular one, f2fs is leaking
uninitialized memory to disk because it doesn't initialize the entire
directory block.  Fix this by zero-initializing the block.

This bug was introduced by commit 4ec17d688d74 ("f2fs: avoid unneeded
initializing when converting inline dentry"), which didn't consider the
security implications of leaking uninitialized memory to disk.

This was found by running xfstest generic/435 on a KMSAN-enabled kernel.

Fixes: 4ec17d688d74 ("f2fs: avoid unneeded initializing when converting inline dentry")
Cc: <stable@vger.kernel.org> # v4.3+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/inline.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 08e302d32118d..72269e7efd260 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -421,18 +421,17 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 
 	dentry_blk = page_address(page);
 
+	/*
+	 * Start by zeroing the full block, to ensure that all unused space is
+	 * zeroed and no uninitialized memory is leaked to disk.
+	 */
+	memset(dentry_blk, 0, F2FS_BLKSIZE);
+
 	make_dentry_ptr_inline(dir, &src, inline_dentry);
 	make_dentry_ptr_block(dir, &dst, dentry_blk);
 
 	/* copy data from inline dentry block to new dentry block */
 	memcpy(dst.bitmap, src.bitmap, src.nr_bitmap);
-	memset(dst.bitmap + src.nr_bitmap, 0, dst.nr_bitmap - src.nr_bitmap);
-	/*
-	 * we do not need to zero out remainder part of dentry and filename
-	 * field, since we have used bitmap for marking the usage status of
-	 * them, besides, we can also ignore copying/zeroing reserved space
-	 * of dentry block, because them haven't been used so far.
-	 */
 	memcpy(dst.dentry, src.dentry, SIZE_OF_DIR_ENTRY * src.max);
 	memcpy(dst.filename, src.filename, src.max * F2FS_SLOT_LEN);
 

base-commit: 7a2b15cfa8dbbd54beb4e2ce7b2f42eb0ad00425
-- 
2.39.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
