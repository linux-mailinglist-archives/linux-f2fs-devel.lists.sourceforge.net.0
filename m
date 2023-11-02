Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B57DE9F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Nov 2023 02:23:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qyMQE-0000KU-Kh;
	Thu, 02 Nov 2023 01:22:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1qyMQD-0000KL-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Nov 2023 01:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPgdrxO08cnuWPdwuhr6uelPhhCClQMSJMdgo2D7Uy0=; b=Lk/f3tHFQswGlUUP82S3KC/31v
 7e2E4QdPX7vBdWqIikjL7gOHOa8UczyZ0I23EKmJr8CTZk/Nj68MOWGZfBE6UMSs+twHOi7LcFTmA
 87qMhzXgGTkJN+ClOPv4L7X5tpukySsSgc5Y5lW9FFUBVHncX8tI1EypPuj2us6fQG6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KPgdrxO08cnuWPdwuhr6uelPhhCClQMSJMdgo2D7Uy0=; b=b
 JvPPUn79Uh/mV65fLeKchQymXKIqK2iazJMYrVmFUqjBFU186nF176jOEJhQ5SFHGntKzABxbG9mX
 fHiPN3UehbfVgkZr/AM45Usgbi3Tl1YJ+lhBB9l1hqahNxplrdtJYCqZnXipKKogbvAAAc8Mbpzm0
 LCEVND9rsK/kISuw=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qyMQC-000KAI-0R for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Nov 2023 01:22:57 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3A21MIDF005064;
 Thu, 2 Nov 2023 09:22:18 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SLQwJ48L0z2LC54f;
 Thu,  2 Nov 2023 09:17:36 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 2 Nov 2023 09:22:16 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 2 Nov 2023 09:20:42 +0800
Message-ID: <1698888042-17199-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3A21MIDF005064
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Because the length of task'name in task_struct can not exceed
 16 characters, f2fs some thread'name cannot be fully displayed, including
 important device number information. If there are more than one [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qyMQC-000KAI-0R
Subject: [f2fs-dev] [PATCH] f2fs: fix thread name cannot be fully displayed
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
Cc: zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Because the length of task'name in task_struct can not exceed
16 characters, f2fs some thread'name cannot be fully displayed,
including important device number information.
If there are more than one partition using the f2fs file system,
it is very inconvenient to match partitions and their threads.

The following examples show that 4 partitions all use f2fs file system
PID: 400    TASK: ffffff80f120c9c0  CPU: 2   COMMAND: "f2fs_discard-25"
PID: 392    TASK: ffffff80f6b75880  CPU: 3   COMMAND: "f2fs_discard-25"
PID: 400    TASK: ffffff80f120c9c0  CPU: 2   COMMAND: "f2fs_discard-25"
PID: 392    TASK: ffffff80f6b75880  CPU: 3   COMMAND: "f2fs_discard-25"
PID: 510    TASK: ffffff80dd62c9c0  CPU: 0   COMMAND: "f2fs_ckpt-254:4"
PID: 255    TASK: ffffff80f2268000  CPU: 3   COMMAND: "f2fs_ckpt-259:4"
PID: 398    TASK: ffffff80f120ac40  CPU: 2   COMMAND: "f2fs_ckpt-259:4"
PID: 390    TASK: ffffff80f6b76740  CPU: 3   COMMAND: "f2fs_ckpt-259:4"
PID: 511    TASK: ffffff80dd629d80  CPU: 3   COMMAND: "f2fs_flush-254:"
PID: 399    TASK: ffffff80f120bb00  CPU: 2   COMMAND: "f2fs_flush-259:"
PID: 391    TASK: ffffff80f6b70000  CPU: 3   COMMAND: "f2fs_flush-259:"
PID: 256    TASK: ffffff80f226d880  CPU: 6   COMMAND: "f2fs_flush-259:"

We can use the name format such as f2fs_gc-xxx, as saw in device:
PID: 260    TASK: ffffff80f8c2e740  CPU: 3   COMMAND: "f2fs_gc-259:44"
PID: 420    TASK: ffffff80f6505880  CPU: 2   COMMAND: "f2fs_gc-259:41"
PID: 393    TASK: ffffff80f6b72c40  CPU: 1   COMMAND: "f2fs_gc-259:40
PID: 513    TASK: ffffff80dd62e740  CPU: 1   COMMAND: "f2fs_gc-254:40"

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/checkpoint.c | 2 +-
 fs/f2fs/segment.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b0597a5..f6a5424 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1893,7 +1893,7 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
 		return 0;
 
 	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
-			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
+			"f2fs_cp-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(cprc->f2fs_issue_ckpt)) {
 		int err = PTR_ERR(cprc->f2fs_issue_ckpt);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d05b416..b290713 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -677,7 +677,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 
 init_thread:
 	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
-				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
+				"f2fs_fh-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(fcc->f2fs_issue_flush)) {
 		int err = PTR_ERR(fcc->f2fs_issue_flush);
 
@@ -2248,7 +2248,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 		return 0;
 
 	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
-				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
+				"f2fs_dc-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(dcc->f2fs_issue_discard)) {
 		err = PTR_ERR(dcc->f2fs_issue_discard);
 		dcc->f2fs_issue_discard = NULL;
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
