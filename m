Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEF751D5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2019 16:53:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqf7H-0007u0-0g; Thu, 25 Jul 2019 14:53:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hqf7F-0007ts-0a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 14:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kN/aLUUdFu3rLRxfecGQLZmaWAXythFLcnxTrP7MP8U=; b=JtVMVHkMZbkezJATK4StNR0sjO
 MA7deLcEn35sa4DcRlxr+qZ+wmoN8Nl2vAmBijZGbHXe7wsZy4v56tfPiZsKMb/Yprkv+eBizLqCL
 8vnhWSg9HMUdrgvlnl5ZWghW+xqxwz6c9ivRQamPhR84IDDUAIdkaMaIcZ/0f0b61cXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kN/aLUUdFu3rLRxfecGQLZmaWAXythFLcnxTrP7MP8U=; b=T
 Urk0zmztOtCJvs2dLn6QuDMmVTyr+73tadgvqY2PNLTFQoP2t67K9pXeo9orU950z7kGqPXzwwTmU
 YhsPBOvQxDehBgyP77tDQtgFTN9+DVOP+FundY+3rdICLPWgL9zQQLOsrfiUysOWoOcW+Rb5bn0hI
 7mZNsxSqWk7NnWPs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqf7B-00Fe4X-5X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 14:53:08 +0000
Received: from localhost.localdomain (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4667722BF5;
 Thu, 25 Jul 2019 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564066378;
 bh=aA2TJGFrTFD2kniTHTChUAByBdRuVeG5Y7UlnhgOl/0=;
 h=From:To:Cc:Subject:Date:From;
 b=o+nDEGl+dM89r2UXqrtgV3BraDJpIwnjFi2mVg9qmzUGnrxJO8NI3kLMvPWigPg9l
 a+AJK6oxKLIm4o0+9umaxohysG+PYu9NTFU2nCUM3I2+hD+TzJoJWcvLLPasngwNDA
 vho/N14ahAos9eQ3qy55bV/2vICO22/QV1tD38hE=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 25 Jul 2019 22:39:11 +0800
Message-Id: <20190725143911.28468-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hqf7B-00Fe4X-5X
Subject: [f2fs-dev] [PATCH] f2fs: disallow direct IO in atomic write
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

From: Chao Yu <yuchao0@huawei.com>

Atomic write needs page cache to cache data of transaction,
direct IO should never be allowed in atomic write, detect
and deny it when open atomic write file.

Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 43d878f3db0f..34de73be2cc9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1842,6 +1842,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
+	if (filp->f_flags & O_DIRECT)
+		return -EINVAL;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
