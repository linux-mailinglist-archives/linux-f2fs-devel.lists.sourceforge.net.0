Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 819B63A7345
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 03:29:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsxt9-0006H8-LS; Tue, 15 Jun 2021 01:29:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1lsxt8-0006Gs-2C
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 01:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BzSFucvqz9PSrpqSO67QUYJUUxup8lvgN+EROnz+T4=; b=GrCyx8jK8tCqx/XhxKyS6eXM6i
 kiuowBnlvd4ulqqqcBObL66GlTYhPpKJTWrIN1OCNF5a4Jrph7dPCddrqEltZ754C91TPV5nf1dqt
 P0224OpoLoQT//BkyL2BY6rgo/J3gDzCmHm/fQMnQSNaBzbZM+4j6s8liNHJkTfq75dM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0BzSFucvqz9PSrpqSO67QUYJUUxup8lvgN+EROnz+T4=; b=G
 HoVidFJjnn92Xwv+i1z7JOik/FptPs+R9jfYmEy3Im7F3mc5FZVewcJSb5SJvCInOFhNZGRzfUPMn
 cEI/4YTvSu/MIcEfol+gSB0LTmm7cLnH/YBR1Tzt+va7DS2PNz8pBTsQtmTtHgEMsY+gP/53N4LDo
 UawH6Ct6xJd+vwYM=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lsxt0-009u2g-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 01:29:11 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3rHC4wXxz6yr2;
 Tue, 15 Jun 2021 09:25:43 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 09:28:51 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Tue, 15 Jun 2021 09:35:09 +0800
Message-ID: <20210615013509.4130329-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lsxt0-009u2g-Kt
Subject: [f2fs-dev] [PATCH] f2fs: replace ERANGE with ENAMETOOLONG in file
 name length check
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ERANGE indicates that the math result is not representative. Here,
ENAMETOOLONG is used to replace ERANGE.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c8f34decbf8e..eb827c10e970 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -529,7 +529,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 
 	len = strlen(name);
 	if (len > F2FS_NAME_LEN)
-		return -ERANGE;
+		return -ENAMETOOLONG;
 
 	down_read(&F2FS_I(inode)->i_xattr_sem);
 	error = lookup_all_xattrs(inode, ipage, index, len, name,
@@ -646,7 +646,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	len = strlen(name);
 
 	if (len > F2FS_NAME_LEN)
-		return -ERANGE;
+		return -ENAMETOOLONG;
 
 	if (size > MAX_VALUE_LEN(inode))
 		return -E2BIG;
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
