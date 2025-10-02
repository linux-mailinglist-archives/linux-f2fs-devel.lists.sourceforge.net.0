Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083EBB24E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Oct 2025 03:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3/seysWyWQf0sDQO2Bc/O9ICZKcKE10Albh64Xg3rA=; b=VwyYII1yBR4iEPwLDK7dSY4gR/
	h4rrg5lrQDsl3yAW1kkHUGaR3jB1A8jNh9Eb2kAFw7D7Cj1TXIfrrY6zpoHzOMb12ztCeVizurIp8
	ig0qATt3zSIsnu/j3YPaOdYuUzLZmMm0BNWuQw2/ZpDn0Uo3vy1sKdeRkM6SiuwWK5Yg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v48Yx-0003OP-7T;
	Thu, 02 Oct 2025 01:56:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v48Yv-0003OJ-MY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 01:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3P25xc+xiOTiwTL4AbrmjQbIbDqmBDxgeqTRQhOW94=; b=Nnp5pDubB9ddho3tP8SDOcGTVz
 G5tJJr8pgYSiVuyJqWWXeR1CFU2wyFgELdqWX8fGAxLYt3HWo3VvhLlyX7O/ptS9z2mwUA7wLVhgV
 G145ZoQhVMNKEQ10kzoFweYsoiLF/zmX/CVCX5XGyH14yEti2ohcaHrGiUoVHW0QJC10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b3P25xc+xiOTiwTL4AbrmjQbIbDqmBDxgeqTRQhOW94=; b=B
 1ssOhQvw6PdWRW7+wVVcCHsbv+eJ08zUvd6WUFRM40RmK2tQTeQazj0jqMyezejYZHLL0YIvpbv91
 V4XrKv6jLYPmq77tLtPL+SSwUwgZR0vs3fSG9uSGYiWAHIKocHxgzZGp4W/34YKr1g19qJKZH62H+
 sxW55r23ntRPQrd4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v48Yv-00029F-Aj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 01:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C983543A0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 01:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94086C4CEF1;
 Thu,  2 Oct 2025 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759370207;
 bh=01fYEaXX5bM/2w1XwUy+dhIFMUhIo7WDFLeTNVXFsrE=;
 h=From:To:Cc:Subject:Date:From;
 b=AkruCSmMOw8vqDIFrHAsV3BOcQ1PF+iWbhRcGgzyocDxnOCEJJ/5fxWzbi3c5OQKv
 ak7j7Hn5xyUZcY6jM3lG//UohIYrwRAAp+XMh2c35K+svtDbj5B/CsiRxadq7WX1a3
 E6X59Lod4eYIuQTwPrWmzs2hFR7eQ313NySUNIgDPZitikdAA6rL5/l6jNFPYfEKwF
 CAmTxkomPaMsMkIoJCFJaECyuRWevIpKzOSvCJRTjxKS12WoXSuL5PDeM1V/cc1fFG
 jVQA4ijrTwZTQgwslFC96OTDd1BvRwvuEDXzdmXnJDcqCZOZFAbbBCxHphqWe0cGYZ
 M+sXttM/C/ivQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Oct 2025 01:56:45 +0000
Message-ID: <20251002015645.3588322-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We missed to call dput() on the grabbed dentry. Fixes:
 f1a49c1b112b
 ("f2fs: show the list of donation files") Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/sysfs.c | 1 + 1 file changed, 1 insertion(+) 
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
X-Headers-End: 1v48Yv-00029F-Aj
Subject: [f2fs-dev] [PATCH] f2fs: add missing dput() when printing the
 donation list
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We missed to call dput() on the grabbed dentry.

Fixes: f1a49c1b112b ("f2fs: show the list of donation files")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 7992386fb9e6..6d2a4fba68a2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1845,6 +1845,7 @@ static int __maybe_unused donation_list_seq_show(struct seq_file *seq,
 				(loff_t)(fi->donate_end + 1) << (PAGE_SHIFT - 10),
 				(loff_t)inode->i_mapping->nrpages << (PAGE_SHIFT - 10));
 next:
+		dput(dentry);
 		inode_unlock_shared(inode);
 		iput(inode);
 	}
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
