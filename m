Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D9875CEA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Mar 2024 04:51:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1riRGX-0000Ez-K5;
	Fri, 08 Mar 2024 03:51:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1riRGW-0000El-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 03:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RCJRMWlT35Mzc55dp61CYAOdjNHtFe/PtRJMy98LASw=; b=JpN6B0kUBcu+DSPEzwQoFtQtm5
 72P/hUkTveJnAP4IneSda56326RKdySnH69E1o8uhmyCjLalfAgDI4wYLQU+yEjB4cxzjdTT3YTr0
 yHA2GgkJJCV3atOtNAnpgq9nkTCcJve0BpA7z7D+XknYXghocZ7BGj5p43e5i1kdHTFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RCJRMWlT35Mzc55dp61CYAOdjNHtFe/PtRJMy98LASw=; b=V
 dxVQ5XEGakxekpG0ywVysLmaDL/sQhoRetnWyzCRHnkpnKKaSAmuPFb4IlcapStO1EvcqnF9uso17
 2bCWuPlatza5Lkv92m9gLbj8C6rvwcrHInPZkPR114ZLeyYML2XDsFIeeDOtAGxLlgoe0iU2+vdZL
 cybl2wwlG9+p/CGg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1riRGQ-0005jX-Cp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Mar 2024 03:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03D9F6119A;
 Fri,  8 Mar 2024 03:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B8DC433F1;
 Fri,  8 Mar 2024 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709869873;
 bh=L+U3YTJaKWjFVJqwd79Dx/KrkVoS6k2lA1363JvtMf4=;
 h=From:To:Cc:Subject:Date:From;
 b=pYSe037MGJ18WUss5lY6ExOhP7hT5uqZ4h2ePbprihz92o+JWRwu3szl8/dcJliEP
 0lqdBHwL0Z7dcsVhcNL2Cb6Mmth3xBtPIXmm23nkC51S3JHWDmEBiuNWyGroT/257F
 dfTIG7Xv5t0+nvJ8WjtlHU+JpdNnNvVQSog+Y7376p4U0BWhbSHNjo6PwXI61LR6Zl
 hp5I8uz64gCYrBvNHGDLj/6KDbaiHq0qNzJGAEvOWhtJggDeL9Ns7LQ65KmysxAVHt
 gv1b+K4/rslUOM62uWJZgCWYbyBBqas0DN1fscAWhYzJUd6AEn+k/jmxr9/97D6MJX
 9LFj2L3lij4iA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  8 Mar 2024 11:50:57 +0800
Message-Id: <20240308035057.62660-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 2e2c6e9b72ce ("f2fs: remove power-of-two limitation
 of zoned device") missed to remove pow2 check condition in init_blkz_info(),
 fix it. Fixes: 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned
 device") Signed-off-by: Feng Song <songfeng@oppo.com> Signed-off-by: Yongpeng
 Yang <yangyongpeng1@oppo.com> Signed-off-by: Chao Yu < [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1riRGQ-0005jX-Cp
Subject: [f2fs-dev] [PATCH] f2fs: zone: fix to remove pow2 check condition
 for zoned block device
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
Cc: Feng Song <songfeng@oppo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned
device") missed to remove pow2 check condition in init_blkz_info(),
fix it.

Fixes: 2e2c6e9b72ce ("f2fs: remove power-of-two limitation of zoned device")
Signed-off-by: Feng Song <songfeng@oppo.com>
Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0676c2dcbbf7..fb4c1ed72710 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3874,11 +3874,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 		return 0;
 
 	zone_sectors = bdev_zone_sectors(bdev);
-	if (!is_power_of_2(zone_sectors)) {
-		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
-		return -EINVAL;
-	}
-
 	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
 				SECTOR_TO_BLOCK(zone_sectors))
 		return -EINVAL;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
