Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E8C29DC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 03:31:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JA4OUTtP4yDwS+bk56MOsOyoWuJrkVXiwosTasculEM=; b=KSzoKt89mygc0BgS9dlSZQPDwO
	Lsa5VFvjfbcZmgUMvWqWklmNSbWarUeV9GD1pWNykW8c7rN1vhinz/MsRySaEk1S/riL1UsCiTNUq
	U9TSrKSp0QveJIUbn0ErmX5voO1daXWpKZVe5CmVtGI3cRD6lc4TMknTh71CaOdeAfPg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFkLm-0002VS-HW;
	Mon, 03 Nov 2025 02:31:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFkLl-0002VL-61
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UJHIOZCtjRgS7kWap8xSx0A0/7FKvsPO6VjP9lAdOL4=; b=APoJzIe4GLm9XU8d4KmerNkvc3
 Sxu5nno8MYNnl/G3bprJZ0EZHqQVmgGpNU7fVJ2OKiozpBJaz36yGEwsrSApt3+Kl28wDHf0Yo2XK
 2FQJ/V3bDZvjojLq7wXiQhQqCf3vlYjBuBz90fTAfx96h7mNovp/VfBbWPq7WazzLdU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UJHIOZCtjRgS7kWap8xSx0A0/7FKvsPO6VjP9lAdOL4=; b=U
 MU7nvjrMS1PPzLLb4xRhBLf+vema8O+YID4KWs/+wkSBUowHeq1sqCC6lJ8NcxPcdL36WzEbM5IOS
 URHRm2oGW7wa07bs6liXCnKoMiRYw36iU4MMjOn4H2S9HYMwGU/R1dqyHuX6GHaLMEig5iZXLz7a3
 /Cs40dNyuZJhaxxE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFkLk-0000Kf-Q0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 02:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7115B4436B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Nov 2025 02:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD87C4CEF7;
 Mon,  3 Nov 2025 02:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762137071;
 bh=5Kum6uP1k43P71MVReTNXIyEwW1rtRJrPhYpfKG0Ae4=;
 h=From:To:Cc:Subject:Date:From;
 b=rcTXmB/+iOyl8KB3cxMzh0elFrgnC+Xvtc1aShUhecxfeZdXG0kqt13C27SGvOqBQ
 +c6/Yw6ZYOWGeErP5Go9t/aro9+MEdsTjzVhWIC51ipBEH8p0LhCML4AmKmB3knEwk
 UvqeBgEapkW7gHBNpTCPYaDt6wDbByxvYLe/HznCgJ8xixpsK/faZ1nqOsK7vr+U1A
 qGMsMquHRpvFPaRHrg9tYT1CffPfk62LA9+W+k86M5reS2il4gJWTbebPYe+WdjAKa
 HcV9y8zlz4jorRq7cAksOfA7NuBg1vu9IQHFDunDQEfKcBiiqSHqHt2tywQtYnmjZy
 YYbDcV4xp1Q+w==
To: jaegeuk@kernel.org
Date: Mon,  3 Nov 2025 10:30:59 +0800
Message-ID: <20251103023059.2598474-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We missed to return error value if below functions fail, fix
 it. - do_resize - do_sload - do_label - do_inject Signed-off-by: Chao Yu
 <chao@kernel.org> --- fsck/main.c | 12 ++++++++---- 1 file changed,
 8 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFkLk-0000Kf-Q0
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to return error value correctly
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We missed to return error value if below functions fail, fix it.
- do_resize
- do_sload
- do_label
- do_inject

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index d034dc3..f7ef092 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1341,13 +1341,15 @@ fsck_again:
 #endif
 #ifdef WITH_RESIZE
 	case RESIZE:
-		if (do_resize(sbi))
+		ret = do_resize(sbi);
+		if (ret)
 			goto out_err;
 		break;
 #endif
 #ifdef WITH_SLOAD
 	case SLOAD:
-		if (do_sload(sbi))
+		ret = do_sload(sbi);
+		if (ret)
 			goto out_err;
 
 		ret = f2fs_sparse_initialize_meta(sbi);
@@ -1363,13 +1365,15 @@ fsck_again:
 #endif
 #ifdef WITH_LABEL
 	case LABEL:
-		if (do_label(sbi))
+		ret = do_label(sbi);
+		if (ret)
 			goto out_err;
 		break;
 #endif
 #ifdef WITH_INJECT
 	case INJECT:
-		if (do_inject(sbi))
+		ret = do_inject(sbi);
+		if (ret)
 			goto out_err;
 		break;
 #endif
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
