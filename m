Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A072F2E03BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 02:20:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krWLX-00043X-3N; Tue, 22 Dec 2020 01:20:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1krWLV-00043Q-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 01:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZtzzQKUmImfYDY33Kjf4aLHQ1CwsYaj1A9Gl+aCrbrQ=; b=jA3F13cj/dxWdR4cuDha/Oz9Ad
 MjwjxRN2ANDX/3grfJ8o2jUsM21sGukU4u15MPNto8wtktppb0cnTsgPw+m44kz8VZoFHFP+45UWX
 R39D5S92nrbS8/z9ZCxcuHB1pdJR6KpNLBou937PnvtNPhjAid0K3AZOnoZ5LjhU6trE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZtzzQKUmImfYDY33Kjf4aLHQ1CwsYaj1A9Gl+aCrbrQ=; b=l
 FIF+ZBqOOww/riYRwZCesSqix1nwtGOh6F2e5AmDJq1J328ohiCZyel4034ml8JnQBWhSY8EuoxpB
 ijYCHw3WHPPhx5KsNJHHjISFWdaESkxe/t39uTZHjp92+cmBMy2BJWtC7F40oMLGlgjiQMMxWhBet
 yGOYWn3gEfkYwJto=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krWLJ-004Fby-0U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 01:20:13 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0JQ31hdDz7JFd;
 Tue, 22 Dec 2020 09:18:51 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 09:16:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
Date: Tue, 22 Dec 2020 09:16:34 +0800
Message-ID: <20201222011634.124180-1-yuchao0@huawei.com>
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
X-Headers-End: 1krWLJ-004Fby-0U
Subject: [f2fs-dev] [PATCH 5.10.y] f2fs: fix to seek incorrect data offset
 in inline data file
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
Cc: jaegeuk@kernel.org, kitestramuort <kitestramuort@autistici.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As kitestramuort reported:

F2FS-fs (nvme0n1p4): access invalid blkaddr:1598541474
[   25.725898] ------------[ cut here ]------------
[   25.725903] WARNING: CPU: 6 PID: 2018 at f2fs_is_valid_blkaddr+0x23a/0x250
[   25.725923] Call Trace:
[   25.725927]  ? f2fs_llseek+0x204/0x620
[   25.725929]  ? ovl_copy_up_data+0x14f/0x200
[   25.725931]  ? ovl_copy_up_inode+0x174/0x1e0
[   25.725933]  ? ovl_copy_up_one+0xa22/0xdf0
[   25.725936]  ? ovl_copy_up_flags+0xa6/0xf0
[   25.725938]  ? ovl_aio_cleanup_handler+0xd0/0xd0
[   25.725939]  ? ovl_maybe_copy_up+0x86/0xa0
[   25.725941]  ? ovl_open+0x22/0x80
[   25.725943]  ? do_dentry_open+0x136/0x350
[   25.725945]  ? path_openat+0xb7e/0xf40
[   25.725947]  ? __check_sticky+0x40/0x40
[   25.725948]  ? do_filp_open+0x70/0x100
[   25.725950]  ? __check_sticky+0x40/0x40
[   25.725951]  ? __check_sticky+0x40/0x40
[   25.725953]  ? __x64_sys_openat+0x1db/0x2c0
[   25.725955]  ? do_syscall_64+0x2d/0x40
[   25.725957]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9

llseek() reports invalid block address access, the root cause is if
file has inline data, f2fs_seek_block() will access inline data regard
as block address index in inode block, which should be wrong, fix it.

Fixes: 788e96d1d3994 ("f2fs: code cleanup by removing unnecessary check")
Fixes: 267378d4de69 ("f2fs: introduce f2fs_seek_block to support SEEK_{DATA, HOLE} in llseek")
Cc: stable <stable@vger.kernel.org> # 3.16+
Reported-by: kitestramuort <kitestramuort@autistici.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

This will cause boot failure in f2fs image, which was reported in gentoo
community, I'd like to fix them in stable kernel 5.10 first as request in
bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=210825

 fs/f2fs/file.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ee861c6d9ff0..fe39e591e5b4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -412,9 +412,14 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 		goto fail;
 
 	/* handle inline data case */
-	if (f2fs_has_inline_data(inode) && whence == SEEK_HOLE) {
-		data_ofs = isize;
-		goto found;
+	if (f2fs_has_inline_data(inode)) {
+		if (whence == SEEK_HOLE) {
+			data_ofs = isize;
+			goto found;
+		} else if (whence == SEEK_DATA) {
+			data_ofs = offset;
+			goto found;
+		}
 	}
 
 	pgofs = (pgoff_t)(offset >> PAGE_SHIFT);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
