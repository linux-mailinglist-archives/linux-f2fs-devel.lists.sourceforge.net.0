Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598CB2EB56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Aug 2025 04:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-Id:MIME-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W+G2Z7HdDQEiFxU09uAV7FkmFTEL5DEPIy1qE4YLqsU=; b=JO3kOpUK26eON5SoJIqKf4XH6O
	H0tNWql+PGXKGCmWSwtlY0JXt+9vr798gMRL5pXQBERyKlxiaCKuzR5gtt5YisqCLorbOV4DdghCV
	/cKloswf2bab8Okf76ElmVTXjY0l8y+GJTUWKyrjyoJOr1eI0z6nf7KlHiU27KV+kSJM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uovEG-0007ir-TH;
	Thu, 21 Aug 2025 02:40:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull+jiucheng.xu.amlogic.com@kernel.org>)
 id 1uovEF-0007ij-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 02:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding
 :Content-Type:MIME-Version:Subject:Date:From:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QShxIkkEQRm8ycsBGSawrTKLMvWjmcPTJCNslPAgKM0=; b=XrTiyUAd+Cmh7x6Qn9JpdPsICO
 TCPYTlV0jcS/HZGc31YcGMsOdk3aAvQ8jRVBR2JAwkmuvnHuhnwhc5PaDQkucNAU3F6OH/DMgG+du
 U+ZG1cUQsjsbM/odC+xRv1kHevIsKBN+0oRr4Mtoi1O8+sMYuya5d12QzFhKZzzIRWTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QShxIkkEQRm8ycsBGSawrTKLMvWjmcPTJCNslPAgKM0=; b=deitJapA2IOzsesCmyP/ZyIUy3
 Z9kes6TK8TJo1EAwrUNmhazl5aHlBV8GqYSgq9A/PZjiuEOsYe0egbG2PByTOpF4GANX3qTMtMlyh
 0YOHqJ4su5tJGaxe0PZanqZJbSL48zKeJQMO1TaNBWVdKi3okzLDLm4dmcEv1cTy4Bzw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uovEE-0004fj-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Aug 2025 02:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E7466144A;
 Thu, 21 Aug 2025 02:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6BD7C4CEE7;
 Thu, 21 Aug 2025 02:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755744032;
 bh=aXuO83ahAy8rkUHy5j81fv7qlC2lpPGnmdUGTUBiO8M=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=klvBs9OvrurRM+E8HLuGqZwoh9MOyRL2SVnGznpgOxR4SZZuS1VMDC1qTP2mW5co0
 mg61m6iDc7LhM6TqYEeKuHTHN6Wx924uySsqapz7jsbQYk1S9usVhr41uNvZhVIfeN
 OmwJWfscLoofOa+quYIwkSOIwvntHVUNqvuNVFOtt0TLmdsriA1t9gYbTKq7T/03m6
 7mu8b5zY5/g1k7WrxfEgNnoE3dhECdCANm9lVyX4Y1Azq4ssTTqvOrONtF3WLBsYpH
 sb0kz9jeBTiGrtbgPQZrPlxkQsmZKaGfXB2xAWJG4KVQz51KyIeWQyIFGI3vvTxuV6
 S6pfUubLMcMuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DC50FCA0EE4;
 Thu, 21 Aug 2025 02:40:32 +0000 (UTC)
Date: Thu, 21 Aug 2025 02:40:05 +0000
MIME-Version: 1.0
Message-Id: <20250821-dev-v1-1-17895dcd6de5@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAASHpmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMD3ZTUMl1jwyRzS6NUi1TDtCQloMqCotS0zAqwKdGxtbUAqe5cjlU
 AAAA=
X-Change-ID: 20250820-dev-31b792e8e1fb
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755744031; l=4919;
 i=jiucheng.xu@amlogic.com; s=20250821; h=from:subject:message-id;
 bh=wya5DJZMk39l246MFX6Ep0FIXV5z0kLcEUjj/zgmqaI=;
 b=G5KBIf5K81W0tkR5CiKqDJVQU7RucYNqi8LD6FZF1mG+LcYobV47qSunumqd9VVimzcRB1Oil
 WxUGiWKJN7pCJmOYIAJE214iesp4F4iFos1L0rULtD29ttXW8ihurgz
X-Developer-Key: i=jiucheng.xu@amlogic.com; a=ed25519;
 pk=Q18IjkdWCCuncSplyu+dYqIrm+n42glvoLFJTQqpb2o=
X-Endpoint-Received: by B4 Relay for jiucheng.xu@amlogic.com/20250821 with
 auth_id=498
X-Original-From: Jiucheng Xu <jiucheng.xu@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Tao Zeng <tao.zeng@amlogic.com> Always do checkpoint
 is a heavy behavior for compressed file. But for contiguous writing of a
 file, checkpoint need to be skipped to help improve performance. Tested with
 iozone for always do check point on compressed data, results are: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uovEE-0004fj-Tx
Subject: [f2fs-dev] [PATCH] f2fs: skip checkpoint for compressed file write
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
From: Jiucheng Xu via B4 Relay via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: jiucheng.xu@amlogic.com
Cc: Jiucheng Xu via B4 Relay <devnull+jiucheng.xu.amlogic.com@kernel.org>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Tuan Zhang <tuan.zhang@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Tao Zeng <tao.zeng@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Tao Zeng <tao.zeng@amlogic.com>

Always do checkpoint is a heavy behavior for compressed file.
But for contiguous writing of a file, checkpoint need to be
skipped to help improve performance.

Tested with iozone for always do check point on compressed data,
results are:

File stride size set to 17 * record size.
                                                  random  random
    KB  reclen   write rewrite    read    reread    read   write
102400       4    1314   35488   234231  1683793 1212394   35334
102400       8    2387   54133   244584  1871789 1644952   52478
102400      16    5060    7059   298052  1901792 1894929    6600
102400      32    9315   13118   424723  1825565 1924235   12041
102400      64   17028   22258   491181  1844443 1968247   22115
102400     128   30551   38008   445192  1796615 1917466   38527
102400     256   46944   55006   509625  1630910 1715586   56201
102400     512   63355   70432   434639  1406089 1487569   72718
102400    1024   83036   86742   447141  1420505 1503320   88913
102400    2048   98577  101971   450287  1434918 1522294  106374
102400    4096  113300  116994   451286  1435321 1527404  119579
102400    8192  132532  133044   488503  1458688 1540595  141167
102400   16384  143246  143857   489376  1469878 1556530  151362

We can see that writing speed of small pieces of data(less than 16KB) is
very slow.

With this change, iozone data are on the same hardware:
                                                  random  random
    KB  reclen   write rewrite    read    reread    read   write
102400       4   14658   34796   232797  1985764 1219513   34509
102400       8   25980   53695   233218  2419198 1788989   51927
102400      16   49556   50325   266754  2780871 2256746   50593
102400      32   79947   80783   393452  2755413 2467949   77681
102400      64  104866  105830   531853  2816504 2596812  106223
102400     128  142097  142034   651876  2885805 2728473  143296
102400     256  146972  144822   535727  2542080 2450922  157390
102400     512  126591  152480   571581  2055442 2052839  156512
102400    1024  135164  143667   654547  2052594 2045214  130488
102400    2048  127587  124889   491258  2058457 2059454  141273
102400    4096  124280  123959   660713  2067394 2056889  131967
102400    8192  138240  136233   509709  2102040 2090773  149215
102400   16384  146524  145333   576519  2118162 2096482  158704

We can see that speed of write with small pieces of data increased a lot.

Signed-off-by: Tao Zeng <tao.zeng@amlogic.com>
Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d6a49de1b7e919eda12354c074b8b253b2a9ea3f..2f820d531cdb32c0fc050aca05ffd3d00395a618 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1531,6 +1531,7 @@ enum compress_algorithm_type {
 
 enum compress_flag {
 	COMPRESS_CHKSUM,
+	COMPRESS_SKIP_WRITE_CP,
 	COMPRESS_MAX_FLAG,
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 42faaed6a02da01f2bd117a5c55e1761beaffde6..3561b407f45e7aa97c7dcf911d4dddbc01ec2ca4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -212,7 +212,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
 
 	if (!S_ISREG(inode->i_mode))
 		cp_reason = CP_NON_REGULAR;
-	else if (f2fs_compressed_file(inode))
+	else if (f2fs_compressed_file(inode) &&
+		 !(F2FS_I(inode)->i_compress_flag &
+			 BIT(COMPRESS_SKIP_WRITE_CP)))
 		cp_reason = CP_COMPRESSED;
 	else if (inode->i_nlink != 1)
 		cp_reason = CP_HARDLINK;
@@ -5234,6 +5236,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
 			f2fs_buffered_write_iter(iocb, from);
 
+		/* skip checkpoint for normal write compress file */
+		if (f2fs_compressed_file(inode))
+			F2FS_I(inode)->i_compress_flag |=
+				BIT(COMPRESS_SKIP_WRITE_CP);
+
 		trace_f2fs_datawrite_end(inode, orig_pos, ret);
 	}
 
@@ -5250,14 +5257,17 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+
+	if (ret > 0 && may_need_sync)
+		ret = generic_write_sync(iocb, ret);
+
+	if (f2fs_compressed_file(inode))
+		F2FS_I(inode)->i_compress_flag &= ~BIT(COMPRESS_SKIP_WRITE_CP);
 out_unlock:
 	inode_unlock(inode);
 out:
 	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
 
-	if (ret > 0 && may_need_sync)
-		ret = generic_write_sync(iocb, ret);
-
 	/* If buffered IO was forced, flush and drop the data from
 	 * the page cache to preserve O_DIRECT semantics
 	 */

---
base-commit: 3ea4ad0a1df0bcbfd5ccdcea56d57ca4678ae2a8
change-id: 20250820-dev-31b792e8e1fb

Best regards,
-- 
Jiucheng Xu <jiucheng.xu@amlogic.com>




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
