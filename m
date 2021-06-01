Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE52397102
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jun 2021 12:10:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lo1ME-0006ZU-Ii; Tue, 01 Jun 2021 10:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lo1MD-0006ZI-9O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Jun 2021 10:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQzjn6gWwS/1TzPdRk9RzFgIOJWphaJXxjFq/6V+UBA=; b=GHyYyy+p3i7wHkUqN9qN4JScnx
 IrARbD9LjfVuAFO4fdA+2Co579DPjDcEN6BOhclIflF2cQmHNy5rQDzf+PRrTAmXNGpX30k+IGN5P
 /QTETRhUlZA9ACvK5CUrMgVNtfO2RT87jkqiLZlhaIBsAnAfiVwWouNfssQr9RpRfwPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QQzjn6gWwS/1TzPdRk9RzFgIOJWphaJXxjFq/6V+UBA=; b=n
 QBVXX5rMBeSDoIBpDT+7Ka6UkOvXTIGOVwEXS6fsKbkiIzjLi96D/sj1LNmJbb7xqadVuOb785DFK
 CigpeFY+MBLDXASqV6CvfCtRHUxYJDz8ThphsUHGxl4ymMD4oBPCis7le+BX3C90qnBXahYCo8lts
 2lE7E8AiJXUNQArE=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lo1M5-0006ai-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Jun 2021 10:10:45 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FvSTk388Sz1BFwL;
 Tue,  1 Jun 2021 18:05:46 +0800 (CST)
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 1 Jun 2021 18:10:27 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 1 Jun 2021 18:10:24 +0800
Message-ID: <20210601101024.119356-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lo1M5-0006ai-Rt
Subject: [f2fs-dev] [PATCH v2 RFC] f2fs: fix to force keeping write barrier
 for strict fsync mode
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

[1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html

As [1] reported, if lower device doesn't support write barrier, in below
case:

- write page #0; persist
- overwrite page #0
- fsync
 - write data page #0 OPU into device's cache
 - write inode page into device's cache
 - issue flush

If SPO is triggered during flush command, inode page can be persisted
before data page #0, so that after recovery, inode page can be recovered
with new physical block address of data page #0, however there may
contains dummy data in new physical block address.

Then what user will see is: after overwrite & fsync + SPO, old data in
file was corrupted, if any user do care about such case, we can suggest
user to use STRICT fsync mode, in this mode, we will force to trigger
preflush command to persist data in device cache in prior to node
writeback, it avoids potential data corruption during fsync().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix this by adding additional preflush command rather than using
atomic write flow.
 fs/f2fs/file.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7d5311d54f63..238ca2a733ac 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -301,6 +301,20 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
 			goto flush_out;
 		goto out;
+	} else {
+		/*
+		 * for OPU case, during fsync(), node can be persisted before
+		 * data when lower device doesn't support write barrier, result
+		 * in data corruption after SPO.
+		 * So for strict fsync mode, force to trigger preflush to keep
+		 * data/node write order to avoid potential data corruption.
+		 */
+		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT &&
+								!atomic) {
+			ret = f2fs_issue_flush(sbi, inode->i_ino);
+			if (ret)
+				goto out;
+		}
 	}
 go_write:
 	/*
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
