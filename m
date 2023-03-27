Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B86CB0A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 23:26:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pguMF-0007su-4H;
	Mon, 27 Mar 2023 21:26:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pguME-0007so-DF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 21:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmnnQ1ARNTX7fHophld5fYmX0T/HIlFW/qWE1Rh/ejE=; b=IstHIP3gOz4/u3tuGI18E7tYNK
 vmThLT/vjMErVtuuaJ5FHQ/SSPqoqMyZuipA6lhNZ8y4dAE6Cc4u5ivyJ+O/xXSq9o+ZsXl2B89S0
 hyj+urr7o4i7NJad84JHdd398a7T2Ca4wLi0dxenDi2dyGdQkSbkvD3HW4gE+aTj8TKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kmnnQ1ARNTX7fHophld5fYmX0T/HIlFW/qWE1Rh/ejE=; b=F
 OZhi0JOBPaENtnT65YW+TROXqvuo7kKyryCJoIjHH7gD/hWKMbUyYc390MSMk5+AKCgpPZa6IwMQD
 UXkQqzZFR2xY+qRE9YVPbHWw/KonLRcvvgfHprFE+cHUnM63Qt4wkux0kxHDpvLAy0c7u09IhGm+0
 Nj3wN7x/YbrK+3XA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pguME-0006GK-Dj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 21:26:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8CB6BCE19FA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Mar 2023 21:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64E6C433D2;
 Mon, 27 Mar 2023 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679952374;
 bh=VgudGWvC93Cdrdkp2ZAY5zwwt8MbkkDLjyj0g7oEhX8=;
 h=From:To:Cc:Subject:Date:From;
 b=i7yR12wb12wFjs5mM4wD9ZhR4qxEWTyBBWxCvjfDyyz3hLMdj82+D1W6/6IbX5U6G
 LK1Mf26hbJFQgNzItKVFf7obmzll305Mm1XcVOM8LIOOvjWNgn40OV0hD5fuBAGc/q
 9RQv+JASMr1RKh9GUj2nUUjvy3zTVkB6QbMd/NVNTUKNQV/HmIP1xPskOr1bqw+9Mj
 MoMjxG4daTwAS5jkc6bOiadGqhMaeTV9tUTMO4x/2dIxNZPsKm3A11+N7DexZAwuNA
 iDdXEXQyaUOzKjWmwiv6FY/Kwa2uLYESQX3debdwMQvr1jWVYVZGNys3CAWsp4b6xi
 Rl4M7Y6fEdk/g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 Mar 2023 14:26:13 -0700
Message-Id: <20230327212613.3679573-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Show info w/o it. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- lib/libf2fs.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff
 --git a/lib/libf2fs.c b/lib/libf2fs.c index 118e12592394..93b0604615c7 100644
 --- a/lib/libf2fs.c +++ b/lib/libf2fs.c @@ -1046, 7 +1046,
 7 @@ int get_device_info(int i) } 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pguME-0006GK-Dj
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: remove indentation
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

Show info w/o it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 lib/libf2fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 118e12592394..93b0604615c7 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1046,7 +1046,7 @@ int get_device_info(int i)
 		}
 
 		if (!is_power_of_2(dev->zone_size))
-			MSG(0, "\tInfo: zoned: zone size %" PRIu64 "u (not a power of 2)\n",
+			MSG(0, "Info: zoned: zone size %" PRIu64 "u (not a power of 2)\n",
 					dev->zone_size);
 
 		/*
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
