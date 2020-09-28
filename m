Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB027AB01
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Sep 2020 11:43:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kMpgh-0000QP-6L; Mon, 28 Sep 2020 09:43:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kMpgf-0000QH-4w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 09:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=js14lOO4nyfb3f026jh74JvOlwcAonZ7mp7TqRtXs/w=; b=E3gkyO1sDE+aM1uuyzG6gJhcmc
 WmpbyBeWeaqh4uWi14QjXf2s0/pRGiZmk2d8P1esGtO9eKzDIVs9zewjFTrsKn0nNktP+UARfF3lo
 GW5eYJUGyYvU4DJUggTwHedpd33GcrVJHkLD8PPO9LNCPJN/HLe86241R71n6WuaXY00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=js14lOO4nyfb3f026jh74JvOlwcAonZ7mp7TqRtXs/w=; b=M
 kbdmALgRY+uTeT9WagIrHpx9PJ/6VWZYth4UD4tKgEtCCXh/p90TTpAtkwPZOQtoF1jHZ/X0DCJk+
 5o0TOv+NDTVWn3p7uNjW4UgTVu+XPXgeFoOhXsDlHMAtOc5ZXh4JB5Cmxrn8tdMK9zKyGEUzJKck4
 wTW+kitpxoOvWuv8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kMpgS-008cE4-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 09:43:13 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6A01EC669EBFA0EF986C;
 Mon, 28 Sep 2020 17:42:52 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 28 Sep 2020 17:42:43 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 28 Sep 2020 17:42:39 +0800
Message-ID: <20200928094239.66221-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kMpgS-008cE4-Qe
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on segment/section
 count
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

As syzbot reported:

BUG: KASAN: slab-out-of-bounds in init_min_max_mtime fs/f2fs/segment.c:4710 [inline]
BUG: KASAN: slab-out-of-bounds in f2fs_build_segment_manager+0x9302/0xa6d0 fs/f2fs/segment.c:4792
Read of size 8 at addr ffff8880a1b934a8 by task syz-executor682/6878

CPU: 1 PID: 6878 Comm: syz-executor682 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 init_min_max_mtime fs/f2fs/segment.c:4710 [inline]
 f2fs_build_segment_manager+0x9302/0xa6d0 fs/f2fs/segment.c:4792
 f2fs_fill_super+0x381a/0x6e80 fs/f2fs/super.c:3633
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The root cause is: if segs_per_sec is larger than one, and segment count
in last section is less than segs_per_sec, we will suffer out-of-boundary
memory access on sit_i->sentries[] in init_min_max_mtime().

Fix this by adding sanity check among segment count, section count and
segs_per_sec value in sanity_check_raw_super().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a24980aa425d..79d5e0e2225a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2834,6 +2834,12 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
+	if (segment_count_main != total_sections * segs_per_sec) {
+		f2fs_info(sbi, "Invalid segment/section count (%u != %u * %u)",
+			  segment_count_main, total_sections, segs_per_sec);
+		return -EFSCORRUPTED;
+	}
+
 	if ((segment_count / segs_per_sec) < total_sections) {
 		f2fs_info(sbi, "Small segment_count (%u < %u * %u)",
 			  segment_count, segs_per_sec, total_sections);
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
