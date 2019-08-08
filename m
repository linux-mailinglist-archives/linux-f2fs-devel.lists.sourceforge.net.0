Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909B857EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Aug 2019 04:03:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvXm1-00027O-7W; Thu, 08 Aug 2019 02:03:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuehaibing@huawei.com>) id 1hvXlz-00027D-C0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 02:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/oC8253JlwHW5zVKDLOsfqZRZ7LD2gbhP8CjaxySE6o=; b=lgIUAzBDWBSNLMn/2oZZzvLdUC
 gnJKylaT7p4Pnz2xb5yfp/BsgC3CU1JbvWGRyDqVhdiOGZjbK76L6w8yg2UNsDlplAI5F3xpkw2MN
 0O6/GJwf/KDt2pk19xM6iSrdU9KtFcWkZh4oAql88syw5pIDowMeN58OsSsKTgGEG/oA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/oC8253JlwHW5zVKDLOsfqZRZ7LD2gbhP8CjaxySE6o=; b=W
 AQDaG+TTRjLQMpcpZZuU9v2CWNTpol88qSFJe4lJNnjYVjFvDgZ9f6yiD7lBiYek7lvix8Q3xtFVx
 XmP9q+ovX0D3SpTOluip0dObXOOFPGbBz+CZCFB1nGVrFR8JpcuUnd1puYSLUA4M+wXdhRr0nqgj2
 djF3rYg3kQ1jsFOU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvXlx-00FffK-49
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 02:03:23 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DDAE935F919AAF914DE0;
 Thu,  8 Aug 2019 10:03:13 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 8 Aug 2019
 10:02:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 8 Aug 2019 10:02:53 +0800
Message-ID: <20190808020253.27276-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
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
X-Headers-End: 1hvXlx-00FffK-49
Subject: [f2fs-dev] [PATCH] f2fs: Fix build error while CONFIG_NLS=m
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

If CONFIG_F2FS_FS=y but CONFIG_NLS=m, building fails:

fs/f2fs/file.o: In function `f2fs_ioctl':
file.c:(.text+0xb86f): undefined reference to `utf16s_to_utf8s'
file.c:(.text+0xe651): undefined reference to `utf8s_to_utf16s'

Select CONFIG_NLS to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 61a3da4d5ef8 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/f2fs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 110a38c..95f1b99 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -2,6 +2,7 @@
 config F2FS_FS
 	tristate "F2FS filesystem support"
 	depends on BLOCK
+	select NLS
 	select CRYPTO
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
-- 
2.7.4




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
