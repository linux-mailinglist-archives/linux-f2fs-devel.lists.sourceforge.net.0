Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE21A48A65
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2025 22:24:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnlMZ-0000U6-MK;
	Thu, 27 Feb 2025 21:24:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tnlMX-0000U0-M8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Feb 2025 21:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2fzOKiFHS+s8kwWDfWBjYdUadhrIBIHLNZyoa+9Boc=; b=S4/JjevL8Yk8p9lyAD7r7HPdhI
 Ut0gnKL8kXy8QkhzCFqI2xkdsbKypSeiGnQCcXBThGeLCShvSosU4XP2Iz7CDlFcRyFvUlc1aT+v1
 gTqUH4twn/a7e6WAO3SsPj4tK00p+h+Obpj84GH/aOGaJFzDvG+TSz8JBynEg/51qQRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r2fzOKiFHS+s8kwWDfWBjYdUadhrIBIHLNZyoa+9Boc=; b=X
 bEWF03Hvz4aaRORb0e2ravHpB+ix9sRtPWMHE6stE7iJbghhLSkYGo4cJaOYIl7tZAJy1oywo0P0i
 dbBUTYCQytKXDDHRCyqMIHr5uxzsX2BqQN2VAe+TanrOlwxTnYmGEbJmEP8t9yThY9IgR+7+BLZto
 2i3I1v+lM/DepX8s=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnlMX-0006ps-FU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Feb 2025 21:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EE2361136
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Feb 2025 21:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C323C4CEDD;
 Thu, 27 Feb 2025 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740691443;
 bh=vD8RUpJ0yAedJRgQfUTf+GMBbYOFPmK1x7iiFwnW3Fg=;
 h=From:To:Cc:Subject:Date:From;
 b=ld55pj4bFuPsOkON+H2nuyZvN0PedfTwaoPB4SGghCybDpYfWimkHPVYIHe3BP17u
 DHeK+UQ+rLFEdd8ZD3CmaotrWR7EE7wZkbYft6Tn4ttVYPfkVcHWQMT45m3Vv+Vz5W
 bcsiufUXD7hA22Urm7yD+baM6ktDtKT5XPi7IR8Zfll7oyJfgrYXIwbYj3IhbNk+En
 AoyNw1owA8ZXK7Xf5m6++KMzsY+grs/n5KyIK2vplpNCZ/fuaVnWnMZ3CCClzHSAIz
 GBwW9TMSy5pJfLgu9uaBh6RCl07TdZLcCwyvjRT7KIxDyHZZ5MQ17h4lmWd2nhDtHk
 /WFdG7cWY3lsQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Feb 2025 21:24:01 +0000
Message-ID: <20250227212401.152977-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If checkpoint was disabled,
 we missed to fix the write pointers.
 Cc: <stable@vger.kernel.org> Fixes: 1015035609e4 ("f2fs: fix changing cursegs
 if recovery fails on zoned device") Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/super.c | 4 +++- 1 file ch [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnlMX-0006ps-FU
Subject: [f2fs-dev] [PATCH] f2fs: fix the missing write pointer correction
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If checkpoint was disabled, we missed to fix the write pointers.

Cc: <stable@vger.kernel.org>
Fixes: 1015035609e4 ("f2fs: fix changing cursegs if recovery fails on zoned device")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f5c69cc2de72..7a8fcc1e278c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4752,8 +4752,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_meta;
 
-	if (unlikely(is_set_ckpt_flags(sbi, CP_DISABLED_FLAG)))
+	if (unlikely(is_set_ckpt_flags(sbi, CP_DISABLED_FLAG))) {
+		skip_recovery = true;
 		goto reset_checkpoint;
+	}
 
 	/* recover fsynced data */
 	if (!test_opt(sbi, DISABLE_ROLL_FORWARD) &&
-- 
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
