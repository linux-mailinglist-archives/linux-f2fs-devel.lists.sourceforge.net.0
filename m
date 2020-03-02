Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D06175734
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Mar 2020 10:35:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j8hTX-0007Of-8C; Mon, 02 Mar 2020 09:34:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j8hTV-0007OR-PT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 09:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iHYq64x9zEDYsPPpUM5wWZH9T01CkOR8STYrDc/rC/s=; b=azMP9udFwk2W30KYxSwtBa4zqC
 IG6sgwLnjLN5MVM04CGdz3F8rUFWbt+bTCeZmLa1J4igFaBSukuWXC71kbQFhLCfY3F3c1EHzfF+a
 J3rgc9GxbbAig7rWCMrJsoLxu2nc96rBERUgOEcMIYep6T/aQfE7hBHOP0LiMN/xFPd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iHYq64x9zEDYsPPpUM5wWZH9T01CkOR8STYrDc/rC/s=; b=m
 jzmBK167s6xYyI2QXIWNxIt6W8873qNJ7AOy9BgDA+3hpszThBL7UbTDSncaXCV89xMCSIOiIV0qm
 V1xJBZHt0+ocdB+zWJz1PuL5zzgJnSjeTGYst/mYlVCS4qlctdVqPmNHTt/4/YQBGtkZs3oMmgpvK
 cCMA/P6G5jj+yqL8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j8hTS-00AuW6-2e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 09:34:57 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 39D1753B58EB3F07568D;
 Mon,  2 Mar 2020 17:34:43 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 2 Mar 2020 17:34:32 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 2 Mar 2020 17:34:27 +0800
Message-ID: <20200302093427.49796-1-yuchao0@huawei.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j8hTS-00AuW6-2e
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid using uninitialized variable
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

In f2fs_vm_page_mkwrite(), if inode is compress one, and current mmapped
page locates in compressed cluster, we have to call f2fs_get_dnode_of_data()
to get its physical block address before f2fs_wait_on_block_writeback().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 09164c6a1d39..caa7ca42791f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -106,10 +106,18 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		err = f2fs_get_block(&dn, page->index);
 		f2fs_put_dnode(&dn);
 		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
-		if (err) {
-			unlock_page(page);
-			goto out_sem;
-		}
+	}
+
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	if (!need_alloc) {
+		set_new_dnode(&dn, inode, NULL, NULL, 0);
+		err = f2fs_get_dnode_of_data(&dn, page->index, LOOKUP_NODE);
+		f2fs_put_dnode(&dn);
+	}
+#endif
+	if (err) {
+		unlock_page(page);
+		goto out_sem;
 	}
 
 	f2fs_wait_on_page_writeback(page, DATA, false, true);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
