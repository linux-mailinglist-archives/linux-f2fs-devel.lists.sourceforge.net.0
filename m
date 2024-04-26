Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B90568B36D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Apr 2024 14:03:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0KIk-0003PH-0T;
	Fri, 26 Apr 2024 12:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1s0KIg-0003PB-PA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 12:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+7FHvu39xebdzsw6m/kOCuq39fZaOLLxKTvmkrBnBU=; b=MKC18cXwTmXZNDy+5fPTW7Mfdz
 lR6kuA8HdaZ3ASCXysMFp7IFrbhO96eKABgGnFWqBwez9W5MLFboTNTQcbVGcw3IfSih6DWFwcZpk
 K9FfySYY2FU0wupZV8kuVUQhXMC/ttXJgKe5cToRAqmbDQ3f1PmWf5GBq4h+cWJGNrIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4+7FHvu39xebdzsw6m/kOCuq39fZaOLLxKTvmkrBnBU=; b=K
 Qjz22T//rxuxubBT6kGO+trN1SI5sPuhuKImPZ+XeBJSefjHRNENxDBjvjVsyFmYO6xBJFtFGV9bh
 DygtGDGvQOSUdHs7oA5vOCBsyZNW4XQJeIWH0aMsipwG/cug7AQxkx2kMGk/GZMiS4ajBpI/wAKnZ
 BKIx5gIL5v5KEnx0=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s0KIe-0000c7-ET for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Apr 2024 12:03:34 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 43QC1c1w090269;
 Fri, 26 Apr 2024 20:01:38 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4VQrq51X47z2Nr60C;
 Fri, 26 Apr 2024 19:58:57 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 26 Apr 2024 20:01:37 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 26 Apr 2024 20:01:29 +0800
Message-ID: <1714132889-9423-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 43QC1c1w090269
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit d7e9a9037de2 ("f2fs: Support Block Size == Page
 Size"), Some comments are confused and just correct with block size is 4KB.
 Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- v2: add comments
 "support
 64 TB disk size for 16K page size" --- --- include/linux/f2fs_fs.h | 10
 +++++++--- 1 file changed, 7 insertions(+), 3 de [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1s0KIe-0000c7-ET
Subject: [f2fs-dev] [PATCH V2] f2fs: fix some ambiguous comments
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

After commit d7e9a9037de2 ("f2fs: Support Block Size == Page Size"),
Some comments are confused and just correct with block size is 4KB.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v2: add comments "support 64 TB disk size for 16K page size"
---
---
 include/linux/f2fs_fs.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a357287..41d1d71 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -394,7 +394,8 @@ struct f2fs_nat_block {
 
 /*
  * F2FS uses 4 bytes to represent block address. As a result, supported size of
- * disk is 16 TB and it equals to 16 * 1024 * 1024 / 2 segments.
+ * disk is 16 TB for a 4K page size and 64 TB for a 16K page size and it equals
+ * to 16 * 1024 * 1024 / 2 segments.
  */
 #define F2FS_MAX_SEGMENT       ((16 * 1024 * 1024) / 2)
 
@@ -424,8 +425,10 @@ struct f2fs_sit_block {
 /*
  * For segment summary
  *
- * One summary block contains exactly 512 summary entries, which represents
- * exactly one segment by default. Not allow to change the basic units.
+ * One summary block with 4KB size contains exactly 512 summary entries, which
+ * represents exactly one segment with 2MB size.
+ * Similarly, in the case of block with 16KB size, it represents one segment with 8MB size.
+ * Not allow to change the basic units.
  *
  * NOTE: For initializing fields, you must use set_summary
  *
@@ -556,6 +559,7 @@ struct f2fs_summary_block {
 
 /*
  * space utilization of regular dentry and inline dentry (w/o extra reservation)
+ * when block size is 4KB.
  *		regular dentry		inline dentry (def)	inline dentry (min)
  * bitmap	1 * 27 = 27		1 * 23 = 23		1 * 1 = 1
  * reserved	1 * 3 = 3		1 * 7 = 7		1 * 1 = 1
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
