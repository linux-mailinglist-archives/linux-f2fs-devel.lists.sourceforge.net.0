Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDEB7BF05D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Oct 2023 03:35:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qq1eW-0006J7-7D;
	Tue, 10 Oct 2023 01:35:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qq1eU-0006Iu-7x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Oct 2023 01:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mksPmfF6FJkG5M1TcmN0yf9cLVyZIL8IiI5uVDI2ge0=; b=LxvMol/aEDgbwLcT8k//0o1xhO
 JyQx+YSzlgSbVK2whzltnbNuRCXHS0EERduBqGLXgMeIjxXUjk/wsLqZ0EwJqy8juw3EK9SrNVllL
 wNMvRjxd8e6vHyg7O4gn0LoIuG/SP9JOXwPiGz5mmkOuj6ZTrfUPuaIfZ7zlyeXa0cJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mksPmfF6FJkG5M1TcmN0yf9cLVyZIL8IiI5uVDI2ge0=; b=U
 GM3m2LllxjtHoBqNRNP6+Lra19d6vcDT/EGG5gu+AQWRCsOyalDWcImcjCHHrjOti2X58cN6PvRsR
 XgC5BK7/BX8dTUFDYd/eWYcsoFJYB4apr7ONOuXsenym1OFo9RnQUPotSVEdmff5pM/S7SgFaPxi6
 GVGDLPCd0T/30/Y0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qq1eR-0007Ti-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Oct 2023 01:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BA0B4B80B55
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Oct 2023 01:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC5EC433C7;
 Tue, 10 Oct 2023 01:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696901704;
 bh=wdXe14lwor8omxbaXrg8/wjNwruX3BHW4Eu0cZq/Z14=;
 h=From:To:Cc:Subject:Date:From;
 b=jrLMaPinjSOTMq9/ANW0jfGue5KY8WrCmnLLPwaDdYppFmtXviYphlx23ZmkZfDwH
 478+Wuztmd/ne0hZm49iD3DxO290H2LpeBgS686+6794edX8ZfU5itRkLV0/Fb2Kfa
 pyadZNUgldHFjcyU5FNqDC388+h2B9uJWWeNJ1hMLXGmH3sZfLdfK6qZZTyVhvLPro
 PW0or02rSnpTclKKSSveWVGwx8v8W3EBQhoLadUdlt6l9RKhcorhLBaOO21kQmN10b
 cEsSOxsofu0pNLA0vFIKMo3nBxiZZHpRFVm04jLNZ820Ti9JX4EozWodxJx2pwGwdX
 e04uMjHLE6vDA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 10 Oct 2023 09:34:59 +0800
Message-Id: <20231010013459.115024-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Rather than in range of [0, max_file_blocks()), since data
 after EOF is alwasy zero, it's unnecessary to preload mapping info of the
 data. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qq1eR-0007Ti-Kq
Subject: [f2fs-dev] [PATCH] f2fs: let f2fs_precache_extents() traverses in
 file range
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

Rather than in range of [0, max_file_blocks()), since data after EOF
is alwasy zero, it's unnecessary to preload mapping info of the data.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 06d35b8aceef..304d0516d3a4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3263,7 +3263,7 @@ int f2fs_precache_extents(struct inode *inode)
 	map.m_next_extent = &m_next_extent;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-	end = max_file_blocks(inode);
+	end = F2FS_BLK_ALIGN(i_size_read(inode));
 
 	while (map.m_lblk < end) {
 		map.m_len = end - map.m_lblk;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
