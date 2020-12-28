Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDE2E6A86
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 21:00:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktyh4-0002U3-9o; Mon, 28 Dec 2020 20:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ktyh2-0002Tw-U0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 20:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HlKx7jlq+425U9R33+i6o+8DqQTXeIoMdbJJr2AMsq0=; b=G/9mPSovWkEBWs+rcx/nV/eZqs
 VKjUXT/GZGcosPSR118z91PryU4NdbKDnfr8c9JrhYvtMXZsCcPJpeYHkRUAGDxC71oZm+H9CxtUf
 mFbdK8K7pNcr2Rp6iDkrwMpuUrJaF+BbN7qy2X1DPUWiGrJst90ni9yh0K0ULde4RLAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HlKx7jlq+425U9R33+i6o+8DqQTXeIoMdbJJr2AMsq0=; b=C
 jEbwJ/x/SAnz7S3mtBrI/srjuxVch+l56wFcA2LBn7LFgA8CNM9VPjk9wpBpucgtiQdZdoNPx4Aqy
 ROBpBbOJS6qDrrqxlG714gB6yokOAwdFlcldcqOLSuDltOTiEVoFps2Ke8mXjlGLA7LsSXw7wGBHK
 /TVwEpAVVYItDmxY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktygs-006p1w-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 20:00:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E43F207C5;
 Mon, 28 Dec 2020 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609185616;
 bh=A1bTActOc2ArjUSAmOLkWFgWCN2V56nsgcUGR0wnQps=;
 h=From:To:Cc:Subject:Date:From;
 b=su2CF+bheYO3t0fflZEwbdpdRL4/+ex53Ie5jNPhhKkMGq0iWFLTUGt+M6hgIScB/
 9is/6dSgyTinMcBy+734jRcgRvrtqOpaet0ib9UVZfEHHRI6/vHOHPi2xGECZFKntX
 AZYNaFFQyAjZHO1JDdasihv2cLWkaWRRWWjr2xBjur+A/GZN/tr1fP4pB6E/Wnjpx9
 dhfMSbjeqx7OPy7tikiRoauTRjhff41xltDro2X5/B33QlJk47lJg038Z8h9TIRrML
 i9CEVce4t8FQRgXA7xR3CAVbip1dii73YVXFjGsf4LSHURo3Ld5G8m8Z4ArvdpN423
 nFjt5SrIUsl7g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Dec 2020 12:00:11 -0800
Message-Id: <20201228200011.2435042-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
X-Headers-End: 1ktygs-006p1w-Ox
Subject: [f2fs-dev] [PATCH] libzoned: use blk_zone_v2 and blk_zone_report_v2
 by default
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

Old blk_zone and blk_zone_report should be compatible with v2.
And, old blk_zone_report uses reserved[4] which breaks the build.

struct blk_zone_report {
	__u64		sector;
	__u32		nr_zones;
	__u8		reserved[4];
	struct blk_zone zones[0];
};

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h | 49 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index ccf1e2b7a548..a51a35998ffb 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1358,6 +1358,30 @@ static inline int get_inline_xattr_addrs(struct f2fs_inode *inode)
 
 #ifdef HAVE_LINUX_BLKZONED_H
 
+/* Let's just use v2, since v1 should be compatible with v2 */
+#define BLK_ZONE_REP_CAPACITY   (1 << 0)
+struct blk_zone_v2 {
+	__u64   start;          /* Zone start sector */
+	__u64   len;            /* Zone length in number of sectors */
+	__u64   wp;             /* Zone write pointer position */
+	__u8    type;           /* Zone type */
+	__u8    cond;           /* Zone condition */
+	__u8    non_seq;        /* Non-sequential write resources active */
+	__u8    reset;          /* Reset write pointer recommended */
+	__u8    resv[4];
+	__u64   capacity;       /* Zone capacity in number of sectors */
+	__u8    reserved[24];
+};
+#define blk_zone blk_zone_v2
+
+struct blk_zone_report_v2 {
+	__u64   sector;
+	__u32   nr_zones;
+	__u32   flags;
+	struct blk_zone zones[0];
+};
+#define blk_zone_report blk_zone_report_v2
+
 #define blk_zone_type(z)        (z)->type
 #define blk_zone_conv(z)	((z)->type == BLK_ZONE_TYPE_CONVENTIONAL)
 #define blk_zone_seq_req(z)	((z)->type == BLK_ZONE_TYPE_SEQWRITE_REQ)
@@ -1407,31 +1431,6 @@ blk_zone_cond_str(struct blk_zone *blkz)
 /*
  * Handle kernel zone capacity support
  */
-#ifdef HAVE_BLK_ZONE_REP_V2
-#define BLK_ZONE_REP_CAPACITY   (1 << 0)
-struct blk_zone_v2 {
-	__u64   start;          /* Zone start sector */
-	__u64   len;            /* Zone length in number of sectors */
-	__u64   wp;             /* Zone write pointer position */
-	__u8    type;           /* Zone type */
-	__u8    cond;           /* Zone condition */
-	__u8    non_seq;        /* Non-sequential write resources active */
-	__u8    reset;          /* Reset write pointer recommended */
-	__u8    resv[4];
-	__u64   capacity;       /* Zone capacity in number of sectors */
-	__u8    reserved[24];
-};
-#define blk_zone blk_zone_v2
-
-struct blk_zone_report_v2 {
-	__u64   sector;
-	__u32   nr_zones;
-	__u32   flags;
-struct blk_zone zones[0];
-};
-#define blk_zone_report blk_zone_report_v2
-#endif /* HAVE_BLK_ZONE_REP_V2 */
-
 #define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
 #define blk_zone_sector(z)	(z)->start
 #define blk_zone_length(z)	(z)->len
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
