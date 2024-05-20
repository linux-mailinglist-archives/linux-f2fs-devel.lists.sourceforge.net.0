Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD388C9C2D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2024 13:37:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s91KP-0001oA-Q7;
	Mon, 20 May 2024 11:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1s91KL-0001ns-QW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 11:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d4FhD3qnZ8qHZhpqXFeBk7qhFoFnRPolbz1UaCtuGAU=; b=SjdXQM/JRWK28WJGU1cYgyXVlU
 hm8yB+0IChBF4P9WAxXsd5Xe6xHNFZT4/8CAh5GJgHh6+dSJFVeXbhFeQ06yn+JQo3Onpj8BReeIz
 erecY8i8v5tv5XQtpEd3pZLeFa1f0fNwiPS40RB4C7WlzvKzk1Wx1A43T913Crbmp0lI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d4FhD3qnZ8qHZhpqXFeBk7qhFoFnRPolbz1UaCtuGAU=; b=P
 PUGi/sc4nrW6kBnUxsOZItZebdSD3N/VkF/wq7TnEFjCHxOoT2F17p/n/yAm6n/369bOnCrh1atzP
 LKgH4swANAflbt8nMpqWyOduDiwL4/1C2s8uwl/DvJTVBXIsci1GsB0rAdAB9BiRLsxBGQNQE3grq
 zWBsXj3LG/FG5laE=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s91KL-0005vv-4g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 11:37:14 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 44KBaWh8040804;
 Mon, 20 May 2024 19:36:32 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Vjb672thwz2Q7LW0;
 Mon, 20 May 2024 19:33:03 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 20 May 2024 19:36:29 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 20 May 2024 19:36:18 +0800
Message-ID: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 44KBaWh8040804
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now atgc can be enabled based on the following conditions:
 -ATGC mount option is set -elapsed_time is more than atgc_age_threshold
 already
 but these conditions are check when umounted->mounted device [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1s91KL-0005vv-4g
Subject: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now atgc can be enabled based on the following conditions:
-ATGC mount option is set
-elapsed_time is more than atgc_age_threshold already
but these conditions are check when umounted->mounted device again.
If the device has not be umounted->mounted for a long time, atgc can
not work even the above conditions met.

It is better to enable atgc dynamiclly when user change atgc_age_threshold
meanwhile this vale is less than elapsed_time and ATGC mount option is on.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c |  9 ++++-----
 fs/f2fs/sysfs.c   | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6a..e441d2d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3694,6 +3694,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
+int f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi);
 int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 71dc8042..44923d4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2931,14 +2931,11 @@ static int get_atssr_segment(struct f2fs_sb_info *sbi, int type,
 	return ret;
 }
 
-static int __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
+int f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC);
 	int ret = 0;
 
-	if (!sbi->am.atgc_enabled)
-		return 0;
-
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 
 	mutex_lock(&curseg->curseg_mutex);
@@ -2955,7 +2952,9 @@ static int __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
 }
 int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
 {
-	return __f2fs_init_atgc_curseg(sbi);
+	if (!sbi->am.atgc_enabled)
+		return 0;
+	return f2fs_init_atgc_curseg(sbi);
 }
 
 static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 09d3ecf..72676c5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -673,6 +673,22 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "atgc_age_threshold")) {
+		if (t < 0)
+			return -EINVAL;
+		sbi->am.age_threshold = t;
+		if (sbi->am.atgc_enabled)
+			return count;
+
+		if (test_opt(sbi, ATGC) &&
+			le64_to_cpu(sbi->ckpt->elapsed_time) >= t) {
+			if (f2fs_init_atgc_curseg(sbi))
+				return -EINVAL;
+			sbi->am.atgc_enabled = true;
+		}
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "gc_segment_mode")) {
 		if (t < MAX_GC_MODE)
 			sbi->gc_segment_mode = t;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
