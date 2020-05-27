Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D611E3EF4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2020 12:28:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdtIC-0002w3-A0; Wed, 27 May 2020 10:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jdtI9-0002vE-JX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxItM5n1YpYqe1YTpzVVI3EwCdZvTXQrNPLW+3FYcas=; b=h2W9NJpnztWeL+5NMLiisqPvkq
 UGLLZ8aDWLDDcZk88mZj0Z6cv6P7UFy5XUFM/5fsoRPWvCW/MCETJstwvGRf7vIHYMcaOrUF0F2MQ
 BC9oNTP5jnqTSEF+2XcSKLlMNQqhL1ovTwF+fkaeAsPI8mgoSqVsfDm90p+uilClNV40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xxItM5n1YpYqe1YTpzVVI3EwCdZvTXQrNPLW+3FYcas=; b=g
 gxIxkbp5YwE28cRNNmbsPgLV9w4mBkglgRsLB/AjFkeuw0ZpfYtjzN2RrzGF03i1Tyc3QerPRgzNt
 m8+7mf2TYoN2yVqw9xjBzs6EULHzhFbRDK9SLPPycOelfTxwg6nRAQJ0ca9WKtbeyVsMxJqRq66PZ
 oBWNAOvqixKnXnmI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdtI7-0094Xl-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 10:28:09 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0A807683E807A536D497;
 Wed, 27 May 2020 18:28:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 18:27:54 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 27 May 2020 18:27:51 +0800
Message-ID: <20200527102753.15743-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdtI7-0094Xl-Mu
Subject: [f2fs-dev] [PATCH 1/3] f2fs: fix wrong value of tracepoint parameter
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

In f2fs_lookup(), we should set @err correctly before printing it
in tracepoint.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/namei.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 63b34a161cf4..2c2f8c36c828 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -504,6 +504,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 			err = PTR_ERR(page);
 			goto out;
 		}
+		err = -ENOENT;
 		goto out_splice;
 	}
 
@@ -549,7 +550,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 #endif
 	new = d_splice_alias(inode, dentry);
 	err = PTR_ERR_OR_ZERO(new);
-	trace_f2fs_lookup_end(dir, dentry, ino, err);
+	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
 	return new;
 out_iput:
 	iput(inode);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
