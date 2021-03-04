Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3E32CF84
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Mar 2021 10:21:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHkAs-0006Ac-0z; Thu, 04 Mar 2021 09:21:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <colin.king@canonical.com>) id 1lHkAq-0006A7-MB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 09:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=euUkgjoINdSJOLGagz7MkAFqEmnvly/KMcbKiGgsPOk=; b=bmSH/XI+bRQPSueLS77sG+rtij
 T2AbxpuQvSXJEl3ziQ0awLk3BnWmXLegTrRta2A9DvInWCpUr0wEBT2tjagoQSHG53yOSwM+jd09i
 gR2ryYmHpybkwMJZyHdxi4iy86lCx5MSdcYmcNyXywDzRaJB0k+Q8/6vm/0qreb/mB64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=euUkgjoINdSJOLGagz7MkAFqEmnvly/KMcbKiGgsPOk=; b=j
 laGE+sfcnyrV7CTsvG8HQAEcJO/S1p1Z95rcuTNGO07Xtit2rBBOMOeFB6cs45Vi92OHKZa4DBuu9
 CW1nEA9ajhPB3Vq8jO00HkroOwIV0w/9/5XXyMcrtZu4oJVwYZ80f2FRkLUf3+fooLrWceFmXWdp/
 YIrFD2rCTHANc0DA=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1lHkAf-00DaOe-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 09:21:36 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHkAY-0001W7-J6; Thu, 04 Mar 2021 09:21:18 +0000
From: Colin King <colin.king@canonical.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  4 Mar 2021 09:21:18 +0000
Message-Id: <20210304092118.2279879-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: canonical.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lHkAf-00DaOe-Ap
Subject: [f2fs-dev] [PATCH] f2fs: fix a redundant call to f2fs_balance_fs if
 an error occurs
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Colin Ian King <colin.king@canonical.com>

The  uninitialized variable dn.node_changed does not get set when a
call to f2fs_get_node_page fails.  This uninitialized value gets used
in the call to f2fs_balance_fs() that may or not may not balances
dirty node and dentry pages depending on the uninitialized state of
the variable. Fix this by only calling f2fs_balance_fs if err is
not set.

Thanks to Jaegeuk Kim for suggesting an appropriate fix.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2a3407607028 ("f2fs: call f2fs_balance_fs only when node was changed")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/f2fs/inline.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 993caefcd2bb..92652ca7a7c8 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -219,7 +219,8 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 	f2fs_put_page(page, 1);
 
-	f2fs_balance_fs(sbi, dn.node_changed);
+	if (!err)
+		f2fs_balance_fs(sbi, dn.node_changed);
 
 	return err;
 }
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
