Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD2978D44
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Sep 2024 06:24:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1spKKt-0000Et-AV;
	Sat, 14 Sep 2024 04:24:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1spKKs-0000En-4C
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 04:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JLAbTgJhbfcz1Ltmk0nFQVCDO22ymvliKalui86Kxtg=; b=jLclMZ6co6n/dI8xJbCYixmGo0
 6gQtpwwELkWEL2+cP+7Jd6hKtdKAwrS2Pby6xvq5XhCQxS8udOVJzXmM/AXzjiNfXi+TqHjYNRJaB
 znuUpcDj4i4Am80w55fQYq2XY5oz1hacsq0scn7Rlt6FQMTTjw72PPxWhcKc8GfN/b2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JLAbTgJhbfcz1Ltmk0nFQVCDO22ymvliKalui86Kxtg=; b=D
 X+C0LBzyTqQZaguPTwGWdG2StNH4XBuxYqtMAB7ucJqX1ETUHoquI0S0Bp2Ydh5/vuCZrjEPmG17G
 OoRbc1bQ5ISHW9zxud2px8YpN63SvGPcnct3mkQD+md2xy54gycDqM1EP/1gyocCpN4FpZ7nd8Som
 U4dyVWye6Lo5/aV0=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1spKKr-0007WC-66 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 04:24:38 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 48E3CsV1002804
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Sep 2024 11:12:54 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 48E3CH60000371;
 Sat, 14 Sep 2024 11:12:17 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4X5GHq16q2z2Nk1dW;
 Sat, 14 Sep 2024 11:04:55 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Sat, 14 Sep 2024 11:12:14 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Sat, 14 Sep 2024 11:11:47 +0800
Message-ID: <1726283507-16611-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 48E3CH60000371
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When 16K page/block size is enabled in Android platform, a
 error maybe detected in mount process in kernel if "-b" parameters is not
 specified in mkfs.f2fs. Just as the following check: if (le32_to_cp [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1spKKr-0007WC-66
Subject: [f2fs-dev] [PATCH] f2fs-toos: use getpagesize() to get default
 blocksize in Android
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
Cc: xiuhong.wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When 16K page/block size is enabled in Android platform,
a error maybe detected in mount process in kernel if "-b"
parameters is not specified in mkfs.f2fs.
Just as the following check:
if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS)

So use getpagesize() to get correct default blocksize.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
---
 lib/libf2fs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index ecd22d4..98ee0ae 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -685,8 +685,17 @@ void f2fs_init_configuration(void)
 
 	memset(&c, 0, sizeof(struct f2fs_configuration));
 	c.ndevs = 1;
+#ifdef WITH_ANDROID
+	c.blksize = getpagesize();
+	c.blksize_bits = log_base_2(c.blksize);
+	if ((1 << c.blksize_bits) != c.blksize) {
+		c.blksize = 1 << DEFAULT_BLKSIZE_BITS;
+		c.blksize_bits = DEFAULT_BLKSIZE_BITS;
+	}
+#else
 	c.blksize = 1 << DEFAULT_BLKSIZE_BITS;
 	c.blksize_bits = DEFAULT_BLKSIZE_BITS;
+#endif
 	c.sectors_per_blk = DEFAULT_SECTORS_PER_BLOCK;
 	c.blks_per_seg = DEFAULT_BLOCKS_PER_SEGMENT;
 	c.wanted_total_sectors = -1;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
