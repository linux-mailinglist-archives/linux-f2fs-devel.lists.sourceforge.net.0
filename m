Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0120C7EC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 14:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpWSG-0006P5-8R; Sun, 28 Jun 2020 12:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpWSE-0006OR-95
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NHEjsmd46maEqsz8IFFbn7CvyfiYyuBEw4oR5KrNuPY=; b=hCCt++lA5EQGZ6Bn5rDSE/vVnt
 2EGXAsirRY47JMumHrutJ486ldCSM+QYuKWj6NQoaDH+n91lPTSDbz2MqInMOWZQRA2rIthn0d1Ba
 Uvv3xKZQ2OVjfoNq+haEiXwS1P7t/yXE+3XNC9ox8AblVtZiQbnf7YvmewT6+HZFBFf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NHEjsmd46maEqsz8IFFbn7CvyfiYyuBEw4oR5KrNuPY=; b=LcBTxiLhd751DqKeBOc9XIUeg3
 DqiGDJys47yEDn9edZ/2PB9JzIebhyHatOhiOB7ck64aNKHhXS4ESlVJa/747eoMrvoK+1ApuFYyW
 k45l7DCZNhsTu6Hvi52CzPzTYO/+xUau6SNDiEhZO+MIDFAckg/zvb/2fGlB2D63Ckac=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpWSB-003ewA-1U
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 12:30:36 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B128AF012B4D705F9F08;
 Sun, 28 Jun 2020 20:30:14 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 20:30:07 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sun, 28 Jun 2020 20:29:40 +0800
Message-ID: <20200628122940.29665-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628122940.29665-1-yuchao0@huawei.com>
References: <20200628122940.29665-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpWSB-003ewA-1U
Subject: [f2fs-dev] [PATCH 3/3] f2fs: support to trace f2fs_fiemap()
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

to show f2fs_fiemap()'s result as below:

f2fs_fiemap: dev = (251,0), ino = 7, lblock:0, pblock:1625292800, len:2097152, flags:0, ret:0

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c              |  6 +++++-
 fs/f2fs/inline.c            |  2 ++
 include/trace/events/f2fs.h | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c07a50e4d967..995cf78b23c5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1813,6 +1813,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 			flags |= FIEMAP_EXTENT_LAST;
 
 		err = fiemap_fill_next_extent(fieinfo, 0, phys, len, flags);
+		trace_f2fs_fiemap(inode, 0, phys, len, flags, err);
 		if (err || err == 1)
 			return err;
 	}
@@ -1836,8 +1837,10 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 		flags = FIEMAP_EXTENT_LAST;
 	}
 
-	if (phys)
+	if (phys) {
 		err = fiemap_fill_next_extent(fieinfo, 0, phys, len, flags);
+		trace_f2fs_fiemap(inode, 0, phys, len, flags, err);
+	}
 
 	return (err < 0 ? err : 0);
 }
@@ -1931,6 +1934,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 		ret = fiemap_fill_next_extent(fieinfo, logical,
 				phys, size, flags);
+		trace_f2fs_fiemap(inode, logical, phys, size, flags, ret);
 		if (ret)
 			goto out;
 		size = 0;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index dbade310dc79..def4b8481883 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -12,6 +12,7 @@
 
 #include "f2fs.h"
 #include "node.h"
+#include <trace/events/f2fs.h>
 
 bool f2fs_may_inline_data(struct inode *inode)
 {
@@ -776,6 +777,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	byteaddr += (char *)inline_data_addr(inode, ipage) -
 					(char *)F2FS_INODE(ipage);
 	err = fiemap_fill_next_extent(fieinfo, start, byteaddr, ilen, flags);
+	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
 out:
 	f2fs_put_page(ipage, 1);
 	return err;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 3d844c51d283..67202963ef82 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1918,6 +1918,44 @@ TRACE_EVENT(f2fs_bmap,
 		(unsigned long long)__entry->pblock)
 );
 
+TRACE_EVENT(f2fs_fiemap,
+
+	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock,
+		unsigned long long len, unsigned int flags, int ret),
+
+	TP_ARGS(inode, lblock, pblock, len, flags, ret),
+
+	TP_STRUCT__entry(
+		__field(dev_t, dev)
+		__field(ino_t, ino)
+		__field(sector_t, lblock)
+		__field(sector_t, pblock)
+		__field(unsigned long long, len)
+		__field(unsigned int, flags)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= inode->i_sb->s_dev;
+		__entry->ino		= inode->i_ino;
+		__entry->lblock		= lblock;
+		__entry->pblock		= pblock;
+		__entry->len		= len;
+		__entry->flags		= flags;
+		__entry->ret		= ret;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, lblock:%lld, pblock:%lld, "
+		"len:%llu, flags:%u, ret:%d",
+		show_dev(__entry->dev),
+		__entry->ino,
+		(unsigned long long)__entry->lblock,
+		(unsigned long long)__entry->pblock,
+		__entry->len,
+		__entry->flags,
+		__entry->ret)
+);
+
 #endif /* _TRACE_F2FS_H */
 
  /* This part must be outside protection */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
