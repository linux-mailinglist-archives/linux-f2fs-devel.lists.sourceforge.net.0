Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F7A5101E0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Apr 2022 17:27:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njN5t-0002q1-7S; Tue, 26 Apr 2022 15:27:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1njN5r-0002po-TN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 15:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=En+lqQ8swyKhSA/xbE03nx2mdFdta6drixsieWXfXwY=; b=TY7JmGJZnIdLrx0kaxp68H2zLe
 5/TiQHMMjfFD9SLl0YILGOjqtu0dNdChSkyJ6kbXk2Wr15C/cUDrxA0SqlgwUa8Tk+LWxc5aPH2b/
 F27vD2IJB0HszQOAKWXHcq+9e+9iaFOCT3fqpzdbFSNgiKIiLAjNLJrwc0/38O3u+hm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=En+lqQ8swyKhSA/xbE03nx2mdFdta6drixsieWXfXwY=; b=Z
 st0RG20BIa0nZwzRDP7qO5zfvuiB/mJO2Gs5eoL5lZXMWVUTZyYalmaCYqnQoXEkjS7Dy4KJ5B58k
 YK2nVWUPzw/wtCdbAxKQIpVpbc8fpjTCTFUWOBJeoQk5ly0T4PYmGYFkZ9CFGs2VPTQVzxsnm1yZY
 LdGv7osWqR53pmhU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njN5n-00Am6X-A7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Apr 2022 15:27:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 126FB6196E;
 Tue, 26 Apr 2022 15:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47898C385A0;
 Tue, 26 Apr 2022 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650986816;
 bh=2hTGeRgPDbSTyAVeec+ApELlltc5xubB+dLaXFYQPzM=;
 h=From:To:Cc:Subject:Date:From;
 b=IaKE6KOKpm0SCDBcF8v/3Lks/+ii2GqXDoMPxnb52pJw1tfX2I0F4i6PWhS0XBui8
 NEqglz2ycdcBv36327ZG3T8V0Diuq/Tvt/KLN31BYKx1QB+jUn0oDSRL+KosMa/zZt
 7zN+E6V79H4/teZRzdAm+7QiB8LPrCwhbGeAZqBw2MZRBKT1OUmUZjWJg1EP6SEz+y
 LK4UsX1Hgpvip6bf/TO3HA+SqTI9qauFdYQGGkcZg/j2RuM4dLu5qwtlBEdsI9M53L
 vpuu93mfADjoPafUtWqf0FfRG7f+mfoSg5KSjRKeTP4OveQFSJnaPUHKyPnoYsEKF7
 Tb3erJGGlzDuw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 26 Apr 2022 23:26:46 +0800
Message-Id: <20220426152646.5721-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compressed cluster content includes compress cluster header, 
 so calculation of dstlen parameter in LZ4_compress_fast_extState() should
 consider this design, otherwise compressed data may overflow dest [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njN5n-00Am6X-A7
Subject: [f2fs-dev] [PATCH] dump.f2fs: compress: fix dstlen of
 LZ4_compress_fast_extState()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Compressed cluster content includes compress cluster header, so
calculation of dstlen parameter in LZ4_compress_fast_extState()
should consider this design, otherwise compressed data may overflow
destination buffer during compression.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fsck/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsck/compress.c b/fsck/compress.c
index 620768d..b413492 100644
--- a/fsck/compress.c
+++ b/fsck/compress.c
@@ -86,7 +86,8 @@ static int lz4_compress(struct compress_ctx *cc)
 {
 	cc->clen = LZ4_compress_fast_extState(cc->private, cc->rbuf,
 			(char *)cc->cbuf->cdata, cc->rlen,
-			cc->rlen - F2FS_BLKSIZE * c.compress.min_blocks,
+			cc->rlen - F2FS_BLKSIZE * c.compress.min_blocks -
+			COMPRESS_HEADER_SIZE,
 			LZ4_ACCELERATION_DEFAULT);
 
 	if (!cc->clen)
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
