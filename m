Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D69A79CA0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 09:10:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0Eit-0002Zh-QE;
	Thu, 03 Apr 2025 07:10:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u0Eis-0002ZT-IT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKDewctWhP7PED0Upz2Gg0PgzU3oqRLoaY3IZRnmTbQ=; b=Wf+fz3bnd8yBTeDvbVCBN3jtE9
 GFg7rpiZQY5ZJGAsGrEWxXEBPeThR11UIcFeXFZyjVrJEHrUzFGqvBOz88E/QE56lrBHzmcsu2s54
 7tydCBIdK+ryryY4BPoAHfMUBSJGVkS3z2o2nfbzbqGzv2ukm9YTMs5erQlbAS6IoIg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DKDewctWhP7PED0Upz2Gg0PgzU3oqRLoaY3IZRnmTbQ=; b=A
 VK5MLEjXaqCcdyxL5ZnF3RAosqXPDCFZQJ2hp3H68MDlZZw7/m9AY8m/bwWB40AG+ImVr4YHgjUvo
 ljNDoUrQ1R41U/jM+xFbc9Xd/0miUra9jliGI7ns0oDgx18L3F23LAfpkldkN6zjPt8HFK5MIVdva
 B+SC9I7lwm00Rx2g=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u0Eic-0005p7-8S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:10:47 +0000
X-AuditID: a67dfc59-057ff7000000aab6-aa-67ee345b08a5
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  3 Apr 2025 16:10:15 +0900
Message-ID: <20250403071016.2940-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzSDfa5F26wf9nwhanp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZcz/dIyp4AtfxfxF
 Z9kaGPfwdDFyckgImEg8+3WRvYuRA8x+sJQXJMwmoCHxp7eXGcQWEdCUONI5kx3EZhYok9jz
 5wgLSLmwQLxE1z9NkDCLgKrEuQedYCW8AmYSBy7/YoKYrimx48t5Joi4oMTJmU9YIMbISzRv
 nQ00nguo5i6rxLInJ1ggGiQlDq64wTKBkXcWkp5ZSHoWMDKtYhTJzCvLTczMMdYrzs6ozMus
 0EvOz93ECAylZbV/IncwfrsQfIhRgINRiYe349rbdCHWxLLiytxDjBIczEoivIVaQCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8Rt/KU4QE0hNLUrNTUwtSi2CyTBycUg2MefocK4Qm/wo/abtx
 06w+ToUJoSdZ2fPnTZjJGjn9UVjbrHV/ZgWcXHDx8uvXf65FrfjD/WJZi76ArMKl3jyVdn+/
 zR71/OK+d3wXNUXLTDwgceaPyDKhtOll815emX1j5q99v3zntPiIevSeZvrbeSYzaXOBg8p5
 vcrm2DlNbLbcjDnCLtySSizFGYmGWsxFxYkAVY1cziECAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOJMWRmVeSWpSXmKPExsXCNUNljm60ybt0gysPeS1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgypj/6RhTwRe+ivmLzrI1MO7h6WLk4JAQMJF4sJS3i5GTg01AQ+JPby8ziC0ioClxpHMm
 O4jNLFAmsefPERaQcmGBeImuf5ogYRYBVYlzDzrBSngFzCQOXP7FBGJLALXu+HKeCSIuKHFy
 5hMWiDHyEs1bZzNPYOSahSQ1C0lqASPTKkaRzLyy3MTMHDO94uyMyrzMCr3k/NxNjMDgWFb7
 Z9IOxm+X3Q8xCnAwKvHwXjB5my7EmlhWXJl7iFGCg1lJhLdQCyjEm5JYWZValB9fVJqTWnyI
 UZqDRUmc1ys8NUFIID2xJDU7NbUgtQgmy8TBKdXAqL5mudji7y28C42/vNzTEsf4yFz+bkDU
 6ftr6r5VL9/FeW2/k25l/0zR32f14kWvZgm/+xKzw+DjNec+wZ1zO9Q015cwrlqv47bIjnn5
 rQtnuTVTQ0NZtH8KLrz0LTq8WuBU/NQPU9z27dgiPdVCa+N0o7KeKq9pbxcVn/FgOjp384vu
 t+f2zVViKc5INNRiLipOBACTzfbeCgIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When selecting a victim using next_victim_seg in a large
 section, 
 the selected section might already have been cleared and designated as the
 new current section, making it actively in use. This behavi [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1u0Eic-0005p7-8S
Subject: [f2fs-dev] [PATCH v4] f2fs: prevent the current section from being
 selected as a victim during GC
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When selecting a victim using next_victim_seg in a large section, the
selected section might already have been cleared and designated as the
new current section, making it actively in use.
This behavior causes inconsistency between the SIT and SSA.

F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
Call trace:
dump_backtrace+0xe8/0x10c
show_stack+0x18/0x28
dump_stack_lvl+0x50/0x6c
dump_stack+0x18/0x28
f2fs_stop_checkpoint+0x1c/0x3c
do_garbage_collect+0x41c/0x271c
f2fs_gc+0x27c/0x828
gc_thread_func+0x290/0x88c
kthread+0x11c/0x164
ret_from_fork+0x10/0x20

issue scenario
segs_per_sec=2
- seg#0 and seg#1 are all dirty
- all valid blocks are removed in seg#1
- gc select this sec and next_victim_seg=seg#0
- migrate seg#0, next_victim_seg=seg#1
- checkpoint -> sec(seg#0, seg#1)  becomes free
- allocator assigns sec(seg#0, seg#1) to curseg
- gc tries to migrate seg#1

Signed-off-by: yohan.joung <yohan.joung@sk.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..1398d2973ffe 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		next = find_next_bit(free_i->free_segmap,
 				start_segno + SEGS_PER_SEC(sbi), start_segno);
 		if (next >= start_segno + usable_segs) {
-			if (test_and_clear_bit(secno, free_i->free_secmap))
+			if (test_and_clear_bit(secno, free_i->free_secmap)) {
 				free_i->free_sections++;
+
+				if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
+					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+
+				if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
+					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
+			}
 		}
 	}
 skip_free:
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
