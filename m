Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 309826DC2A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:22:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plhAS-0000wF-4r;
	Mon, 10 Apr 2023 02:22:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plhAQ-0000w9-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qvjY2htA0bE25M2xCNlSvvPZhRo6S8aG9CJOCArR7SA=; b=WxGTMxOgIuhVg7usKSZyatuJx5
 eZSfzmzVS6OtOEz96rIv+cp1yWnC3czZCA2jvrDmLlo8lfGrlHyDht+J/ItMGT7hNKbroc/7eP2Jk
 muoUPtQ7hbWsx5KuWvrS9lyRGAGlcYl3TVB6jHyug3zZkJ7PHm5njL55GKoGZM9erTcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qvjY2htA0bE25M2xCNlSvvPZhRo6S8aG9CJOCArR7SA=; b=m
 MEr6KiYIL2ANhoGoYJfVOoCrka0IF3xT0M2mnbFCruWTQrOCz6R9l4UA8Sk/tKlUAKY7KpVohyJF+
 rzGwkPM0P4PlryVN9oujd13ubUqxTNGbvlEq6EQME1QDddYYIsV6ShjGaSQqgQR690w/NqvtVITrO
 yhNzpUxLMk4NpSoY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plhAM-002VIB-Kz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4725E60E75
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A9FC433EF;
 Mon, 10 Apr 2023 02:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681093312;
 bh=4T3lyXoA1FoV6P5GhQMMg5O/djdkaXone30k5xsKe0I=;
 h=From:To:Cc:Subject:Date:From;
 b=L0SmKFIOvAmAlaiZ9aKuw5CvWEbwZ52C609Zv78+Db0t3wcmTt04cSrEvcPvqhA7a
 DDIOD+pIFtg6+vUGFSNwH8miY3ZRKv+iaBx0egZQqhgxhU9x/ZicBy7s1MA9lK8fmo
 JI14+MNgTvtHQCO18hRY9dE3mCbaC9PU5z9mmssPiy4SZjoBBxcbWhoFWGJ2whSFd1
 gLYBFu5DRcmSv0+lafLVV3wkMnIoe4yCWnH/7Xh1IBYwHIVKG2dbTdRC4dVocndID1
 1eJZURI6+rNPIroziFLImK1jt5OoSi9PTCHzjTghlSGafeTMeW0iT0zws5Cr1QZRY/
 nF3nUV32e/k5Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:21:45 +0800
Message-Id: <20230410022145.1840993-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As detach_page_private() should have reset page's private
 field. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/dir.c | 1 - 1
 file changed, 1 deletion(-) diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c index
 d6dd8327e82d..d5c7c8e55eb4 100644 --- a/fs/f2fs/dir.c +++ b/fs/f2fs/dir.c
 @@ -912,7 +912,6 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry,
 str [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plhAM-002VIB-Kz
Subject: [f2fs-dev] [PATCH] f2fs: remove unneeded set_page_private() in
 f2fs_delete_entry()
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

As detach_page_private() should have reset page's private field.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d6dd8327e82d..d5c7c8e55eb4 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -912,7 +912,6 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 		f2fs_remove_dirty_inode(dir);
 
 		detach_page_private(page);
-		set_page_private(page, 0);
 	}
 	f2fs_put_page(page, 1);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
