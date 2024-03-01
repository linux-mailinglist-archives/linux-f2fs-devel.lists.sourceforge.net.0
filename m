Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76686DD0B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 09:27:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfyEL-0001Bo-EX;
	Fri, 01 Mar 2024 08:26:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rfyEH-0001Be-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N97YKCny0Cs6KHLM8g8hM3GRmmGR/JOopzKxWKTSvjQ=; b=CmeOD6WYDLcmECudDcneE8B5m4
 H/FkU7WFsGAa/xThXye3nHlJBara15hgoedEO9blqjhwPm1I85I4JYtcqa7V5lAPiYcNWNdFUUN0B
 4Lh3Mq2shmWAQZ7gTQANvyVpnJ09DX+RWvXlAndp8lkXSRUX29RLmwqXXe3RaDLxuzfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N97YKCny0Cs6KHLM8g8hM3GRmmGR/JOopzKxWKTSvjQ=; b=YLYOyvYkVeAU06Qq78gV/iWHxU
 r45UcJDWdA3MSF6Y0cP0BGj1dugD1Px756eIXNdgl1NPTWqCD5gJp4mY23o+KgUqv8fqQmLAbhYmO
 ncdNeAhwoAxIUbNQd3/U2Cc4618u2rM5H3havyeEIVd+PQLDvIMeGruviWI19eD/XJSo=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfyED-0004Zn-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:26:52 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4218QCKa055787;
 Fri, 1 Mar 2024 16:26:12 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TmLkR6XLSz2KQsFF;
 Fri,  1 Mar 2024 16:25:19 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 1 Mar 2024 16:26:09 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 1 Mar 2024 16:25:55 +0800
Message-ID: <1709281555-11373-2-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4218QCKa055787
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_gc_range may return error,
 so its caller f2fs_allocate_pinning_section
 should determine whether to do retry based on ist return value. Also just
 do f2fs_gc_range when f2fs_allocate_new_section return -EAGAIN, and check
 cp error case in f2fs_gc_range. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfyED-0004Zn-Jc
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to check return value of
 f2fs_gc_range
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
 zhiguo.niu@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_gc_range may return error, so its caller
f2fs_allocate_pinning_section should determine whether
to do retry based on ist return value.

Also just do f2fs_gc_range when f2fs_allocate_new_section
return -EAGAIN, and check cp error case in f2fs_gc_range.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/gc.c      |  3 +++
 fs/f2fs/segment.c | 13 ++++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e435e1f..c60b747 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1986,6 +1986,9 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 	unsigned int segno;
 	unsigned int gc_secs = dry_run_sections;
 
+	if (unlikely(f2fs_cp_error(sbi)))
+		return -EIO;
+
 	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
 		struct gc_inode_list gc_list = {
 			.ilist = LIST_HEAD_INIT(gc_list.ilist),
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 72f6ee3..1bb3019 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3109,6 +3109,7 @@ static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int old_segno;
+	int err = 0;
 
 	if (type == CURSEG_COLD_DATA_PINNED && !curseg->inited)
 		goto allocate;
@@ -3121,8 +3122,9 @@ static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 
 allocate:
 	old_segno = curseg->segno;
-	if (new_curseg(sbi, type, true))
-		return -EAGAIN;
+	err = new_curseg(sbi, type, true);
+	if (err)
+		return err;
 	stat_inc_seg_type(sbi, curseg);
 	locate_dirty_segment(sbi, old_segno);
 	return 0;
@@ -3151,13 +3153,14 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
 	err = f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
 	f2fs_unlock_op(sbi);
 
-	if (f2fs_sb_has_blkzoned(sbi) && err && gc_required) {
+	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
 		f2fs_down_write(&sbi->gc_lock);
-		f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk), true, 1);
+		err = f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk), true, 1);
 		f2fs_up_write(&sbi->gc_lock);
 
 		gc_required = false;
-		goto retry;
+		if (!err)
+			goto retry;
 	}
 
 	return err;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
