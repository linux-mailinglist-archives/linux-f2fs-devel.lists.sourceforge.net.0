Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1C43E147
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 14:52:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mg4tH-0005pv-6g; Thu, 28 Oct 2021 12:52:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mg4tF-0005p2-H3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 12:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eQkrx+c4DateluvEwSBFvXpd/krDl+DRLZaZwDfaYYs=; b=Bpd7MGreBvelfJ/2Am7YP02v5y
 MJsCIruExLk7GXZqGE89doqeRKxALIk1lE9QkB/F9hWwZMc/dUCuXDvifhvZTQqXa9UeLIx2fcI8D
 UjHYHP+cC1JXcWN3cF8p8f9aHKri7DeJ6cTeRHW6WOtfgWzkbMKcUT3viFf3f+eIpgS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eQkrx+c4DateluvEwSBFvXpd/krDl+DRLZaZwDfaYYs=; b=K
 AHRMKyq7DRUYZmgBrZmDhyHYj9B8caoLz6IaEs7ZmZncBVlgBAENCvOD/UYLjPGU1qzNoHc2jZf8C
 /I/vpULOze1vEBiCP3MdFKEAub44pAfxqP9KTrLNR8TXZfRSJG70jqctZ0WPwESrYVMqE7ycduO4E
 w0HBz6xbSphWu2w0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mg4t7-0000De-El
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 12:52:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1CAE60FC4;
 Thu, 28 Oct 2021 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635425114;
 bh=o2C6FvRrmDzrbftY8FeeMYbB6RuSRYiUaT2LP9Dk+YI=;
 h=From:To:Cc:Subject:Date:From;
 b=Vv8BsWEePhaTpO+39QlXx5FIPm9+IPxz4irhvfpCZC3w+KD1RgItVlwdUjMhGlyRo
 3lWMIOgn1q0EKFllKonO/WqgUFTbw4B6McSUQk4SbRyxcTia8eydYhtba/Ibjzl5Cv
 In4MCYGkwx3inORdhhLfLPga5AAlKWaNeQc/brbQPJ9SXUoRZpTwGCNVpnss9UMMyv
 n0hRpk2IDIg2PVdOFU4WhdTkG8WZb4Mppj2sx4+DsPXZdxgQrB2M6pEsWVAKtyHFQF
 fkxZkZRSN74CK4CmTHS4O46UKVX8HB0Kqq8+VrUD3ypdmE+ywrWntVfndstwfcb/dn
 OJvUDFYo969bQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Oct 2021 20:45:08 +0800
Message-Id: <20211028124508.2672-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Pavel Machek reported in [1] This code looks quite
 confused:
 part of function returns 1 on corruption, part returns -errno. The problem
 is not stable-specific. [1] https://lkml.org/lkml/2021/9/19/207 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mg4t7-0000De-El
Subject: [f2fs-dev] [PATCH RESEND] f2fs: fix incorrect return value in
 f2fs_sanity_check_ckpt()
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
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Pavel Machek reported in [1]

This code looks quite confused: part of function returns 1 on
corruption, part returns -errno. The problem is not stable-specific.

[1] https://lkml.org/lkml/2021/9/19/207

Let's fix to make 'insane cp_payload case' to return 1 rater than
EFSCORRUPTED, so that return value can be kept consistent for all
error cases, it can avoid confusion of code logic.

Fixes: 65ddf6564843 ("f2fs: fix to do sanity check for sb/cp fields correctly")
Reported-by: Pavel Machek <pavel@denx.de>
Reviewed-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9693f3e4cdd4..989e76ec7fb2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3495,7 +3495,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
 		f2fs_warn(sbi, "Insane cp_payload: %u, nat_bits_blocks: %u)",
 			  cp_payload, nat_bits_blocks);
-		return -EFSCORRUPTED;
+		return 1;
 	}
 
 	if (unlikely(f2fs_cp_error(sbi))) {
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
