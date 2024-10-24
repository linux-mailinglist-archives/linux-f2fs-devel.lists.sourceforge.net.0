Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F749AF4B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 23:32:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t45R6-00083S-0W;
	Thu, 24 Oct 2024 21:32:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t45R4-00083K-NI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 21:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2uoxxwDj/PBReYIZBjJHimu1lY0wrE5N9oIKhxbDe4=; b=BBWzlhltAq//aow5ruiiaQJ0Or
 c5+IabwisVs0vt0CnwbRgwBreZuE7HxNF9UjufpCVt5wiRuu8ej4iFmQKBEXFPr1OF4Paen0vmdzN
 T/iUELMVjgxPFB/Ny5KThihGOc3V1rk0KJmHBzQlYOmSiiLYUOBFzkODTO9tIqRnyLRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G2uoxxwDj/PBReYIZBjJHimu1lY0wrE5N9oIKhxbDe4=; b=B
 ih78R8T9EC8B2z0fMYCt6IrOPYh40/yowG3my82JnLMZDhT61mtWRRO2KitHXfrf1fRmEL6JIb71C
 6W4pHFwetqIC7QHr4HaQ9xshR8yDnN7y0IGMmgyv7IFTuc/7XGai4baipFlg66+RojNcLTyNT3nBH
 7ElOXYBqVDguqe78=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t45R4-0001N6-2S for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 21:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15E68A45839;
 Thu, 24 Oct 2024 21:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E2DC4CEC7;
 Thu, 24 Oct 2024 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729805515;
 bh=8aVIHhVHToLP99G1syN1xAoPMZJJTR6cywV5xVCGbmo=;
 h=From:To:Cc:Subject:Date:From;
 b=scnCCn7bowuPHO8xD/S7JyjqcvYo7T1RBCnhebFTVKJtfMT4ls2HprQXEbwcSn5KL
 kzBewWeBrxZVBur3nW9VhZtrWSpotJBArGBQIGtRYYuaoK3nnBgeoaL6mZo1SmYnw0
 lDgCNgQxKQo6BhCTM137v3Ozx+m9CgbZYsZcZ093Mao4ToqooIMKJbo8XHbqIkkVtW
 02q9/pu2cc2wt+EopkQMxZtsuz1ufLjla6ZwTH5H059xoIenphX4Ip5FVv8xfegwbj
 JeiIHPMhtiJanfd2pUxTY1qWSYqPnahHdJGyPjCiV9f3KjNy77r6VFDZlrKmkjcLwN
 VZO2C5KtP+xEg==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 24 Oct 2024 21:31:53 +0000
Message-ID: <20241024213154.2581358-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The existing bool definition is broken for c23, where bool
 is now a keyword. Signed-off-by: Elliott Hughes <enh@google.com>
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- include/f2fs_fs.h | 4 +--- 1 file changed,
 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t45R4-0001N6-2S
Subject: [f2fs-dev] [PATCH] f2fs-tools: use stdbool.h instead of bool
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Elliott Hughes <enh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The existing bool definition is broken for c23, where bool is now a keyword.

Signed-off-by: Elliott Hughes <enh@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 9534da98ca53..0cb9228288c0 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -28,6 +28,7 @@
 #include <stddef.h>
 #include <string.h>
 #include <time.h>
+#include <stdbool.h>
 
 #ifdef HAVE_CONFIG_H
 #include <config.h>
@@ -119,9 +120,6 @@ typedef uint16_t	u16;
 typedef uint8_t		u8;
 typedef u32		block_t;
 typedef u32		nid_t;
-#ifndef bool
-typedef u8		bool;
-#endif
 typedef unsigned long	pgoff_t;
 typedef unsigned short	umode_t;
 
-- 
2.47.0.163.g1226f6d8fa-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
