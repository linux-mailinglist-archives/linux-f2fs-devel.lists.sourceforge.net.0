Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91178F90
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 17:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs7lJ-000519-RL; Mon, 29 Jul 2019 15:40:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hs7lI-000510-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NSK3KOkd3bNlVwSlAt3o7HS4W4u6VRFSW+BVH8MyBM4=; b=gldtpLQvPW/tTpKjVHKTXhjfko
 R5wla/cnlXysz03b/tSDyXwbMgbNJEzpZZnep4NvvwHQZyPnsEM1ttD4hjw42nQoXjQ0JnN41K7QO
 GgStjJGRxryGsaD5INZvtw8fReT0++KONP00qRNf9dyh536vDpytd4kUwl+xsE5NoIa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NSK3KOkd3bNlVwSlAt3o7HS4W4u6VRFSW+BVH8MyBM4=; b=Y
 4ZEGlv3SE7IL+IFO0soC82ioI1+rZUbMYl8ivqNawUNxd6HVtueDXxTQIkY3mFYQYYxTMa8UrbDzS
 qoYh6VEX2fzVJeFE4hUVrJhVqxiRBnsdhJErncQoDj/V/Qbz9PH4FiTETvGAz09pzz/QmHxY1pZel
 DxPeBih64pRiu/NA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs7lD-003Chj-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:40:32 +0000
Received: from localhost.localdomain (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5546F2067D;
 Mon, 29 Jul 2019 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564414822;
 bh=yi6+T7g7yldlTb8eoXuPvBmVnfCMbjM8FkkAJahJagk=;
 h=From:To:Cc:Subject:Date:From;
 b=VmoMjlBKfjQMxmtpek8BdKts3soYxIS5T1i2hKA6GlLnoK+2qowoqT03XS7ujCsr9
 8ybm6xGsgpxT6uKmDMMScjSDrEaUmoQi7Ksa9iAynzQuKRgGQtdPjVlfjhGTNUJ5HY
 rGh0qmnnrNlvGvvOT18UjG9Ohp3pKxIye0SdOhzA=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 29 Jul 2019 23:39:36 +0800
Message-Id: <20190729153936.15438-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs7lD-003Chj-Rs
Subject: [f2fs-dev] [PATCH] dump.f2fs: allow to dump data on mounted device
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

In generic/38[3456], we use quotactl(2) to check if prjquota is
enabled on the given device (src/feature -P $dev in _require_prjquota),
and quotactl(2) requires the given device is a mounted device.

So it requires dump.f2fs to list/check enabled features on a mounted
device, let's relieve to allow such operation.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 lib/libf2fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 5ac07c1..7b65fa0 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -845,7 +845,7 @@ void get_kernel_uname_version(__u8 *version)
 #ifndef ANDROID_WINDOWS_HOST
 static int open_check_fs(char *path, int flag)
 {
-	if (c.func != FSCK || c.fix_on || c.auto_fix)
+	if (c.func != DUMP && (c.func != FSCK || c.fix_on || c.auto_fix))
 		return -1;
 
 	/* allow to open ro */
@@ -891,7 +891,7 @@ int get_device_info(int i)
 			return -1;
 		}
 
-		if (S_ISBLK(stat_buf->st_mode) && !c.force) {
+		if (S_ISBLK(stat_buf->st_mode) && !c.force && c.func != DUMP) {
 			fd = open(dev->path, O_RDWR | O_EXCL);
 			if (fd < 0)
 				fd = open_check_fs(dev->path, O_EXCL);
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
