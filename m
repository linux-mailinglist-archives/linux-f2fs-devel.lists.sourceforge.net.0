Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A298CD4BF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 15:30:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sA8WN-0008Du-HS;
	Thu, 23 May 2024 13:30:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sA8WM-0008Dn-Nc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OuCNEgJSsUEnXJbZPKO91r6MB414YH8j6wV6xl5Olk0=; b=H/MM0hv4GEE/+1tN7rnhxQU67N
 hp9rwEkBRcZraXErXF+UGfIXLvhwA1fz9xPu4V24vkWZnkVe9CvzYJAEse2vh2/Z1q7KqFBQbyqU7
 3Xubu5ajIxCZwsn4Q0rY3uJaMGYVwyxhtuv2jL6SnaQn+Ay96kvSUKdFYJmu1WMRHhZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OuCNEgJSsUEnXJbZPKO91r6MB414YH8j6wV6xl5Olk0=; b=C
 WjyShuUZnsvT90FN0bxhAFlaoldqR9kOIKobk4CGHLdc1kWUa9M8DK1PF/g6oELHORL8QshBgsLIJ
 U+WkGNycMontvmTPl5L3H0zgZAoNsh/KJF3bZoSkHGu9tUDv4mqxMmwwoggtwHMg6WJn4dE+RENEW
 K4szou6vFNap4neA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sA8WM-00034X-30 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31871CE16FD;
 Thu, 23 May 2024 13:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A8BC3277B;
 Thu, 23 May 2024 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716470999;
 bh=Rk4yXUP9gRTWbd2b0oejhcUnoZA8VySiJ7FWn7BIDGU=;
 h=From:To:Cc:Subject:Date:From;
 b=YtEjefmpxgRonDoRO53ZOxb0h9X1hV1MABIRTkpEcM46Fdu7FjXI2mZZXdX+2m2Nu
 gzLkYAJe9ws3crPFQqXzYzrX+fgu+oifo1GrCAlJzDQLaNSGmjZA7pkX9Or8UwWcBG
 HurnlUeJCuT060TU+kxrTlk4md+95Q2HoyWJoc4HWc9gSG14KpFuLMGacmM0/NMRlE
 4VDbWSEmQPJ6/YOYQc5AS2XsxBR4yJxpv7Vc4s9nYqjb9uuoB+1+jNP8KAaMuWmgsH
 HPFE8+7iOd47xNbmfEk/BGIewPeFKzkGzjZMzoLjHZOUAQkYo9/YZzyznnUful6Xwo
 8dlJNjnq7+Tbg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 23 May 2024 21:29:48 +0800
Message-Id: <20240523132948.2250254-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It will return all zero data when DIO reading from
 inline_data
 inode, it is because f2fs_iomap_begin() assign iomap->type w/ IOMAP_HOLE
 incorrectly for this case. We can let iomap framework handle inline data via
 assigning iomap->type and iomap->inline_data correctly, however, it will
 be a little bit complicated when handling race case in between direct IO and
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sA8WM-00034X-30
Subject: [f2fs-dev] [PATCH] f2fs: fix to force buffered IO on inline_data
 inode
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
Cc: Barry Song <v-songbaohua@oppo.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It will return all zero data when DIO reading from inline_data inode, it
is because f2fs_iomap_begin() assign iomap->type w/ IOMAP_HOLE incorrectly
for this case.

We can let iomap framework handle inline data via assigning iomap->type
and iomap->inline_data correctly, however, it will be a little bit
complicated when handling race case in between direct IO and buffered IO.

So, let's force to use buffered IO to fix this issue.

Cc: stable@vger.kernel.org
Reported-by: Barry Song <v-songbaohua@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index db6236f27852..e038910ad1e5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -851,6 +851,8 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 		return true;
 	if (f2fs_compressed_file(inode))
 		return true;
+	if (f2fs_has_inline_data(inode))
+		return true;
 
 	/* disallow direct IO if any of devices has unaligned blksize */
 	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
