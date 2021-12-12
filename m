Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF88471A9F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 15:18:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwPga-0005Wg-D7; Sun, 12 Dec 2021 14:18:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwPgY-0005WS-TG
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 14:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fidVhJQdapbiDfvWP43kZXzc/UujF2rWNbOlDdwWOq4=; b=FaJFp2bdUBihVk6DtIof5dR/Uz
 l8X0wmbpPRuo4ZZZbnsAD/GLc9toqp0aiLsCo4mCrllLe6uObwEBNYyuoigKF+UW8wUP9T+KNBlqg
 h03XLWxbjUdUC+/2m1dq77QualpLZZl5wII1ybpo6WkkBOqwvLtQiMZb14+IEGm61N1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fidVhJQdapbiDfvWP43kZXzc/UujF2rWNbOlDdwWOq4=; b=h
 DRuImbUPAgjhuqMWqzon3tzlh3qrvHpnaBG64A35DBLGQ8VX1EvcmfaDxaufrVCT0okbzBk1sMuam
 JNwECxMsgdZlYj46nMZ+Nq9XNhM6tahabz2p01qTABDKH/0ehBA2/AAz+rjsLmbW8vgpMZObzeKTr
 jwtIhXYGd+bAV/Iw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwPgZ-0003gf-9c
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 14:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B0CDDCE0B15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 14:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DCBC341C5;
 Sun, 12 Dec 2021 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639318704;
 bh=vHEegeDN9TpY8LC9UjSd5Q4VU5L1v3FFcVMkQUhz5GY=;
 h=From:To:Cc:Subject:Date:From;
 b=XGa5on+6YdNFNzaaHutU0uuyWlXPFgLnNy7jqbO1oUQ0qxq3Lrc23bp74KK7YQtgT
 mXpUFlII5HS1Abzr7X1rilgObnVSm/huRH5d2pPi6w4CUH2UplIZzZep/INJs8SNpU
 1P+Ym8qzGt1HvHNE2iqp7mTM4D1sJJn+jPhWnqDCuYjP1L+MQ1waAnsGIxjeXogy93
 lmXp2v0HNFsJkcQ2e4GlUrwuOTNndhcMrmX2x+Su/RQQ70/O4Cz4aiExmOPSQ+x77N
 IvGfMa7gVFHY/jgodZbahXN8mXOpjTcfI6eNxdaC3bPUjLgM2YHqZA87xcyYN5S11c
 XgTNpqCdVrgQg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 12 Dec 2021 20:28:12 +0800
Message-Id: <20211212122812.8132-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise, nat_bit area may be persisted across boundary of
 CP area during nat_bit rebuilding. Fixes: 94c821fb286b ("f2fs: rebuild
 nat_bits
 during umount") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/checkpoint.c
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwPgZ-0003gf-9c
Subject: [f2fs-dev] [PATCH] f2fs: fix to check available space of CP area
 correctly in update_ckpt_flags()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, nat_bit area may be persisted across boundary of CP area during
nat_bit rebuilding.

Fixes: 94c821fb286b ("f2fs: rebuild nat_bits during umount")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f1693d45bb78..2011e9742443 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1302,8 +1302,8 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	unsigned long flags;
 
 	if (cpc->reason & CP_UMOUNT) {
-		if (le32_to_cpu(ckpt->cp_pack_total_block_count) >
-			sbi->blocks_per_seg - NM_I(sbi)->nat_bits_blocks) {
+		if (le32_to_cpu(ckpt->cp_pack_total_block_count) +
+			NM_I(sbi)->nat_bits_blocks > sbi->blocks_per_seg) {
 			clear_ckpt_flags(sbi, CP_NAT_BITS_FLAG);
 			f2fs_notice(sbi, "Disable nat_bits due to no space");
 		} else if (!is_set_ckpt_flags(sbi, CP_NAT_BITS_FLAG) &&
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
