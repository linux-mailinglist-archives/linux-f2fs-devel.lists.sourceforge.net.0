Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEB85B4D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 09:20:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcLMa-0001VL-TL;
	Tue, 20 Feb 2024 08:20:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rcLMZ-0001Uq-Og
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NKWMX7gVulyDFAC6HdbcX1dqXaI57dkZwZP4k9UVLRo=; b=UFXopy6xsUVz1274U0v50ipjiN
 XIEWm1lQ4pAL/pZJNENFquYmHrO/4zslKffed6CfNjLacHiTrZGVNooDGRcuFHazZGf08pYPyvT+A
 XxMYaAv56h9TsBVrkLvEijgvBEjeAKtDf7yRNreTgxoN1mFqjtKGEmTjCdjph55n05bA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NKWMX7gVulyDFAC6HdbcX1dqXaI57dkZwZP4k9UVLRo=; b=V
 OYmD6EGGFtYll18JrWFEtVPoxOD756fg34HDHL0SgHX/OzsxyDSqvz+t7r2N4Gy3BPrcGhHkRvCcI
 Cy83+p0p+c6kyw+TIFfDIsMkYtD61I/ZvJ03cNYsTH4j40l2lqDVd3OT6I6RH9zu9dpjT0g6p5IR1
 KqIokL4c7Pah1mqc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcLMU-0001el-IW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:20:28 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41K8JlLQ042498;
 Tue, 20 Feb 2024 16:19:47 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TfC424Xy0z2KLwDx;
 Tue, 20 Feb 2024 16:19:14 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 20 Feb 2024 16:19:45 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 20 Feb 2024 16:19:28 +0800
Message-ID: <1708417168-29109-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41K8JlLQ042498
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a new stop cp reason STOP_CP_REASON_NO_SEGMENT for
 keeping consistent with kernel codes. Signed-off-by: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 --- fsck/mount.c | 1 + include/f2fs_fs.h | 1 + 2 files changed, 2 insertions(+)
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcLMU-0001el-IW
Subject: [f2fs-dev] [PATCH] f2fs-tools: add a new stop cp reason
 STOP_CP_REASON_NO_SEGMENT
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, zhiguo.niu@unisoc.com,
 niuzhiguo84@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a new stop cp reason STOP_CP_REASON_NO_SEGMENT for keeping
consistent with kernel codes.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fsck/mount.c      | 1 +
 include/f2fs_fs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 50afd01..b983920 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -679,6 +679,7 @@ static char *stop_reason_str[] = {
 	[STOP_CP_REASON_CORRUPTED_SUMMARY]	= "corrupted_summary",
 	[STOP_CP_REASON_UPDATE_INODE]		= "update_inode",
 	[STOP_CP_REASON_FLUSH_FAIL]		= "flush_fail",
+	[STOP_CP_REASON_NO_SEGMENT]		= "no_segment",
 };
 
 void print_sb_stop_reason(struct f2fs_super_block *sb)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 5e9dfad..fb2a863 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -718,6 +718,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_CORRUPTED_SUMMARY,
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_MAX,
 };
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
