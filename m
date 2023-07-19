Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD636758E50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qM1Bu-0002ze-QJ;
	Wed, 19 Jul 2023 07:01:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qM1Bt-0002zX-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 07:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l3qp/hGid/pJHEVMNicyeV9o+Y985Tiae2XCDNoSiIE=; b=KuVCkVAI1aJnbw2bGaIs6xH2rp
 Inu7/XEHV8t62Pd5y3ZV+ZW3SDhBfNA1omK/piiZqiKld0mt9IFj8VMN4eFIWMB2u1T5Xd/euY97q
 DwW2cjcd+OFx2llsrwmxxQK0eod2N6j75XDnPIJUxr3Dl000lNeUHECsqZMcaq8GOLxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l3qp/hGid/pJHEVMNicyeV9o+Y985Tiae2XCDNoSiIE=; b=H
 ad4MyAepKtjVJfePkeLuwANLlheMN1GEXsZoyTVuFrxF1hERZPpRmXB6csOwMvlEfCWK5ddkiuTcf
 gfUJIxq/zu83MqnfelYR8/QCcGsEeCK6ViH24c6CzSDcuTsEdIp6pXOcvoZ2p0VfGwa10HzHo8caw
 duhp5+gs7jiMA1Xs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qM1Bs-00CdPh-Nv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 07:01:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55342612CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jul 2023 07:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFCAC433C7;
 Wed, 19 Jul 2023 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689750089;
 bh=rHPIayEgCw60Voodvn5p8kOxtbFc5Qakb3TWhVfAG1o=;
 h=From:To:Cc:Subject:Date:From;
 b=Jpgc9zN8WdllpJ7JUEhajfXTPVBC7i9+pSZlE/C/H1A3xVQjke1d1GWwfFRSjMccL
 6Re9TnIDUqxL+9QBH+6wxtD8Q28w8ohDsJMR9QucNG7Kv3VZ6N/RfUKYBwYOlDQLr+
 tT+1+vF9crjzv98WotpxjAOxQXlSghCSJp/wYkluDknJpJ1ppWqfrevmy+zT12GFF6
 bqSvAa2SNwwIxudItUYl6s5bLm1Z+7IaZqF4Xq4RRIXhp0O+tmk7eYvzQMhvtKltDJ
 T+rudmNpdj8nYc719TtQLzumcnB2HRzL4HLjWa1nGSYULypgf3TGxjBPhk97GlGle5
 03QZupx3X9kqQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 19 Jul 2023 15:01:22 +0800
Message-Id: <20230719070122.2361853-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In dump_node(),
 f2fs_is_valid_blkaddr() has checked ni.blk_addr's
 validity and dump_node() will bail up if ni.blk_addr is invalid, so let's
 remove redundant check condition and print below: if (ni.blk_addr == 0x0)
 MSG(force, "Invalid nat entry\n\n"); 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qM1Bs-00CdPh-Nv
Subject: [f2fs-dev] [PATCH] dump.f2fs: remove redundant check condition in
 dump_node()
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

In dump_node(), f2fs_is_valid_blkaddr() has checked ni.blk_addr's
validity and dump_node() will bail up if ni.blk_addr is invalid,
so let's remove redundant check condition and print below:

	if (ni.blk_addr == 0x0)
		MSG(force, "Invalid nat entry\n\n");

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/dump.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 6c1857f..e7a1c5c 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -605,9 +605,7 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 
 	dev_read_block(node_blk, ni.blk_addr);
 
-	if (ni.blk_addr == 0x0)
-		MSG(force, "Invalid nat entry\n\n");
-	else if (!is_sit_bitmap_set(sbi, ni.blk_addr))
+	if (!is_sit_bitmap_set(sbi, ni.blk_addr))
 		MSG(force, "Invalid sit bitmap, %u\n\n", ni.blk_addr);
 
 	DBG(1, "node_blk.footer.ino [0x%x]\n", le32_to_cpu(node_blk->footer.ino));
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
