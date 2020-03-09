Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F317E728
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Mar 2020 19:31:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBNBJ-000092-FB; Mon, 09 Mar 2020 18:31:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gustavo@embeddedor.com>) id 1jBNBI-00007y-UA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 18:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vb54cLSvPsXKWYl9Uu3Xdo1u6mHlzTCiMBQVMibC31E=; b=VcIwXOkLFSspaz/yAssDM3JKZ6
 tpqs3wPwW69mVnroa6bLMMvGC9shqVaezI5F89Mt8N7+kVl+b6v5ePFq9f6jl60GE/rCTJkr09UWR
 szIzG/yBkhxtkfJbkBbYVllKCk4K/G0acFopH/tV4N8if/R+vlz2l33UvjU/XlAYYYLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vb54cLSvPsXKWYl9Uu3Xdo1u6mHlzTCiMBQVMibC31E=; b=g
 y7Qy8rJhhkb96Sx13R21rVtqNjAtEoSm56/gScNViaGkd0dD3b6BaNxAm2XQxsqYYrJMtKXJFQSUr
 al96pxinhtDEOx5t7FL4+L/gTJQAaejB0fQ+pGgzY9HKoBR+KDwcTPPQEEV3V93Myc4NRSs/UQFWu
 wpWvx7uE6u0Z6xMA=;
Received: from gateway32.websitewelcome.com ([192.185.145.101])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBNBF-00718L-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 18:31:12 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 5618214BD89
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Mar 2020 13:06:58 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id BMnqjyDSiEfyqBMnqj0rDW; Mon, 09 Mar 2020 13:06:58 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vb54cLSvPsXKWYl9Uu3Xdo1u6mHlzTCiMBQVMibC31E=; b=OR94NR7dX+CIJD1BT73j8FaZBI
 779HwshMroI13BfyDG1CDrPKpJGHNVVxElzNT6EaqFafdoIpTzZT4yqL2jQ+MMJ3Nb3IE0uUAwCQF
 NvicACmxb7YKu6WO3nh76UfqPc5D9iZcRQss2vn/rqNFqqqcVWBWujx7krXRwmXWs/K4s7qZryNNf
 eKVzeATxW/YPwheUvb4uM+QEO9u14nTrMDwrN4S+UPfe7TSurbFrMVIJfScPsXqvmw88CWbeRiXeZ
 V8i5j5U8QaRJFnuHiWCk7WZupg4HnJ8TSnefMlmOwRuYBvnlDwJyQbNqKCDOyIneYfshz5PCSz1Xk
 u5RWEgvA==;
Received: from [201.162.240.150] (port=23942 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jBMno-004DyT-8u; Mon, 09 Mar 2020 13:06:56 -0500
Date: Mon, 9 Mar 2020 13:10:08 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <20200309181008.GA3537@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.240.150
X-Source-L: No
X-Exim-ID: 1jBMno-004DyT-8u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.240.150]:23942
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [192.185.145.101 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jBNBF-00718L-Ow
Subject: [f2fs-dev] [PATCH][next] f2fs: xattr.h: Replace zero-length array
 with flexible-array member
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/f2fs/xattr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index de0c600b9cab..95d589bf8e22 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -49,7 +49,7 @@ struct f2fs_xattr_entry {
 	__u8    e_name_index;
 	__u8    e_name_len;
 	__le16  e_value_size;   /* size of attribute value */
-	char    e_name[0];      /* attribute name */
+	char    e_name[];      /* attribute name */
 };
 
 #define XATTR_HDR(ptr)		((struct f2fs_xattr_header *)(ptr))
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
