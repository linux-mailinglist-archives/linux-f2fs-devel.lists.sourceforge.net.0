Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D94E9FDF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 21:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYvG7-0002cT-Pl; Mon, 28 Mar 2022 19:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1nYvG6-0002cI-N5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5qsDZTVpj9vVSAjKbMfzRGgg8UNlHevrwvmi1ShmNoc=; b=HW+mD9WhuhmpofU1ZzdqeEa9eM
 9EFhG3/2DyzDTby1aTzL/+aEdNOYCYCrDlwAw1vhwAKN932bH1dvK4JcKV0obic99hbUnXJyUc0uK
 fBANJuiScCwxeEo9GwHokv7C1ctfshtVYvUQX7bOAPwO+ltF4nEazqrefMo5jEkNTPBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5qsDZTVpj9vVSAjKbMfzRGgg8UNlHevrwvmi1ShmNoc=; b=iZvZIdoaF8ABlETDEbTnJ6n22e
 Oda9UoULZgXL1ycWzKrSmyED4cwYgh3qe/29xc3AIpdr0B9Z4I96wEF0mGM2ca2UHzXjL1EueS3hO
 mObzZpME95cn6uXiC/BT0cjYnodaUBvsc7ZzmRZIUNPzhoJUWJ2jJWWRyi+AwA/ZLeeo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYvG1-0006sB-SN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6240EB8120F;
 Mon, 28 Mar 2022 19:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224F4C36AEC;
 Mon, 28 Mar 2022 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648496543;
 bh=Tep2vIuVDQsBDq9li1VXsakPXRUUageVRqxJj3lG7YE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A/Rm6wyXvgfBuVNlW81O7uV8swyGA2AbyNnaNrvpPBGd2w94n4Gre4TfsnLpJ7EIh
 RpqYaTxo7YsB9MJWRTOwYglWYW/T1gxsD0mHkEMZ5e27AVCMHFJKlL0qZRJ1eYJTjQ
 btQlxlbNDufeKtgfrOHoUR8nWFDPX9f2Smrc/6FXNgfDlowH840h44EA3N4gDVJ1tD
 O6TDl2/qnjYrzsg+IplZRB6Um/L1N2JNwjiN+cSIwEgB7E6SnWrHxp2U2JhKSTTUe8
 E3KOT3Aw0pLEJ+I8zwKYiguvTzD5gEVmf4NdxqC4TdE6urJx//1NAyMs/zPA54cKsW
 /mup7EAuAhCQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Mar 2022 15:41:54 -0400
Message-Id: <20220328194157.1585642-19-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328194157.1585642-1-sashal@kernel.org>
References: <20220328194157.1585642-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 d284af43f703760e261b1601378a0c13a19d5f1f
 ] In lz4_decompress_pages(), if size of decompressed data is not equal to
 expected one, we should print the size rather than size of target buffer
 for decompressed data, fix it. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYvG1-0006sB-SN
Subject: [f2fs-dev] [PATCH AUTOSEL 5.17 19/21] f2fs: compress: fix to print
 raw data size in error path of lz4 decompression
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
Cc: Sasha Levin <sashal@kernel.org>, yuchao0@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit d284af43f703760e261b1601378a0c13a19d5f1f ]

In lz4_decompress_pages(), if size of decompressed data is not equal to
expected one, we should print the size rather than size of target buffer
for decompressed data, fix it.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d0c3aeba5945..3b162506b269 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -314,10 +314,9 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	}
 
 	if (ret != PAGE_SIZE << dic->log_cluster_size) {
-		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid rlen:%zu, "
+		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid ret:%d, "
 					"expected:%lu\n", KERN_ERR,
-					F2FS_I_SB(dic->inode)->sb->s_id,
-					dic->rlen,
+					F2FS_I_SB(dic->inode)->sb->s_id, ret,
 					PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
 	}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
