Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D3CF7574
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 09:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GwmFj1eZjGbPfrR+U5r0Qekc8NfnHatGfGe9THeH3QQ=; b=YmIEPOUTGB1R+Xrzu0QWYau+Bg
	e0w7X7YfkqwlB90bviKPqxbSelJQ+wOTpJn1/H7r8q//WaPaiMVhjJupdFJBtJ7cyMuiYeTNzuduq
	L8T9VKNpoB76+Jz3ZMpo+rKEoXEv+3o6/s2yYxaxzwaAdvp2fMUZKk5BNT7rymeW2gas=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd2j8-0000zR-4r;
	Tue, 06 Jan 2026 08:47:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd2j7-0000zH-7f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Se1ieTiW4Q2J2tkZ257hrZgCk6kteSIfd9juaHIikcE=; b=Wgk+0svQxjjnPr80zeyYBeSj+V
 BBPGLVoIBZCeyn9uzfwvJQMwWz9R0mNvN2XgzYzgAebHNUycDtraGU8P+2OSPDYDesb2pN/fkvVS5
 0ujGGuxE8bS00XNAhrNXHmTRnAC4INYuVHgnEoCo0BnmD++DFpQQdnSez5QmlIE/Nel0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Se1ieTiW4Q2J2tkZ257hrZgCk6kteSIfd9juaHIikcE=; b=d
 rgMOlOov9xDUpUzvzVp4jWMawTiOOGdn1QpzNGuQ7CrhT9yCEUvpTe2uX/ENrC37mEsaRAY2mNx16
 nOjXXalLor0qmL578jMRIdviU5C8DQiN4aNbPGgedGrlVpPgaBOSFuK7PzqnqkssyMNOKKeOXbwT7
 uOHwMmD6MiNJ2CY4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd2j7-0008Cf-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2FBAE43DB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Jan 2026 08:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E7CC116C6;
 Tue,  6 Jan 2026 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767689256;
 bh=TRB66xwTb2yyOA3jgA1yy5T1RuRRNRSeUpwEKoxemYk=;
 h=From:To:Cc:Subject:Date:From;
 b=Asgkmwf811G7EPp3VWDb8bSSa9GTQzY2ivVZek5618OzygryIoGpmsEL2M5OxkQWs
 pmwC/3VnXH35d83dRzLmEr0P9cvT7VtOd4utwcqj8SPFaj7nxucDmAE4I0ivOeZ/Ea
 eRp8rmagCFuv49g3xsKKVggJgpccvB8BZVIqBCfdt7mSs3oTC9l7ylWY+5/gLGAj+a
 lyE2vBtAqhuQ76CjFNuoa+Z8PbT3AyrcBTswUj3cU5ylwtT+Z7zMldBXOB5Qc3xNEf
 W7JpjB6zaB20qdKNNqFILZgYydYgtUo37R0ypYHaWd3EbMsvYsXZz9RxDYGe6Eq5Bm
 T8lUGS7qK4s4w==
To: jaegeuk@kernel.org
Date: Tue,  6 Jan 2026 14:31:17 +0800
Message-Id: <20260106063117.29975-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sysfs entry name is gc_pin_file_thresh instead of
 gc_pin_file_threshold, 
 fix it. Cc: stable@kernel.org Fixes: c521a6ab4ad7 ("f2fs: fix to limit
 gc_pin_file_threshold")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/sysfs.c | 2 +- 1 file
 changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd2j7-0008Cf-Fw
Subject: [f2fs-dev] [PATCH] f2fs: fix to check sysfs filename w/
 gc_pin_file_thresh correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sysfs entry name is gc_pin_file_thresh instead of gc_pin_file_threshold,
fix it.

Cc: stable@kernel.org
Fixes: c521a6ab4ad7 ("f2fs: fix to limit gc_pin_file_threshold")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 91bc0544ba1f..cd22bfe75c45 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -797,7 +797,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	if (!strcmp(a->attr.name, "gc_pin_file_threshold")) {
+	if (!strcmp(a->attr.name, "gc_pin_file_thresh")) {
 		if (t > MAX_GC_FAILED_PINNED_FILES)
 			return -EINVAL;
 		sbi->gc_pin_file_threshold = t;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
