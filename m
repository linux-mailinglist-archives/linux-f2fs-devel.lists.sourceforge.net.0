Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCE2F0D80
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 08:51:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyryz-000560-TK; Mon, 11 Jan 2021 07:51:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kyryx-00055r-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 07:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qX6G5m9GYFZ+YB96hQhxsWYphkD+Rc/8QLpcx/6H8Z4=; b=Q86RXLsQ/v3oYp6f9S4xzs8NJ6
 W5eaQW8I374sIdiUSDYhNBcoiIGl22sakGPMiN/m1GC1LPPUVDwnD804q0/rcnG+/ADhCGRGP2uh6
 4Xf0+eHi+ydQ4aOYsnLQ3jE2pfHU23e93DFhEsyK98Q7l6rETfKfZK9Ib5m3RMU57kJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qX6G5m9GYFZ+YB96hQhxsWYphkD+Rc/8QLpcx/6H8Z4=; b=G
 ofG9+yGtteH+x4PCV8LPFxf6Yi6gKcZfdMNalr4J87fLd8cskIopqoJbrS1g05VlOtnYKZiqgLIxC
 nvUXTM0oXETTu0dRMWpUgiUnaJR1MLZsA9XpHPazpHBwX4xeuUhzyPerqAponqzkPEoGwY/XUG6Zl
 ZnnhhGt/BVERFEtk=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyryn-008SsB-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 07:51:19 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DDm8C1WmFz7SfQ;
 Mon, 11 Jan 2021 15:50:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 15:50:52 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 11 Jan 2021 15:50:17 +0800
Message-ID: <20210111075017.82370-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyryn-008SsB-Dl
Subject: [f2fs-dev] [PATCH v4 5/5] f2fs: introduce sb_status sysfs node
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
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce /sys/fs/f2fs/<devname>/stat/sb_status to show superblock
status in real time as a hexadecimal value.

value           sb status macro                 description

0x1             SBI_IS_DIRTY,                   /* dirty flag for checkpoint */
0x2             SBI_IS_CLOSE,                   /* specify unmounting */
0x4             SBI_NEED_FSCK,                  /* need fsck.f2fs to fix */
0x8             SBI_POR_DOING,                  /* recovery is doing or not */
0x10            SBI_NEED_SB_WRITE,              /* need to recover superblock */
0x20            SBI_NEED_CP,                    /* need to checkpoint */
0x40            SBI_IS_SHUTDOWN,                /* shutdown by ioctl */
0x80            SBI_IS_RECOVERED,               /* recovered orphan/data */
0x100           SBI_CP_DISABLED,                /* CP was disabled last mount */
0x200           SBI_CP_DISABLED_QUICK,          /* CP was disabled quickly */
0x400           SBI_QUOTA_NEED_FLUSH,           /* need to flush quota info in CP */
0x800           SBI_QUOTA_SKIP_FLUSH,           /* skip flushing quota in current CP */
0x1000          SBI_QUOTA_NEED_REPAIR,          /* quota file may be corrupted */
0x2000          SBI_IS_RESIZEFS,                /* resizefs is in process */

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v4:
- fix linux-next build (htmldocs) warning:
WARNING: Inline emphasis start-string without end-string.  
- reformat to fit rendering in html.
 Documentation/ABI/testing/sysfs-fs-f2fs | 23 +++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3dfee94e0618..e5918c93f3bf 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -377,3 +377,26 @@ Description:	This gives a control to limit the bio size in f2fs.
 		Default is zero, which will follow underlying block layer limit,
 		whereas, if it has a certain bytes value, f2fs won't submit a
 		bio larger than that size.
+
+What:		/sys/fs/f2fs/<disk>/stat/sb_status
+Date:		December 2020
+Contact:	"Chao Yu" <yuchao0@huawei.com>
+Description:	Show status of f2fs superblock in real time.
+
+		=====  ===================== =================================
+		value  sb status macro       description
+		0x1    SBI_IS_DIRTY          dirty flag for checkpoint
+		0x2    SBI_IS_CLOSE          specify unmounting
+		0x4    SBI_NEED_FSCK         need fsck.f2fs to fix
+		0x8    SBI_POR_DOING         recovery is doing or not
+		0x10   SBI_NEED_SB_WRITE     need to recover superblock
+		0x20   SBI_NEED_CP           need to checkpoint
+		0x40   SBI_IS_SHUTDOWN       shutdown by ioctl
+		0x80   SBI_IS_RECOVERED      recovered orphan/data
+		0x100  SBI_CP_DISABLED       CP was disabled last mount
+		0x200  SBI_CP_DISABLED_QUICK CP was disabled quickly
+		0x400  SBI_QUOTA_NEED_FLUSH  need to flush quota info in CP
+		0x800  SBI_QUOTA_SKIP_FLUSH  skip flushing quota in current CP
+		0x1000 SBI_QUOTA_NEED_REPAIR quota file may be corrupted
+		0x2000 SBI_IS_RESIZEFS       resizefs is in process
+		====== ===================== =================================
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index bd1174ed2e6f..f39874d512ea 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -96,6 +96,12 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 				sbi->sectors_written_start) >> 1)));
 }
 
+static ssize_t sb_status_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%lx\n", sbi->s_flag);
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -702,7 +708,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
 
+F2FS_GENERAL_RO_ATTR(sb_status);
 static struct attribute *f2fs_stat_attrs[] = {
+	ATTR_LIST(sb_status),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
