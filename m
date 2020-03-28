Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B81965BB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2020 12:28:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jI9dD-0006zx-NH; Sat, 28 Mar 2020 11:28:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuehaibing@huawei.com>) id 1jI9dA-0006zg-Ha
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 11:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJuSabGjXu4FniZlp3Tt8xur7pLAtDVyX0acYTjB4vQ=; b=XcSW7AEB4xNyjdxeh9HBhNEOJB
 DFNXsgdnsovi/Z54Zg6wr9/ceveGpMReUei9o8W3RSJ3HmQjnZqb+0TcCJVWGLNrtomL5u2ZaG9O6
 JSiz9sm0WSeerKBxKLCjqch/HYuyvXmGuGPBe/bUZHRXY27MZYC+XlPe6eCJxMhk5NuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jJuSabGjXu4FniZlp3Tt8xur7pLAtDVyX0acYTjB4vQ=; b=b
 HdaToKx8o+4ktc4pcGkTRWfJ6F5M0czDmQWCCIBIxH+isYhq0a3KOzC9NCDRdSOCUMH9rBOpFQ9LG
 p22FoUpytFirS9GyNkqCMDhraFpKdG1buXmOfkzyM/9+dA/pnFbjRn28wYlwPD3IKDcYGuyTO2xxQ
 1/VFf5naHSGeyBtY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jI9d5-0052dW-BC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 11:28:00 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 82E2438E4A91D745D7AF;
 Sat, 28 Mar 2020 19:27:46 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sat, 28 Mar 2020
 19:27:39 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <qkrwngud825@gmail.com>
Date: Sat, 28 Mar 2020 19:27:36 +0800
Message-ID: <20200328112736.28852-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jI9d5-0052dW-BC
Subject: [f2fs-dev] [PATCH -next] f2fs: xattr.h: Make stub helpers inline
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix gcc warnings:

In file included from fs/f2fs/dir.c:15:0:
fs/f2fs/xattr.h:157:13: warning: 'f2fs_destroy_xattr_caches' defined but not used [-Wunused-function]
 static void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
             ^~~~~~~~~~~~~~~~~~~~~~~~~
fs/f2fs/xattr.h:156:12: warning: 'f2fs_init_xattr_caches' defined but not used [-Wunused-function]
 static int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: a999150f4fe3 ("f2fs: use kmem_cache pool during inline xattr lookups")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/f2fs/xattr.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index e471be77f8f0..938fcd20565d 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -153,8 +153,8 @@ static inline ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer,
 {
 	return -EOPNOTSUPP;
 }
-static int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
-static void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
+static inline int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
+static inline void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
 #endif
 
 #ifdef CONFIG_F2FS_FS_SECURITY
-- 
2.17.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
