Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C97AAA311
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 01:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtMAfXeq+h/kfp4nO65QBlBC51wxaZbp8cwpN5IcEzU=; b=VZhcbSLpJwg1baB6I8RwvtTz/y
	DjocdKU7e86+In/X2JinrasDY9iD69Jmznzmdy2bk2lDlxgEfJpNdtpf6lSxWgUM6BY/Cw7mpA31+
	o/v8jf911PiivG7IiLTbBq9TIJrDytLjeDtwOpMpIIqddmgKyIhD1loVSDWPIOxzoSgM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uC4vY-0007Et-Mn;
	Mon, 05 May 2025 23:08:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uC4vX-0007En-Dm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 23:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PR3WyGFJFVsyIwQaDWpWedN9tKnQ8IHJZV1Wk85HvMs=; b=aJnf9DbfUuG8XaLNJk4jRGhxJY
 osFng3huHiVDAcPAZn/4+nVOR5M82iioZfmR+HVhzoZJLinbUeFQxJ4XtBubC+IqFVD/Ux3XeXvD7
 k9rWHIOCjlXhREeXbnpUBHb24b5EQB6+xJkOnPfcBWYXncac04TDOhb9/x6MvhI49Fmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PR3WyGFJFVsyIwQaDWpWedN9tKnQ8IHJZV1Wk85HvMs=; b=TCiplS9eDZJurqOQxkzpSxoc+q
 sxpH5aYhxPhdr6Qoi/5acLGXmddumiNr61B4y57QRWM02BBd7l4hvOQ0q+37lZr6PVBTrL69DMTuq
 fiDizk2bfMcj0LDgTIEzfX+BeA5uhm0kbBPPTKZNddsUboCgeOAFRUOIS+pid8vkgGNI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uC4vH-0004JS-OG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 23:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AE465C137C;
 Mon,  5 May 2025 23:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252F1C4CEEE;
 Mon,  5 May 2025 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486501;
 bh=0uhOEJdesMZ0/FMN3zc75mJ1ev9hHoeL2W/wxepzwK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H8+DI7ZElXRFLCk8pNwP4B6SfdcXuO8ntSqY7g5kA21uo0LQtQ023mEC7s60mfY4k
 /oMv9uKQXgadf93jQZbCK3tej7CbM9ETzmToEJ4Ds0BvG9S8l9KWToU94gzonT2wPz
 E2d1rh5d+R9jqxMvhEzEXesDtEPxrQPsAIgRZNh+lN0WWRlhlLDUo8nDchAQ/eVQ/w
 XYtrVTbX+yfcf73BB1nF0l9R6xPN250MuN3iCB+MBTRNIccFICPGyoz3tCdWz0IR0R
 GZZHMpAx1hlg6bd74/UHg2+UIh2RjuIkDMKjquYfX92wtuQUS32/hbiUf49XC+xRXx
 L7YqBS72IJEQg==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 19:03:54 -0400
Message-Id: <20250505230624.2692522-62-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Sandeen <sandeen@redhat.com> [ Upstream commit
 9cca49875997a1a7e92800a828a62bacb0f577b9 ] Defer the readonly-vs-norecovery
 check until after option parsing is done so that option parsing does not
 require an active superblock for the test. Add a helpful message, while we're
 at it. Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uC4vH-0004JS-OG
Subject: [f2fs-dev] [PATCH AUTOSEL 6.1 062/212] f2fs: defer readonly check
 vs norecovery
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Eric Sandeen <sandeen@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Sandeen <sandeen@redhat.com>

[ Upstream commit 9cca49875997a1a7e92800a828a62bacb0f577b9 ]

Defer the readonly-vs-norecovery check until after option parsing is done
so that option parsing does not require an active superblock for the test.
Add a helpful message, while we're at it.

(I think could be moved back into parsing after we switch to the new mount
API if desired, as the fs context will have RO state available.)

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 72160b906f4b3..0802357d45256 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -745,10 +745,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, DISABLE_ROLL_FORWARD);
 			break;
 		case Opt_norecovery:
-			/* this option mounts f2fs with ro */
+			/* requires ro mount, checked in f2fs_default_check */
 			set_opt(sbi, NORECOVERY);
-			if (!f2fs_readonly(sb))
-				return -EINVAL;
 			break;
 		case Opt_discard:
 			if (!f2fs_hw_support_discard(sbi)) {
@@ -1404,6 +1402,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
 	}
+
+	if (test_opt(sbi, NORECOVERY) && !f2fs_readonly(sbi->sb)) {
+		f2fs_err(sbi, "norecovery requires readonly mount");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
