Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A401CFBEAE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70I-0005DU-I7; Thu, 14 Nov 2019 04:45:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70G-0005D3-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2fb00h4B+DnYaEF/Odq6Jv4p4uWTenx0b+j/p6/6VsU=; b=V7yWHDoio5SqwSdDJ1UG0YXwQP
 BURQQIeLCaBmUKW/c5g5AdYDXtPcYEMBMYwKyDhYIwcgzTItlMkPduOo56dmqXK42b0TLZD7csoka
 vhTq/GD7J7GJ5JdbX2A2c1ekCiolVdvKWI5SulrKbw2F3H9i1fI6ZhzNSoiZxJZmk1jE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2fb00h4B+DnYaEF/Odq6Jv4p4uWTenx0b+j/p6/6VsU=; b=R4TmkIUpCUhKmsu1cjZy0r5+7M
 uud5j8sVT4x0DqG15r+hegjvEvN1KPSRUHIvb8awVJkOv6HhgFNxKjfz426SIVXfV+on9NT4uLU5L
 GYONL6WtbEAySFb3xJpUakx/2kKl54N4bbUEJRx0BDvS755s+tTAAboB4QuZoppcdpAE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70F-002ZD6-8g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706708; x=1605242708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFSPQB5CGW6gzgtCWBs8hNdY06lSauRcAysdw7G2x2s=;
 b=rvJop/jm3d51f51EJ/ZmRSF9KcmTOREUZLElBvVtpuivTG2rO17ziY+7
 YYuGijSJECOdIzdLIL8oP5ntJaSGaj/59WlqNREhzzFvEnuj1+AZ+io62
 uxAflyQrEVnmPjz8FqlaLeflfnYgfGlDE0r2XtClcg/aLRAf1bwd06ojy
 MTVtrhXUEPRPXqA6Xfg54XvUGF1iPBcEUG7fbyw4p1JdzfzXxfU3mYh2e
 sl5xOMTsSQAh61RhAwboEAPR0OKud/iFVJf27xsGpfCyn+YCWkWifS0O+
 iu3aeV8S9rqNXdc2RH2fhSdiy8jlm1nrPp/IuQNOQZog6We3mWb7ReAUb A==;
IronPort-SDR: CtO/+JFKAhRAe+rVC70oWCiztjVu0e/DL/9ZrLVPqR7oBLxi81/KGEppNPUdpll3ibca74FBH6
 PL6+CU5WlIoM8tIj74/ppPSPHyx1mue2LpwvcDmXq/XjNVMjFVn89r/KcZz48HDmuBzG/fgx/n
 ruBBTvXdd+Ji01sykZylW0L3ANQ9o4u3KDYPhRRxQCl9jgNXR3Jt4kvlCahdssWCUOLGZmNZaC
 1qPef9bpaHREdL4/RcwK9gat2N9uy0HayLkI60wO2wuSo63IYw+2rwHn5MAKYF2GDnxjLxGM9D
 yUs=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411449"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:02 +0800
IronPort-SDR: XmF6G2tSRSdSlgI1tXke/QEcauqn1vC6gVZ4zLlUzPpBqCSwiG2ZyyDZ8L1xI3XWS9B+Ni8ofB
 y/qI73NeUNFhYjDxR74Vzue29n1YcK47eornCxAamBlt7PMH/UwvxKW+F3QhJ2ykQNcLA0ejXF
 dOnGsTIW60Vau7UTZOiLsSATe+VzlTWUymVf7oA2pqB+s57+GvKO66Koh9MUAdU82i3eMylKfR
 A36OzsSHY+bDFCQtqld9kPthqZQgv2brlFFPsG6ah9pso3PBOEhqpBmQNZkrOaSadcVWPXIpGP
 BlQlLt5cF9+n8kaMdCx9IGWK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:01 -0800
IronPort-SDR: C5+lOEsLQQHpuYmIyyCNr1+jC1vs7b/qFAh0Ts7zhGqefoe9HW37I18IFq8KHK0DORjyK3hJ6y
 V7W8dPyblws2UjXjYrDW/R+YD7xgzFZUa5qQ9XukYqCVcbK+NLB97NRWPGgXRxo6+TpXFe5oE6
 MD6AAK0Sxc9tW/Ikc8+vhCmnJiQCwIDPsM3ApQrvnBrMrs67IMmg7SsRIe42zB56GCIVMFedmw
 Gg20tJHOwUQWy4K4xzeJHynYvW6XTKLvg+NC3lKZ4Gf4IfnHos4LdwO36zwiEaSD9NIGaL9wBh
 z5c=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:02 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:50 +0900
Message-Id: <20191114044454.200461-5-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iV70F-002ZD6-8g
Subject: [f2fs-dev] [PATCH v7 4/8] fsck: Find free zones instead of blocks
 to assign to current segments
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

When fsck needs to assign a new area to a curreng segment, it calls
find_next_free_block() function to find a new block to assign. For zoned
block devices, fsck checks write pointer consistency with current
segments' positions. In case a curseg is inconsistent with the
write pointer of the zone it points to, fsck should assign not a new free
block but a new free zone/section with write pointer at the zone start,
so that next write to the current segment succeeds without error.

To extend find_next_free_block() function's capability to find not only
a block but also a zone/section, add new_sec flag to
find_next_free_block() function. When new_sec flag is true, skip check
for each block's availability so that the check is done with unit of
section. Note that it is ensured that one zone has one section for f2fs
on zoned block devices. Then the logic to find a new free section is good
to find a new free zone.

When fsck target devices have ZONED_HM model, set new_sec flag true to
call find_next_free_block() from move_curseg_info(). Set curseg's
alloc_type not SSR but LFS for the devices with ZONED_HM model, because
SSR block allocation is not allowed for zoned block devices. Also skip
relocate_curseg_offset() for the devices with ZONED_HM model for the
same reason.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/defrag.c  |  2 +-
 fsck/f2fs.h    |  1 +
 fsck/fsck.h    |  2 +-
 fsck/mount.c   | 13 +++++++++----
 fsck/segment.c |  2 +-
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index fc6b7cf..3473637 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -77,7 +77,7 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 		if (!f2fs_test_bit(offset, (const char *)se->cur_valid_map))
 			continue;
 
-		if (find_next_free_block(sbi, &target, left, se->type)) {
+		if (find_next_free_block(sbi, &target, left, se->type, false)) {
 			MSG(0, "Not enough space to migrate blocks");
 			return -1;
 		}
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 399c74d..59d2cc8 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -14,6 +14,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdio.h>
+#include <stdbool.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <string.h>
diff --git a/fsck/fsck.h b/fsck/fsck.h
index ccf4a39..8da0ebb 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -191,7 +191,7 @@ extern void zero_journal_entries(struct f2fs_sb_info *);
 extern void flush_sit_entries(struct f2fs_sb_info *);
 extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
 extern void write_curseg_info(struct f2fs_sb_info *);
-extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
+extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 7d268e3..7ce885c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2445,6 +2445,9 @@ int relocate_curseg_offset(struct f2fs_sb_info *sbi, int type)
 	struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
 	unsigned int i;
 
+	if (c.zoned_model == F2FS_ZONED_HM)
+		return -EINVAL;
+
 	for (i = 0; i < sbi->blocks_per_seg; i++) {
 		if (!f2fs_test_bit(i, (const char *)se->cur_valid_map))
 			break;
@@ -2477,7 +2480,8 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 	}
 }
 
-int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type)
+int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
+						int want_type, bool new_sec)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct seg_entry *se;
@@ -2535,7 +2539,7 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
 			}
 		}
 
-		if (type == want_type &&
+		if (type == want_type && !new_sec &&
 			!f2fs_test_bit(offset, (const char *)bitmap))
 			return 0;
 
@@ -2561,13 +2565,14 @@ void move_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left)
 		ASSERT(ret >= 0);
 
 		to = from;
-		ret = find_next_free_block(sbi, &to, left, i);
+		ret = find_next_free_block(sbi, &to, left, i,
+					   c.zoned_model == F2FS_ZONED_HM);
 		ASSERT(ret == 0);
 
 		old_segno = curseg->segno;
 		curseg->segno = GET_SEGNO(sbi, to);
 		curseg->next_blkoff = OFFSET_IN_SEG(sbi, to);
-		curseg->alloc_type = SSR;
+		curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
 
 		/* update new segno */
 		ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
diff --git a/fsck/segment.c b/fsck/segment.c
index e3a90da..ccde05f 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -52,7 +52,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	blkaddr = SM_I(sbi)->main_blkaddr;
 
-	if (find_next_free_block(sbi, &blkaddr, 0, type)) {
+	if (find_next_free_block(sbi, &blkaddr, 0, type, false)) {
 		ERR_MSG("Can't find free block");
 		ASSERT(0);
 	}
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
