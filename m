Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA62331E34
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 06:10:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJUdq-0006Pv-6W; Tue, 09 Mar 2021 05:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1lJUdo-0006PZ-5p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 05:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FXe55cT5EJ0GA/LizEakPQ9SANkLLJ+tdN4gv5UPcm8=; b=T3pTR8og0BDaFpIGOJdNa0HC4P
 3WrgIbNjjku1WIvcEvy6r5BWAU9OwUgee3GsMdZx1aLDOU1sXg9oB6c/shfFW5MT3a3yEzZGkUkhp
 V4uHHnuSmGkKU4hjVJaRKcI2AuTdgplO6KTht0/6bGI9s4iqFpit2uceGceOJgsmk4qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FXe55cT5EJ0GA/LizEakPQ9SANkLLJ+tdN4gv5UPcm8=; b=hvuB2MCaEpfG0jnpoD66CkwDXr
 rTeDMnE+cJ7omDBMnIktZBHsW+NKZwHM8wj6BTIDqBnT8AIQIWo8KEXyIhDjOWY2pGbQA7w3PaXuy
 AvraCy+/8jFa6CoqtaxyRR420xUBTAhAph+AXLGG3+VbAd0nbXRnU8u4FGI+5Qe2oQuk=;
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lJUdV-0006sD-Q1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 05:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1615266605; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=BI0M5hxWTahk7R4UlhebX36g4p3ayq2UrZLU1nAG56OZkXB+2be5zHv8OlvBNCTwDw3cKF5DB4jLw73GXXwvMLfs2ZRU9RsI0ZcXDzyxBZ8/PQunWJxOS+ImomXAvVVZb0MamMA9XswJuAoDMKdA8wdcgN86Fd86HlpGsE7/6Jg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1615266605;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=FXe55cT5EJ0GA/LizEakPQ9SANkLLJ+tdN4gv5UPcm8=; 
 b=oFI0umAmT1lCE+0LqBapuueYCpLjC98uXXRKwd+f9jyKdgRZHxFXAz3ygfiq3RCDZwwg2Afxxe/Q94R9z70D8tXnw6HOcSAIoUW6//xvLZR+pcb+Wi/0qtKL7ziK6sX+RQ0KueveHzf0/GE8VrZMJjhpgK+LLgNpxwgqT7LMY2Q=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615266605; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=FXe55cT5EJ0GA/LizEakPQ9SANkLLJ+tdN4gv5UPcm8=;
 b=Ty9jIcO4riFl6Q8AJiPffYzefRp/0l11RQR3RD5J9p5EcXSh7xavAxlbrppSlea0
 xL+SgcKhR9o4eQBr0+Q25Z9p8OHfXd2p2Cpy2kOB7DZcVWX++ImAkKzlzIESXwUGKrr
 zlv8eBvlOFHGq45rizrOExSmIjc1oicL4kYxartQ=
Received: from localhost.localdomain (159.75.42.226 [159.75.42.226]) by
 mx.zoho.com.cn with SMTPS id 1615266603958651.7144712756642;
 Tue, 9 Mar 2021 13:10:03 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20210309050938.592976-1-cgxu519@mykernel.net>
Date: Tue,  9 Mar 2021 13:09:38 +0800
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.243 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lJUdV-0006sD-Q1
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to use per-inode maxbytes in
 f2fs_fiemap
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS inode may have different max size,
so change to use per-inode maxbytes.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
v1->v2:

- Calculate max bytes in inode lock.

 fs/f2fs/data.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7c95818639a6..3cbcde4174e6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1850,6 +1850,15 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	inode_lock(inode);
 
+	maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+	if (start > maxbytes) {
+		ret = -EFBIG;
+		goto out;
+	}
+
+	if (len > maxbytes || (maxbytes - len) < start)
+		len = maxbytes - start;
+
 	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR) {
 		ret = f2fs_xattr_fiemap(inode, fieinfo);
 		goto out;
-- 
2.27.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
