Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2023E57E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Aug 2020 03:23:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k3r6m-0007uy-FQ; Fri, 07 Aug 2020 01:23:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k3r6k-0007un-EO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 01:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fMmMsRAiYbegQ4YyFSLfeMf+JYYVPiq01gXxyd8u6kU=; b=jVFD26liFZJ9rxIsjQsN0x6+EB
 H++FRQ3GkamQGGnjYF/lcpdavX62ZPdJkoRMi7ib7Z2oCo2cFkdHwC+iOgNbjIbzgoFjssRGFjx8t
 g7swMgXaOxGcZtDxjOXEw22ncGLRmlWLVyq+AmnBJ1/XEfJA0IcSK9sBfCH0EeA4Hd5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fMmMsRAiYbegQ4YyFSLfeMf+JYYVPiq01gXxyd8u6kU=; b=G
 JhYAk/Tj4qi29ohxjVUDER9PU18oars8BrZf3eFmhbrJRh/VrjVU9/azwL3Qfje95H51tzEgv2UQN
 lfc3dy7xD0QYYGcylBJOx3h9pmguFcZd+NvX+zV6cLmHkMhhdU1mL2QOwCcQHcOwHsGHTNg1PB/nt
 QGjDtS6Ik0XccDxY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k3r6e-009S8N-UW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 01:23:42 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 231C2A365779A84C8704;
 Fri,  7 Aug 2020 09:23:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 7 Aug 2020 09:23:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 7 Aug 2020 09:23:10 +0800
Message-ID: <20200807012310.112639-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k3r6e-009S8N-UW
Subject: [f2fs-dev] [PATCH] f2fs: compress: remove unneeded code
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

- f2fs_write_multi_pages
 - f2fs_compress_pages
  - init_compress_ctx
  - compress_pages
  - destroy_compress_ctx  --- 1
 - f2fs_write_compressed_pages
 - destroy_compress_ctx  --- 2

destroy_compress_ctx() in f2fs_write_multi_pages() is redundant, remove
it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6e7db450006c..3bb112e91cf6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1388,9 +1388,6 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 					struct writeback_control *wbc,
 					enum iostat_type io_type)
 {
-	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
-	const struct f2fs_compress_ops *cops =
-			f2fs_cops[fi->i_compress_algorithm];
 	int err;
 
 	*submitted = 0;
@@ -1405,7 +1402,6 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 
 		err = f2fs_write_compressed_pages(cc, submitted,
 							wbc, io_type);
-		cops->destroy_compress_ctx(cc);
 		kfree(cc->cpages);
 		cc->cpages = NULL;
 		if (!err)
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
