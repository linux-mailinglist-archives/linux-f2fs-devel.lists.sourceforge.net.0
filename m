Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BB07FB218
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 07:49:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7ruk-0007E7-Og;
	Tue, 28 Nov 2023 06:49:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1r7rui-0007E1-Qn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4R3ZUlDLkPLQsSYazMZGQpoqTQbOIVeMp3U+E6+CHRU=; b=SXVUre3hbFctPRmH7UBMv/7e53
 9lL3MvdVBmnbmd3TRoh1f5YomrnVw0ekZkNNZFJLxX6xtSlKyEVM/GGz0iQf4DwKwtqljCZ0gYIaj
 IxBP+ybwgj8UVT4yQuQQ6Xub4JTRQX0XlNcNSqzzylPitrqwryFubCgtmLRil74hqtXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4R3ZUlDLkPLQsSYazMZGQpoqTQbOIVeMp3U+E6+CHRU=; b=k
 ATkaEttg0oKmNM2vwWnBcps/i6MurjUlBBqeJlENq9DNAc3boid/VvJJChvr4Fnjg0QOkqwsxiRKZ
 GnUYVJHvVBQWXfAbUbWg36AxQDZi9nwPhs58YG897l7oy9OCg311HHOWMSaT5GRlv4djgOnNQXzps
 DjgW3Y0lQTmRVw78=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7rue-0007li-Mb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:49:43 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3AS6mhXG087957;
 Tue, 28 Nov 2023 14:48:43 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SfXvy5tlyz2K1r9S;
 Tue, 28 Nov 2023 14:43:10 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 28 Nov 2023 14:48:41 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 28 Nov 2023 14:48:16 +0800
Message-ID: <1701154096-23883-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3AS6mhXG087957
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The current pending_discard attr just only shows the
 discard_cmd_cnt
 information. More discard status can be shown so that we can check them
 through
 sysfs when needed. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> ---
 changes of v2: Improve the patch according to Chao's suggestions. --- ---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++ fs/f2fs/sysfs.c | 18 [...]
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7rue-0007li-Mb
Subject: [f2fs-dev] [PATCH V2] f2fs: show more discard status by sysfs
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
Cc: hongyu.jin@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current pending_discard attr just only shows the discard_cmd_cnt
information. More discard status can be shown so that we can check
them through sysfs when needed.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v2: Improve the patch according to Chao's suggestions.
---
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 36c3cb5..c6970e5 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -498,6 +498,12 @@ Description:	Show status of f2fs checkpoint in real time.
 		CP_RESIZEFS_FLAG		0x00004000
 		=============================== ==============================
 
+What:		/sys/fs/f2fs/<disk>/stat/discard_status
+Date:		November 2023
+Contact:	"Zhiguo Niu" <zhiguo.niu@unisoc.com>
+Description:	Show status of f2fs discard in real time, including
+		"issued discard","queued discard" and "undiscard blocks".
+
 What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
 Date:		January 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 417fae96..2b80116 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -134,6 +134,22 @@ static ssize_t cp_status_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
 }
 
+static ssize_t discard_status_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+	if (!dcc)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%llu, %llu, %u\n",
+			(unsigned long long)atomic_read(
+				&dcc->issued_discard),
+			(unsigned long long)atomic_read(
+				&dcc->queued_discard),
+			dcc->undiscard_blks);
+}
+
 static ssize_t pending_discard_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1197,9 +1213,11 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 
 F2FS_GENERAL_RO_ATTR(sb_status);
 F2FS_GENERAL_RO_ATTR(cp_status);
+F2FS_GENERAL_RO_ATTR(discard_status);
 static struct attribute *f2fs_stat_attrs[] = {
 	ATTR_LIST(sb_status),
 	ATTR_LIST(cp_status),
+	ATTR_LIST(discard_status),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
