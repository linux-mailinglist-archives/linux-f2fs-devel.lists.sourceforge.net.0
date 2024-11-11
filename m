Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CB9C36D8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2024 04:05:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tAKjk-0003Nq-Q0;
	Mon, 11 Nov 2024 03:05:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tAKji-0003Nb-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 03:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u7UX/izpOmCFAWFDMF8tJFgep5mM0uBjrtDEVZtPIRY=; b=hZRSxkVZwDe95W5IKR9Uql8iG7
 0acVxMJK9mUNcb3glLkibedERM13s296A+cWKHO6U73hkhRtc+r9GsEvm/e0Xe+DEEM+EW+0NYrqF
 ltYu0ZL+pYMrnXDnMxwNFuCTyfzEzQHtXGyRRCyiLYclKInfRdHRLEqO9yiVXT+5AMww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u7UX/izpOmCFAWFDMF8tJFgep5mM0uBjrtDEVZtPIRY=; b=Y
 eqpCioV4u6DYyU7jo1JhUhFFVf0dlTaRB0Y8mZ00fVWEj0alySvb3Cw4Rukqh5FmyYa7Yyua3lfXC
 S9EdUK0LQW9Ai1AJdLZ9hMbDCpGi1zMZ0AySVhN3t6f+nREhQ/nT641FspyHdSdEKf4JZwuVxO0za
 VARRwrJYN3fL+r48=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tAKji-0004Se-6Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 03:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 666055C56D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Nov 2024 03:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79495C4CECD;
 Mon, 11 Nov 2024 03:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731294300;
 bh=AWpyNMW1dieaheGEiGBKpMuE3jX/0v5RuFtwBBIpGKY=;
 h=From:To:Cc:Subject:Date:From;
 b=S6nzSunsDRvi04UmX5HBYR8HXp72cguc2pjKV9XDqfoaCqK56JRVvEVKnwEKAfKlo
 Mw4/ms7Vhs/Lr2xEBAK+WzBGDVFTDH3lAZgzxw8LFBCSTpdZJMpg1A7Kfs1m9xIoRI
 PSCwZ7sMKAf+bG/j+JBtbGygzFoOQeEc0E0sfUVNW7F+IrwwOnzCenYax+Rp4CLfvd
 Q4f6aosDsJjqE1ywnlAGPtdzlSMLplvP5Aqnqfnf3I6TelN9kRp2e2AE2JHIMnAV60
 gMA3KFIswKv8qayiL6ohnSF976JjzIc19AvClvLsKo5bkyqojtCmCssuuZwbAfA9D7
 YZJkMGThRm6XA==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Nov 2024 03:04:56 +0000
Message-ID: <20241111030456.2572093-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The immutable bit disallows selinux permission which gives
 no way to clear it. Fixes: 8cc4e257ec20 ("mkfs.f2fs: add device aliasing
 feature") Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 mkfs/f2fs_format.c
 | 3 +-- 1 file changed, 1 insertion(+), 2 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tAKji-0004Se-6Z
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: remove IMMUTABLE bit
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The immutable bit disallows selinux permission which gives no way to clear it.

Fixes: 8cc4e257ec20 ("mkfs.f2fs: add device aliasing feature")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 52a1e1864b29..6635eed99813 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1748,8 +1748,7 @@ static int f2fs_write_alias_inodes(void)
 		dev_off++;
 		f2fs_init_inode(sb, raw_node, ino, mkfs_time, 0x81c0);
 
-		raw_node->i.i_flags = cpu_to_le32(F2FS_IMMUTABLE_FL |
-				F2FS_DEVICE_ALIAS_FL);
+		raw_node->i.i_flags = cpu_to_le32(F2FS_DEVICE_ALIAS_FL);
 		raw_node->i.i_inline = F2FS_PIN_FILE;
 		raw_node->i.i_pino = sb->root_ino;
 		filename = c.devices[i].alias_filename;
-- 
2.47.0.277.g8800431eea-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
