Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738A589CFB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 15:43:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJb7x-0000W0-IC; Thu, 04 Aug 2022 13:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJb70-0000Ul-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OU3Wl7jtOHaegOXRHCMxrdSLmXGQRU13HA9s5Rsnip8=; b=D/bRv7cmyofsQoIsKo70SjOmiP
 fuQduc49aWeN8ighlTrKaIn2gjOO3fEDMREes4fwuKoXInARbrEQsmRXgIE+yU7E+41WSBAPxYKu5
 lSlbmTZfBYVbnnvug0AHEMEMoqEsB0/Kc3YpF1YHuuwq0qXZcTYa0yyg2Lan7CMwJbOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OU3Wl7jtOHaegOXRHCMxrdSLmXGQRU13HA9s5Rsnip8=; b=T
 RLOOyM+x0qDKsx6Z1coHmuAPMARgNr35e8prxsXYeFQMGco5OiXUrtqfqzGeecDKicC7ozelG2VCi
 2NQAadpZFb/J3lcllZutTgMb7lO/hzHJoJuwBiYnNwDQr0iheezHGV+RXd60PChs1/4f6lH0impdG
 dCm4lsbIH7swV2cw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJb6w-003Dva-PQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 13:42:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2AACB824B3;
 Thu,  4 Aug 2022 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B73C433B5;
 Thu,  4 Aug 2022 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659620510;
 bh=tft2ehdcPlqOGOhqquXqJ/QmYEfBenOXGUYgu/c2XrI=;
 h=From:To:Cc:Subject:Date:From;
 b=PP1IwDFDTjFeeOeQNo7hGlCkVvepWKehYd/CgEIL+ybGrIQoWxvQo1U+aYGXu3Ih9
 SJCR6pJxGtP3vgO53tFYIrmLk5xbxbiCchaQLFUmxDER5zh3NI3IkuuCC/6iqTKMII
 bPNxMiJJ8ulJgOILmzQ7GzRElWpLTsNCMy9V3ZwHSxME4gL/GOEGaQEMTTj4qCfRmn
 rMIWlrdMmgv/LpU//u0NVq1rWW5oONeY17+xQf6ecDsSpq1N3cwOzJ/DDAyMnUHp51
 aLHmC2Rnss5oC2NiUADSN+p4Gycy9sKt2Gb8hRJiHE/G5LxTB75IhVqM34mL9B9KGi
 TbbOJiRvIdHsw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  4 Aug 2022 21:41:40 +0800
Message-Id: <20220804134140.14455-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao.yu@oppo.com> This patch disallow to
 enable
 file compression in image which doesn't support compression feature.
 Signed-off-by:
 Chao Yu <chao.yu@oppo.com> --- fs/f2fs/file.c | 2 ++ 1 file changed,
 2 insertions(+)
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJb6w-003Dva-PQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to check compression feature before
 enabling file compression
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

From: Chao Yu <chao.yu@oppo.com>

This patch disallow to enable file compression in image which doesn't
support compression feature.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 24f5b02c78e7..4a3f4eaa3fc5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1872,6 +1872,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 			if (!f2fs_disable_compressed_file(inode))
 				return -EINVAL;
 		} else {
+			if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+				return -EOPNOTSUPP;
 			if (!f2fs_may_compress(inode))
 				return -EINVAL;
 			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
