Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38F1CD1E6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 08:36:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jY22g-0002DH-IA; Mon, 11 May 2020 06:35:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <khlebnikov@yandex-team.ru>) id 1jY22e-0002Cq-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 06:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:To:From:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YYyYBM3hFKxurJJ19a+KMzEF5sBPCd+yAZICqfQZ1kI=; b=f4niUREBdAgj5uGtj+1nsbwgzd
 995R4qrUp/TtwquTJ+JnRnQz4qBZ6quphOEBp4OtZmn5KP4lTfLCa7qUHpMb1jhwSo/qXjZuu4PlT
 Js1VHZgxAvlgi5+37tlTd8YJDz1Jbg+gri1XfUSIEE1RHtT5Cb1sazMR77eaUOgB9igo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:To:
 From:Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YYyYBM3hFKxurJJ19a+KMzEF5sBPCd+yAZICqfQZ1kI=; b=Z
 WUbBovjE4BpPlC1TLuvo7SIOqhajsZK1HT0oW/JWy/maRzWfO+cpOqh4sAM1GO0LmHLnEcohack7n
 lOUWj6HMBANl9oWvm1jArlk5RKw9AappnxItWIy7a3lRGrhst682aZnfEiVtGtsXFwCvo5I5ZjF0T
 C5tfO04Jnfevritc=;
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jY22U-003bHT-Hm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 06:35:56 +0000
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id F3FC92E14DC;
 Mon, 11 May 2020 09:15:20 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 9lzX6X5efJ-FJWipr4m; Mon, 11 May 2020 09:15:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1589177720; bh=YYyYBM3hFKxurJJ19a+KMzEF5sBPCd+yAZICqfQZ1kI=;
 h=Message-ID:Date:To:From:Subject;
 b=cFuE1RTTWYnhFE7ZV5dOckfVWGuAXegRVFDD89mRp/eyG7rqYugzR+Bq2Fs7QRw7n
 GDKkc0r3PpnLzUGVEz7GUKp2PQdI8geQVAHpzBaB1QTG2l/1arv2AtAY4fRnbzoYXL
 m6Ynw8skx8YKAOgAgCNcWnTxRyd2Uf1ARYNM14dY=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:423::1:1])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nVyDhfSKjI-FJYuoUQD; Mon, 11 May 2020 09:15:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Mon, 11 May 2020 09:15:18 +0300
Message-ID: <158917771894.228779.2521743301299120701.stgit@buzz>
User-Agent: StGit/0.22-32-g6a05
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: yandex-team.ru]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jY22U-003bHT-Hm
Subject: [f2fs-dev] [PATCH] f2fs: report delalloc reserve as non-free in
 statfs for project quota
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reserved space isn't committed yet but cannot be used for
allocations. For userspace it has no difference from used space.

See the same fix in ext4 commit f06925c73942 ("ext4: report delalloc
reserve as non-free in statfs for project quota").

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
---
 fs/f2fs/super.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f2dfc21c6abb..c5e8cb31626f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1292,7 +1292,8 @@ static int f2fs_statfs_project(struct super_block *sb,
 		limit >>= sb->s_blocksize_bits;
 
 	if (limit && buf->f_blocks > limit) {
-		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
+		curblock = (dquot->dq_dqb.dqb_curspace +
+			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		buf->f_blocks = limit;
 		buf->f_bfree = buf->f_bavail =
 			(buf->f_blocks > curblock) ?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
