Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DB749F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2019 11:34:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqa8c-0007y4-Az; Thu, 25 Jul 2019 09:34:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqa8a-0007xw-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 09:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hEvkwVV86HzvppkeV5/lkxNQ1IzE22sxCYx+cZ0cxDo=; b=YSYSzt43Bxc2IKrh2RgIy25NeH
 Fjah7TgLGn4UMlKgVSSLrjvW2T+WywxEmdfzNGqAtF+ghqYpt2eW+ve9eiwOq5UtdS92bKLvmJcJ4
 9JQ6xH83Jfr2eJ0GT7stYvQVLfsuOWayei/ZBt8H6Aw60YOkwGld9ra+QtaBtUFcMj1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hEvkwVV86HzvppkeV5/lkxNQ1IzE22sxCYx+cZ0cxDo=; b=d
 7SmFZYkUzyWo+Caf5nqZQ1c8MuFuwtFZt7sZDgEIuF1v8g3RBFYW6NhgZIsad4odCn+AnErn4flbX
 FftNUrFfD3QRpWBvFIKZ9yezB/7M6tFjAfyb/oCtlHd6EG+/VbNyGrSGl9T0+tlYUKQDwkVO2iNFL
 L+fukV/dr48dj1D4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqa8X-0009jZ-1J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 09:34:12 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A5C5D3CF4F397CE816FD;
 Thu, 25 Jul 2019 17:33:58 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 25 Jul 2019 17:33:50 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 25 Jul 2019 17:33:37 +0800
Message-ID: <20190725093337.123063-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqa8X-0009jZ-1J
Subject: [f2fs-dev] [PATCH] f2fs: fix to handle quota_{on,off} correctly
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With quota_ino feature on, generic/232 reports an inconsistence issue
on the image.

The root cause is that the testcase tries to:
- use quotactl to shutdown journalled quota based on sysfile;
- and then use quotactl to enable/turn on quota based on specific file
(aquota.user or aquota.group).

Eventually, quota sysfile will be out-of-update due to following specific
file creation.

Change as below to fix this issue:
- deny enabling quota based on specific file if quota sysfile exists.
- set SBI_QUOTA_NEED_REPAIR once sysfile based quota shutdowns via
ioctl.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e5cae67935f6..c28d2b864975 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2000,6 +2000,12 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 	struct inode *inode;
 	int err;
 
+	/* if quota sysfile exists, deny enabling quota with specific file */
+	if (f2fs_sb_has_quota_ino(F2FS_SB(sb))) {
+		f2fs_err(F2FS_SB(sb), "quota sysfile already exists");
+		return -EBUSY;
+	}
+
 	err = f2fs_quota_sync(sb, type);
 	if (err)
 		return err;
@@ -2019,7 +2025,7 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 	return 0;
 }
 
-static int f2fs_quota_off(struct super_block *sb, int type)
+static int __f2fs_quota_off(struct super_block *sb, int type)
 {
 	struct inode *inode = sb_dqopt(sb)->files[type];
 	int err;
@@ -2045,13 +2051,30 @@ static int f2fs_quota_off(struct super_block *sb, int type)
 	return err;
 }
 
+static int f2fs_quota_off(struct super_block *sb, int type)
+{
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	int err;
+
+	err = __f2fs_quota_off(sb, type);
+
+	/*
+	 * quotactl can shutdown journalled quota, result in inconsistence
+	 * between quota record and fs data by following updates, tag the
+	 * flag to let fsck be aware of it.
+	 */
+	if (is_journalled_quota(sbi))
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	return err;
+}
+
 void f2fs_quota_off_umount(struct super_block *sb)
 {
 	int type;
 	int err;
 
 	for (type = 0; type < MAXQUOTAS; type++) {
-		err = f2fs_quota_off(sb, type);
+		err = __f2fs_quota_off(sb, type);
 		if (err) {
 			int ret = dquot_quota_off(sb, type);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
