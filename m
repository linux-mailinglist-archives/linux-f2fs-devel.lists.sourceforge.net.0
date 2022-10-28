Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD0C610D4E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 11:31:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooLiU-0004Wl-KF;
	Fri, 28 Oct 2022 09:31:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooLiR-0004WZ-TA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 09:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3wNmOELDnsuy/CqEXpMehn0+OdrVLoOIrF847WQkCFk=; b=CFz28q0rm7mhy2K4aqWd5kNWgT
 31UHDHszuF5epl4BOvSe3mMvaov0SnD+utsOeNwLAutclTYC6nXA6OvSxgo6GOb4xJpFj3tK7P/kQ
 /hSaaJvTdFv1VXE3KZaLG6z/oQo1+su8Rx23IzdRHde2V7xAHbJ7rUF55I7t2HBuWHsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3wNmOELDnsuy/CqEXpMehn0+OdrVLoOIrF847WQkCFk=; b=Q
 fXch5RSPrhxedRdfREI1emuwCzgCdecwu0Lrhi6SauNFnZeYIxjSyJnmvZrg1JguvuAP8KxkwPR8M
 IjhjKzne3aCSC4392l0enKIixBagF7yRRi0BCeNVF3M30G1hpPCZu4b6iI9UiTv3QUVNw1T2flhii
 Z4rJJwN+dCBGvPQo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooLiN-003H1a-JI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 09:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 566E1B828B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Oct 2022 09:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1059C433D6;
 Fri, 28 Oct 2022 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666949500;
 bh=on4ve1L/tc15LIA9yjdcewdPR3skPWPiVhzzpmc0SE8=;
 h=From:To:Cc:Subject:Date:From;
 b=oEm3wHfRMe+buCKOwTMPwYYVDTpBMqxXzCWLXqLSe/P2ZQe7+yQT1FiL4w2C+sx8M
 JvCPtXdaaMuOsVLRneYmHdX1EqpkO+mGUR2NXe+/qRZbg2SIiT/6XID3dHaPkhHKdh
 DaCmLXC4zANKsgldhSgjhKtTF541MRB7XI6o41+WXBzInXQJAK8vJ3z1iqgI4EqhTA
 u9RvR5mVUHZm/xrjUlOtf/IQlhx8YzL7yG3BWCrbbiWmhipp7zQr8lYMeOwU8aJsFh
 p6BsMSBPrke9gRa9TtElcAXznmHvLbq8jdTnC+j8LWbKvUNa7RRuvoHQIeIuoGvLO2
 Cw1yuykhilKsA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 28 Oct 2022 17:30:26 +0800
Message-Id: <20221028093026.1406495-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error path of f2fs_fill_super(), this patch fixes to call
 f2fs_destroy_post_read_wq() once if we fail in f2fs_start_ckpt_thread().
 Fixes: 261eeb9c1585 ("f2fs: introduce checkpoint_merge mount option")
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/super.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooLiN-003H1a-JI
Subject: [f2fs-dev] [PATCH] f2fs: fix to destroy sbi->post_read_wq in error
 path of f2fs_fill_super()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In error path of f2fs_fill_super(), this patch fixes to call
f2fs_destroy_post_read_wq() once if we fail in f2fs_start_ckpt_thread().

Fixes: 261eeb9c1585 ("f2fs: introduce checkpoint_merge mount option")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..696f094c4505 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4523,9 +4523,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_destroy_node_manager(sbi);
 free_sm:
 	f2fs_destroy_segment_manager(sbi);
-	f2fs_destroy_post_read_wq(sbi);
 stop_ckpt_thread:
 	f2fs_stop_ckpt_thread(sbi);
+	f2fs_destroy_post_read_wq(sbi);
 free_devices:
 	destroy_device_list(sbi);
 	kvfree(sbi->ckpt);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
