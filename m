Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D19B40D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 04:13:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5cfu-0001Hx-U2;
	Tue, 29 Oct 2024 03:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1t5cfs-0001Hp-Rd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MDLqcsgAa4BRDeB2cPl+4GlfhOYDNlE02s55tgyHT+I=; b=AUjC30ipN4U6vFEoAenBMK/esK
 yO3oK+uCGRCddqwTOmnE6e4rfChXAALopFnyQOGmZK2WPuT95DHOV2y9n5nyoHoFSu5FgUwYtsU1I
 qZ3y0zJIzANzeZRyFRuwYnawmYQy4MIKYg44RGd26FAedugmuKM1nDpkOf/GT11cbAIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MDLqcsgAa4BRDeB2cPl+4GlfhOYDNlE02s55tgyHT+I=; b=N
 b22ispvs7GpUgnkA/dmKVh4GcurgpL7jSlLOZe6o5BZJoY6UgLeW24BrH/dwcEetme9c1WMzbvmiV
 fxFW7Z3+A9TcP96EzRjMABBUpcvV1exdfELuAkDMQaEH9PHbGB/OEyk8wHay/wq6Lez6TIkKuTtnQ
 TT6bDascrfbd4F14=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5cfp-0002TP-Px for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:13:40 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49T3D0ov018719;
 Tue, 29 Oct 2024 11:13:00 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XcwKj1G53z2K25NV;
 Tue, 29 Oct 2024 11:12:25 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 29 Oct 2024 11:12:57 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 29 Oct 2024 11:12:49 +0800
Message-ID: <1730171569-10757-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49T3D0ov018719
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If gc_mode is set to GC_URGENT_LOW or GC_URGENT_MID, cost
 benefit GC approach should be used, but if ATGC is enabled at the same time,
 Age-threshold approach will be selected, which can only do amount [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t5cfp-0002TP-Px
Subject: [f2fs-dev] [PATCH V3] f2fs: fix to avoid use GC_AT when setting
 gc_mode as GC_URGENT_LOW or GC_URGENT_MID
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If gc_mode is set to GC_URGENT_LOW or GC_URGENT_MID, cost benefit GC
approach should be used, but if ATGC is enabled at the same time,
Age-threshold approach will be selected, which can only do amount of
GC and it is much less than the numbers of CB approach.

some traces:
  f2fs_gc-254:48-396     [007] ..... 2311600.684028: f2fs_gc_begin: dev = (254,48), gc_type = Background GC, no_background_GC = 0, nr_free_secs = 0, nodes = 1053, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0
  f2fs_gc-254:48-396     [007] ..... 2311600.684527: f2fs_get_victim: dev = (254,48), type = No TYPE, policy = (Background GC, LFS-mode, Age-threshold), victim = 10, cost = 4294364975, ofs_unit = 1, pre_victim_secno = -1, prefree = 0, free = 44898
  f2fs_gc-254:48-396     [007] ..... 2311600.714835: f2fs_gc_end: dev = (254,48), ret = 0, seg_freed = 0, sec_freed = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0
  f2fs_gc-254:48-396     [007] ..... 2311600.714843: f2fs_background_gc: dev = (254,48), wait_ms = 50, prefree = 0, free = 44898
  f2fs_gc-254:48-396     [007] ..... 2311600.771785: f2fs_gc_begin: dev = (254,48), gc_type = Background GC, no_background_GC = 0, nr_free_secs = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:
  f2fs_gc-254:48-396     [007] ..... 2311600.772275: f2fs_gc_end: dev = (254,48), ret = -61, seg_freed = 0, sec_freed = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0

Fixes: 0e5e81114de1 ("f2fs: add GC_URGENT_LOW mode in gc_urgent")
Fixes: d98af5f45520 ("f2fs: introduce gc_urgent_mid mode")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v3: add more descriptions in sys-fs-f2fs for gc_urgent(2) and gc_urgent(3)
v2: make GC_URGENT_LOW also use CB approach
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++--
 fs/f2fs/gc.c                            | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index fdedf1e..513296b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -311,10 +311,13 @@ Description:	Do background GC aggressively when set. Set to 0 by default.
 		GC approach and turns SSR mode on.
 		gc urgent low(2): lowers the bar of checking I/O idling in
 		order to process outstanding discard commands and GC a
-		little bit aggressively. uses cost benefit GC approach.
+		little bit aggressively. always uses cost benefit GC approach,
+		and will override age-threshold GC approach if ATGC is enabled
+		at the same time.
 		gc urgent mid(3): does GC forcibly in a period of given
 		gc_urgent_sleep_time and executes a mid level of I/O idling check.
-		uses cost benefit GC approach.
+		always uses cost benefit GC approach, and will override
+		age-threshold GC approach if ATGC is enabled at the same time.
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent_sleep_time
 Date:		August 2017
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e40bdd1..3e1b6d2 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -257,6 +257,8 @@ static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
 
 	switch (sbi->gc_mode) {
 	case GC_IDLE_CB:
+	case GC_URGENT_LOW:
+	case GC_URGENT_MID:
 		gc_mode = GC_CB;
 		break;
 	case GC_IDLE_GREEDY:
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
