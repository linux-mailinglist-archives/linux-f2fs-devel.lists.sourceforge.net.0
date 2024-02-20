Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C771285BC84
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 13:46:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcPVc-000402-Hk;
	Tue, 20 Feb 2024 12:46:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcPVa-0003zw-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 12:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kxm+unuSqLfiA5HCTQLgrP1bLKvY6EdsN9x7ubsWxqo=; b=BmBW/awYhAkWSdvPdHvbXSbMhl
 jU8T+e0FoJVQL+GRz3VSHlbP2KE1fvJa3OR7tqsXp/4MQ0Qwlv+AjJJn3XeENR7BZQkGEeW3SL+Yy
 s0XCzOlwLdsk4YGVSVSpytC0XgwjQkTz+0K/hR1I0WzRGUgW2GFVe+Klr6lDIxPAlPlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kxm+unuSqLfiA5HCTQLgrP1bLKvY6EdsN9x7ubsWxqo=; b=OnEX3xPcleClGY2CQgC5luQ9FE
 vek0zoY71ntF/mgxmr+X6h6XMi5nrrIqKgBrDdlahDkX1X+apzjMtffUp6Iz7hGf0KmaohPZPqCoR
 PLUqvXhkLKG4s+IUL+ENvYnE23tO03tPwK8z9ZUdRDhaHmoX4vH0fuqCmv5xmOlw74SE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcPVY-0007b8-98 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 12:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1547ACE14E5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 12:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB88C433F1;
 Tue, 20 Feb 2024 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708433153;
 bh=vEf0Ih4DLZl+DfJ2jdBpaR+s4SCpe+EwlG+7g5o8K/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iO6DQ1Nxu0/K9LUWnp5khHzGBPrp6QJuBysHFmSaR8MR36Gn8MwVSGIbokGVdLJPW
 2Pa8w0N5o4GXVxbBvr2SDSHE/BIxcQIxSCT3bS9YcbWYcEmMHRV35mRunP1eHqw8Or
 YBVNXZFWbiJEzS8rSCziR/MXhSN0AFDJfzyc040447nmlwQRmpl1cEiN7QrzkHF2aL
 YDKFfmQ4tRXRStzFuCtxr5TCP5KzeAWzttNJUOCxk4v/6PuHN06FTXDnvACmj90Z7D
 QkSB8Zb8EbvkNag8374cWj60W1zkwlfP3XbUbQRwskHfZ6Oe/+xozL9vzUiWqh9DMR
 KjpZSKOhE+bUw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Feb 2024 20:45:37 +0800
Message-Id: <20240220124537.11531-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240220124537.11531-1-chao@kernel.org>
References: <20240220124537.11531-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 it will waste time to convert for comparison. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fsck/fsck.c | 4 ++-- 1 file changed,
 2 insertions(+), 
 2 deletions(-) diff --git a/fsck/fsck.c b/fsck/fsck.c index 14a9628..a42b597
 100644 --- a/fsck/fsck.c +++ b/fsck/fsck.c @@ -1253,8 +1253,8 @@ check: }
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcPVY-0007b8-98
Subject: [f2fs-dev] [PATCH 3/3] f2fs-tools: print hexadecimal number in log
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, it will waste time to convert for comparison.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 14a9628..a42b597 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1253,8 +1253,8 @@ check:
 	}
 
 	if (i_blocks != *blk_cnt) {
-		ASSERT_MSG("ino: 0x%x has i_blocks: %08"PRIx64", "
-				"but has %u blocks",
+		ASSERT_MSG("ino: 0x%x has i_blocks: 0x%08"PRIx64", "
+				"but has 0x%x blocks",
 				nid, i_blocks, *blk_cnt);
 		if (c.fix_on) {
 			node_blk->i.i_blocks = cpu_to_le64(*blk_cnt);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
