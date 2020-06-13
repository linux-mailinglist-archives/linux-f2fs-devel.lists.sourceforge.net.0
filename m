Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 095101F80C6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jun 2020 05:58:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjxJa-0007U0-Te; Sat, 13 Jun 2020 03:58:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fangwei1@huawei.com>) id 1jjxJU-0007Ta-0I
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Jun 2020 03:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RC+IN7saRg0UBqyKISOQyKiRGjIBc/dbbZcZGh2lq3o=; b=mkejO1zVQJz0fv6rdhcUCfY7rN
 dg/iS2rKWziBNfKjpQM+ltxKxmSGz7rT0SCGdI7iVaQW/L2W3fnwkaYP5q2vc2fbSIAJCVCgYkY9q
 GcLz+cJiDU3TtGFdK04iluqAQakqWY0qf99nqjqmhZnN02QwMnpW3VprA7oyslvsrCCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RC+IN7saRg0UBqyKISOQyKiRGjIBc/dbbZcZGh2lq3o=; b=U
 XjeECch/RN1wNreXNBCHvA4aLxXZDWDTV7I+lFDTUzTWSekCYLtpeP+osAHaasammGEYomyL9kMfk
 1md8S8ft9FIXSI0FtWZi75KdFY/3H7WDdzSQ8U85njnh4Gg4fm/9I41MUZDPGfD3bJ3tBdOJUe7Qs
 aAhCIpTE0Z3fYvOY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjxJQ-003l08-1f
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Jun 2020 03:58:35 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AD8512291275708B6059
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jun 2020 11:58:23 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Sat, 13 Jun 2020
 11:58:16 +0800
From: Wei Fang <fangwei1@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 13 Jun 2020 12:25:26 +0800
Message-ID: <20200613042526.30382-1-fangwei1@huawei.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jjxJQ-003l08-1f
Subject: [f2fs-dev] [PATCH] f2fs: remove useless truncate in
 f2fs_collapse_range()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since offset < new_size, no need to do truncate_pagecache() again
with new_size.

Signed-off-by: Wei Fang <fangwei1@huawei.com>
---
 fs/f2fs/file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3268f8dd59bb..43544817238b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1368,13 +1368,12 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 		return ret;
 
 	/* write out all moved pages, if possible */
-	down_write(&F2FS_I(inode)->i_mmap_sem);
 	filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
+
+	down_write(&F2FS_I(inode)->i_mmap_sem);
 	truncate_pagecache(inode, offset);
 
 	new_size = i_size_read(inode) - len;
-	truncate_pagecache(inode, new_size);
-
 	ret = f2fs_truncate_blocks(inode, new_size, true);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
 	if (!ret)
-- 
2.21.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
