Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 956393525B1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Apr 2021 05:27:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lSASt-0004Lx-3a; Fri, 02 Apr 2021 03:27:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lSASr-0004Lq-If
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 03:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTtwi2+8P6uKDze/MXSHJDhdR9aIl98rfXTYmBlwyik=; b=W7f5uyl3bkb71aXwqj1Jys++Rj
 K5KI516nPuMg+zVxrXu6Mxijnzyo+vi21KaQZ0LeQG+4SHtQIIIwDv8djdOWFTeQV8XECYcVwgaxD
 64gWuqYEeYMJS0TAMymf64uOtq0SydCr1cY296fWGS0X4DaoUzaoFeeZKHP9N6PodWYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aTtwi2+8P6uKDze/MXSHJDhdR9aIl98rfXTYmBlwyik=; b=m
 fXGD5u8fqYDhJbTu58NUQ9dU/MlFV5fW5Bn298i10tKgzkCZXzFONyjqXCfbQXQvVhZWK3YvfkOZN
 Nj79drYW3R9wJs6RhrBiZyFb56ljO6rzgzDAlOEyz4b077CzMke4rohUG6BdFb+MwjJnyo+s6OIkw
 k9IdegP/WcG+E0lE=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lSASj-0000l7-3b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 03:27:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B4F560FDC;
 Fri,  2 Apr 2021 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617334018;
 bh=cYl20oqyymcduVYyfQSf4qFqnpLjlRxnH846QLU2VQo=;
 h=From:To:Cc:Subject:Date:From;
 b=nWExemQskcJSdkGHamyL5V4smR3cZZC+B2SGB4CWY2zC6bqPEdbcrrycceiYZ0HZN
 lvLtmdKGxHexpMYAKsGcmQod5Y8jiU0vTzdWA+I77NQFpDV6oBmli3irdhRx7bJtDV
 S9rhD9B/HQnZaijLJt2d4pwCw6PxgcQ3dI/A8bMgMlyDg1YQVbZud+5vx8kjzU/G1B
 jyOFdh/i2d2wrG/8KFFgbI/bYkSKwADq69ZhQI1horTAweOsAlkp7MENUFZKSr1e1w
 K5to3sA04Ido3noZaHHnGAWBOWJwa3i5yz2vOaEqsZrQM8xz0HkdTjq9i51SElQPNm
 AVShPLVw3bzdw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  1 Apr 2021 20:26:41 -0700
Message-Id: <20210402032642.2537641-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lSASj-0000l7-3b
Subject: [f2fs-dev] [PATCH 1/2] resize.f2fs: fix wrong ovp calculation
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

beroal reported a mount failure due to broken valid_user_blocks.
[ 6890.647749] F2FS-fs (loop0): Wrong valid_user_blocks: 16040048,
user_block_count: 10016768

From fsck,

segment_count_main                      [0x    9a95 : 39573]
-> 39573 * 2MB = 78GB as user space

overprov_segment_count                  [0x    4e29 : 20009]
-> 20009 * 2MB = 40GB as overprovisioned space which user can't see.

But,
[FSCK] valid_block_count matching with CP             [Ok..] [0xf4c070]
-> 0xf4c070 = 16040048

valid_block_count                       [0x  f4c070 : 16040048]
-> So, this is correct.

It turns out resize.f2fs gave very large and wrong overprovisioning space
result in shortage of user blocks. The root cause was f2fs_get_usable_segments()
didn't consider resize case which needs segment_count_main from new superblock.

Fixes: f8410857b7a8 ("f2fs-tools: zns zone-capacity support")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs_zoned.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 56c97d1a65f7..ce73b9af66ec 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -495,6 +495,9 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 	int i, j;
 	uint32_t usable_segs = 0, zone_segs;
 
+	if (c.func == RESIZE)
+		return get_sb(segment_count_main);
+
 	for (i = 0; i < c.ndevs; i++) {
 		if (c.devices[i].zoned_model != F2FS_ZONED_HM) {
 			usable_segs += c.devices[i].total_segments;
-- 
2.31.0.208.g409f899ff0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
