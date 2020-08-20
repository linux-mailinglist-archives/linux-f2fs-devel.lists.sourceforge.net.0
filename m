Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8EB24AA81
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Aug 2020 02:02:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8Y25-0003Ds-67; Thu, 20 Aug 2020 00:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1k8Y23-0003Dk-LO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 00:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HctSLUz/EoLp9YozuK2+qNByTcIBpgOaE3pX8kBxixY=; b=P2ZkPSfJc/Wd/PNqX8OjD4B5QJ
 20L9zZuf1mofRP263t7eEmw4YQph3sm7eu5b7klqpBFcTdhCx6yPyHxwY2OhxMeMO7gCoHYeXTLJb
 D6ropi72+YfcxlSKtpNpjjTM9WXbyePqegFHwM/LDKZp3g5p0jC9uiK4jnlg2KBSrHuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HctSLUz/EoLp9YozuK2+qNByTcIBpgOaE3pX8kBxixY=; b=LVM4rHhXpZtxdMvucPT09ArlGa
 t1rwIy2gw8SO4s9JxrVq0OSWvGenbmdc9fb1V+AcRmTgOEkI2fxLiUJZkT5ysIaeojJmSZxhF0yCs
 mI5s5wgDu2YtlsMQHBByYh8Zn81NpyVirH6a8yBTe+6ZKcuuCGE7iAavPpzLtCChHqM8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Y22-00GXQf-Er
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 00:02:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3192B208C7;
 Thu, 20 Aug 2020 00:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881721;
 bh=WUu1nmeECqgBkkf62NEGmJ1dhLGsP5wMDFpd2EjOBCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pGlZ1vJcNQFLIPl+qzrULbv5xC/eBwGefve5kdVy+13dHedkuG3CFFXLQ7/BCpC9N
 RvuxZc+IvfpweCMX20NVlgnAT1J9WHXoCJeGtB/C2y6QRh8peYmT6QXrEyB1MMJh9U
 wjSGW5u9uxlJ59WB1XJV7vEcVrwic0bi+0uzNc80=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 19 Aug 2020 20:01:35 -0400
Message-Id: <20200820000155.215089-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000155.215089-1-sashal@kernel.org>
References: <20200820000155.215089-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8Y22-00GXQf-Er
Subject: [f2fs-dev] [PATCH AUTOSEL 5.7 04/24] f2fs: fix to check page dirty
 status before writeback
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit eb1353cfa9c1e9415b03dc117f8399969fa02102 ]

In f2fs_write_raw_pages(), we need to check page dirty status before
writeback, because there could be a racer (e.g. reclaimer) helps
writebacking the dirty page.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index a5b2e72174bb1..a1504a7aecb19 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1207,6 +1207,12 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				congestion_wait(BLK_RW_ASYNC,
 						DEFAULT_IO_TIMEOUT);
 				lock_page(cc->rpages[i]);
+
+				if (!PageDirty(cc->rpages[i])) {
+					unlock_page(cc->rpages[i]);
+					continue;
+				}
+
 				clear_page_dirty_for_io(cc->rpages[i]);
 				goto retry_write;
 			}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
