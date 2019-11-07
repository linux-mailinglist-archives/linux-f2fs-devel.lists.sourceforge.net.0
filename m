Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53008F2787
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 07:12:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSb26-00052v-2M; Thu, 07 Nov 2019 06:12:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iSb24-00052k-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 06:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaD7zu3vy1hvVjC1/Sl3UQvqF51X9JdTOuwtrDatvPo=; b=OZDL8ellklGVBgN5Z14AbQwnQc
 uqlNQ4tswi5uw87/B1rSroBsoTWci94YpjpQlEom+m4hFo/Hu0zlTi+J1W1b94hEnaciXl2esYQ01
 KxnVzzXHCzN4mGwv24U7r9Nyy0F6VW/ye+vp4UAErSAiNehpGGFZTgN2Ee66ZLNq5Oto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LaD7zu3vy1hvVjC1/Sl3UQvqF51X9JdTOuwtrDatvPo=; b=G
 nqCaROGA7AQ+QEV1AbEKyGLc1/OgXbOpRch2I97u1BfV9blEhHFOMzQXSXV2Q/2uvKFzKo+CGwlWh
 y/aDF8tgvcQplK1y+SgOwNAnXRuANBAa+M0yLPfuRBfWJ/yqw20whWolB6RyBVIAtnE3f9DUBmpHf
 tT5HtB3kv6F+x3s4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSb21-003DEp-6W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 06:12:36 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89D4ACF001A7AC68CC88;
 Thu,  7 Nov 2019 14:12:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 7 Nov 2019 14:12:18 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 7 Nov 2019 14:12:05 +0800
Message-ID: <20191107061205.120972-1-yuchao0@huawei.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSb21-003DEp-6W
Subject: [f2fs-dev] [PATCH] f2fs: fix to update dir's i_pino during
 cross_rename
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

As Eric reported:

RENAME_EXCHANGE support was just added to fsstress in xfstests:

	commit 65dfd40a97b6bbbd2a22538977bab355c5bc0f06
	Author: kaixuxia <xiakaixu1987@gmail.com>
	Date:   Thu Oct 31 14:41:48 2019 +0800

	    fsstress: add EXCHANGE renameat2 support

This is causing xfstest generic/579 to fail due to fsck.f2fs reporting errors.
I'm not sure what the problem is, but it still happens even with all the
fs-verity stuff in the test commented out, so that the test just runs fsstress.

generic/579 23s ... 	[10:02:25]
[    7.745370] run fstests generic/579 at 2019-11-04 10:02:25
_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
(see /results/f2fs/results-default/generic/579.full for details)
 [10:02:47]
Ran: generic/579
Failures: generic/579
Failed 1 of 1 tests
Xunit report: /results/f2fs/results-default/result.xml

Here's the contents of 579.full:

_check_generic_filesystem: filesystem on /dev/vdc is inconsistent
*** fsck.f2fs output ***
[ASSERT] (__chk_dots_dentries:1378)  --> Bad inode number[0x24] for '..', parent parent ino is [0xd10]

The root cause is that we forgot to update directory's i_pino during
cross_rename, fix it.

Fixes: 32f9bc25cbda0 ("f2fs: support ->rename2()")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/namei.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 4faf06e8bf89..a1c507b0b4ac 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -981,7 +981,8 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (!old_dir_entry || whiteout)
 		file_lost_pino(old_inode);
 	else
-		F2FS_I(old_inode)->i_pino = new_dir->i_ino;
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(old_inode, new_dir->i_ino);
 	up_write(&F2FS_I(old_inode)->i_sem);
 
 	old_inode->i_ctime = current_time(old_inode);
@@ -1141,7 +1142,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_set_link(old_dir, old_entry, old_page, new_inode);
 
 	down_write(&F2FS_I(old_inode)->i_sem);
-	file_lost_pino(old_inode);
+	if (!old_dir_entry)
+		file_lost_pino(old_inode);
+	else
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(old_inode, new_dir->i_ino);
 	up_write(&F2FS_I(old_inode)->i_sem);
 
 	old_dir->i_ctime = current_time(old_dir);
@@ -1156,7 +1161,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_set_link(new_dir, new_entry, new_page, old_inode);
 
 	down_write(&F2FS_I(new_inode)->i_sem);
-	file_lost_pino(new_inode);
+	if (!new_dir_entry)
+		file_lost_pino(new_inode);
+	else
+		/* adjust dir's i_pino to pass fsck check */
+		f2fs_i_pino_write(new_inode, old_dir->i_ino);
 	up_write(&F2FS_I(new_inode)->i_sem);
 
 	new_dir->i_ctime = current_time(new_dir);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
