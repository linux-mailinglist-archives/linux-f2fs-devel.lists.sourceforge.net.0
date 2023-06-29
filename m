Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B4741DBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jun 2023 03:41:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEgfG-0007lW-HW;
	Thu, 29 Jun 2023 01:41:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qEgf6-0007lE-Sf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6z6xRoLXvC1J0NbhQA5qJ0d/xmpsuSMjwG5GpXsMwz8=; b=VmvRUrcpqnn8lgXmBemwkrUl5L
 XQ4zmDtmuXE8+ui8mHY/cAUKYC0uuni4z/Wd7SLnwJy95ON45icx4lAgTSIwUJ293cmpLPxzBa3r7
 S/OzY6sjtQ8wS3/x3ffjwjAVplX8l8w0g044x0XZDJjLa6j7OOusNQnI/x7S95Ta++Z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6z6xRoLXvC1J0NbhQA5qJ0d/xmpsuSMjwG5GpXsMwz8=; b=A
 3HGej3NU9P1fNbDlSDKbMVrbGSe0zhkwjNqrVvHALJVTtdwyzBQDB8zvHLxqOWgaFWFwcnXK+Sue6
 LAP5r8bvtBOLjzP349GnTRecB/sxUc9vjoIHsFmv3kQ5OI8m0/pxqSMCsmHdxrVcSKD/US/U2/CBE
 c+6yluldt7CYMOLY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEgey-0001PX-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 01:41:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A6676135C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Jun 2023 01:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFD6C433C0;
 Thu, 29 Jun 2023 01:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688002870;
 bh=IRiMTzPSBBDNyJP17NyLwGG1gecMwGYnqIEp9NdQdYc=;
 h=From:To:Cc:Subject:Date:From;
 b=je+daSnVyZAyW2Pk9dbcmPDrLMWrJwD6yiv0OOTNVgVFbc8b+qCmG5kCO7id/jBm9
 GL39Ofu40OM7Z7v+cQnebYB8nzzaDUWCuFPi33MbQbXZioTu0Hn48Wl5V9jHu/+fTL
 gBUQQoClCyI+P3wXsXDrKTH9tAwd1U1PSQzYp1EHI7z0ZLShqrsLkKxe38VhEsl7b2
 4PGpRs9NTeVCiwYhdVAAiZ8JgMCHzPkRlAqhnCzxdL1+gfHcV0Ic90J9D/sCsA12Zt
 ADl86kY3nchQNs5TTcWJE7OpMQdB6qFkbZrFSErEkiKCG+Us9ud2UeQcJuc2SGNY3o
 TmgyiB3Us0HRg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 29 Jun 2023 09:41:02 +0800
Message-Id: <20230629014102.3057853-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If truncate_node() fails in truncate_dnode(), it missed to
 call f2fs_put_page(), fix it. Fixes: 7735730d39d7 ("f2fs: fix to propagate
 error from __get_meta_page()") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/node.c | 4 +++- 1 file changed, 3 insertions(+), 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEgey-0001PX-Qb
Subject: [f2fs-dev] [PATCH] f2fs: fix error path handling in truncate_dnode()
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

If truncate_node() fails in truncate_dnode(), it missed to call
f2fs_put_page(), fix it.

Fixes: 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4a105a0cd794..dadea6b01888 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -943,8 +943,10 @@ static int truncate_dnode(struct dnode_of_data *dn)
 	dn->ofs_in_node = 0;
 	f2fs_truncate_data_blocks(dn);
 	err = truncate_node(dn);
-	if (err)
+	if (err) {
+		f2fs_put_page(page, 1);
 		return err;
+	}
 
 	return 1;
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
