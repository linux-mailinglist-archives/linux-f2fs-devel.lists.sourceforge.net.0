Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE482C947
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 04:57:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOV9N-0006w8-DG;
	Sat, 13 Jan 2024 03:57:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rOV9M-0006w2-7B
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BukD3JAQCP39cvO9gL9YjkxyctgLPkQmOkajwpajTt8=; b=QCLPRKAx24D1i2tORGFollX6oC
 u7rBrU0PlTFOln7Q1LkVRLh8D0srylrEthgleGndcg5Bw28XVUK+KL0/EqdhXyiJC4cnZgunZvmy0
 k+q6VtmGD3pEXDobudIHIvG3lLGZkDtAd1ZMghL6igj0jSrzPDYH0NAK8BA9590pTxvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BukD3JAQCP39cvO9gL9YjkxyctgLPkQmOkajwpajTt8=; b=UlaAib0l7vExqmNCSFoUwAuCnx
 aNfQwKInaY5XrMSF6rpklXZRX4l5lXyAs9nun5pQIiYGmRjDAfXvGmIZVwpJwmAVql5+9qQ7h4kTX
 8NFpV/S6ao+rXfMaWMMgZCQNUYoyCDRHdNSSHaRh2IekHGsqvzcHJQ/jhZA5pIBg6dTY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOV9J-0003oV-RP for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CEEEF61ED5;
 Sat, 13 Jan 2024 03:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722A8C433A6;
 Sat, 13 Jan 2024 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705118248;
 bh=SD4fUAPJzN+uvRFc7mA/nW29W2wE766je65+7EHnk/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f7pX6qAv4QWcmyVcM0N8hs2jXBfnQxuaoTct/5CLyHPjilaqJZMFGK8SO9fQ4sLq/
 ccW4m6q/ColKurPEwwFgqle55HWe1LeNVcIf+AZfN5BM48duRlLrN9tQ+PddLGzpP9
 HVevzbToVs5KN8We5ANKc7Q50q+Dgtm7pRY3y2HlpTgGbB22RuaSNHin9JeIPKie8n
 g1+/ceNaZF5ZhfCUd5xofzEj8/gvMfX7gqyPcr5xpAa+4Bw0ImkN8yrFtfqLelugAC
 bt/wDSTrgI5ngPh1t6hXhTQMC5zo2KjZdDZ5pYFa5TTJEtWtcDHc2amWJjyPKaBXBV
 OfxZkxOp1oJig==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 13 Jan 2024 03:41:31 +0800
Message-Id: <20240112194132.25637-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240112194132.25637-1-chao@kernel.org>
References: <20240112194132.25637-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: verify_blkaddr() will trigger panic once we inject fault into
 f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on(). Fixes:
 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
 Reviewed-by: Daeho Jeong <daehojeong@google.com> Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/f2fs.h | 4 +--- [...] 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOV9J-0003oV-RP
Subject: [f2fs-dev] [PATCH v5 5/6] f2fs: fix to remove unnecessary
 f2fs_bug_on() to avoid panic
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

verify_blkaddr() will trigger panic once we inject fault into
f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on().

Fixes: 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 69e71460a950..ab710bb6d8b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3470,11 +3470,9 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type))
 		f2fs_err(sbi, "invalid blkaddr: %u, type: %d, run fsck to fix.",
 			 blkaddr, type);
-		f2fs_bug_on(sbi, 1);
-	}
 }
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
