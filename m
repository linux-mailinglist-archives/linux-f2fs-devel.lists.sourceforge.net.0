Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA731A7BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Feb 2021 23:34:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lAh0c-0006q6-EK; Fri, 12 Feb 2021 22:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lAh0b-0006pz-Cd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Feb 2021 22:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QcNFNrFbEBWBhSBFM0Vkguq1AuFyie7eyNXMcuoiCtA=; b=d+njBv8n2PiSmefyO2QNy6u1FN
 w3jAPN93TtgHrJ+h+BRj0sMjwH4f9Dj2IBZPPKJ82QCqwJVQLTR3lwdV0Fsty4tx268gq/iSU6i0y
 J2pkuZoQ2y1ZvYsq+fWNUCUlCm22JZWK5ugAlRo1NnO1ZAMw6i2uoSDyucwLmZkTDJgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QcNFNrFbEBWBhSBFM0Vkguq1AuFyie7eyNXMcuoiCtA=; b=C
 W/VeALoz/SkQtRPtW3OgtemmobZNzW32iNF9MyRDyusiByjIxzeSqA/YtKeOjZ4oELjtfzpxEu/pK
 YT8yvpNN0KNIrD5NFsSnJSleHiFYUPlVklTQjEGQl6CqaP7PQ+2wWgCE7i9vvB8zCKJ4W7tqYdWEl
 8raObVOopOrDPAZs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lAh0X-006kle-4n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Feb 2021 22:33:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A406864DA1;
 Fri, 12 Feb 2021 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613169218;
 bh=zPLaLMvsfWolU7A16h5AwBVtaAqZZp8VsJK9aSEF+Oc=;
 h=From:To:Cc:Subject:Date:From;
 b=bz6gNxSjE+LWAL4HXxQHIymg3n3+zD6JqskLilyqGZ5jqrCqJZvHk9NWo0CNc7huw
 yKpW+I6iavEVqoSSgOO3TiJnXPmvDzNZC4MszJTW1VdhgewpuLure/rWoZMD1BSCA9
 Xott4J6YPohZZYrMGQEKQ5mm3UL5MKefqqGxP/Xc4V44YkLR7xzEgq/u8zZeVTLA7G
 5M4ApIfpA4FWYB4dXI+uQKsKUhTG6I4EGJ7QfT04sQbYUtlFCaMmWeLFALRgEqqbwm
 6nGWGwp8O/FWZ7mK0Dm4b6x4rmjpUfcbR2OKdlVqHJAELOTQh49C9qBxgZEgn+56XC
 OTw1KVO6nD28g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 12 Feb 2021 14:33:34 -0800
Message-Id: <20210212223334.3550799-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lAh0X-006kle-4n
Subject: [f2fs-dev] [PATCH] f2fs: give a warning only for readonly partition
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

Let's allow mounting readonly partition. We're able to recovery later once we
have it as read-write back.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4aa533cb4340..30d5abef4361 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3933,12 +3933,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		 * previous checkpoint was not done by clean system shutdown.
 		 */
 		if (f2fs_hw_is_readonly(sbi)) {
-			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
-				err = -EROFS;
+			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
 				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
-				goto free_meta;
-			}
-			f2fs_info(sbi, "write access unavailable, skipping recovery");
+			else
+				f2fs_info(sbi, "write access unavailable, skipping recovery");
 			goto reset_checkpoint;
 		}
 
-- 
2.30.0.478.g8a0d178c01-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
