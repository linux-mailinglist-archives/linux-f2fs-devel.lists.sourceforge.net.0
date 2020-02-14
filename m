Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B5315D4EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 10:45:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2XXG-00025D-Da; Fri, 14 Feb 2020 09:45:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j2XXE-00024h-Fl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 09:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ivt19hylBIys33Sd4M3NHZKfcXKMgmj2f208tGXamRs=; b=MM1quUIgqMrhAHeHzq0CBlcLEx
 g+P1SaCf/LzDMo6pGTPM4t2ZGmrVhSPqACROYm04tITlYIeU8KyQi5YWHRg8Z1mF1Srfxs71XvVzh
 Vedun+Rh8NMVorjoRdR3FHQtWKvwKmkNZofvQuZTEHA01CpQ2pbuAcLd4iGv43tBn+8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ivt19hylBIys33Sd4M3NHZKfcXKMgmj2f208tGXamRs=; b=WDI57m1W06luWpayC4HFOJ72u1
 ASE7G8whFCYh5Cn/4sE/jQBQpZ6GO+RC5+TsphzES1PHdsQol11zQXo/OTAgDD7GrV8EEcarrHV09
 z7YEJCM2/8UrvRyxeqBWb2YjGRfJzYBHgjqU7cnE0FpTL+/HrWjOg16Nz5eSsMFTCHC0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2XXA-003qx5-4S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 09:45:20 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0EB4224E2402592F2897;
 Fri, 14 Feb 2020 17:45:06 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Fri, 14 Feb 2020 17:44:59 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 14 Feb 2020 17:44:11 +0800
Message-ID: <20200214094413.12784-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200214094413.12784-1-yuchao0@huawei.com>
References: <20200214094413.12784-1-yuchao0@huawei.com>
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
X-Headers-End: 1j2XXA-003qx5-4S
Subject: [f2fs-dev] [PATCH 2/4] f2fs: clean up parameter of macro
 XATTR_SIZE()
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

Just cleanup, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/xattr.c | 10 ++++------
 fs/f2fs/xattr.h |  3 ++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 296b3189448a..a3360a97e624 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -312,12 +312,12 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	if (!xnid && !inline_size)
 		return -ENODATA;
 
-	*base_size = XATTR_SIZE(xnid, inode) + XATTR_PADDING_SIZE;
+	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
 	txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
 	if (!txattr_addr)
 		return -ENOMEM;
 
-	last_txattr_addr = (void *)txattr_addr + XATTR_SIZE(xnid, inode);
+	last_txattr_addr = (void *)txattr_addr + XATTR_SIZE(inode);
 
 	/* read from inline xattr */
 	if (inline_size) {
@@ -539,7 +539,6 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 {
 	struct inode *inode = d_inode(dentry);
-	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	struct f2fs_xattr_entry *entry;
 	void *base_addr, *last_base_addr;
 	int error = 0;
@@ -551,7 +550,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	if (error)
 		return error;
 
-	last_base_addr = (void *)base_addr + XATTR_SIZE(xnid, inode);
+	last_base_addr = (void *)base_addr + XATTR_SIZE(inode);
 
 	list_for_each_xattr(entry, base_addr) {
 		const struct xattr_handler *handler =
@@ -609,7 +608,6 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 {
 	struct f2fs_xattr_entry *here, *last;
 	void *base_addr, *last_base_addr;
-	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	int found, newsize;
 	size_t len;
 	__u32 new_hsize;
@@ -633,7 +631,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (error)
 		return error;
 
-	last_base_addr = (void *)base_addr + XATTR_SIZE(xnid, inode);
+	last_base_addr = (void *)base_addr + XATTR_SIZE(inode);
 
 	/* find entry with wanted name. */
 	here = __find_xattr(base_addr, last_base_addr, index, len, name);
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index de0c600b9cab..574beea46494 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -73,7 +73,8 @@ struct f2fs_xattr_entry {
 				entry = XATTR_NEXT_ENTRY(entry))
 #define VALID_XATTR_BLOCK_SIZE	(PAGE_SIZE - sizeof(struct node_footer))
 #define XATTR_PADDING_SIZE	(sizeof(__u32))
-#define XATTR_SIZE(x,i)		(((x) ? VALID_XATTR_BLOCK_SIZE : 0) +	\
+#define XATTR_SIZE(i)		((F2FS_I(i)->i_xattr_nid ?		\
+					VALID_XATTR_BLOCK_SIZE : 0) +	\
 						(inline_xattr_size(i)))
 #define MIN_OFFSET(i)		XATTR_ALIGN(inline_xattr_size(i) +	\
 						VALID_XATTR_BLOCK_SIZE)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
