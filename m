Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DFA7B25F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Apr 2025 01:21:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0TsU-00054L-Hw;
	Thu, 03 Apr 2025 23:21:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u0TsT-00054B-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 23:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G1V6PwqH7BMQ97XkG02pq4AsLycT0KN5p+U2RGdD7zQ=; b=aJvtCxsOyNOcY8q7n9hkJTFaf+
 P4iwU56XFdowrJ9X4GsqYM6vRzEVZVdbxQfOVNxZ64uuuV72jUAw1oyPrwTlsUKYBa7HAFLaT9mBM
 becAAa526HmYAOEbXQTLZWhNi3/ojfviJX/mM1GKB55nrIfKjstoDhaah3Ud+UPshfzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G1V6PwqH7BMQ97XkG02pq4AsLycT0KN5p+U2RGdD7zQ=; b=H
 O3qtJoQIG1WFLwPUpcPmT3j1/FI4kRGKVmV/v709c0HoZ0/I7N8ngIRaFnLKS73weZjkGJy19QoP/
 fqKlNBgAV+VwpEIXo6fEENYi7ZyEEAiVdrqF1Kn4EWD2BKOQiCvIQTlLO6o/m7YHjp7qDbxZYLjPu
 smdeUhD5YBFkCKC8=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u0TsC-0000Jl-2U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 23:21:41 +0000
X-AuditID: a67dfc59-057ff7000000aab6-5c-67ef17e8b7e0
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  4 Apr 2025 08:21:06 +0900
Message-ID: <20250403232107.2960-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhesuzSPeF+Pt0g10b2SxOTz3LZPFk/Sxm
 i0uL3C0u75rD5sDisWlVJ5vH7gWfmTw+b5ILYI7isklJzcksSy3St0vgyjh74gJ7wT++it8n
 prA2MB7h6WLk5JAQMJHYOHs6I4y9aNIlMJtNQEPiT28vM4gtIqApcaRzJjuIzSxQJrHnzxEW
 EFtYIF7i7uYONhCbRUBVomPXMrBeXgEzie7Xf1kgZmpK7PhyngkiLihxcuYTFog58hLNW2cz
 Q9TcZJWYe1ALwpaUOLjiBssERt5ZSFpmIWlZwMi0ilEkM68sNzEzx1ivODujMi+zQi85P3cT
 IzCYltX+idzB+O1C8CFGAQ5GJR5ei8J36UKsiWXFlbmHGCU4mJVEeGW53qcL8aYkVlalFuXH
 F5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYFzzhFlv8sbpvhs/P3l+Ie5Z
 +VMfpSUtW5wuLcwtuGak/ceMnYFrCf8+3+C3On3enP+Yj09WMotpVl4iGBq46syFeWdnfS+Z
 yNe6Z1Ls2QXbpvgLO2vOFu/982TLzYezHx354aRal8Tc4DDRaolQfl2Su9S6R49YfIOvHQuy
 Ptuv8e5R60OBd8pKLMUZiYZazEXFiQDcP3A5IgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJJMWRmVeSWpSXmKPExsXCNUNlju5z8ffpBr9XWFicnnqWyeLJ+lnM
 FpcWuVtc3jWHzWLC3KtMFu+33mN0YPPYtKqTzWP3gs9MHt9ue3h83iQXwBLFZZOSmpNZllqk
 b5fAlXH2xAX2gn98Fb9PTGFtYDzC08XIySEhYCKxaNIlRhCbTUBD4k9vLzOILSKgKXGkcyY7
 iM0sUCax588RFhBbWCBe4u7mDjYQm0VAVaJj1zKwXl4BM4nu139ZIGZqSuz4cp4JIi4ocXLm
 ExaIOfISzVtnM09g5JqFJDULSWoBI9MqRpHMvLLcxMwcM73i7IzKvMwKveT83E2MwABZVvtn
 0g7Gb5fdDzEKcDAq8fBaFL5LF2JNLCuuzD3EKMHBrCTCK8v1Pl2INyWxsiq1KD++qDQntfgQ
 ozQHi5I4r1d4aoKQQHpiSWp2ampBahFMlomDU6qBMbnRR2r/vLAINjGllCe2pS9NTdLXX5OK
 bHt7O1n16/VIz90taRxB0mZBon4alWYs0aHmMaaT9mi8CK7mvPiwr+DtWnfreczbzu67qHX+
 voGbu2TpzKRI79lcwoU27tHH3rX/Wbfxd6Cn09USh6/PbH8ujLFv3r7lUAp76ocUtvlfhc0P
 BCgqsRRnJBpqMRcVJwIA72O5/wwCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u0TsC-0000Jl-2U
Subject: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from being
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
index 0465dc00b349..0773283babfa 100644
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
+				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
+					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+
+				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
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
