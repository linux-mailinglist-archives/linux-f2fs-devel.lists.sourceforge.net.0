Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20B84C22E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 03:02:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXXGN-0008MC-L4;
	Wed, 07 Feb 2024 02:02:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rXXGL-0008M5-Mf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWtkAVeJ9KZLPFoWOjJPFsaKFQ05kqDAUgrmDVzZhFI=; b=RNgPX2QBhTLnXIBrbb8vxrww75
 Et3mpXROdF+V8unih/EOEJz5a3vj5XYA8+se2HiJihFuVThieV9W4ehAqzxqX/2OQiIcg6WCoE64u
 aJ/nSj3K+ZwtdjamuVbDXCD3fBovwiAQXHWg+1FejaMYgxl90aGma9d9KvV1SQzyhbwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NWtkAVeJ9KZLPFoWOjJPFsaKFQ05kqDAUgrmDVzZhFI=; b=iJ7niZvPSjdk/+kZAaHCocRoZq
 b9Et5u2bdvcnM2raaZ9fCtuazw2THYkmkMDEVcS71lxuTkRQkzSBZjelTBcJlEdpyIRvxiuZyMAWv
 KQMpKKkmVeKPQT7VB3PEjTDE5IlaaDGNUbPElFoeY0EdAkLsxbYIYYdVleOrlGmSSybs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXXGK-00072Y-MP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:10 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41721YXP075835;
 Wed, 7 Feb 2024 10:01:34 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TV3J65frxz2K4cHw;
 Wed,  7 Feb 2024 10:01:26 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 7 Feb 2024 10:01:31 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 7 Feb 2024 10:01:03 +0800
Message-ID: <1707271264-5551-4-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41721YXP075835
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  NULL_SEGNO should also be returned when the blk_addr value
 is out-of-bound main area even __is_valid_data_blkaddr return true. For
 example, 
 a 64MB partition with total 24 main segments has no any free segments left,
 then a new wrtie request use get_new_segment may get a out-of-bound segno
 24 if CONFIG_F2FS_CHECK_FS is not ena [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXXGK-00072Y-MP
Subject: [f2fs-dev] [PATCH v2 3/4] f2fs: enhance judgment conditions of
 GET_SEGNO
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
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NULL_SEGNO should also be returned when the blk_addr value is
out-of-bound main area even __is_valid_data_blkaddr return true.

For example, a 64MB partition with total 24 main segments has no
any free segments left, then a new wrtie request use get_new_segment
may get a out-of-bound segno 24 if CONFIG_F2FS_CHECK_FS is not enabled.
GET_SEGNO should also return NULL_SEGNO in this case rather than treating
is as valid segment.

Besides, if the caller of GET_SEGNO does not ensure blk_addr pass to
GET_SEGNO is valid, it should do sanity check about return value of
GET_SEGNO, avoid causing some unexpected problems later.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c    | 7 ++++++-
 fs/f2fs/segment.c | 4 +++-
 fs/f2fs/segment.h | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 23cd6a1..2cd3cd9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2985,9 +2985,14 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (range.dev_num != 0)
+	if (range.dev_num != 0) {
 		dev_start_segno = GET_SEGNO(sbi, FDEV(range.dev_num).start_blk);
+		if (dev_start_segno == NULL_SEGNO)
+			return -EINVAL;
+	}
 	dev_end_segno = GET_SEGNO(sbi, FDEV(range.dev_num).end_blk);
+	if (dev_end_segno == NULL_SEGNO)
+		return -EINVAL;
 
 	start_segno = sm->last_victim[FLUSH_DEVICE];
 	if (start_segno < dev_start_segno || start_segno >= dev_end_segno)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f373ff7..6772ad4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2496,7 +2496,7 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 	struct sit_info *sit_i = SIT_I(sbi);
 
 	f2fs_bug_on(sbi, addr == NULL_ADDR);
-	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
+	if (segno == NULL_SEGNO)
 		return;
 
 	f2fs_invalidate_internal_cache(sbi, addr);
@@ -3708,6 +3708,8 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	unsigned char old_alloc_type;
 
 	segno = GET_SEGNO(sbi, new_blkaddr);
+	if (segno == NULL_SEGNO)
+		return;
 	se = get_seg_entry(sbi, segno);
 	type = se->type;
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index f2847f1..b0ea315 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -96,7 +96,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & ((sbi)->blocks_per_seg - 1))
 
 #define GET_SEGNO(sbi, blk_addr)					\
-	((!__is_valid_data_blkaddr(blk_addr)) ?			\
+	((!__is_valid_data_blkaddr(blk_addr) ||			\
+	!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) ?	\
 	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
 		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
 #define BLKS_PER_SEC(sbi)					\
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
