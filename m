Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB8C883A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 07:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1YA+n2tAEtBk7Mx3EBSFlcI+pwPkI+MkIU+34W/S8+M=; b=fiFcjE+F4DAXs0gfcmnwMQ9Kbm
	lBix+jOtH1L/eTebW1wZbqFJ+BWDlUha7LshqOQCIO6Kx7KTBif/gs+G3HoSH/xwn0FHu/8YomVrc
	tEVns+kEbbNTtKewbKaTV+qT1PWLxOgIQHcG03ASHQjF0Cao3UgJ1Ej/PrELoaf0iE7w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO8o1-0001DR-8c;
	Wed, 26 Nov 2025 06:15:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vO8nu-0001DG-CG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 06:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v3FPaqoPoZNxKkUKOVeaW+1034bm9ICj8RsB5BrOoD0=; b=XhmviXt9M+KlwW6hV9xFZL5bi6
 cyUIKZDKs+kcMxvg4TZJZE81mwUa98xvLcO8UFBMa+gSp161fhUt/Q0uwYYHn6dKUw6SSP2OCiaLb
 D8w9kyTXaDEOo1rK7TXpYxzq2WLensbV1Bp2rl4Y2wx5YxkbxeHmq5ZzLETpGnkpWCGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v3FPaqoPoZNxKkUKOVeaW+1034bm9ICj8RsB5BrOoD0=; b=T
 vgO2zSjfk3zWQuruGJKOaDIcjRfyV94ME/JJRiJbtGtWFgtuG/zbPvmX5k5TGPXzig0fsBZtQYrHr
 hye/I5sBWBgb/OBvgno62G6W1ys9cSs0tgp3WfeDsUZKwBbTvPwY6kEFnN15wfxVa5jM2pLjWoDi4
 tCOt9Hf4+zsANhTo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vO8nu-0006Dn-KG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 06:15:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E92C360017
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Nov 2025 06:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03023C113D0;
 Wed, 26 Nov 2025 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764137691;
 bh=xWH1HsevfA3c1s1qZoSEd9QG2VYtkDD8havo9G9tmwE=;
 h=From:To:Cc:Subject:Date:From;
 b=QQvNKHZyJ5piXVmK2DFKMaUXm1vc7MzZufot7TnlciRTbKuuKJDqXfbHiRQbwCq/G
 XbDxxNI2HHRTPBS3OLx0m9JxQOsNudp9r9RfBE0vJ2IzUaV6Y3KBC4wrz8lGHy8tvs
 tzHPQgQ3ZCRqo68omReACU+UpCGOd36Mu3FzY6FECxZW0FX4ntuxyISGPpwm+nLQz8
 6RLfyuVUNOmViTVsDD95wqJ221i6M+nsahF5AyxK1msCF8kLrfUE+O5dDaO88zI1jk
 LLKsgCfj2J6282FrTrdIgAiXFRP3pr9I6S8QdcAJWmQk8y7QpPSdJ+TZwG/Xz277mg
 /+UtGYL+kEofg==
To: jaegeuk@kernel.org
Date: Wed, 26 Nov 2025 14:14:37 +0800
Message-ID: <20251126061437.658896-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, __blkdev_issue_discard() will always returned
 valid bio, after commit e8b4869bc78d ("block: add a blk_alloc_discard_bio
 helper"), it can return bio w/ NULL value, which may trigger panic o [...]
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vO8nu-0006Dn-KG
Subject: [f2fs-dev] [PATCH] f2fs: fix to check bio after
 __blkdev_issue_discard()
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, __blkdev_issue_discard() will always returned valid bio,
after commit e8b4869bc78d ("block: add a blk_alloc_discard_bio helper"),
it can return bio w/ NULL value, which may trigger panic or warning
in __submit_discard_cmd(), let's fix to check bio instread of return
value after __blkdev_issue_discard().

Cc: stable@kernel.org
Fixes: e8b4869bc78d ("block: add a blk_alloc_discard_bio helper")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8375dca7ed9e..44c0cefbb5a9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1351,7 +1351,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 					SECTOR_FROM_BLOCK(len),
 					GFP_NOFS, &bio);
 		}
-		if (err) {
+		if (err || bio == NULL) {
 			spin_lock_irqsave(&dc->lock, flags);
 			if (dc->state == D_PARTIAL)
 				dc->state = D_SUBMIT;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
