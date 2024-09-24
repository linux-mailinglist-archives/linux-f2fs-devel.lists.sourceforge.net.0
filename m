Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73D9845C4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 14:16:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1st4TL-0006aa-4V;
	Tue, 24 Sep 2024 12:16:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <n.zhandarovich@fintech.ru>) id 1st4TI-0006aS-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 12:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHwvyKdZsKZRuH70HLay5NTrOocz1Vg8//PxQMkg4pQ=; b=ESpq+PxubtDk00waTROJJzKZKN
 Cb8oYcP93ecy/dQXutoJyMhWKmTkN4Al6nmkZRcrgudTYDP41ho1iLVNPXjDRKsgnw7tcGCwor8L1
 WpOW+VB5fz5Lh1/YEqwOFoOxnuTZ4oUVYXWhL4MlUn8A7owF7qy335OHQ+es3PSONqNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hHwvyKdZsKZRuH70HLay5NTrOocz1Vg8//PxQMkg4pQ=; b=ggQDa0BFGXLEgrch+G8C0jD0Tx
 73Q/YHq1ExnNRGS1USbaSIQTC3FgYKj3azau8wi86pXui+bl6ERVcmE1ByPEJhP7HqxEL7tslvK+N
 ZG1sSfAPaCtrcowj6dZxhK1k845oWjUW+AQAHi5BdLcGBq1jsdT6G1uBS3Oc1605wr2E=;
Received: from exchange.fintech.ru ([195.54.195.159])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1st4TI-0007Po-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 12:16:48 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 24 Sep
 2024 15:04:18 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 24 Sep
 2024 15:04:18 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 24 Sep 2024 05:04:11 -0700
Message-ID: <20240924120411.34948-2-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924120411.34948-1-n.zhandarovich@fintech.ru>
References: <20240924120411.34948-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yangtao Li <frank.li@vivo.com> commit
 5bb9c111cd98ad844d48ace9924e29f56312f036
 upstream. BIW reduce the s_flag array size and make s_flag constant. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1st4TI-0007Po-24
Subject: [f2fs-dev] [PATCH 6.1 1/1] f2fs: convert to MAX_SBI_FLAG instead of
 32 in stat_show()
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yangtao Li <frank.li@vivo.com>

commit 5bb9c111cd98ad844d48ace9924e29f56312f036 upstream.

BIW reduce the s_flag array size and make s_flag constant.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[Nikita: This patch has been cherry-picked from original commit:
the only discrepancy was in stat_show(). Specifically, due to
lack of commit dda7d77bcd42 ("f2fs: replace si->sbi w/ sbi in
stat_show()") keep &si->sbi->s_flag instead of &sbi->s_flag.]
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 fs/f2fs/debug.c | 36 ++++++++++++++++++------------------
 fs/f2fs/f2fs.h  |  6 +++++-
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a9baa121d829..002bf12b4e26 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -332,22 +332,22 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 #endif
 }
 
-static char *s_flag[] = {
-	[SBI_IS_DIRTY]		= " fs_dirty",
-	[SBI_IS_CLOSE]		= " closing",
-	[SBI_NEED_FSCK]		= " need_fsck",
-	[SBI_POR_DOING]		= " recovering",
-	[SBI_NEED_SB_WRITE]	= " sb_dirty",
-	[SBI_NEED_CP]		= " need_cp",
-	[SBI_IS_SHUTDOWN]	= " shutdown",
-	[SBI_IS_RECOVERED]	= " recovered",
-	[SBI_CP_DISABLED]	= " cp_disabled",
-	[SBI_CP_DISABLED_QUICK]	= " cp_disabled_quick",
-	[SBI_QUOTA_NEED_FLUSH]	= " quota_need_flush",
-	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
-	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
-	[SBI_IS_RESIZEFS]	= " resizefs",
-	[SBI_IS_FREEZING]	= " freezefs",
+static const char *s_flag[MAX_SBI_FLAG] = {
+	[SBI_IS_DIRTY]		= "fs_dirty",
+	[SBI_IS_CLOSE]		= "closing",
+	[SBI_NEED_FSCK]		= "need_fsck",
+	[SBI_POR_DOING]		= "recovering",
+	[SBI_NEED_SB_WRITE]	= "sb_dirty",
+	[SBI_NEED_CP]		= "need_cp",
+	[SBI_IS_SHUTDOWN]	= "shutdown",
+	[SBI_IS_RECOVERED]	= "recovered",
+	[SBI_CP_DISABLED]	= "cp_disabled",
+	[SBI_CP_DISABLED_QUICK]	= "cp_disabled_quick",
+	[SBI_QUOTA_NEED_FLUSH]	= "quota_need_flush",
+	[SBI_QUOTA_SKIP_FLUSH]	= "quota_skip_flush",
+	[SBI_QUOTA_NEED_REPAIR]	= "quota_need_repair",
+	[SBI_IS_RESIZEFS]	= "resizefs",
+	[SBI_IS_FREEZING]	= "freezefs",
 };
 
 static int stat_show(struct seq_file *s, void *v)
@@ -367,8 +367,8 @@ static int stat_show(struct seq_file *s, void *v)
 			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
 		if (si->sbi->s_flag) {
 			seq_puts(s, "[SBI:");
-			for_each_set_bit(j, &si->sbi->s_flag, 32)
-				seq_puts(s, s_flag[j]);
+			for_each_set_bit(j, &si->sbi->s_flag, MAX_SBI_FLAG)
+				seq_printf(s, " %s", s_flag[j]);
 			seq_puts(s, "]\n");
 		}
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2b540d87859e..75db7c09bdfe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1271,7 +1271,10 @@ struct f2fs_gc_control {
 	unsigned int nr_free_secs;	/* # of free sections to do GC */
 };
 
-/* For s_flag in struct f2fs_sb_info */
+/*
+ * For s_flag in struct f2fs_sb_info
+ * Modification on enum should be synchronized with s_flag array
+ */
 enum {
 	SBI_IS_DIRTY,				/* dirty flag for checkpoint */
 	SBI_IS_CLOSE,				/* specify unmounting */
@@ -1288,6 +1291,7 @@ enum {
 	SBI_QUOTA_NEED_REPAIR,			/* quota file may be corrupted */
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
 	SBI_IS_FREEZING,			/* freezefs is in process */
+	MAX_SBI_FLAG,
 };
 
 enum {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
