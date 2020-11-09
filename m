Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C162AC321
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 19:04:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcBWd-0001CQ-5n; Mon, 09 Nov 2020 18:04:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kcBWa-0001CH-2d
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 18:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+WJ8RDy1EjRXBOrClQFFIa1jAGOan8tvKkBnQDd6huA=; b=k49FBMFgcmZCR/lI4wfEUFoN16
 VFL2l5GVCNavNCEtQFghLYBwWgvODSqW5dFAKTg5YPx2Z7Du+GugFP6ut+369RUQtVnaXrQlZHewc
 g1YSLVTrgg0RbkJ19bOzOrHfQAnGF1vnOo7+Or7XjtvCp9yvHMgvVOMXVs75rlAMCZPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+WJ8RDy1EjRXBOrClQFFIa1jAGOan8tvKkBnQDd6huA=; b=S
 2bI/lHjDhF6UCc2yqdxZ4gt9qqdltlo4qyaYP9CecxpblOY9MJxB4srGEgyxPus7S6y+bEaORczRN
 GPi50CG0lbAuTO2EV3ibcDe+7y9lq0XBScYxL6RGNolB+QP4QCV6rCEURwJFzWlaUQgUX7z1wTZkI
 sr8kRlHpZivn4ZOY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcBWN-005svd-Rq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 18:04:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60BF020665;
 Mon,  9 Nov 2020 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604945033;
 bh=7MrXeupL2mUTVO8G9AlyqK29v2LNBQDDZCRvTOFBG/c=;
 h=From:To:Cc:Subject:Date:From;
 b=XyCcfDuNSDjwUjO0kNX5iSdaw6uLRB2/SdCq7wmGiq/4rs+uzyDRfgGeRlOjC8jDr
 I+NXkq+2zhL044/Tl567Jo7Kzk3DxFSWiCBNgrWLaMKqluB2VoIciF/W8nxjGIEA3F
 GqA7Ljr5WXrPFcq1/1u4+iKte2SxQH04Re50IBHs=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Nov 2020 10:03:51 -0800
Message-Id: <20201109180351.2330062-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kcBWN-005svd-Rq
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: show a message when compression is
 enabled
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

This patch adds a message when formatting the disk with compression.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index b14d7359f786..03eb748170ad 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -98,6 +98,9 @@ static void f2fs_show_info()
 					f2fs_encoding2str(c.s_encoding));
 	if (c.feature & le32_to_cpu(F2FS_FEATURE_PRJQUOTA))
 		MSG(0, "Info: Enable Project quota\n");
+
+	if (c.feature & le32_to_cpu(F2FS_FEATURE_COMPRESSION))
+		MSG(0, "Info: Enable Compression\n");
 }
 
 static void add_default_options(void)
-- 
2.29.2.222.g5d2a92d10f8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
