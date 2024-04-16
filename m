Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 033458A64F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwd8E-0003F7-2J;
	Tue, 16 Apr 2024 07:21:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwd8B-0003Ep-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9oAC6I2Rz5sk9Vrro3BqfUBlXMctfnRDPUBFhedNdPc=; b=QdwFmdzbO0YHOnV3libQcXJSYK
 N67tvTW6PSdgvdm58AsC3v233FvA7tnkr5myaOvNY81P/ltDbTDOC9mhkJJa4+JAwYadYallg+Ddf
 SeNWFr0unl78pFCngn8xVKpzCnkUQxJg21ZVZCjDgFBYIiduHRDQkeiyDxFKf6b6pn04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9oAC6I2Rz5sk9Vrro3BqfUBlXMctfnRDPUBFhedNdPc=; b=ljy12OFhLkKWxDGOd74nsw43y1
 g5Ceq4jFdD5Bv8RyEULeWrngd6dg3nctJGsGvumC03PgB0PcD7Ea50nWUr2Ci+URvPHEtDtIFsFwG
 zg+bNphaT9UNqtNbSrRXke8hJhhtQp9sw4fSxVlcH5ghoSRAP4dLfdlQQXLs03hZKGcY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwd8B-0002nN-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3D2F361077
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 07:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD080C2BD10;
 Tue, 16 Apr 2024 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713252077;
 bh=djpKyoxPD0DIOaQ6IMcLFl5d0YTE8pMEG0ARTsy1XVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L/N0NDiqd9ZL7Q8iDqkpEjnMorp+1p7z58Z6PIaYlzoOqQ3QYbXnon6GN8Pt+9Cjn
 qlEjksywYkAYutBWKmOX2isenwRUFUSr3TwLf2sC54uu9zDntM06FxjFD/Wmeg0m9w
 +qbhvuZ92E5/zRm9WGKAxzq4fwEfNx2QqhHanMDN7BBrGo6CYBcyZbTH3gOQsozS7U
 BEnRbc8zSF4zI19StzSPBicX5OvH3GA073yU2SaWltNXw6ucfoMjaHDQFqD0bcB+zo
 ZQNHn3xEVrxs8uJPwznNs2oulYma54XN/ZVvE1aZ99u0HssYQpcUi7+xbU/LxP/1Ye
 tSuKANTYjZ2eg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 Apr 2024 15:21:08 +0800
Message-Id: <20240416072108.5819-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416072108.5819-1-chao@kernel.org>
References: <20240416072108.5819-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit d7e9a9037de2 ("f2fs: Support Block Size == Page
 Size"), F2FS_BLKSIZE equals to PAGE_SIZE, remove unnecessary check condition.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 6 ------ 1
 file changed, 6 deletions(-) 
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
X-Headers-End: 1rwd8B-0002nN-Nm
Subject: [f2fs-dev] [PATCH 2/2] f2fs: remove unnecessary block size check in
 init_f2fs_fs()
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

After commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size"),
F2FS_BLKSIZE equals to PAGE_SIZE, remove unnecessary check condition.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6d1e4fc629e2..32aa6d6fa871 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4933,12 +4933,6 @@ static int __init init_f2fs_fs(void)
 {
 	int err;
 
-	if (PAGE_SIZE != F2FS_BLKSIZE) {
-		printk("F2FS not supported on PAGE_SIZE(%lu) != BLOCK_SIZE(%lu)\n",
-				PAGE_SIZE, F2FS_BLKSIZE);
-		return -EINVAL;
-	}
-
 	err = init_inodecache();
 	if (err)
 		goto fail;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
