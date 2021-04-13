Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699635DB2B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 11:31:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWFOB-0003YK-Se; Tue, 13 Apr 2021 09:31:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lWFO7-0003Xm-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sMVf9hIIUckMnwOGJrz7pmvJfLD3Bf5rBPnoG1vNciA=; b=gUTOw6IzSPXKh/nwlG/MudC9Or
 n56kpxkyEdkoecW4k9O35SR9wrxvREXyaLJ18o0maIyFYkCM5Ypx+/dOvBp1+cceC1Ddbue7lY5zE
 GeuNhiPrRQgu03jzny5HqvFsubEBV17hdRSL3Rd+AP4I+Fx3rUieBcm7YC3KnZoIZ6Vc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sMVf9hIIUckMnwOGJrz7pmvJfLD3Bf5rBPnoG1vNciA=; b=F
 LMdCeObpU4QsTPqFl+hiHJyPwjIHaGovpC4zzscyhG9gGufnu5/sdzyQ2H6+3vp2EnqcW8XAt5hOa
 cHg4YJt8xkam7kBevVdmRU5mnLeN5S4fx/beVgaXCJbj4XT2BFLcq8J/puagkanaZwqcb0dUd8AOD
 SbZi0rJow2yTSB/M=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lWFO3-00ExBK-OQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:31:15 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FKKzd53L2zB06w;
 Tue, 13 Apr 2021 17:28:45 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 17:30:54 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 13 Apr 2021 17:30:50 +0800
Message-ID: <20210413093050.25201-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lWFO3-00ExBK-OQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid NULL pointer dereference
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

From: Yi Chen <chenyi77@huawei.com>

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
pc : f2fs_put_page+0x1c/0x26c
lr : __revoke_inmem_pages+0x544/0x75c
f2fs_put_page+0x1c/0x26c
__revoke_inmem_pages+0x544/0x75c
__f2fs_commit_inmem_pages+0x364/0x3c0
f2fs_commit_inmem_pages+0xc8/0x1a0
f2fs_ioc_commit_atomic_write+0xa4/0x15c
f2fs_ioctl+0x5b0/0x1574
file_ioctl+0x154/0x320
do_vfs_ioctl+0x164/0x740
__arm64_sys_ioctl+0x78/0xa4
el0_svc_common+0xbc/0x1d0
el0_svc_handler+0x74/0x98
el0_svc+0x8/0xc

In f2fs_put_page, we access page->mapping is NULL.
The root cause is:
In some cases, the page refcount and ATOMIC_WRITTEN_PAGE
flag miss set for page-priavte flag has been set.
We add f2fs_bug_on like this:

f2fs_register_inmem_page()
{
	...
	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);

	f2fs_bug_on(F2FS_I_SB(inode), !IS_ATOMIC_WRITTEN_PAGE(page));
	...
}

The bug on stack follow link this:
PC is at f2fs_register_inmem_page+0x238/0x2b4
LR is at f2fs_register_inmem_page+0x2a8/0x2b4
f2fs_register_inmem_page+0x238/0x2b4
f2fs_set_data_page_dirty+0x104/0x164
set_page_dirty+0x78/0xc8
f2fs_write_end+0x1b4/0x444
generic_perform_write+0x144/0x1cc
__generic_file_write_iter+0xc4/0x174
f2fs_file_write_iter+0x2c0/0x350
__vfs_write+0x104/0x134
vfs_write+0xe8/0x19c
SyS_pwrite64+0x78/0xb8

To fix this issue, let's add page refcount add page-priavte flag.
The page-private flag is not cleared and needs further analysis.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Ge Qiu <qiuge@huawei.com>
Signed-off-by: Dehe Gu <gudehe@huawei.com>
Signed-off-by: Yi Chen <chenyi77@huawei.com>
---
 fs/f2fs/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0cb1ca88d4aa..d6c6c13feb43 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -186,7 +186,10 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 {
 	struct inmem_pages *new;
 
-	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
+	if (PagePrivate(page))
+		set_page_private(page, (unsigned long)ATOMIC_WRITTEN_PAGE);
+	else
+		f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
 
 	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
