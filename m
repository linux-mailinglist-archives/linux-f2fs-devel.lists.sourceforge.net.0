Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FE6DC2AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:24:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plhD2-0000yb-LM;
	Mon, 10 Apr 2023 02:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plhD1-0000yV-O0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4pKndLMlyp/um+NedT0Gj49sdbEbQ5kd4upD0wpTwa8=; b=kVI0M9dX+W6n3pozNvUI/yhBkT
 ZWHUgsxLkyqMNTC4DecxhmjutPvQZVYngkMQQ1O4/4/UDww9s6y6fegCQiMYcmv7B/ZWHnSqo2AX4
 qXbOqW68PDD6+lc8xP2fOfYVoRxqhrHzOQwFRL7mkxIF+NmMU2Vs2GOY/eCRT7Z4VXu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4pKndLMlyp/um+NedT0Gj49sdbEbQ5kd4upD0wpTwa8=; b=R
 gc/WLjg+tcM6Y4fd0ALUobGIQoJ4OjejTzxkIIEcIqdbAQieXZMTV+lpGCyK1lB+DKiHQhu5VF20j
 3heH91E4DWsk8nPiQnbAvXD5PRK/4NNFrfYUVOwWQTOJY782UwklU4VR7MXDYBhYJSxP256xLgny9
 AGHYotj/PEKMhD0U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plhD0-002VNe-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:24:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 710AE6175E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42D5C433D2;
 Mon, 10 Apr 2023 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681093476;
 bh=lfKqRPUiqgrvfO9fwMhr+hAhaRhNAJLuNXb1o5Hmn2w=;
 h=From:To:Cc:Subject:Date:From;
 b=ehXGleMLkdtUae3AMLDJ+sJKwc91yJFxns08gvEzd3ftR1CZ8UGOtAtpkpI88veiK
 gwBY/GMWbsk0tNs+74lu2kz9CzkjzJI0CkSe+Jyx2v8Ibevvld+V9VmfNEYSkwlXA2
 DyOCVMlWyhvifc2O3OjLr4H2+gQM04KrYm/yNiISbMAD+nzvYAw5o1DsXPsjLpa+x8
 iqtkl2mDbginz5ssOSK6UHVbj3B2L8ldDge0sC0FM1S8+CzwK6kgr9Kf5UkVeFJwrb
 mWQfeQJYax3RgbTqs8XRLYlhczFAd+m0VacWq2b96M1dYUXMy/tnXRfWiaYXw+IpVb
 KtJrl3Zv/M22Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:24:17 +0800
Message-Id: <20230410022418.1843178-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We have maintain PagePrivate and page_private and page
 reference
 w/ {set, clear}_page_private_*, it doesn't need to call folio_detach_private()
 in the end of .invalidate_folio and .release_folio, remov [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plhD0-002VNe-Qh
Subject: [f2fs-dev] [PATCH 1/2] f2fs: remove folio_detach_private() in
 .invalidate_folio and .release_folio
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

We have maintain PagePrivate and page_private and page reference
w/ {set,clear}_page_private_*, it doesn't need to call
folio_detach_private() in the end of .invalidate_folio and
.release_folio, remove it and use f2fs_bug_on instead.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4946df6dd253..8b179b4bdc03 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3737,7 +3737,8 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			inode->i_ino == F2FS_COMPRESS_INO(sbi))
 		clear_page_private_data(&folio->page);
 
-	folio_detach_private(folio);
+	f2fs_bug_on(sbi, PagePrivate(&folio->page));
+	f2fs_bug_on(sbi, page_private(&folio->page));
 }
 
 bool f2fs_release_folio(struct folio *folio, gfp_t wait)
@@ -3759,7 +3760,9 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 	clear_page_private_reference(&folio->page);
 	clear_page_private_gcing(&folio->page);
 
-	folio_detach_private(folio);
+	f2fs_bug_on(sbi, PagePrivate(&folio->page));
+	f2fs_bug_on(sbi, page_private(&folio->page));
+
 	return true;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
