Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D2276FD07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 11:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRqup-0006xB-Vd;
	Fri, 04 Aug 2023 09:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=573aff2c0=shinichiro.kawasaki@wdc.com>)
 id 1qRquo-0006x5-HR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 09:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dLt5X0Ypx7VFnN66LAFKguiLcT16DXrEcWfsv55rreA=; b=Cxnsxap0fbQ3jsATuoftQxi2IW
 FOZ/b0AWufpfmZEaP+o7D6sUogASSQas5nV6lAunYxCDYzEUl9EhiI19mIVTWESYc04D65OD8il7q
 egSLC/uT22GY1EZcUzyO4Yyqoi18GqDrbBl1ehwhKZwiTDIYFZIJz+pBehqj7A9JzLlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dLt5X0Ypx7VFnN66LAFKguiLcT16DXrEcWfsv55rreA=; b=g
 VVJB6TbBOu+YFnkmFFKWY9fUWWDtud4WXmg5k19mfoMW6D0fmCarQnjzJUID3dL0Wxpwkmbn4h//m
 V0SaltBdCOxSwb1iE1geTM+QnsKHjpjI02SXt9mB4QxAEw7HoSn8ybzT7cLHBCm6OdRn0NKFnfg/l
 FxaU8jP+0x3x1LGQ=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRqul-000268-1M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 09:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1691140567; x=1722676567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBEOkS9iK2MaL6AIufxp3eoRKcTiExfUGlzy+z9B4BQ=;
 b=hdZt5JEqqJv8Qq7BTWJU/JlhoKLkVmQnXLp9rYDdGzNZXcEv3H/dL7O7
 JGeDE/o2bSQAJSFjmpcecsoMswQEXwDMZWz17B6fwcJhYw4hD2Tjo9HjT
 5IJbkaUOlZ80V+6fglKutfl02pflyFOQOcx5QYxTxiA/Q2IP2MBvkC1kY
 52MboGxigjDuCB//ge0NXHKRxjlyhK9Zlkc/uK1GG84su1Tx+OHaQzWH7
 OHqyEYIXC3NbMxRw0CXwVcXyA5Gfczd2CDOkQ4VTNtX5zGaWCcYd9pbqo
 f/S/V1i/nr2VZrdwSbZzmFkNibMuRTVf0nyWhvOEGtY7pEveMwybYb2I9 w==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684771200"; d="scan'208";a="244704134"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2023 17:16:01 +0800
IronPort-SDR: V7OFceZoSKxI7NHe0pBoXZl/5fQLgEi5yIbkFnC5nEzusY/srcoHoXbMqwjms5Zv93UteLplZE
 OxCx1X8NdzHvsqh7SSpJvZZkJPIVfQAY98aCX54mKavA6MfPdlq/ad1xcp/E0cE85ruwvmatJI
 VS78euqIkzncuo9kDrp3TCFGu64PVLRkFlJQbF/htAwDC3P7Mz/IOWCvKcb1zPq3O8l2ZRw+3j
 rj+VfnYAy4Gdk9qjf5LxRzoDb5hsxB2WcCNo/8mN1/oWk3tS5P8bUc4X/KWKH4PtLZNftp9sCs
 zXY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2023 01:23:53 -0700
IronPort-SDR: aTmKXdfEQXg9QLdKlVatCG7pM5ESkaJezG6cbl05vzeTVxMji7IeQ+8kTePHomZ4nsY1D6mKcV
 KUGrXnS+ZcoPlmOwSU3yQoWryld9TVacMThoITWdwwCAeilVHtbyDKZYNLIt7MvD7OP3hCb/zw
 4GAeJp+aULIiWL2eW8V4O7046JHzRUk0oIsZpZrq8MoFBDT0UvUojB7H12qQxCM6CVNN/hcuLI
 G9ZpXg68rpCg/yGPELDj8ulB/fycYfkcIf4qq6OmA0rGd2nO2m/RPvKCykHWrOw4CPUahzfXO+
 xZg=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.55])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Aug 2023 02:15:57 -0700
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  4 Aug 2023 18:15:56 +0900
Message-Id: <20230804091556.2372567-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The commit 25f9080576b9 ("f2fs: add async reset zone command
 support") introduced "async reset zone commands" by calling
 __submit_zone_reset_cmd()
 in async discard operations. However, __submit_zone_r [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRqul-000268-1M
Subject: [f2fs-dev] [PATCH] f2fs: check zone type before sending async reset
 zone command
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
From: Shin'ichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The commit 25f9080576b9 ("f2fs: add async reset zone command support")
introduced "async reset zone commands" by calling
__submit_zone_reset_cmd() in async discard operations. However,
__submit_zone_reset_cmd() is called regardless of zone type of discard
target zone. When devices have conventional zones, zone reset commands
are sent to the conventional zones and cause I/O errors.

Avoid the I/O errors by checking that the discard target zone type is
sequential write required. If not, handle the discard operation in same
manner as non-zoned, regular block devices. For that purpose, add a new
helper function f2fs_bdev_index() which gets index of the zone reset
target device.

Fixes: 25f9080576b9 ("f2fs: add async reset zone command support")
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h    | 16 ++++++++++++++++
 fs/f2fs/segment.c | 35 +++++++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c7cb2177b252..73fbc9c5f5b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4423,6 +4423,22 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 }
 #endif
 
+static inline int f2fs_bdev_index(struct f2fs_sb_info *sbi,
+				  struct block_device *bdev)
+{
+	int i;
+
+	if (!f2fs_is_multi_device(sbi))
+		return 0;
+
+	for (i = 0; i < sbi->s_ndevs; i++)
+		if (FDEV(i).bdev == bdev)
+			return i;
+
+	WARN_ON(1);
+	return -1;
+}
+
 static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
 {
 	return f2fs_sb_has_blkzoned(sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0457d620011f..668cf709927f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1257,7 +1257,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		return 0;
 
 #ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev)) {
+	int devi = f2fs_bdev_index(sbi, bdev);
+
+	if (devi < 0)
+		return -EINVAL;
+
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev) &&
+		f2fs_blkz_is_seq(sbi, devi, dc->di.start)) {
 		__submit_zone_reset_cmd(sbi, dc, flag, wait_list, issued);
 		return 0;
 	}
@@ -1785,15 +1791,24 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
 	dc = __lookup_discard_cmd(sbi, blkaddr);
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (dc && f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
-		/* force submit zone reset */
-		if (dc->state == D_PREP)
-			__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
-						&dcc->wait_list, NULL);
-		dc->ref++;
-		mutex_unlock(&dcc->cmd_lock);
-		/* wait zone reset */
-		__wait_one_discard_bio(sbi, dc);
-		return;
+		int devi = f2fs_bdev_index(sbi, dc->bdev);
+
+		if (devi < 0) {
+			mutex_unlock(&dcc->cmd_lock);
+			return;
+		}
+
+		if (f2fs_blkz_is_seq(sbi, devi, dc->di.start)) {
+			/* force submit zone reset */
+			if (dc->state == D_PREP)
+				__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
+							&dcc->wait_list, NULL);
+			dc->ref++;
+			mutex_unlock(&dcc->cmd_lock);
+			/* wait zone reset */
+			__wait_one_discard_bio(sbi, dc);
+			return;
+		}
 	}
 #endif
 	if (dc) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
