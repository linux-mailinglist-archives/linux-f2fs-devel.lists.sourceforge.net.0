Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92D249267
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 03:35:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8D0Z-0001b0-Tq; Wed, 19 Aug 2020 01:35:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=4936ee857=shinichiro.kawasaki@wdc.com>)
 id 1k8D0Y-0001at-SE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pos5RlDPHjegxmI7wXxnDshDPN4Ke/jeTaKS5jVmqzY=; b=crn5Ql620rvG6Mhn/vSoD4STII
 ceCUje0qVE1EvoP/HFwdg05/AOkJ3BFm3o19PgRmG1ltL+OI4yonZsZHarNdCnb+37xNES/E2coR9
 if7OR7SMb2O9ZfzvgvefwIiweqYREiXRO45+P2L5cCmWbsb/lqR4v0l/qaR+vorPWxpg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pos5RlDPHjegxmI7wXxnDshDPN4Ke/jeTaKS5jVmqzY=; b=E
 CbNEFOVso2NqL/PzbE5QtwFaAYf64iYPuwIMZIun8vIThijoKv7AFms+7PAISDfVT9u8+75sLqCUt
 tBxgYAo5982Ad4TlbVSsbjl7iQMs38Bdu7xTT+dseEuG17iCH7COPMFx52f+JaHV46cpwvt7BVl5j
 JOGTWR5GxnHVjQBs=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8D0U-00FiNB-Rv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 01:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597800914; x=1629336914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z+E0RR5MwnP0Rr37gxBhhtWOMfAu8X/F5keQONnUjko=;
 b=iabHa83jK/YiEIJ/Bme4+BapXwwmHLcWvaQyaAHj7jJBb+PU6gQJ/hdW
 ZbXQz4Y4NZ8/vXlaC0L6dvvaRsVSP1+7lfQ2cT4VotuWrDO2ohqnHhRyr
 kj4umK64pcqR6fTaWvUk0COo42oqHBkyMAmJbXtOCfZbodxmw+zJVaNXt
 /lUuXF9bY78XJiyC4Fc+XvfrX2yhcwWgx5QdfVmIxp9PBtWKrddQwXXHz
 2givVfpGaprSC5RKsntGs4KlwB0myQJ27fM0WA1SVVp0dAvCZJ93991Wj
 rK8fd/1hhLWduNl2HQDufafpUiT5TcWu1CxkdggxWNLWelhBvj8DUgaDr w==;
IronPort-SDR: +P6DbaQGQvKEtO1Cga52X3nIIz/IV/MFq7q1N/FgDC+bSG8WnzV5lBExfPdhoS63nf6zhwhPVR
 wYGyXNm7Kp/CC41XeOQRVMg4IHO6KyX46EHPZKflO4nhqQP9hLXXEx/ENnpc2qYVYIrd2pSUqQ
 IHfpjwXVTmzY6A/PQMdGULLSODfTeyzawkIpes6XQRqApAgWGx3lny+Cb6iWvY+fhhPqagAkWy
 HqiUAYa6HB72m2GeLqgtNxNmcO/X2g80pE3sgUUARvvng8CKT+9fPkItzXMwb0BDIUYtSdugjs
 sPE=
X-IronPort-AV: E=Sophos;i="5.76,329,1592841600"; d="scan'208";a="254703179"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2020 09:34:50 +0800
IronPort-SDR: katIyIlbOLm0skiT/Nczh/r0YFHOsy+gaWTmQReE24y7yIzkIWYAp59u9ksam2HdWwF/FBEEEb
 DsCpkbYH037Q==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 18:22:34 -0700
IronPort-SDR: jx0EqQ4qzbeSrUlPt+0Z+J/sF0wi9OhE77coz3sK2ayA64Tckc1tlHv8bMgiB9u2FZy4glGyce
 /ypREiyG7NNg==
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Aug 2020 18:34:49 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 19 Aug 2020 10:34:48 +0900
Message-Id: <20200819013448.148302-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k8D0U-00FiNB-Rv
Subject: [f2fs-dev] [PATCH] f2fs: Fix type of section block count variables
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit da52f8ade40b ("f2fs: get the right gc victim section when section
has several segments") added code to count blocks of each section using
variables with type 'unsigned short', which has 2 bytes size in many
systems. However, the counts can be larger than the 2 bytes range and
type conversion results in wrong values. Especially when the f2fs
sections have blocks as many as USHRT_MAX, the count is handled as zero.
This triggers eternal loop in init_dirty_segmap() at mount system call.
Fix this by changing the type of the variables to block_t.

Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section has several segments")
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a65d357f89a9..e247a5ef3713 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -799,7 +799,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 
 		if (__is_large_section(sbi)) {
 			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-			unsigned short valid_blocks =
+			block_t valid_blocks =
 				get_valid_blocks(sbi, segno, true);
 
 			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
@@ -815,7 +815,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
-	unsigned short valid_blocks;
+	block_t valid_blocks;
 
 	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
 		dirty_i->nr_dirty[dirty_type]--;
@@ -4316,8 +4316,8 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int segno = 0, offset = 0, secno;
-	unsigned short valid_blocks;
-	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);
+	block_t valid_blocks;
+	block_t blks_per_sec = BLKS_PER_SEC(sbi);
 
 	while (1) {
 		/* find dirty segment based on free segmap */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
