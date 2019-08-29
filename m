Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FCA214B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 18:50:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3Ncp-00052j-1N; Thu, 29 Aug 2019 16:50:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i3Nco-00052Y-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 16:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f02ixKEChl3x81FOxNAZoItbCFgRRC7o0n5cnyxWNsM=; b=moddwmd8QsPWJz27BfjxZCtbsN
 6gdH6JpyY5jG5POT4qvA2Fi5gR6LVeaZMZXOh+cfL607wQQovSe2oy4zDoQhJTeqmkPPQaWXGkmZk
 kFBV6nAOdUHli2BFk08/9I1CW6AL8gG7/NK2x/keCzIKwgW8NEJpqM/sKUzYQtwS1zX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f02ixKEChl3x81FOxNAZoItbCFgRRC7o0n5cnyxWNsM=; b=P
 jXc5XOw3uzdvYBPqd4PV3WQvKjhrcSlqQH1Xusm+suy91tKc0C12qDgIXOG0FQszUuiRhMjciaIwu
 EuBeaELrrjsr0H4GCT6AWWSE7e65RQ/EzRypbSo7PaXyIdg+Ve9p1DYZliK7n6T7zvABOg93WHS15
 HdIbHXQNnXAalyLQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3Ncn-00341a-5a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 16:50:18 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBAC9208CB;
 Thu, 29 Aug 2019 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567097409;
 bh=Hslj8UGkEo+uEL+vuwTBz4V9Schqb3dk989zc+CeNYE=;
 h=From:To:Cc:Subject:Date:From;
 b=BWIBnFoCvnav1ZFWTSGjiXYAqgdO6IavKgAGKHeWQ68Cc1JGSC2R8HG/ChKL+FbEq
 q+SP4H7f3RZ/XFAQedch6EeKn8vQf3q/We5z94rbTYMiOKvPzYwsaDNHQyJRVx6qyf
 Z1jhCqpYdPUGisEw3PHHzp6C+/zAWX590OKClHR4=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Aug 2019 09:50:08 -0700
Message-Id: <20190829165008.71226-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
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
X-Headers-End: 1i3Ncn-00341a-5a
Subject: [f2fs-dev] [PATCH] f2fs: fix flushing node pages when checkpoint is
 disabled
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

This patch fixes skipping node page writes when checkpoint is disabled.
In this period, we can't rely on checkpoint to flush node pages.

Fixes: fd8c8caf7e7c ("f2fs: let checkpoint flush dnode page of regular")
Fixes: 4354994f097d ("f2fs: checkpoint disabling")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e5044eec8097..8b66bc4c004b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1524,7 +1524,8 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
 
-	if (wbc->sync_mode == WB_SYNC_NONE &&
+	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
+			wbc->sync_mode == WB_SYNC_NONE &&
 			IS_DNODE(page) && is_cold_node(page))
 		goto redirty_out;
 
@@ -1909,7 +1910,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 	}
 
 	if (step < 2) {
-		if (wbc->sync_mode == WB_SYNC_NONE && step == 1)
+		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
+				wbc->sync_mode == WB_SYNC_NONE && step == 1)
 			goto out;
 		step++;
 		goto next_step;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
