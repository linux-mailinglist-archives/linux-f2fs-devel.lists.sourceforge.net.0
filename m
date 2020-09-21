Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182727243D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 14:54:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKLKY-0007Ku-4C; Mon, 21 Sep 2020 12:54:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kKLKU-0007Ke-N6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 12:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nF8zzmE04hhsrONVMSeSeEzHm6/Vt1+GenrTLoVP0c8=; b=g/y3fgg4xp9iiUFmZ6TR7mKThk
 eH17looKD/V5F1Gs7Lg+3byzVVp5vliGf6sXKi8Y3azWjEgyniyGUwjfpneGfRN4em9MHh2tNsjsA
 B5VrAMHMYv4mQMruE+cEbWaR92HPSwds3NQK9XYcx3fWnwV1shuvVtaKkhXQK6QcRBDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nF8zzmE04hhsrONVMSeSeEzHm6/Vt1+GenrTLoVP0c8=; b=S
 r+Az/9I+2sLj/sweYzZqoo335aj65dPHlIoIInBl9DUF2c2Q0XbH+P6z1s3Sye8jdGpbK9/Cye1F7
 DT7Y1P2CTjs5zKE0jO11l/KJDXMLk2cFlDE4MNpHEvCXsobwHwSCFQ6QlMFysEcLl7fu1oTD1X2BS
 EdCxkKY6Z8FmJTgQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKLKH-000Euu-2P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 12:54:02 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6BEEB16731AB41C1103F;
 Mon, 21 Sep 2020 20:53:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 20:53:20 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 21 Sep 2020 20:53:13 +0800
Message-ID: <20200921125314.99297-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kKLKH-000Euu-2P
Subject: [f2fs-dev] [PATCH 1/2] f2fs: do sanity check on zoned block device
 path
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

sbi->devs would be initialized only if image enables multiple device
feature or blkzoned feature, if blkzoned feature flag was set by fuzz
in non-blkzoned device, we will suffer below panic:

get_zone_idx fs/f2fs/segment.c:4892 [inline]
f2fs_usable_zone_blks_in_seg fs/f2fs/segment.c:4943 [inline]
f2fs_usable_blks_in_seg+0x39b/0xa00 fs/f2fs/segment.c:4999
Call Trace:
 check_block_count+0x69/0x4e0 fs/f2fs/segment.h:704
 build_sit_entries fs/f2fs/segment.c:4403 [inline]
 f2fs_build_segment_manager+0x51da/0xa370 fs/f2fs/segment.c:5100
 f2fs_fill_super+0x3880/0x6ff0 fs/f2fs/super.c:3684
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3216
 do_mount fs/namespace.c:3229 [inline]
 __do_sys_mount fs/namespace.c:3437 [inline]
 __se_sys_mount fs/namespace.c:3414 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3414
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46

Add sanity check to inconsistency on factors: blkzoned flag, device
path and device character to avoid above panic.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 427ce4cbd124..e0423b091b30 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2852,6 +2852,12 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 					segment_count, dev_seg_count);
 			return -EFSCORRUPTED;
 		}
+	} else {
+		if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_BLKZONED) &&
+					!bdev_is_zoned(sbi->sb->s_bdev)) {
+			f2fs_info(sbi, "Zoned block device path is missing");
+			return -EFSCORRUPTED;
+		}
 	}
 
 	if (secs_per_zone > total_sections || !secs_per_zone) {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
