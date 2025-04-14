Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 181A9A87E15
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Apr 2025 12:53:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4HRY-00034b-Vy;
	Mon, 14 Apr 2025 10:53:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4HRX-00034U-Vl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 10:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v8F9PYjP24ZOjHS1QwHHrV+cK//1tuNak2yAu1gWqY0=; b=V4QUt/W8VUDqveI9sTv9Dr9t87
 ZXuyvzx/YINzrlJK/Dn9yrY8FVT8rYnKwlNX518P3Mg2UbJumxSe+y4/Wdn8Sj/+XzK1wJ4l4xg82
 Z3Wu3noDkgT6nwJED8Z2w8p1baR/XU+RCrvNoDn6uSxAN0NM/F1j1PGnN21XZVPhqS90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v8F9PYjP24ZOjHS1QwHHrV+cK//1tuNak2yAu1gWqY0=; b=G
 Y0yAe2jBOsPs2ZiCFJvCviQ976NXNBMd0A9n7gLb+y1JwmeQc/YGSbVxZdmepGKzmAAjc9H1gMMxM
 p+rHkJYd+kaotMAQS6JxR49ZRpkl97O3EGPUTo4te0vE6zKJxfkAySdjGc+VmxL0jc+AUFVQx3daU
 QwiovWkHeHYgeBno=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4HRH-0005UD-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 10:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C19D9A49CFB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 10:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E7CC4CEE5;
 Mon, 14 Apr 2025 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744627988;
 bh=N/oOtBHpVIf8Y/Ndag63Io3nJvG/R35WBpnc8Gbkk3M=;
 h=From:To:Cc:Subject:Date:From;
 b=AvZ+4ZNDXksZ2kxcbOjHn3IEZRPwm6/Ky7/sPA7LppeRx0Q5GvMU1sCIk23BFbUTP
 yImEKznZg7emCp4ltFbOZe8PebAwS6vrAITeGPsC9rZEwy3qIog8flJXBd3jnHaYk7
 2+Ou+mFK+xBc9Fut0dgs4n1qcZuAaFlYugh0wSaUtvR4qWrY34oZBAFv8JEJkPiEI5
 q8n+SmIhmndD2hMaBeNgefjjzn+6C/je7EdU/OQSlA2OjGBQIx9B7P346oj3sMMVSZ
 aC9+OksDKxc+MvqEHuCu+qjB4TZ6BQV0yE9aYLRzWJwhl+6OPTuvEvsEcqyaVBbiOr
 9uAUKyNBriOEA==
To: jaegeuk@kernel.org
Date: Mon, 14 Apr 2025 18:52:36 +0800
Message-ID: <20250414105237.728522-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup,
 no logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff
 --git a/fs/f2fs/data.c b/fs/f2fs/data.c index 1a90aca499f6..4f70755c30cc
 100644 --- a/fs/f2fs/data.c +++ b/fs/f2fs/data.c @@ -53, 7 +53,
 7 @@ bool f2fs_is_cp_guaranteed(struct
 page *page) struct in [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4HRH-0005UD-Qc
Subject: [f2fs-dev] [PATCH 1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just cleanup, no logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1a90aca499f6..4f70755c30cc 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -53,7 +53,7 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 	struct inode *inode;
 	struct f2fs_sb_info *sbi;
 
-	if (!mapping)
+	if (fscrypt_is_bounce_page(page))
 		return false;
 
 	inode = mapping->host;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
