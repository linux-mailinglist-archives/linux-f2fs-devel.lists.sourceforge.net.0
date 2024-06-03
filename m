Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E498D815D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 13:36:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE5zF-0001YD-EP;
	Mon, 03 Jun 2024 11:36:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1sE5zE-0001Xq-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 11:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H75dVYarofszrvl+CUA+22dtIxtvJQEu3KdkDCk/0BQ=; b=WJ3C/SIdYPN+YtgOMqplqvw21q
 0QXiRUU3SNzzd52llMb6XtM4+rqxyXkhY1sIzvljTNUnpXRC2VJWx/uCLEvvVHnr9vWM6Cqj7NpmB
 YFC24QFeTQd8AiEBgWzmoH/dsNxhoUwGK0YFVeSoItT0pTpLspNRsKOwTH7+O/uJGFKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H75dVYarofszrvl+CUA+22dtIxtvJQEu3KdkDCk/0BQ=; b=d
 4+aZSGXuaISAA3MEeZ+TnqfY35rDAH375npzsQ6Yx9XdDooo9I2WfutPU1cipdlCDvmkT+MyhZONW
 2eQv7IEOGTWa54AFhOZt0aBAjOGaq9Jvv4+gyn/bK5ViBnfdE/QQEorUQSRsb0ZchLlqWVH4lZidy
 XWJ+L6rZ0J8nOwcs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sE5zD-00009h-NS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 11:36:24 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 453BZgc6074903;
 Mon, 3 Jun 2024 19:35:42 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4VtBQ96W5fz2Qn07V;
 Mon,  3 Jun 2024 19:31:45 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 3 Jun 2024 19:35:40 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 3 Jun 2024 19:35:26 +0800
Message-ID: <1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 453BZgc6074903
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  IOPRIO_PRIO_DATA in the new kernel version includes level
 and hint, So Macro IOPRIO_PRIO_LEVEL is more accurate to get ckpt thread ioprio
 data/level, and it is also consisten with the way setting ckpt [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sE5zD-00009h-NS
Subject: [f2fs-dev] [PATCH V2] f2fs: use new ioprio Macro to get ckpt thread
 ioprio level
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

IOPRIO_PRIO_DATA in the new kernel version includes level and hint,
So Macro IOPRIO_PRIO_LEVEL is more accurate to get ckpt thread
ioprio data/level, and it is also consisten with the way setting
ckpt thread ioprio by IOPRIO_PRIO_VALUE(class, data/level).

Besides, change variable name from "data" to "level" for more readable.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
v2: also change variable name from "data" to "level"
---
---
 fs/f2fs/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 72676c5..c0b0468 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -340,13 +340,13 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
 		struct ckpt_req_control *cprc = &sbi->cprc_info;
 		int class = IOPRIO_PRIO_CLASS(cprc->ckpt_thread_ioprio);
-		int data = IOPRIO_PRIO_DATA(cprc->ckpt_thread_ioprio);
+		int level = IOPRIO_PRIO_LEVEL(cprc->ckpt_thread_ioprio);
 
 		if (class != IOPRIO_CLASS_RT && class != IOPRIO_CLASS_BE)
 			return -EINVAL;
 
 		return sysfs_emit(buf, "%s,%d\n",
-			class == IOPRIO_CLASS_RT ? "rt" : "be", data);
+			class == IOPRIO_CLASS_RT ? "rt" : "be", level);
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -450,7 +450,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		const char *name = strim((char *)buf);
 		struct ckpt_req_control *cprc = &sbi->cprc_info;
 		int class;
-		long data;
+		long level;
 		int ret;
 
 		if (!strncmp(name, "rt,", 3))
@@ -461,13 +461,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 
 		name += 3;
-		ret = kstrtol(name, 10, &data);
+		ret = kstrtol(name, 10, &level);
 		if (ret)
 			return ret;
-		if (data >= IOPRIO_NR_LEVELS || data < 0)
+		if (level >= IOPRIO_NR_LEVELS || level < 0)
 			return -EINVAL;
 
-		cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, data);
+		cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, level);
 		if (test_opt(sbi, MERGE_CHECKPOINT)) {
 			ret = set_task_ioprio(cprc->f2fs_issue_ckpt,
 					cprc->ckpt_thread_ioprio);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
