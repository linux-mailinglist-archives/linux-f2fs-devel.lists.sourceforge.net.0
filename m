Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B951E1B5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 01:20:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn7Fj-0007Tp-1K; Fri, 06 May 2022 23:20:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nn7Fh-0007Tj-8C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mbW3K3pqZFX0pT4hbUUYob5XEApkzKf+mkPrbGJaPfk=; b=imwUB8iwOap8Jr1MM9gCH2jQjm
 9XEzN2TFKOGovPlT2S4/5BX/gaNLC/N+/XgT0fAamVXFYaV56k3KKRf8Kz4nLJI6kdTS1XFXrOWBv
 LRPcCGiGWF60aX0JTgRF5/thk5AdfBKRa1NjCwUV3vrf8QUx7dD5gFPZFXl/NnRGHrvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mbW3K3pqZFX0pT4hbUUYob5XEApkzKf+mkPrbGJaPfk=; b=Q
 9ml5JUCWQG3SkiUhf1PLHKeLdsb87TvOVFQLfoEsvUMvp9EfWD70Ab7HabQBehd3FpROJqbmQ9Z2E
 tdjkQiZ7koHocDWhnQW/JDVELuoaY9huklZqJ+fdU/KOAGk6iJNRxTAqp8P21hSzAbfXqkHzHthdh
 M0ELlLRSMupvTn5w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn7Fd-003dAw-RU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 23:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AF9F61A28
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  6 May 2022 23:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3325C385A8;
 Fri,  6 May 2022 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651879234;
 bh=Equ3KAligNPBOnEusR03evXVwk87qPTr3C3S0lOJka0=;
 h=From:To:Cc:Subject:Date:From;
 b=l+BbfqRBpHaBkitbrWhYcbcDmIYXWmiS79QhKnQGE1r4C67IiNKHCk2R/+w/6AAij
 w9aqr0V23ae2kjED3iyGt9jcoFWJ8B6bM/0UaFmk6dHImdpMebKNPR7p7NKJ/icuWy
 S9k+FaiPBcAnZx+q9shQAEYkSWaWWTMLn4onwRzzKPALKwKTA7BxFKul/DsT0OC9Uy
 EaTZ9Xdz/G8aBgRtUpB1DtTpXAEm6GbNyG+UJHnwybwUtbeD/goU1Y0lFQNK/K4Z9X
 2OnMr4BD/4CtwntbsAj3VZNrRfovyZ2fWbxVX9JEf6zr2blyUHHPlNPnEYFcaAQ4dS
 rmjRH+RGfMHTg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  6 May 2022 16:20:28 -0700
Message-Id: <20220506232032.1264078-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: EAGAIN doesn't guarantee to have a free section. Let's report
 it. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c |
 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index e4cf8b7b23aa..b307d96a0a7c 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -1685, 7 +1685,
 7 @@ static int expand_inode_data(struct inode *inode, l [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nn7Fd-003dAw-RU
Subject: [f2fs-dev] [PATCH 1/5] f2fs: stop allocating pinned sections if
 EAGAIN happens
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

EAGAIN doesn't guarantee to have a free section. Let's report it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4cf8b7b23aa..b307d96a0a7c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1685,7 +1685,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			f2fs_down_write(&sbi->gc_lock);
 			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
-			if (err && err != -ENODATA && err != -EAGAIN)
+			if (err && err != -ENODATA)
 				goto out_err;
 		}
 
-- 
2.36.0.512.ge40c2bad7a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
