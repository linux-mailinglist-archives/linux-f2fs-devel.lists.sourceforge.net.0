Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD6782D24
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 17:22:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qY6jv-00051X-0g;
	Mon, 21 Aug 2023 15:22:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qY6jq-00051R-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFIqGZc0PZo1zahMw/b0GVHZ/Z/b1/qNxmK4+7WwjRI=; b=X6PAxekcFNrwYVAz51vZ1pAiJv
 yz507zmAd3FUo7jTv0wmci0aNXQ7tJhXgywQeglD998v2ZTH+JeGD2AMWKwi50yLXmrquFp23RxRC
 X54F7N1CHorH9pv4QhPzXaP/dVGwbhhYWDA300D86HzzwU+LgT5STaHK3gum8jCUD0Xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XFIqGZc0PZo1zahMw/b0GVHZ/Z/b1/qNxmK4+7WwjRI=; b=d9OV1sSmwoFShuOc8Ba6TkrWnq
 eqIwe43ECbLtQJbYkrxivWgchzsbVK1zCm29dHROLlXC0pFkpnbHdqSP3qMgakNoAlTSv/BvDroaO
 UurNKzpqkA0cwDmEvpLw+RitpJDsWLoxGnod9rVCNGtB/IGaAlU+5CD1AAtaoPbQrjKU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qY6jr-00BU2o-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 15:22:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A16561861
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Aug 2023 15:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B758CC433CB;
 Mon, 21 Aug 2023 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692631357;
 bh=ynZnTfGNCO4mTd9MdNcmARd7SztGSRA/yI7ID5fgvvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tD3qMbD4+7opo/3MzmIdjEVSXZDbNCWIAtnbjqpvXCfTXPB2EgdAR/CmXyWb5VoG0
 vrV4RWS8wBcCSGP7/1ix8IEMPENKl+DGWV+SduMgnMQxOEjBguoOGdFU920zqE3Mhm
 Ds6JsapZJdIsDQ6SnSn+QuTYiFoneoMToWpVQfwBj3ZT49spwtGsTFR4JboektWYpM
 FmHX8MCRkzKpdmPGC8xSSyW6wPrQ1J1XmRDWQGqD8yPhkSAMzjfBFyUVpliiFShfk/
 N1gKrQljfse/UFWeOq9m1WyyCa7fDo4kTuixHqqHJSgK2dk+3/6+3LxYrjx1eNgvau
 4J2Hax6p1kkAQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 21 Aug 2023 23:22:25 +0800
Message-Id: <20230821152225.4086924-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230821152225.4086924-1-chao@kernel.org>
References: <20230821152225.4086924-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After remount, F2FS_OPTION().compress_level was assgin to
 LZ4HC_DEFAULT_CLEVEL incorrectly, result in lz4hc:9 was enabled, fix it. 1.
 mount /dev/vdb /dev/vdb on /mnt/f2fs type f2fs (..., compress_algorithm=lz4,
 compress_log_size=2, ...)
 2. mount -t f2fs -o remount,compress_log_size=3 /mnt/f2fs/ 3. mount|grep
 f2fs /dev/vdb on /mnt/f2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qY6jr-00BU2o-4Q
Subject: [f2fs-dev] [PATCH 3/3] f2fs: compress: fix to assign compress_level
 for lz4 correctly
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

After remount, F2FS_OPTION().compress_level was assgin to
LZ4HC_DEFAULT_CLEVEL incorrectly, result in lz4hc:9 was enabled, fix it.

1. mount /dev/vdb
/dev/vdb on /mnt/f2fs type f2fs (...,compress_algorithm=lz4,compress_log_size=2,...)
2. mount -t f2fs -o remount,compress_log_size=3 /mnt/f2fs/
3. mount|grep f2fs
/dev/vdb on /mnt/f2fs type f2fs (...,compress_algorithm=lz4:9,compress_log_size=3,...)

Fixes: 00e120b5e4b5 ("f2fs: assign default compression level")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a067466a694c..8d9d2ee7f3c7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -591,7 +591,7 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 	unsigned int level;
 
 	if (strlen(str) == 3) {
-		F2FS_OPTION(sbi).compress_level = LZ4HC_DEFAULT_CLEVEL;
+		F2FS_OPTION(sbi).compress_level = 0;
 		return 0;
 	}
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
