Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FF19554D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Mar 2020 11:30:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHmFp-0005cn-Jx; Fri, 27 Mar 2020 10:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jHmFm-0005cd-9o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 10:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXw0TzVkGU+TRU5tU8jXfjzXbYfnro8ehgTAM3jhVsE=; b=Zr8173XFY/Lp04m/YVT7fyGPyl
 pTA+bV9utDYY7iOJzpXR3z7jqNvGXFfC6BI3AAvqiyDRrWFYPQtt+rLECknD2H8wkR8+AKjPFJIDC
 0wosNUlQljcfCdIyHIqzo/hic9VD3CPNXcVdSmpxdTluovNEItUmzGQ5oDJwaSptp9qA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cXw0TzVkGU+TRU5tU8jXfjzXbYfnro8ehgTAM3jhVsE=; b=P
 9FQkJekd++Tg1Lbe63PnNHm3eBNZ7C4X95GwTqWqkKSwhWhncnRED+kNr5kQAFSOmBOUoCpSJ4b/V
 /Pi6wmC7mcQmsFcLVC5Z5XlETL3BEYs7KmPPkKiNmDIZtqet7dy+V0+3UVNg6ET5XYMyCj/RkPIxO
 c+XSe1xX4voRKNJM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHmFi-002U9D-M2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Mar 2020 10:30:18 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7F898749A64AA55676B8;
 Fri, 27 Mar 2020 18:30:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 18:29:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 27 Mar 2020 18:29:51 +0800
Message-ID: <20200327102953.104035-1-yuchao0@huawei.com>
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
X-Headers-End: 1jHmFi-002U9D-M2
Subject: [f2fs-dev] [PATCH 1/3] f2fs: fix to disable compression on directory
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

It needs to call f2fs_disable_compressed_file() to disable
compression on directory.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h | 10 ++++++----
 fs/f2fs/file.c |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9274399d9505..4e80cbe130d9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3850,10 +3850,12 @@ static inline u64 f2fs_disable_compressed_file(struct inode *inode)
 
 	if (!f2fs_compressed_file(inode))
 		return 0;
-	if (get_dirty_pages(inode))
-		return 1;
-	if (fi->i_compr_blocks)
-		return fi->i_compr_blocks;
+	if (S_ISREG(inode->i_mode)) {
+		if (get_dirty_pages(inode))
+			return 1;
+		if (fi->i_compr_blocks)
+			return fi->i_compr_blocks;
+	}
 
 	fi->i_flags &= ~F2FS_COMPR_FL;
 	stat_dec_compr_inode(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1476a3bc6317..6cb3c6cae7cd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1815,7 +1815,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	}
 
 	if ((iflags ^ masked_flags) & F2FS_COMPR_FL) {
-		if (S_ISREG(inode->i_mode) && (masked_flags & F2FS_COMPR_FL)) {
+		if (masked_flags & F2FS_COMPR_FL) {
 			if (f2fs_disable_compressed_file(inode))
 				return -EINVAL;
 		}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
