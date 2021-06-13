Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 606983A56B5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Jun 2021 07:56:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsJ6G-0003r3-VW; Sun, 13 Jun 2021 05:56:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lsJ6B-0003qd-Mx
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0n84qEBDm1h3O6L2LwtINLL39XckAdplQdnjOlDApU=; b=aLokU0iQeOhllNA4zzm+FG+WfQ
 NpKs0ap6V7Skt2Lulf1qrHqpcrE9uA7Kg9rNQlGmkJPv8+NHSvgOG4CQcX/yuGEIw0a1wdX7v8kQO
 Zfv2FUpSPXhLuaZ5z94m8lUPuOqdd7cclSZySs6qYxTYXSDgo1a9Kz9xKsYRyeQ/8mHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w0n84qEBDm1h3O6L2LwtINLL39XckAdplQdnjOlDApU=; b=YhCfUHM1s46aM4hqoaO0spqj0r
 CJ3WHRn16zyIU9he2N+j1yMO/3LQA6PlSEbea4hFdrkcWFLL32T24t5WjewT6tn/286WygVezhFBy
 T5uNl9Rvatv7tk+73FuOq6eRRRP7HQeuN3ze3TA7TlNKyIzdcektAUfBqmMcMKVeRmQ8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lsJ61-007HPN-NX
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 283F0611CA;
 Sun, 13 Jun 2021 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623563733;
 bh=0elZGHGYqjxB51hEh55CWRB/N+p+1GyG3Zhvn2wGB4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IY4AU/lZ1NaMYUJpOZbT8aBtFfve5Id0wlDSIT0TaDRp0rR++YO8YzETgtly6Vxen
 y40Rgqv/sUnovLaBEyVzwjsCkktczzH1U2rNUWp/GkUexJSFANVPHGs93iuX0V+t1j
 1mf4EjqMKO8Hl3JKe1PaHexiSCdU8hi4ByHbaVpWB/btzVCe9u/Qob2Cd3KkW2C4ru
 HIxTaH5y9dqwbyJ9OVZu9QFsU88rLoLt1rYz7aY6KX7lAaUDMPWLF42LJGLaWQBx0F
 uQx4XPfv1J2P+mW73VxUO2gYXbyii4grJCLBXpoS8c5Dmw+LsBQspUm+GW1SjCUhc3
 oKCSWQrIEQKPg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 12 Jun 2021 22:55:29 -0700
Message-Id: <20210613055529.2471492-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210613055529.2471492-1-jaegeuk@kernel.org>
References: <20210613055529.2471492-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lsJ61-007HPN-NX
Subject: [f2fs-dev] [PATCH 3/3] mkfs.f2fs: remove android features for RO
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

We don't need to enable all android features for RO.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 03eb748170ad..031244d5d67a 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -110,11 +110,16 @@ static void add_default_options(void)
 		/* -d1 -f -O encrypt -O quota -O verity -w 4096 -R 0:0 */
 		c.dbg_lv = 1;
 		force_overwrite = 1;
+		c.wanted_sector_size = 4096;
+		c.root_uid = c.root_gid = 0;
+
+		/* RO doesn't need any other features */
+		if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+			return;
+
 		c.feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
 		c.feature |= cpu_to_le32(F2FS_FEATURE_VERITY);
-		c.wanted_sector_size = 4096;
-		c.root_uid = c.root_gid = 0;
 		break;
 	}
 #ifdef CONF_CASEFOLD
-- 
2.32.0.272.g935e593368-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
