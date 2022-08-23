Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C059E8E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Aug 2022 19:21:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQXay-0002XO-Mq;
	Tue, 23 Aug 2022 17:21:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oQXax-0002XI-3C
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 17:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+G/W6wKwL9nqvpUVLi3LOjfZgUmzwG6cJE2uTMxSsE=; b=bPCsuavQlU+f4Ep1LTfpe9M3+y
 yY6t8CXWuKOBHM3+D66aS6zK1cF3HjCYQKu4geNPG2ZSESxu7RL2U+ESsu/td5zqhbq/7gb0hRAJQ
 uf/ZB0TD1eaTPPvTP5KqIgJjwzLN1tJfA9E0j6mCKXYTib2pTqRrs5mquzY42SNSKWDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7+G/W6wKwL9nqvpUVLi3LOjfZgUmzwG6cJE2uTMxSsE=; b=g
 swCh1lU+22Eg78OyYCQPg8d5YPDDcOjoarpmwEdC+SreRzPgGqzC8tjiBzUVI3f/61KtS77vw8JuR
 3xTYZAd/xpsAmF/fGs8eNolR3/HLEHn3UhRy3+sSYRkdeZ6vT8T2uPZubYBS5ZSxXWdMY73hYF4FX
 WTzHMZ1NovsAoEPQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQXar-0007Sq-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 17:21:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D97460AB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Aug 2022 17:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE5CC433D6;
 Tue, 23 Aug 2022 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661275285;
 bh=VFjOTpxcrlmUZh1BhEihfLloefvGcxdpOSpJmXk5h8w=;
 h=From:To:Cc:Subject:Date:From;
 b=t7e8xYLgOmpiiL+/dcP30jhAvGFS9d3MQgitnDKU+zt6hy/sVXhizXHNG7H7RbWlO
 mo+xwaLU3LfGVBWTDd6usavm9GCd0+igMvUYkEQIf31qITwwQLiELcfYBhAS/ZXd6n
 6I0XiGcnhnS5mm0pnCslR8kchFu1RlOQQuA0URaf8uyN/qKrdAvluc2lVE39+0weLL
 GUEN/O4SnRmZW+2GVE1txTiFDz+vKvMzK4z6ljkwXv71/GVajvofGPGjhkhFx3WbVh
 8F03DYCLp8ZMlpyMkUpJc1BYTr5i9NjWey+YqSz1TgeMbtjA26ooWbbyOzaD/IkWIO
 AM7yeVTNTLUDQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 23 Aug 2022 10:21:24 -0700
Message-Id: <20220823172124.2285995-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch increases the threshold that limits the reserved
 root space from 0.2% to 12.5% by using simple shift operation. Typically
 Android sets 128MB, but if the storage capacity is 32GB, 0.2% which is around
 64MB becomes too small. Let's relax it. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQXar-0007Sq-Uh
Subject: [f2fs-dev] [PATCH] f2fs: increase the limit for reserve_root
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

This patch increases the threshold that limits the reserved root space from 0.2%
to 12.5% by using simple shift operation.

Typically Android sets 128MB, but if the storage capacity is 32GB, 0.2% which is
around 64MB becomes too small. Let's relax it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 09972b709cdd..d1b4de5b4083 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -301,10 +301,10 @@ static void f2fs_destroy_casefold_cache(void) { }
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
-	block_t limit = min((sbi->user_block_count << 1) / 1000,
+	block_t limit = min((sbi->user_block_count >> 3),
 			sbi->user_block_count - sbi->reserved_blocks);
 
-	/* limit is 0.2% */
+	/* limit is 12.5% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
 			F2FS_OPTION(sbi).root_reserved_blocks > limit) {
 		F2FS_OPTION(sbi).root_reserved_blocks = limit;
-- 
2.37.1.595.g718a3a8f04-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
