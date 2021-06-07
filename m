Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711F39EA26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 01:31:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqOiW-0003Db-Cw; Mon, 07 Jun 2021 23:31:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqOiV-0003DU-UZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+yYUtwRWLmbhrwPXk75IB87QPleVp+M0LwlESLl4GI=; b=D8/oLdSEresyK6KNwtPUH+yP4N
 GG7Pef0ki667AnRtzCy9dbc334c6bl4tU+M88Y8pKfbCft7FiCtdFgSTE67XybdNWu1AjQhCUMEJf
 0TH1DwYKJ9g7fgPO/OmxOWa2se20NhrTLersNusr5fOAXR89caUVmk26ArAXFnH3D1jw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O+yYUtwRWLmbhrwPXk75IB87QPleVp+M0LwlESLl4GI=; b=U
 YC0w4HSHyESkV03UMpXKxxUmZLWibjdY1amk/b9ZOlqC9Za2xW1qXx7XCtsRhlt600NFdgVih/QwW
 e1x2ko7jhekesEa4PN99CSL6w7wgWRREKVbFZat6LycMWI7KQi2/Ev1ZkK0Yd3Uczsl0fRyyLbV5d
 XWdnCvWmPwBxnL/U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqOiU-00GkVd-C6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:31:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB0F561182;
 Mon,  7 Jun 2021 23:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623108689;
 bh=VU3/5+i8dI+KU7+2oF0H2q925ejEATiZRYicF58gOpE=;
 h=From:To:Cc:Subject:Date:From;
 b=CtIRBqEImKtUzJ/zPHBRCesDTVKkw/YSOGgo9FGmByItv3spNtH/s4dFadFxkz6nk
 KNJYJIARzw0FFrkwhKHo9ilsBH1ZvuBaL8f4WnjD2QxsQat0Q60dbI2NOmTK+x7Y3n
 fOuOavNmcBhnTxDLemDi6YhaD0nhcbATnLJ1qzSwQrHdWVKCZaFuu/1utDDCDN++5k
 xd/6K3mmhuwlYWlmJ0c6VEBGbFAzYFHIsTwt++TOmkds7haEHDmyq2DYFp6/DH+AR1
 aj/kI0vO35q3pgtyrhPLr1XMsIVh8Mb2e42NezDJZC8txUQtYad4AosOoC2H0K2j77
 MDSZQnejmPSgg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  8 Jun 2021 07:31:22 +0800
Message-Id: <20210607233122.3946-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqOiU-00GkVd-C6
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid adding tab before doc section
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

Otherwise whole section after tab will be invisible in compiled
html format document.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Fixes: 89272ca1102e ("docs: filesystems: convert f2fs.txt to ReST")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 809c4d0a696f..b91e5a8444d5 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -720,10 +720,10 @@ users.
 ===================== ======================== ===================
 User                  F2FS                     Block
 ===================== ======================== ===================
-                      META                     WRITE_LIFE_NOT_SET
-                      HOT_NODE                 "
-                      WARM_NODE                "
-                      COLD_NODE                "
+N/A                   META                     WRITE_LIFE_NOT_SET
+N/A                   HOT_NODE                 "
+N/A                   WARM_NODE                "
+N/A                   COLD_NODE                "
 ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
 extension list        "                        "
 
@@ -749,10 +749,10 @@ WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
 ===================== ======================== ===================
 User                  F2FS                     Block
 ===================== ======================== ===================
-                      META                     WRITE_LIFE_MEDIUM;
-                      HOT_NODE                 WRITE_LIFE_NOT_SET
-                      WARM_NODE                "
-                      COLD_NODE                WRITE_LIFE_NONE
+N/A                   META                     WRITE_LIFE_MEDIUM;
+N/A                   HOT_NODE                 WRITE_LIFE_NOT_SET
+N/A                   WARM_NODE                "
+N/A                   COLD_NODE                WRITE_LIFE_NONE
 ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
 extension list        "                        "
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
