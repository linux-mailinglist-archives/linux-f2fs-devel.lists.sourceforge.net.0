Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 042367265F2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 18:30:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6w2w-0005mg-F0;
	Wed, 07 Jun 2023 16:30:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q6w2v-0005ma-9r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 16:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XtYWopUfUV3pjUxzKYdcP2P01GlJicaI6mldYrZ0TNM=; b=mOXSXBC0qwVd3nIvmz63QpUJVK
 woEio3QupeoZp5+CDDWU3vHpwo94TH6IW8vhfVnhQziR7XosUGZ6apw8oiqKN1MsBu3OcnZndQ5TE
 TT7+O/atndb4pPlakhBlDhO97yYqQ7IrR4wZ3x5k9H9RZWOVD9IOb6MTQNluybW3D99o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XtYWopUfUV3pjUxzKYdcP2P01GlJicaI6mldYrZ0TNM=; b=R
 BdeNcgHUZq1jZB9OMW8NuRgAfAQb/wZWRoceoeRXwgVTHFFIToct30td3Ztm5Yv27ISogvN/Gg9UC
 pj2Uwly1T/TxomHwNbnmXMel6Vo8wlHBbOU6W1ijdCEe3ED/b9xyLFUVs9VAr1qIRcM2vX/ymVKfM
 pkjlhkjUdvrvmX7M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6w2t-00Dt9c-Fg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 16:30:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63FC26416D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jun 2023 16:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61A6C433A0;
 Wed,  7 Jun 2023 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686155395;
 bh=rAXf1ZqsGnObsvjcYvsmTKbEZgNJCNBl1IG2c3vyIFw=;
 h=From:To:Cc:Subject:Date:From;
 b=F44bcrz7p0Q3Fonp/7x2+bCCOA5CjLELo3I7hay4Bfwg0htX0PWV89tvwlUS/XopD
 AcV0rC+4DVFa6SiUrmmiiKgWYWeRfq4gsy1ZO/x9c0EyZSVuUhtecpLX/obu7Vz7OH
 YGY8xIyCvpxmsLkPdYpWkwjPL8ZC9yyrweCKcM+0LW6pqM8K223ZCJ7DnCr8NRUWwZ
 cUePkopnKDmMAeT1Ik3Z3mMXsLmszn8h/Q7KMBIAsI7XPXg7NT1WsEe+lEtHZddTMi
 WLf9CYwK2lQFwPTaOcbQdEX9pN0xKD/RaocJxysScC6CvxrTElxcffwJUw3O6CTuTc
 aAWXw9ZWODmZw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Jun 2023 09:29:54 -0700
Message-ID: <20230607162954.2651657-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ZSTD does not support compress_level=0. The commit
 d7ffafc99c42
 ("f2fs: add sanity compress level check for compressed file") revealed the
 issue. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/super.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6w2t-00Dt9c-Fg
Subject: [f2fs-dev] [PATCH] f2fs: set zstd default compression level to 3
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

ZSTD does not support compress_level=0.

The commit d7ffafc99c42 ("f2fs: add sanity compress level check for compressed file")
revealed the issue.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fd23caa1ed9..1fb8d4f27a40 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -627,7 +627,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	int len = 4;
 
 	if (strlen(str) == len) {
-		F2FS_OPTION(sbi).compress_level = 0;
+		F2FS_OPTION(sbi).compress_level = 3;
 		return 0;
 	}
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
