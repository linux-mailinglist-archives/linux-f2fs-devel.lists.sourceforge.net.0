Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E21383F2A56
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 12:53:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH29i-0006dX-Hn; Fri, 20 Aug 2021 10:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mH29g-0006dF-VE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsgW3LjjnP2JtziuExU4D244ugffHqUoiADxkMxck5Q=; b=jTDUzKKTZ0XGoR5e3soFpIY5lO
 pwtJszQkgHBPScARQHgHc5ieeuLZ93ON+FvdQUlfPGSu/3wB2D36akUSC2Yxd19KGy5W2WoT6uXet
 myGTlr9N17VFpSgmYzgEx2vvAYjCyYny29/peBe1RLJp3sDqoXBfYR5G2+mwLav0PC/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EsgW3LjjnP2JtziuExU4D244ugffHqUoiADxkMxck5Q=; b=T
 vMCX1QRSngNEf/bioZKjbHQKoOS73S4+sTNXkF16o/0qvyUFEayKGasoB5Hm+XRWjaeBodojsLXs+
 +8XfvcQae70YvqmXe081XPIoW+AMV9Ox+94KZIAl/aPK9ERvPXdhnyJSqppehry/vx7K3IMXygU4u
 RriQ8CpAPi8RxQsQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH29f-0004ey-TU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 10:53:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A39F260C3E;
 Fri, 20 Aug 2021 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629456813;
 bh=VlCFJfF9lFTl1dJuE2e2uzICbbzwsCfyLaRHpi2W6t8=;
 h=From:To:Cc:Subject:Date:From;
 b=gvp5NIvIFYC2SgsUYcZNqtZTxTaEyKvRmu0ajo8wMC0m8WN9i5Tb6uj1/56KHNqqE
 ijWpxW2ag+TjgaB7odO+jfkzh/qGdrQicsf/Mdsw1i2TGToRA7iw+z0KXnwr1sxgkL
 05nJvsqnPJheC7AT2FzJX9lkwJgeRvULo3tjlLIJtFndvpKBhExtaks2rRFpb4dtjv
 76VCvqvCgx+EAN8ZUV0DtTRqvN0sSGArbVnhBHBtJAQtNqgVcnQBGRCIs139eoeGhH
 JtYbgBrXFk6uiPDzNAtHXM7HmmbsDaWLRd/XcfNM1Lej0xRkCG6Wbx6sURiWQgutAM
 r7IrDPP5OT+QA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 20 Aug 2021 18:53:26 +0800
Message-Id: <20210820105326.26922-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mH29f-0004ey-TU
Subject: [f2fs-dev] [PATCH] f2fs: enable realtime discard iff device
 supports discard
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's only enable realtime discard if and only if device supports
discard functionality.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f92c582f8008..597e5dbc2f6d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -660,10 +660,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return -EINVAL;
 			break;
 		case Opt_discard:
+			if (!f2fs_hw_support_discard(sbi)) {
+				f2fs_warn(sbi, "device does not support discard");
+				return -EINVAL;
+			}
 			set_opt(sbi, DISCARD);
 			break;
 		case Opt_nodiscard:
-			if (f2fs_sb_has_blkzoned(sbi)) {
+			if (f2fs_hw_should_discard(sbi)) {
 				f2fs_warn(sbi, "discard is required for zoned block devices");
 				return -EINVAL;
 			}
@@ -1999,7 +2003,8 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).unusable_cap = 0;
 	sbi->sb->s_flags |= SB_LAZYTIME;
 	set_opt(sbi, FLUSH_MERGE);
-	set_opt(sbi, DISCARD);
+	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
+		set_opt(sbi, DISCARD);
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
 		F2FS_OPTION(sbi).discard_unit = DISCARD_UNIT_SECTION;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
