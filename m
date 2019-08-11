Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8C89483
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwvWj-0003BX-72; Sun, 11 Aug 2019 21:37:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hwvWi-0003Az-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z13UzqbwtJ2vVFOjFzYgV70348yUQTF8/VvsoIjIq8Q=; b=cyXwM7IU1L0CKNUOPIN1beoflv
 X9G8H2TWVJYapVmpxwhmSeOgsrqqQXqHYRHYwBG6fP8rJm0qOqWVWDJ6EDnCiZEXjRvds3iGWojcg
 L4XKFjOpuZUAnZVMygh0SHmcxMc4yQfDvrMTOnMtaXuMArKEH/frls52mj4jNTdP1kIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z13UzqbwtJ2vVFOjFzYgV70348yUQTF8/VvsoIjIq8Q=; b=gENA9sPBae/D3/mwLK0iXb0b8D
 8H5RRKC1Yj9u1mdHK7hbzMW9J72dEYCdqZA+74rQNzQL2J7idZkXt58G/wBphh4FrOVWVk8cS4+C3
 xneqCVRHOEzH7tASI7yui/9rklLE7cAPfhn7cE3XPHeLVeL3e/Bpgp9kgBAPaSR9Shu8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwvWg-000YlE-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:20 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 310002147A;
 Sun, 11 Aug 2019 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565559433;
 bh=ogxEiq2FStmpdB1nMQQucSgGithBLja/oR9v2LpPzGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JjKGV8U4TfrNl4xq3zOAIX0wqsItLHGRMeqlb7G26JeK1ekkCb5ZB/ha1mvjDNMcH
 XGaJvYtNHn86tLponsPBakMNcE54w4kLU0WParAktwp5L6K7uRVuj1lmDmqq9kD2Q3
 08W5HT7MXYRs0lrzhllxVQFpqPLuJnTkXGB8OKyI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 11 Aug 2019 14:35:55 -0700
Message-Id: <20190811213557.1970-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
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
X-Headers-End: 1hwvWg-000YlE-Qz
Subject: [f2fs-dev] [PATCH 4/6] ext4: remove ext4_bio_encrypted()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

ext4_bio_encrypted() is unused following commit 4e47a0d40dac
("ext4: add fs-verity read support"), so remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/readpage.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index ec8aeab3af65a..a30b203fa461c 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -52,15 +52,6 @@
 static struct kmem_cache *bio_post_read_ctx_cache;
 static mempool_t *bio_post_read_ctx_pool;
 
-static inline bool ext4_bio_encrypted(struct bio *bio)
-{
-#ifdef CONFIG_FS_ENCRYPTION
-	return unlikely(bio->bi_private != NULL);
-#else
-	return false;
-#endif
-}
-
 /* postprocessing steps for read bios */
 enum bio_post_read_step {
 	STEP_INITIAL = 0,
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
