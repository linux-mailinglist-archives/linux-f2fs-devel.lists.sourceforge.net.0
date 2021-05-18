Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F5386FB9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 03:58:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1liozv-0002be-Mh; Tue, 18 May 2021 01:58:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1liozt-0002bK-9K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 01:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPlAo7RqtSUb84WLC+hbVWyVJbFWn8iMIRRPoXfMJU8=; b=Zfijf2O0RVrb/dNnrZZ/alK60h
 BfWmXnXXBgfBpdcVUkbZfK31qjbsYjo3EAqFov6dzvldwD9fRcMKthdV/DqrWQXcyT0Ld60CmqAJ0
 ew8pVrKU0b2R90mAIl/Ml0Lyde6XMVtx3SkeH8MVqrEF6I/fHR5SGmyVlZC5NotlH42g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cPlAo7RqtSUb84WLC+hbVWyVJbFWn8iMIRRPoXfMJU8=; b=A
 LjLhQ4+CLHGCoZH0NKQgFtwobGpGiJGUewjrHKS5vj1qcVrgkOijk+gMR4TYVC0aw14H3k1+n4Q/z
 Sr5P84waUoU4hD0Tq5EqBy3OVpuLLR+KS6XfS0kU6UbOPs4lXhFZ3foIeomLYtS35dRY8wDUxpVsk
 nwhzcCBXU+tNqLrc=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1liozk-00008S-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 01:58:12 +0000
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FkfG74D8CzCtHh;
 Tue, 18 May 2021 09:55:11 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 09:57:56 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 18 May 2021 09:57:56 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 18 May 2021 09:57:54 +0800
Message-ID: <20210518015754.9311-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1liozk-00008S-Rm
Subject: [f2fs-dev] [PATCH v2] f2fs: add MODULE_SOFTDEP to ensure crc32 is
 included in the initramfs
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
Cc: marcosfrm <marcosfrm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As marcosfrm reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=213089

Initramfs generators rely on "pre" softdeps (and "depends") to include
additional required modules.

F2FS does not declare "pre: crc32" softdep. Then every generator (dracut,
mkinitcpio...) has to maintain a hardcoded list for this purpose.

Hence let's use MODULE_SOFTDEP("pre: crc32") in f2fs code.

Fixes: 43b6573bac95 ("f2fs: use cryptoapi crc32 functions")
Reported-by: marcosfrm <marcosfrm@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix to use "crc32" keyword
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3f8a7a6c250c..34071782455b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4431,4 +4431,5 @@ module_exit(exit_f2fs_fs)
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: crc32");
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
