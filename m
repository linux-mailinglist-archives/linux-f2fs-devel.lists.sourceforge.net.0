Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3D682F9F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 15:47:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMruw-0007My-6e;
	Tue, 31 Jan 2023 14:47:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMrus-0007MR-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 14:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k0XiL2kyugc3JB/+w2qrgOL85fTuK5IXAnFJk5vQyZo=; b=EvJRkb1pTH/ls3VDPr5Gw9ujdK
 stsJ0vBK4IyvG98fT/8ZWdpQ5Slr17nPaXOtch7FMjSF+DjOr2Y+2wA5uKwvFo9gvrkL6FEQTEHYm
 lIgPXcxnrl7y4LAt9ytcT21zRftarVS+sK1On/fVP3o2MpiRZc+cHDbPxN5vMWmfCKZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k0XiL2kyugc3JB/+w2qrgOL85fTuK5IXAnFJk5vQyZo=; b=QcxSPzFjK/HTsAyjqt7oEJSfsz
 35camjLpIoclXXruuFNijFe3Yialr0I1Q5eRBc/kDbKSiG40WEI/Ts1bzq6d+UIdpC8NMlrnQz/iQ
 wsDTiI/d/wtk0Tj6uQcfsc8Ix+me/3JZ027tnkZNkDnHTEwwLu7NMNl6Xm5MKKaCsUJc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMrum-005Nzl-A7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 14:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2073B81D24
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 14:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B84C433EF;
 Tue, 31 Jan 2023 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675176428;
 bh=qLSS2GASRL8RKpxdXDWhe4iVsIVVZ3UeUtKqaOGvO0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sOYe00Am1ogdvGACUfNzfDLl7Vazf31h+dx1uwjgSsY8+82XiJJxXzz7kypcFN5Il
 O4Z50WMV/rsQiKRF34E/fOJrKodWsjm5nDkK6FPpPj179zCkmIlKLtxx2AzCPMyofr
 xrF4s9nNeBgpV/5KybxZtsBmauh8rUsKE2+UtkOVASTOPI4+tE5Hgn+eeXn0YUZmY5
 Bc1pRXjwsQ6LtyEfQ36lRVkZNrrx4PWRzLlnoNISmky/bNgms8GZy910hAe7HGcg13
 85A3idfKezrp19KjRnupUbkL7+XmNzu0pdFa3pI2B+QISFgD768PCWJ5YHvoJ3XxbR
 vh0tZ4DiwIT1A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 31 Jan 2023 22:47:00 +0800
Message-Id: <20230131144701.34418-2-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230131144701.34418-1-chao@kernel.org>
References: <20230131144701.34418-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  nr_free may be less than len, we should update age extent
 cache w/ range [fofs, len] rather than [fofs, nr_free]. Fixes: 71644dff4811
 ("f2fs: add block_age-based extent cache") Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/file.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMrum-005Nzl-A7
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix to update age extent correctly
 during truncation
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

nr_free may be less than len, we should update age extent cache
w/ range [fofs, len] rather than [fofs, nr_free].

Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f4de96a3744b..746ffcd09b6c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -617,7 +617,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page),
 							dn->inode) + ofs;
 		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
-		f2fs_update_age_extent_cache_range(dn, fofs, nr_free);
+		f2fs_update_age_extent_cache_range(dn, fofs, len);
 		dec_valid_block_count(sbi, dn->inode, nr_free);
 	}
 	dn->ofs_in_node = ofs;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
