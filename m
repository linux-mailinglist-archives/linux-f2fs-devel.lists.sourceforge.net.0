Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4CA785E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 02:53:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzmM9-0001fR-7j;
	Wed, 02 Apr 2025 00:53:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1tzmM7-0001fD-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/3FkMq8zSX1LRYcPyK0quSDMfcfTZgOMk/B35pGgHPQ=; b=eawhpOMHeqjPXhe9lio4bjqOrA
 L3U8rfmNFjz4Fj7NHSUkak+gIu/kx0w5NjgQnV7MLuvhssQ07VIyTfTQNj+Jsu3WAoFqwMSpvdMkG
 1Gji2LV/hUPHYitrycfQKAxomDAbWw4dtjkFJ7tJ/vHARGJoLly7Kemr2ML2yBkf/TQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/3FkMq8zSX1LRYcPyK0quSDMfcfTZgOMk/B35pGgHPQ=; b=i
 NZ4bqXKUKlP0BSz4kgS73STe8yydARwvQIignPHwB+M0vxhHbSUt1dok3+jupDXLD1H7qT7TVt4ae
 4exo+tK2PYoKcq2MJiEhx9RAFyDEc/lf8ihPuMwhRlrLDFcxqMohItPxSPGBxacSp+/zKcsFezBwC
 E2vVhGj8fGKd8zM4=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tzmLr-0000EL-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:53:24 +0000
X-AuditID: a67dfc59-057ff7000000aab6-3e-67ec8a6895c1
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  2 Apr 2025 09:52:18 +0900
Message-ID: <20250402005219.2759-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LhesuzUDej6026wfFDMhanp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZTRtMCl4zl/xbe9v
 tgbGmbxdjJwcEgImEnvWn2ODsRvWfGYCsdkENCT+9PYyg9giApoSRzpnsoPYzAJlEnv+HGEB
 sYUF4iXO/bkHVM/BwSKgKvHmvwRImFfATOLx1RYmiJGaEju+nGeCiAtKnJz5hAVijLxE89bZ
 QOO5gGpuskpsnnoe6gZJiYMrbrBMYOSdhaRnFpKeBYxMqxhFMvPKchMzc4z1irMzKvMyK/SS
 83M3MQJDaVntn8gdjN8uBB9iFOBgVOLhbeB9ky7EmlhWXJl7iFGCg1lJhDfi68t0Id6UxMqq
 1KL8+KLSnNTiQ4zSHCxK4rxG38pThATSE0tSs1NTC1KLYLJMHJxSDYx8exX+tImES/r5m/sK
 yhx1sPhw/vK6a0YzPj3ZyX/S+rWJeyWXpZLZ7qKub4q9O8/+6pohOWNuVFmhxylH0YLa5IJ5
 p+Y7Xpi8siduQqPNZ7vKawHHk9mabmfuyH5bFeaoXL4+Z2LGc0aV0/qG11y3rRBzT7jItmH3
 PImlqqcEL4RcLfGe91mJpTgj0VCLuag4EQBJEN9uIQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOJMWRmVeSWpSXmKPExsXCNUNljm5G15t0g4U94hanp55lsniyfhaz
 xaVF7haXd81hs5gw9yqTxfut9xgd2Dw2repk89i94DOTx7fbHh6fN8kFsERx2aSk5mSWpRbp
 2yVwZTRtMCl4zl/xbe9vtgbGmbxdjJwcEgImEg1rPjOB2GwCGhJ/enuZQWwRAU2JI50z2UFs
 ZoEyiT1/jrCA2MIC8RLn/twDqufgYBFQlXjzXwIkzCtgJvH4agsTxEhNiR1fzjNBxAUlTs58
 wgIxRl6ieets5gmMXLOQpGYhSS1gZFrFKJKZV5abmJljplecnVGZl1mhl5yfu4kRGBzLav9M
 2sH47bL7IUYBDkYlHt4G3jfpQqyJZcWVuYcYJTiYlUR4I76+TBfiTUmsrEotyo8vKs1JLT7E
 KM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpgzCh+e9GO4fIie7OmDuOTFvxCTovMN0Ve
 Sshs+J/6/mWgwLf0IBuXfK/uVbve/X2UxvfmJu/8ixP/GbBzCF12mebmmLLt7ISOPekZLY+y
 l8258eRqb5Gk3yeHC5ulN92ZtPRCW3eSVcy7vMzFs5681Quvanp/uMzp/bFf35sOHGev5bv4
 5srBICWW4oxEQy3mouJEAKHlf04KAgAA
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tzmLr-0000EL-Ei
Subject: [f2fs-dev] [PATCH v2] f2fs: prevent the current section from being
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
 fs/f2fs/segment.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..14d18bcf3559 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -460,6 +460,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		unsigned int segno, bool inmem)
 {
 	struct free_segmap_info *free_i = FREE_I(sbi);
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
@@ -476,6 +477,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 		if (next >= start_segno + usable_segs) {
 			if (test_and_clear_bit(secno, free_i->free_secmap))
 				free_i->free_sections++;
+
+			if (test_and_clear_bit(secno, dirty_i->victim_secmap)) {
+				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
+				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
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
