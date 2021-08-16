Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529E3EE081
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 01:43:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFmGT-0007XS-HU; Mon, 16 Aug 2021 23:43:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <nathan@kernel.org>) id 1mFmGS-0007XL-8q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 23:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOmX+q8vEvS4lP/VvyMotGP6rDUcNUN10UnkQJ7s2to=; b=BmbOYRGkmyya9jFF4yzk+9DvvC
 ubCGHaa1VM0OLTupXDN+uILm0szazLkHIS0aV2PLEDMEXmyNSD+CrA3fnCyn6FuusQ/e5O23iAkzk
 +n5SYasn9CWWFHHEUjQLWa2xpyQ3xsldJH3jUd3UZayKjO89qALc8S5oZ4QWPKQz/B7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IOmX+q8vEvS4lP/VvyMotGP6rDUcNUN10UnkQJ7s2to=; b=W
 TIGF795nZCV1AnV7BYGNuiwhe0DFBBMuUPPr+ym1yLgHmxRd0W7UZ3AKyIxTFcqCAzP6uNJTxNsb2
 x1GywTxAqq6e5j1Ti2xIHkZTyYikDbUeuiPfVqcer2QFNz5QVItaAXXW+1sspICtqy6/KDM9xyC/g
 kaY/VQsduz7GXjA0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFmGP-008jvX-Ac
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 23:43:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2182760EE0;
 Mon, 16 Aug 2021 23:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629157398;
 bh=NrRsJNff5j+swFa8HAxh+3BW3YLAq/RCrLszGjLzw9k=;
 h=From:To:Cc:Subject:Date:From;
 b=uTWVsbUtGlZ8JfRT3RHEsJWL0fhLyk3snGshZLfgNl52/DOVnTzVof8jh41BRQOQ6
 zRhTqzxmyHopbF2jvBa5INLeDwj4o3z7iElodM6sc6P9yVf6grdkDKAe/lHso2nqPC
 TwNw2uMWzVDJeb31dvEsNESuk0tAeVDC6Xm5ZzW7eJH0+BEGsqkftGgwbTXiGZ3KRr
 lLF3i/ykew6s777lGAfitw9HWx42oKHr0jEL/XrfE8Bnd12xHiHGXnHvwHdp2avQqF
 oT7u0gfe/kp8i0vQR2U3vTj6xTxMorZwPqmG6xyXLIj2LE8DQIiE6A4kQNChbgJ1Jo
 Mw+UItSjmIeNw==
From: Nathan Chancellor <nathan@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 16 Aug 2021 16:42:47 -0700
Message-Id: <20210816234247.139528-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mFmGP-008jvX-Ac
Subject: [f2fs-dev] [PATCH] f2fs: Add missing inline to
 f2fs_sanity_check_cluster() stub
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
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Without this, there is a warning in nearly every fs/f2fs/ file when
F2FS_FS_COMPRESSION is not set:

In file included from fs/f2fs/super.c:31:
fs/f2fs/f2fs.h:4251:13: warning: unused function 'f2fs_sanity_check_cluster' [-Wunused-function]
static bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
            ^
1 warning generated.

Fixes: 1495870233e7 ("f2fs: compress: do sanity check on cluster")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0c978f934dcc..fe1097e678da 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4248,7 +4248,7 @@ static inline void f2fs_put_page_dic(struct page *page)
 	WARN_ON_ONCE(1);
 }
 static inline unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn) { return 0; }
-static bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
+static inline bool f2fs_sanity_check_cluster(struct dnode_of_data *dn) { return false; }
 static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
 static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }

base-commit: f4b05791dda93edb03ebb6b48f1be104b2e64274
-- 
2.33.0.rc2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
