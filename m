Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEE8BCC2F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:42:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vnp-0002Lw-05;
	Mon, 06 May 2024 10:42:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vnV-0002L6-0t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxArMdgJXALH7kX7KC1uLNCx8j7YG3n6T1DTG2HPg1I=; b=XMuJEbDBKmKOO3oKJ7W6XTdWKC
 FvOSUFtd7ZxVu7MapM4Fbml+83iY0cjrD1ARrU/fNuEmWCzfBNTfWiI5/ekRpxFVSz4ftqLJcN6t/
 TnCny8vz3jvtNbpc80aH73+MZ8pQ3Yuv9h/vwpm9+QpXg2MCJPIXKnvA93vohs2WcfkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BxArMdgJXALH7kX7KC1uLNCx8j7YG3n6T1DTG2HPg1I=; b=GMidWTkh3IeOUwPRxV/F1WI+9U
 2jfKUJjjKKApdraMmqrr5h/RbJVVTzF37qhIhIV0Fy4bbRtr7/A57NVTAEGYFMUvPrNLqDSL7V3C3
 4YcnEzF+3N33ckNWe2J8XWkw9EN0O0+PGWyCieGf0Uojq5aCm/Gxre6bE/PNWpanRkmI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vnU-0004nS-DD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12D2561171
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3AEC4AF63;
 Mon,  6 May 2024 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992130;
 bh=v82z/f0v3qlNA/pUTvtaHNQodyv569B9p8AX3nujvZk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boV2IkvTKAOy7YPAYJ/6WZNNps3mLpo5SdXeM5EZN8FpPP/Pn2RRUM9tUTbEATUXm
 dbAD+zMropII+XZY7MDHJKFVUtIJFrKCKE5AgpkikNdBWiIZROAqGbLw2nlZk1XQNs
 EuM/c+V/LZ9XIc11EEdYIzN/vVH7mB+bOqVgqbnKLvGlAx96IwZ3CB6FZHT8S+Hiuj
 7w0t7yz40dvcdJpECFuvBYgbEKu80LrGLP5nGwJYyX6a+gEUXNfeaZYfOY7n3Y00BN
 sHwWbLWKzCU4zKlgQkyLaXjIz0kmbQ/5BMnCCGASy8bm5n86zB4xDZ8sCCda3MmIdl
 gPh/QD7CnAD2A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:41:37 +0800
Message-Id: <20240506104140.776986-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506104140.776986-1-chao@kernel.org>
References: <20240506104140.776986-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If inc_valid_block_count() can not allocate all requested
 blocks,
 it needs to release block count in .total_valid_block_count and resevation
 blocks in inode. Fixes: 54607494875e ("f2fs: compress: fix to avoid
 inconsistence
 bewteen i_blocks and dnode") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/f2fs.h | 15 ++++++++------- 1 file changed, 8 inserti [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
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
X-Headers-End: 1s3vnU-0004nS-DD
Subject: [f2fs-dev] [PATCH 2/5] f2fs: compress: fix error path of
 inc_valid_block_count()
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

If inc_valid_block_count() can not allocate all requested blocks,
it needs to release block count in .total_valid_block_count and
resevation blocks in inode.

Fixes: 54607494875e ("f2fs: compress: fix to avoid inconsistence bewteen i_blocks and dnode")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c876813b5532..95a40d4f778f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2309,7 +2309,7 @@ static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count, bool partial)
 {
-	blkcnt_t diff = 0, release = 0;
+	long long diff = 0, release = 0;
 	block_t avail_user_block_count;
 	int ret;
 
@@ -2329,26 +2329,27 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	percpu_counter_add(&sbi->alloc_valid_block_count, (*count));
 
 	spin_lock(&sbi->stat_lock);
-	sbi->total_valid_block_count += (block_t)(*count);
-	avail_user_block_count = get_available_block_count(sbi, inode, true);
 
-	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
+	avail_user_block_count = get_available_block_count(sbi, inode, true);
+	diff = (long long)sbi->total_valid_block_count + *count -
+						avail_user_block_count;
+	if (unlikely(diff > 0)) {
 		if (!partial) {
 			spin_unlock(&sbi->stat_lock);
+			release = *count;
 			goto enospc;
 		}
-
-		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
 			diff = *count;
 		*count -= diff;
 		release = diff;
-		sbi->total_valid_block_count -= diff;
 		if (!*count) {
 			spin_unlock(&sbi->stat_lock);
 			goto enospc;
 		}
 	}
+	sbi->total_valid_block_count += (block_t)(*count);
+
 	spin_unlock(&sbi->stat_lock);
 
 	if (unlikely(release)) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
