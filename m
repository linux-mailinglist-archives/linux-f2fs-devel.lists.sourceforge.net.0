Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A42EEB03B64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Jul 2025 11:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3oTVc/t0YGdJG5U/oRBfmD58KoHl8W7SCALi2+Up5w=; b=E+ulP4mIkN6Bo8skyD1d2mmoCT
	Wlts4x8O9PiiogKWiWPzeWBZPnmlTvAJX/0KhI4+krsB4UsMJ3CMsj8BwC2+gUSZmSK95wfOJDSft
	xjZOjlE83MDtMzNtPabrOOFLg9Y+vnt3Yg/iUaoFFF/93Xl+AOKKhfRPfpMQg5rRzGEE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubFsM-0005Wy-Dg;
	Mon, 14 Jul 2025 09:53:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1ubFro-0005UE-Az
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 09:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e5DnEFm2eM8ToPuBwGU4cCVBwDFj8T7zbrEwE84cenw=; b=FU3Ffh7Z+5hdCUnwRRGN7yUhjr
 tJTwzoj0GdERtf9UKwZTQzIjJ82m8DbVupmkd4+YP7DMQvCWwzHZYUd1Pr/TZLowS9TAtTmoilDcb
 MxN2gJZCL6mQLniNTVug2DXuE2/Zsj0KG/AMHtKJ6L7dh0M7rvT9D+Gz17Be4zjJfNOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e5DnEFm2eM8ToPuBwGU4cCVBwDFj8T7zbrEwE84cenw=; b=j
 PpdDiCy/U4lIzLUBNq2qRDCFDBIEFjwa1AZDgNyE5LwNbG5CRXdCLDed/c0MCV7JVQprl5yvXVpkr
 fULCSEa6rlMCklRE5i55F8WQZqAPu8Dv0Y4DislHEfvhD/qNPa4ZgGwWudr0ssM+/OuxEi07pN6gE
 mDdzqN6g+fFXdBYw=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubFrn-0001kK-AD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 09:53:00 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 56E9qJXt091864;
 Mon, 14 Jul 2025 17:52:19 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bgcv93yF0z2Q79s5;
 Mon, 14 Jul 2025 17:48:05 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 14 Jul 2025 17:52:17 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 14 Jul 2025 17:51:45 +0800
Message-ID: <1752486705-9498-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 56E9qJXt091864
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Should check these after c.devices[1].start_blkaddr is
 assigned
 when c.ndevs > 1. Fixes: 316e128fe3dc ("mkfs.f2fs: adjust zone alignment
 when using multi-partitions") Signed-off-by: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 --- mkfs/f2fs_format.c | 23 ++++++++++++ 1 file change [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1ubFrn-0001kK-AD
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: adjust zone alignment check to
 correct position
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Should check these after c.devices[1].start_blkaddr is assigned
when c.ndevs > 1.

Fixes: 316e128fe3dc ("mkfs.f2fs: adjust zone alignment when using multi-partitions")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 mkfs/f2fs_format.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2680bd3..3a899e6 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -339,17 +339,6 @@ static int f2fs_prepare_super_block(void)
 	MSG(0, "Info: zone aligned segment0 blkaddr: %u\n",
 					get_sb(segment0_blkaddr));
 
-	if (c.zoned_mode &&
-		((c.ndevs == 1 &&
-			(get_sb(segment0_blkaddr) + c.start_sector /
-			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) ||
-		(c.ndevs > 1 &&
-			c.devices[1].start_blkaddr % c.zone_blocks))) {
-		MSG(1, "\tError: Unaligned segment0 block address %u\n",
-				get_sb(segment0_blkaddr));
-		return -1;
-	}
-
 	for (i = 0; i < c.ndevs; i++) {
 		if (i == 0) {
 			c.devices[i].total_segments =
@@ -390,6 +379,18 @@ static int f2fs_prepare_super_block(void)
 
 		c.total_segments += c.devices[i].total_segments;
 	}
+
+	if (c.zoned_mode &&
+		((c.ndevs == 1 &&
+			(get_sb(segment0_blkaddr) + c.start_sector /
+			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) ||
+		(c.ndevs > 1 &&
+			c.devices[1].start_blkaddr % c.zone_blocks))) {
+		MSG(1, "\tError: Unaligned segment0 block address %u\n",
+				get_sb(segment0_blkaddr));
+		return -1;
+	}
+
 	set_sb(segment_count, c.total_segments);
 	set_sb(segment_count_ckpt, F2FS_NUMBER_OF_CHECKPOINT_PACK);
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
