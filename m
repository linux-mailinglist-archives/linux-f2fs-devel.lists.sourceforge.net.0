Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 142C084C22C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 03:02:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXXGI-0004bx-QK;
	Wed, 07 Feb 2024 02:02:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rXXGG-0004be-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaJn8xlKsjzx/iIIxNAPS5wLhotT9xnLZevse49RQwg=; b=Jz0QGTmTZl/WeHO9LGVXQAUJZ8
 ONQgY7wtOB/vdJmAIOeajEMHCbEWqG1CJhnWmsAotNz9WLmNSracNG2MIiVZmjSpdksU/J8uO7CVE
 UfVzsRoxtPlc9y6ZwgPwbU3kYNR7WqoKz4a7Hgjlk4LPyIww1Na/C5u/3sGQ1/cuuH9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LaJn8xlKsjzx/iIIxNAPS5wLhotT9xnLZevse49RQwg=; b=MqDSx5sTxwcMRHp5N0lFQPwzJT
 AYKTzB9EmOxdFS87GIJYrhgVvw14YYxNVyool5Mp+CxX84NptMZ7UTEt1kl4sLjygffJAjtTY3afT
 ABgx7FTSaUDVjp+LHbrSScy4w7VfSF5fODW/ukx9o3TdrW9X5bPweDFlbWeWwA4TeoJg=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXXGF-00072J-Km for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:05 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41721TTX075531;
 Wed, 7 Feb 2024 10:01:29 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TV3J13RTXz2K4cHw;
 Wed,  7 Feb 2024 10:01:21 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 7 Feb 2024 10:01:26 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 7 Feb 2024 10:01:01 +0800
Message-ID: <1707271264-5551-2-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41721TTX075531
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a corner scenario on a small-capacity partition with
 64MB size: 1. The main area has a total of 24 segments, and there are no
 free segments left shown from the free_segmap bitmap and free_sec [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXXGF-00072J-Km
Subject: [f2fs-dev] [PATCH v2 1/4] f2fs: correct counting methods of
 free_segments in __set_inuse
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

There is a corner scenario on a small-capacity partition with 64MB size:
1. The main area has a total of 24 segments, and there are no free
segments left shown from the free_segmap bitmap and free_secmap in
free_segmap_info.
---------------------------------------------------------------------
bitmap value: ffffffffffffffff
---------------------------------------------------------------------
2. When doing gc, an out-of-bounds segment with segno=24 is allocated.
Because CONFIG_F2FS_CHECK_FS is not enabled, f2fs_bug_on in get_new_segment
just print warning log but the subsequent process continues to run.
---------------------------------------------------------------------
got_it:
    /* set it as dirty segment in free segmap */
    f2fs_bug_on(sbi, test_bit(segno, free_i->free_segmap));
    __set_inuse(sbi, segno);
----------------------------------------------------------------------
3. __set_inuse directly sets free_i->free_segments--,
As a result, free_i->free_segments=-1, as shown in the following
coredump information:
----------------------------------------------------------------------
  crash_arm64> struct free_segmap_info 0xffffff8084d9a000 -x
  struct free_segmap_info {
  start_segno = 0x7,
  free_segments = 0xffffffff,
  free_sections = 0x0,
----------------------------------------------------------------------
This is unreasonable and will cause free_segments and free_sections
counts mismatch if there are segments released as free.

So same counting methods like free_sections should be used to
free_segments.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8129be7..f2847f1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -463,8 +463,8 @@ static inline void __set_inuse(struct f2fs_sb_info *sbi,
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 
-	set_bit(segno, free_i->free_segmap);
-	free_i->free_segments--;
+	if (!test_and_set_bit(segno, free_i->free_segmap))
+		free_i->free_segments--;
 	if (!test_and_set_bit(secno, free_i->free_secmap))
 		free_i->free_sections--;
 }
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
