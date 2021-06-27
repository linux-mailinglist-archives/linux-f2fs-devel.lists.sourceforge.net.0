Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486D3B5372
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Jun 2021 15:30:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxUrX-0001pR-2s; Sun, 27 Jun 2021 13:30:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lxUrV-0001pF-5L
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Jun 2021 13:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qj7ede5ybWJX+n67R/yDJS5SoJdIHmqOHMoutzaJDfI=; b=ejPtEoQwqCdOOWZVh2ucwZ+8r2
 78LBhSX9w8b2+Z9tWKnM2Gd4DcGNToQU8t44o2CDSoNlLIWkXuoqynY3zoZDosHktQlqtEOtGhZ0P
 Ovbj+13+6Ax2TfhxPIAxIbEiV/LMHMnXrHtDkj1xf+TpizxPVf4pN5qDWhV+M4bZYEoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qj7ede5ybWJX+n67R/yDJS5SoJdIHmqOHMoutzaJDfI=; b=F
 VeuNcFUuA9H/o3CERv70N84GrtPYVBCib5r4rDgeL1Tznsx3NtbFPIibdVoTwlVrxo+3si4Pv1YB0
 M5NwSRFCwnJ0dUvTFO9bIx4sc2hahNVN+aKiqvDuf6pjc4KAaENl3D6/krWkHC5xDLOIKEDp0wUPH
 pCUHPkLr5ArrN/6U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxUrQ-0007Wy-Oo
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 27 Jun 2021 13:30:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC176144E;
 Sun, 27 Jun 2021 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624800599;
 bh=2uC2toy+ka1uze6VAxg44Fq+lJlePnzUG0woD9XSRg4=;
 h=From:To:Cc:Subject:Date:From;
 b=PNVPMXMoUnW+DEZBbSb3wju7VDxdr6yVpRaDihJbGu4jR4+ab3QfoNTWd2eJ9V2ZZ
 rwa7H2UJeA9oB47TRQ6tWW/KonDVlD/vZtz8+fD0vLz3ep+R6KOts7J6XeUPMk5jOR
 gVVZxzjJq58ih5J9NZ0lIWVRC9UXAGBEgZAS+W3niPxTgb8KcAma7eWwpNYsSLp2h+
 4pLXCrGtlRbFNMgqvRFcZaQLYvtjGQ4UgfplcMCPdZquKgOXAbOTbA/MaF4zN9s2eo
 2iNrqumiFIoF0OAU5Gzxu9LStVl6/I/daaNBueNl8yG88mTzDJzB+MumrZsfRzBubA
 hpVw7KUdr0j8A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 27 Jun 2021 21:29:18 +0800
Message-Id: <20210627132918.7956-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lxUrQ-0007Wy-Oo
Subject: [f2fs-dev] [PATCH] MAINTAINERS: f2fs: update my email address
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

Old email address will be invalid after a few days, update it
to kernel.org one.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fa367400f7d..d19d825be1de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6903,7 +6903,7 @@ F:	drivers/iommu/exynos-iommu.c
 
 F2FS FILE SYSTEM
 M:	Jaegeuk Kim <jaegeuk@kernel.org>
-M:	Chao Yu <yuchao0@huawei.com>
+M:	Chao Yu <chao@kernel.org>
 L:	linux-f2fs-devel@lists.sourceforge.net
 S:	Maintained
 W:	https://f2fs.wiki.kernel.org/
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
