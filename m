Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6D2F5B9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 08:54:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzxSN-00066t-QD; Thu, 14 Jan 2021 07:54:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@kernel.org>) id 1kzxSI-00066J-KH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 07:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WgHajNfN1j71bV+cBAhaeu2l8LzDHSRg6OFQvc1RyUY=; b=fH46wLqSgZcU0Xp0U0cq4+V2Do
 o0MaQ6ftpONOkAW+FRHetagbhASIX5YxKR8av5X940BzJKQkm5Iifl0Ci88h2cIO3gkHTFXSZ+bFe
 CORC5I0XQ10pO8o+mBvT+fbiiwK266Ak7FC+nyZ7a35vNKGzvqt6cA3Gx/tip/ZkhZ20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WgHajNfN1j71bV+cBAhaeu2l8LzDHSRg6OFQvc1RyUY=; b=dsKEjI8Th0N5q6Ee2rozxDK/lo
 U85ZCTRLpgBgC9+WS7LMPYtjaorvh9PUlvpzPjhT0sYAPJd2Utr0DH44mokuKEgr43mSCEErRouk/
 FWCgn05DgF9s0F10bkoSbbi/vUPnBBfVJlPXsrPInTYglzelEgbSSdGqhIFbB3iQ1L9Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzxSE-00EdjN-Pp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 07:54:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD0A423A02;
 Thu, 14 Jan 2021 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610610830;
 bh=j46GC8EQ+wDuLjInlFgJe8KE3E7zAC95eawxVM4OyVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TBEIyN6xrBAwrDGRr7PolKZCEZ2IuCrm4dsYZ4EZOafK3gMz6ZlfuU5qKJrNT81sb
 hFDqMkpUiMntg1wqigxZ8xYoDzrq4bIxDMB/PunIWYL/YdBq8vDSdJs1lgs0rrxGVx
 r9ictQapiWVqYbP04m1qWmjPahn/drp34WBQKVkZTnefzPmsWxsdvHkbd+ipNPLpO/
 Hia9VtOAtCehRhE9+dlbERyRVK/n8tL12UyP4pOKa/v92q5igI7Yz4dS7ns5BJo4f1
 H788VGyg0HYe/qtjWCyrcQtT1s+wGp5mDYJNyWb+vCU7iPpSzrHwydg8YvdCJ9H2ct
 C2m1YUoISr3xw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzxRz-00EPu5-53; Thu, 14 Jan 2021 08:53:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 14 Jan 2021 08:53:37 +0100
Message-Id: <52a3058459673bc190ca6044779ccea9146c7208.1610610444.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610444.git.mchehab+huawei@kernel.org>
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzxSE-00EdjN-Pp
Subject: [f2fs-dev] [PATCH 02/10] ABI: sysfs-fs-f2fs: fix a table identation
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Solves this doc build error:

.../Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Malformed table.
Text in column margin in table line 15.

=====  ===================== =================================
value  sb status macro       description
0x1    SBI_IS_DIRTY          dirty flag for checkpoint
0x2    SBI_IS_CLOSE          specify unmounting
0x4    SBI_NEED_FSCK         need fsck.f2fs to fix
0x8    SBI_POR_DOING         recovery is doing or not
0x10   SBI_NEED_SB_WRITE     need to recover superblock
0x20   SBI_NEED_CP           need to checkpoint
0x40   SBI_IS_SHUTDOWN       shutdown by ioctl
0x80   SBI_IS_RECOVERED      recovered orphan/data
0x100  SBI_CP_DISABLED       CP was disabled last mount
0x200  SBI_CP_DISABLED_QUICK CP was disabled quickly
0x400  SBI_QUOTA_NEED_FLUSH  need to flush quota info in CP
0x800  SBI_QUOTA_SKIP_FLUSH  skip flushing quota in current CP
0x1000 SBI_QUOTA_NEED_REPAIR quota file may be corrupted
0x2000 SBI_IS_RESIZEFS       resizefs is in process
====== ===================== =================================

Fixes: 969945899a35 ("f2fs: introduce sb_status sysfs node")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index e5918c93f3bf..1ba8d533437a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -383,8 +383,9 @@ Date:		December 2020
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	Show status of f2fs superblock in real time.
 
-		=====  ===================== =================================
+		====== ===================== =================================
 		value  sb status macro       description
+		====== ===================== =================================
 		0x1    SBI_IS_DIRTY          dirty flag for checkpoint
 		0x2    SBI_IS_CLOSE          specify unmounting
 		0x4    SBI_NEED_FSCK         need fsck.f2fs to fix
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
