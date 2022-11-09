Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC76221C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 03:09:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osaXB-0001Lk-Tx;
	Wed, 09 Nov 2022 02:09:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1osaWz-0001LZ-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 02:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CPW61gTPsv5cTK2Rt9pFwr9nAryg+WUSR8h4GOH/oCk=; b=koWMs+GoyCkn1LVr6b1mYWnwx2
 fqpqfFXvanU1j5HDEWaT6uGFx3dwvUXU8hIbCSi2wwETlE46BiYxT5HqCkxpWmQCk3E4JAHyaBlk6
 6pHgOkbPTZn0g75ypHGKJDoJAlvNUSCU0xzjVzSL4b5LWXvVvhMCv4OUkxq2vVcQpICc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CPW61gTPsv5cTK2Rt9pFwr9nAryg+WUSR8h4GOH/oCk=; b=U
 giPpo9e+i2B464XnJs8NFPCPVehLlGAwMm+ZbmLae1H7CsGQO6rR4uXcFo01imGqljFA5D3X+TKnf
 eKj1OhJEJRtPZxdZhOFw4Hw8haoNs1C8S3LjQqz4pMl6Ou3JiBdyfmwSscG2zTMv2mjD0ysFU+vYy
 p630f2FrWkvwfNus=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osaWv-000oKi-EV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 02:09:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B907FB81619
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Nov 2022 02:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B8C433C1;
 Wed,  9 Nov 2022 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667959759;
 bh=GX1WjxW5uIqLEw8Wf86wBcBw2yon78ZixjUQkvdfwEM=;
 h=From:To:Cc:Subject:Date:From;
 b=e0R6UZj9AmzXm6wp3136fx0o1LvJiv/VAof9ELNn8s6q2CbXVQStgxEMGcgNykFDz
 rszEN5NztQnopREbtuR1A17yGS4s3zVWn9zi9Z0qYKGbpsvoHUEFcyJGl01NXi55OF
 xkZVnE3bMo2mdmkvBvCz7hXCPPC8MOygywIkvzihalQzAq1jVzsVoMV5qG1mie1cE/
 PNu9mkCtWzDke1b98p4ddWi1ZuuCXJGLlsOinA65momdq6iDJPAbTKxDiQVQ/BCKgK
 pCXwle+mh97lr0xssPc3+vtM2SxDoq1bHeA/zWAGr7jDXiXpZW6JRCvtUZmGJEVPYZ
 lonJyYW+8db6A==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  8 Nov 2022 18:09:17 -0800
Message-Id: <20221109020917.4121067-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If block address is still alive, we should give a valid node
 block even after shutdown. Otherwise, we can see zero data when reading out
 a file. Fixes: 83a3bfdb5a8 ("f2fs: indicate shutdown f2fs to allow unmount
 successfully") Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/node.c
 | 3 +-- 1 file changed, 1 insertion(+), 2 deletions [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osaWv-000oKi-EV
Subject: [f2fs-dev] [PATCH] f2fs: allow to read node block after shutdown
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

If block address is still alive, we should give a valid node block even after
shutdown. Otherwise, we can see zero data when reading out a file.

Fixes: 83a3bfdb5a8 ("f2fs: indicate shutdown f2fs to allow unmount successfully")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 983572f23896..b9ee5a1176a0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1360,8 +1360,7 @@ static int read_node_page(struct page *page, blk_opf_t op_flags)
 		return err;
 
 	/* NEW_ADDR can be seen, after cp_error drops some dirty node pages */
-	if (unlikely(ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR) ||
-			is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)) {
+	if (unlikely(ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR)) {
 		ClearPageUptodate(page);
 		return -ENOENT;
 	}
-- 
2.38.1.431.g37b22c650d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
