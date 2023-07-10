Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E480174CCAC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 08:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIk74-0000em-Rj;
	Mon, 10 Jul 2023 06:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qIk73-0000ef-NA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 06:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LPMUWXJI9s+VPT0KPMlqrzgvPGMvI3ZLQYa1HPhZ2Rk=; b=SvNwCMYAbnC44wMbC4AYrk7EaB
 esVLWUGOS2GqwlVwvsAgly0+sgNe86j84w2wExD004Ln8VPb+XiuP/kIsEKxhs9cjYdTHhSpRNc8y
 7LP463/Gk/Qru1rBuEK1elNAD5okYPRKsbKDRDL4dPuGXZ9zWBUWRH8w2XHa03f8PIB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LPMUWXJI9s+VPT0KPMlqrzgvPGMvI3ZLQYa1HPhZ2Rk=; b=c
 ORXvvUNGhyl0Hxggq5qrjJDkVN7Yv/9L7A31N/A88I3pcYZx+m+PsGyGxBjiKaj1omDd3xRERJhml
 De9nGh6NSfrWqPkbVAS8V1vJ8+prCGKYc6tuPeJOXNREW73Zvqb5PCTBBFaP1QW9lM4uSP0ZQw1P7
 33epNr3VSeWzBpRw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIk73-0030S1-Ir for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 06:11:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 322F560DF3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Jul 2023 06:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7040AC433C7;
 Mon, 10 Jul 2023 06:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688969463;
 bh=POVkwNRnXDTfSq2EQOtvr5EVAKm/0LZO6D8+9fhg9qo=;
 h=From:To:Cc:Subject:Date:From;
 b=aVlZps9/ljtmmOZ258zRJ3em8y5MKFcpsgUk5gQ2I0RfOelUVPcNP3v4Kje8iStoY
 Wgx7DUbELlRfQ09wzhWlxTys4GqfDbj/ctlfZb7CfNZQzQJPA4cLCuTv9lyU/bZ6dT
 SQ+WU9IelPcfdOZjl4yRnmP7tcqzU+bhR1fi1o6W2LAW1eshtdD2oxdoA7KtXSJOJ3
 02NOZBgZ8CoYrSX9liEIb0q6DDv24srL47b9Dpo3PXFRXR1goSEwulRo2Kvd98pjQj
 qEXO2u+4R4cDosRFb6MeVGT5sw6MegBWj1KlPDwuMBczMODIYJ6AdI5PiXhd6lNs1U
 iuDyi/mUe8o8w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Jul 2023 14:10:58 +0800
Message-Id: <20230710061058.2303767-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_compress_alloc_page() uses mempool to allocate memory, 
 it never fail, don't handle error case in its callers. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fs/f2fs/compress.c | 14 + 1 file changed,
 1 insertion(+), 13 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIk73-0030S1-Ir
Subject: [f2fs-dev] [PATCH] f2fs: don't handle error case of
 f2fs_compress_alloc_page()
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

f2fs_compress_alloc_page() uses mempool to allocate memory, it never
fail, don't handle error case in its callers.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 236d890f560b..9662d635efbe 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -649,13 +649,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		goto destroy_compress_ctx;
 	}
 
-	for (i = 0; i < cc->nr_cpages; i++) {
+	for (i = 0; i < cc->nr_cpages; i++)
 		cc->cpages[i] = f2fs_compress_alloc_page();
-		if (!cc->cpages[i]) {
-			ret = -ENOMEM;
-			goto out_free_cpages;
-		}
-	}
 
 	cc->rbuf = f2fs_vmap(cc->rpages, cc->cluster_size);
 	if (!cc->rbuf) {
@@ -1574,8 +1569,6 @@ static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 		}
 
 		dic->tpages[i] = f2fs_compress_alloc_page();
-		if (!dic->tpages[i])
-			return -ENOMEM;
 	}
 
 	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
@@ -1656,11 +1649,6 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		struct page *page;
 
 		page = f2fs_compress_alloc_page();
-		if (!page) {
-			ret = -ENOMEM;
-			goto out_free;
-		}
-
 		f2fs_set_compressed_page(page, cc->inode,
 					start_idx + i + 1, dic);
 		dic->cpages[i] = page;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
