Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9C1FDB54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 03:12:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlj6Q-0002N0-Ft; Thu, 18 Jun 2020 01:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jlj6L-0002Mh-Ly
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UWc0efAMob6Qec+TRdwQzM7qRb3CJqVIgxvRWcn5aA=; b=aXHFhz4oQeHUy1pCVp/m3TVc7t
 jw9k7RG38tHlDad3hh7IHeLL4q+gaCQDH4VHBR2NRltWDEWr+OjnyKSG82UvBJEQhQuCSUEuMVaTJ
 JrMoWOEBDnVcvbpTWKiq6LWF9G47LWP/G4jZOwubRIH3J4pzOgtovGXc9t8I4kQSnaJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8UWc0efAMob6Qec+TRdwQzM7qRb3CJqVIgxvRWcn5aA=; b=VscY2P5Jxgm0rz2CzfnnF1Ygg6
 xu+GIKu/dCsGYJELKPgqJ5qpuVXlwvEmqBzn+LeC71Hwp7Uy18IsoVLLLydLYBxry0+dfU3vCHjj1
 U27VUPiYmDZukl/NEkF2ZO5zaZFxmH7vowAcQaneidNeVZtWWEtb/+k+gAzjL0kZua0g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlj6K-007eO1-Ku
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 01:12:21 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F04E20B1F;
 Thu, 18 Jun 2020 01:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442735;
 bh=SQj2NRbSEqIYGQpLgmiIi058rCiMpe/GiKQnx6UPSrU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dx7Yum849qaqp6kRWl+5A4qxolenYXlHQ7UdkzoWKjuBqOV8gUPqzYUcujdgxHe+2
 SbQRBYnaazqQiKzLXSqIG+1Xmxi2XSeOy7DZr2e6+ANhAUWA5Feuf1lWd1JDgvlrcK
 COOMsUId+IzfX3ScDmvDtr+fIwbf2cLT/xhhlbiE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:04:47 -0400
Message-Id: <20200618010805.600873-190-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlj6K-007eO1-Ku
Subject: [f2fs-dev] [PATCH AUTOSEL 5.7 190/388] f2fs: compress: fix zstd
 data corruption
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 1454c978efbb57b052670d50023f48c759d704ce ]

During zstd compression, ZSTD_endStream() may return non-zero value
because distination buffer is full, but there is still compressed data
remained in intermediate buffer, it means that zstd algorithm can not
save at last one block space, let's just writeback raw data instead of
compressed one, this can fix data corruption when decompressing
incomplete stored compression data.

Fixes: 50cfa66f0de0 ("f2fs: compress: support zstd compress algorithm")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c05801758a35..a5b2e72174bb 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -369,6 +369,13 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 		return -EIO;
 	}
 
+	/*
+	 * there is compressed data remained in intermediate buffer due to
+	 * no more space in cbuf.cdata
+	 */
+	if (ret)
+		return -EAGAIN;
+
 	cc->clen = outbuf.pos;
 	return 0;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
