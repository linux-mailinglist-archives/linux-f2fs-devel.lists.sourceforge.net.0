Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8B8A64EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:21:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwd86-0007if-JY;
	Tue, 16 Apr 2024 07:21:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwd85-0007iY-5V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PwN7zq5CuR/8dF8HeTh8pL7KL9hqaJlQwDWs8XtBLuk=; b=B5yjfLKIWCfsBWEMFXoY8IrEk1
 GNLgOKnmxQ4bxfbftlRelxX8gKRY7hozgW1KP0GrT4umvZ3nlvMg/IQMzlRcIoek2SumRP10dGe3P
 cdNBVvWcCrA3bC4C1ybmZZHgXcSQEB+T6UbFX0oEUfxMvBxKlxw1ghp1F/RlW/6WTKwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PwN7zq5CuR/8dF8HeTh8pL7KL9hqaJlQwDWs8XtBLuk=; b=V
 YsJ6EzW2/of7CwCjHTl2o4AzvniJCwbF1ZXjkRug+MqEK7KEQHWZ3bysDE4mhtIrHXSy+kC9zCG9C
 Z+FOBO3mIP9B+lIVY4SygWAe14pO23Am9KA+e1s+SnWRoofnZX0OpQC+AJ7exf449sTldn0Iie5mp
 Q77008cO07AVuYWY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwd84-0002mg-Vs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A92D60ECF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 07:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F64C113CE;
 Tue, 16 Apr 2024 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713252075;
 bh=0eAYPFz5NJz8CvYb2+reHHZOCHtdyUHNHA7JFN9scDM=;
 h=From:To:Cc:Subject:Date:From;
 b=XBG7NtgcrQECr0YpoPjUOFyUyw2eqNUa6jVQRPDU3MaoW3IouNXXIHJ8kjMy3n81O
 XXS7DknigjgoYcLCtZe0+lCTSxQOrbNHKR4s2pLNEVJ25vlZ6anG6oMO4fYNNmLjqs
 v6VEEgbvfZhTWxifnycvVWkzVEshrl82iK6c744yo2hfzBHRdpvahYBS68hqKPx5Op
 +yqhcsFO4FVFu6U1TjzOsRtkcukDpP9VRco+z8g2Z+lmQozIS/fiXO4iur/ciZ7ODx
 QEhbxMQ8W3e2PvxyBIUJNfwyEnC5ukc9rvhkhPvBE61r7gP/lLwRMymtU69gRWt8U+
 56xngnOpHXVpQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 Apr 2024 15:21:07 +0800
Message-Id: <20240416072108.5819-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
 missed to adjust comment in sanity_check_raw_super(), fix it. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwd84-0002mg-Vs
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix comment in sanity_check_raw_super()
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

Commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size") missed to
adjust comment in sanity_check_raw_super(), fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0a34c8746782..6d1e4fc629e2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3456,7 +3456,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	/* Currently, support only 4KB block size */
+	/* only support block_size equals to PAGE_SIZE */
 	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
 		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
 			  le32_to_cpu(raw_super->log_blocksize),
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
