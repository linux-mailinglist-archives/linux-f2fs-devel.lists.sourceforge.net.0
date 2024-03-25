Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F763888FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Mar 2024 06:57:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rodKl-0006TX-Bp;
	Mon, 25 Mar 2024 05:57:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rodKi-0006TD-Pe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 05:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71ksiVuQJfLauOg/uDmrYfOhTXM+ciIwcjHvu+Z1JXY=; b=Whwi4Pjv5i7uYtvItLcswIH34b
 +zSA7YPKE+jpuyjF7rwssOp4WgfopnDW8Ur1qeOXR9CPrLT0mNuiVsphFDRJ/Zz4poX9jJIjCQn4x
 2E+1Chc8KXphFya2yPa0OgiiunblGTmPvyQFZx+hTKyPM08ZRJCPbDwkbkWC7XvwcZwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=71ksiVuQJfLauOg/uDmrYfOhTXM+ciIwcjHvu+Z1JXY=; b=k
 l8AHOEBlzCkEaULHou9mMMhoxuLx7WTu3LlNCZoypEf29TPW2WSxie5dPOKwglLWqoPr1yIjdH0en
 yLmmbaFUzYmQekXLI1wr8Qbpc6XLDPtXqkiEMj8MOwrDHtKklvFQmHmBm+Rb0TmXBj62jkj4uOeJQ
 0D9i1RbTc/CSr86Q=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rodKh-0005cw-KM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 05:57:21 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42P5uic2078365;
 Mon, 25 Mar 2024 13:56:44 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4V32G14BRMz2KXJwC;
 Mon, 25 Mar 2024 13:55:05 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 25 Mar 2024 13:56:42 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 25 Mar 2024 13:56:35 +0800
Message-ID: <1711346195-24555-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42P5uic2078365
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A length that exceeds the real size of the inode may be
 specified
 from user, although these out-of-range areas are not mapped, but they still
 need to be check in while loop, which is unnecessary. Signed-off-by: Zhiguo
 Niu <zhiguo.niu@unisoc.com> --- v2: check i_size within inode lock according
 to Chao's suggestions --- --- fs/f2fs/file.c | 11 +++++++---- 1 file changed, 
 7 insertions(+), 4 dele [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rodKh-0005cw-KM
Subject: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropirate defragment
 pg_end
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

A length that exceeds the real size of the inode may be
specified from user, although these out-of-range areas
are not mapped, but they still need to be check in
while loop, which is unnecessary.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v2: check i_size within inode lock according to Chao's suggestions
---
---
 fs/f2fs/file.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 128e53d..cf63db7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2608,9 +2608,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	bool fragmented = false;
 	int err;
 
-	pg_start = range->start >> PAGE_SHIFT;
-	pg_end = (range->start + range->len) >> PAGE_SHIFT;
-
 	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
@@ -2629,10 +2626,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	/* writeback all dirty pages in the range */
 	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
-						range->start + range->len - 1);
+						min_t(loff_t, range->start + range->len - 1,
+						i_size_read(inode) - 1));
 	if (err)
 		goto out;
 
+	pg_start = range->start >> PAGE_SHIFT;
+	pg_end = min_t(pgoff_t,
+				(range->start + range->len) >> PAGE_SHIFT,
+				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
+
 	/*
 	 * lookup mapping info in extent cache, skip defragmenting if physical
 	 * block addresses are continuous.
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
