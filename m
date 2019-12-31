Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4312DAE4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2019 19:15:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imM3H-0007nP-Cn; Tue, 31 Dec 2019 18:15:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1imM3F-0007nF-1P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 18:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CpJvdkoFOG8u6urxBV+FeTUD+acFwyhD9uYxs9gUu8M=; b=Gc/XJZQVR8toASYADbTFBcSNiC
 KDj6uaTpNzUflZ/eYfY4gKh0D6o1hNzaF2Fd+aNkpdsvO1Ixy1vEZqtmrJsTSu0Pdk1riLt+V/Rrr
 YXi7Elg9hMnkH+ceuOQI5xh0DAsE8Q2/NTF0wlz1+vyiLU269JxMzQqrkhuV+VFcrGGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CpJvdkoFOG8u6urxBV+FeTUD+acFwyhD9uYxs9gUu8M=; b=e
 fDNg2Ce/72b5cf6u+Fp8UxhNaYeeZP3e2PKVuW3gCwEdhHyLLoOC3tcpvvzzY3RVj6UqgJLcsMEl2
 L76HzoJU2Pwg6XXevSKtpzCCBYyqWpzqN5iApoMVoqxPz/uKLeGXFgO0dUDnCTxHa9iJdsT4OHLQN
 dkc1zlUsmYKK6dXc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imM38-004GMJ-PI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 18:15:27 +0000
Received: from zzz.tds (h75-100-12-111.burkwi.broadband.dynamic.tds.net
 [75.100.12.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9F58206E0;
 Tue, 31 Dec 2019 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577816117;
 bh=R7F0k84TKiRuXBbh08JjpWu+dILQdgBWUuwJnRPVITs=;
 h=From:To:Cc:Subject:Date:From;
 b=VvBZ6DKLJT67FOwaf2TjKTfeJkQtxdwc1JKZLSGwK7uxvTFC0Yen37Bm4uySTPGit
 8Iq+XBuHVNxJN9Z0/rGmLuz31TE7TdPcRtlOrOYjFeoZuect9/f2tFsFXhla5wgpv4
 +NKXpZwcV8tBvHd2cqOsJWT9qDan88gnaAgejH8Q=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 31 Dec 2019 12:14:56 -0600
Message-Id: <20191231181456.47957-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1imM38-004GMJ-PI
Subject: [f2fs-dev] [PATCH] f2fs: remove unneeded check for error allocating
 bio_post_read_ctx
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since allocating an object from a mempool never fails when
__GFP_DIRECT_RECLAIM (which is included in GFP_NOFS) is set, the check
for failure to allocate a bio_post_read_ctx is unnecessary.  Remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 618a05bf356e..b52e1512f82e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -939,11 +939,8 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 		post_read_steps |= 1 << STEP_VERITY;
 
 	if (post_read_steps) {
+		/* Due to the mempool, this never fails. */
 		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
-		if (!ctx) {
-			bio_put(bio);
-			return ERR_PTR(-ENOMEM);
-		}
 		ctx->bio = bio;
 		ctx->sbi = sbi;
 		ctx->enabled_steps = post_read_steps;
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
