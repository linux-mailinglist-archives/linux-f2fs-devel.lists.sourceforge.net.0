Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98759AAA267
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 00:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDJ3739p0bG/OkTCYAmpsA0VGxg06L2wFv8T9uY/Pew=; b=Xi7yTjAPaxg37kDQ/v5wyM6dNF
	eX5cD+3u/lbN/PNZLaI2m4sDYUKoOiwhnisclDBnP97n0wayy524llgdsKbcOW1I4EjmLjmKA5omC
	RbASfqbu3GEJRgmXhga1dDIhW5Jne450LUBd99sMOlfgpdYTiXnW2SJVeUFzdq2BFfmk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uC4mc-00072m-Lx;
	Mon, 05 May 2025 22:59:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1uC4mb-00072f-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 22:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9jBOtZCzam5EZiNa+8+t1gdnTSiYAZurpmEGAsZ7I0=; b=Tx+1Y0b8bVfBiKiMkV5vUszzVT
 Hq5nbzsk0pc5bARv7y/BzOcQwtzn7RoRFb9nCWWOT8L0RZqAcYkYAukzV+d+eurjuGBuyzmOuREAs
 HJYUr9u7ynctG0VHASUQ9bNJQOzTO14jiIcWDxqPvn3OsVZXVeX9zykl5gxv7luFSC2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O9jBOtZCzam5EZiNa+8+t1gdnTSiYAZurpmEGAsZ7I0=; b=LjC1EWmDbWFHpvgD0wdMqoYGoU
 yrRyrWODjCm8qz05pov0B7qNFDwYqn84OtkeiA9j53sS24GbGFtUYBAeS6kAM3LdyA+FV8HqNo+Wc
 XH/abisQHALqOBXQLKLQLPsdyrBeSmJFkTxaQj72pJQZ6RFyV9PNY8WaWwYOKkoTNTaE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uC4mL-0003pR-7G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 22:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 80AD1629D3;
 Mon,  5 May 2025 22:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414B4C4CEEF;
 Mon,  5 May 2025 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485946;
 bh=n9hhTDj40JpZ/5hfqIn73ebJDLsxbovJ/7hGyXWzv98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HIGHN36Ai/Iykp/fsGls38r+aIoW/4gOkMoJxMwFT0xIoTYfFwh1hUsxA8/PwAclw
 U2F4vSaiTyYrgIAvZHv2nyuV0t/uajUqXzqshkgtCSRBzIsmUTDsiT+GzKqS9p/4sE
 XVq9ugGXR9UVuUwv5IRmsJ98Ftqw9pxfa5BX4MQxlu66eHzaPJrOR/bHIMd8RKGOJE
 VL3BrYdWqKhBLeL7hCKtPiC+KMCQj1YKUzlnIMHNg4hCaKWqyfnzeVA4xtZFOkrHrB
 Dw2umkeJMo3nj3zgjR8rouwx8vdfajNeijeMQOIWog9qfzelpIgXufd98fkXOb4r+L
 vEdvyFiefZK0g==
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 18:52:58 -0400
Message-Id: <20250505225634.2688578-78-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Sandeen <sandeen@redhat.com> [ Upstream commit
 9cca49875997a1a7e92800a828a62bacb0f577b9 ] Defer the readonly-vs-norecovery
 check until after option parsing is done so that option parsing does not
 require an active superblock for the test. Add a helpful message, while we're
 at it. Content analysis details:   (-0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uC4mL-0003pR-7G
Subject: [f2fs-dev] [PATCH AUTOSEL 6.6 078/294] f2fs: defer readonly check
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
index 4cc87921aac3e..10e50bede8080 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -707,10 +707,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
@@ -1390,6 +1388,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
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
