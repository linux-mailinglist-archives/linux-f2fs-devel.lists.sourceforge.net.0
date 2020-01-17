Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 149971404BA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 08:59:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isMXQ-0007Jo-Hr; Fri, 17 Jan 2020 07:59:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1isMXO-0007Jg-AO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 07:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h75K6Gboa4ERTV6Q42FLmZP8/gXyYCfIRDGcO/Ilukk=; b=cWA7VJR9b5gmQcZkBzzy72HTnu
 iUSVl0jgggywnJPGlNlOaq6dglxPOuDbp0J+llT8KRqoQlXtn/a3W0SYp/zvb+J7CopR+4NZm3VuS
 YVcLte9IT0gYUS+EBygtVjT5Q1bQxnGdWQoI6UpGNaDdOdIfu9oLzTF1DherUwdbutBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h75K6Gboa4ERTV6Q42FLmZP8/gXyYCfIRDGcO/Ilukk=; b=I
 ZRsqsrNPygbBr6m/Ry7rmfQWhbsBnoh4aF+4OAOTgY+IwdcUd7kg5eYmdiul5ugqr1XGLxbWpJuwP
 rGUyKUhgObEv02L36shJFkT/ApVtFHh+EhmTmJy1wusrPHyVbTcqJUydfVmuTBkaDdEfQ3jC7KEyC
 uLgm0FWI6aQpqaHk=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isMXL-007vr0-6e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 07:59:26 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0204531959F5A58760;
 Fri, 17 Jan 2020 15:59:14 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 15:59:06 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 17 Jan 2020 15:59:03 +0800
Message-ID: <20200117075903.6157-1-yuchao0@huawei.com>
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
X-Headers-End: 1isMXL-007vr0-6e
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to avoid NULL pointer
 dereference
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

If cluster has only one compressed page, race condition as below will
trigger NULL pointer dereference:

- f2fs_write_compressed_pages
 - cic->rpages[0] = cc->rpages[0];
 - f2fs_outplace_write_data
					- f2fs_compress_write_end_io
					 - WARN_ON(!cic->rpages[1]);
 - cic->rpages[1] = cc->rpages[1];

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 45a6f20ceb3e..d8a64be90a50 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -837,12 +837,15 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	set_cluster_writeback(cc);
 
+	for (i = 0; i < cc->cluster_size; i++)
+		cic->rpages[i] = cc->rpages[i];
+
 	for (i = 0; i < cc->cluster_size; i++, dn.ofs_in_node++) {
 		block_t blkaddr;
 
 		blkaddr = datablock_addr(dn.inode, dn.node_page,
 							dn.ofs_in_node);
-		fio.page = cic->rpages[i] = cc->rpages[i];
+		fio.page = cic->rpages[i];
 		fio.old_blkaddr = blkaddr;
 
 		/* cluster header */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
