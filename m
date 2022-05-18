Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087D52C1AC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 19:56:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrNty-0008A1-VC; Wed, 18 May 2022 17:56:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nrNty-00089n-42
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVJXAKA7VBhK+EcjKRR7FWyndn69CCDS4Mjg0hgrlVc=; b=YFSBR53qy8dpSjgKdzWlVpBJ0e
 +6bScauGmqvqJd1zzI/UzGzz+DrBWQWKsH9zgxQJf2m6R//J5X4ycibFiAo+eMf4o4Gdk6smGWvP/
 aR81OhJJFsjA7/jXL+ti1DVt1zKtilv/pLM5Ml/1NypnYbdjL/FKjjkQU370xyDydaEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UVJXAKA7VBhK+EcjKRR7FWyndn69CCDS4Mjg0hgrlVc=; b=C
 TQL3Etr9TFctwqjapc4Pe++EY0EzcOhvii25NUafgiA8ijs8wuw8t3QTE04nHwvOo0oZvOKPYGa12
 dWTuQtZec5aF50eR2tR6FYvhbwf+lGT/y7iedn4soIJvZTNYy260yTS1OIjQkCCuwKPzDaDfdtlIN
 OftPTWV+vdVY9G6c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrNtw-007DZ5-CT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 17:56:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 361D261825
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 May 2022 17:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB88C385A5;
 Wed, 18 May 2022 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652896549;
 bh=HBYXEZNCYGiDeETVCOvO+Gk69oq/4MZUE9rOXOS97fk=;
 h=From:To:Cc:Subject:Date:From;
 b=ZqmcwOBnYweBt/zdVLG+N3QXD/Fj4An0JfumB8lIO7aj4FlQyywbVfZrAngMtHLsH
 4nI50PPFXnxPGqmcKBYOJ7aM9nUuYSmAh4Arq3cq+JzNOJ0qxf7oJWKS9v6d7fcRm3
 WzB/Pqy6AmNOKUUMigcWrh5wGehwNKzF7o3+XD+jGswLhWbOcJXby/HIGybirIHdtQ
 5Bvu+QsFWqCZuuHXmOab137O1yJwXLY+PhJCwrsUXeoQ0WlXjwewdNYesXbfLnuEVN
 yKn8/969Md7M3Ew45hAfKvZXkgiod+9DofJ9ANyHVPjhpjoJmrtTjkb3zhuffxfVZr
 qq3ywZcGNKHoQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 May 2022 10:55:47 -0700
Message-Id: <20220518175547.3284875-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's decompress data under the same context to avoid
 workqueue
 delay. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c
 | 4 +++- 1 file changed, 3 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 54a7a8ad994d..37aa7ac5d463 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -285, 10 +285,
 12 @@ static void f2fs_read_end_io(struct bio *bio) retur [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrNtw-007DZ5-CT
Subject: [f2fs-dev] [PATCH] f2fs: decompress data without workqueue
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

Let's decompress data under the same context to avoid workqueue delay.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54a7a8ad994d..37aa7ac5d463 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -285,10 +285,12 @@ static void f2fs_read_end_io(struct bio *bio)
 		return;
 	}
 
-	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
+	if (ctx && (ctx->enabled_steps & STEP_DECRYPT)) {
 		INIT_WORK(&ctx->work, f2fs_post_read_work);
 		queue_work(ctx->sbi->post_read_wq, &ctx->work);
 	} else {
+		if (ctx && (ctx->enabled_steps & STEP_DECOMPRESS))
+			f2fs_handle_step_decompress(ctx);
 		f2fs_verify_and_finish_bio(bio);
 	}
 }
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
