Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA22EFE64
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Jan 2021 09:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ky9Am-0007Fc-9v; Sat, 09 Jan 2021 08:00:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ky9Ac-0007DX-6x
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=94OkTz3ILjq+LlEP6Pa6vsIYykohAFSIR80AhcgeJcQ=; b=YDT8DBy7opSo9d785D7Kn3md4s
 tGd6pYj5WJd2SUKHc1igrqSzOCztpaN8PZig2M1/7z5YIqgjqatxc/9yqjprIrg7YtYQf+01qJwWU
 oSNOR2gSnDN294dRIUeru8K9qftRfDZ7O9f3IFflNYZ0eQtWnY6A3v72re4EhLp2MPXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=94OkTz3ILjq+LlEP6Pa6vsIYykohAFSIR80AhcgeJcQ=; b=IYjnwPLgJ45OEGaICLJI3zNzZc
 P8WArWR6SL1KTNBqJq6POmOd7IBS1o2CFRroc02Hv/DWvTBZdF1dwdcqVAR5V0nCze9jqs9AzBrSJ
 CcS0HALoQLXPv7LV9QYR5ulisxSs9NYwFQy0AJRq4hdDFtqBsZmrpyiUT85xJEh1qTCs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ky9AZ-002qhL-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Jan 2021 08:00:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F47123A81;
 Sat,  9 Jan 2021 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610179187;
 bh=7+R8JaCcIjtUaH3VUl8CBoaLeio7VB0jSETcJdih7i0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FLQ3V54/YJ3wzqN91RgQa6ijgdV5w1Awcx+Maz19TcjXaSY1fFcKSqhrGgJ83zo4+
 Z3kgG0QX37rePYQlEOvlTVZSdQB9lIFLRLtzWe46jn9qQlOpizMfEUTje2V2/b51B9
 vGiq1UoQfxORuSZF7BhCC0nX7hLt5yu2T3SnHfMYrkNXPy9SIF/hicNuUOrgYnI1MB
 pdxNxRfwP3Nzvyl9aMHAQhS2IvE/m5B9VIm/qEtpJe900C5k9AFhTha6DMlnwOHX52
 F45ZPSX3b/U4ATdTRcRECV2WPnFWkfrVDOTE05cZGvyQ8b4xuYSi3PsSPEGrCjvn4j
 y2278dWl8GXdg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri,  8 Jan 2021 23:59:02 -0800
Message-Id: <20210109075903.208222-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210109075903.208222-1-ebiggers@kernel.org>
References: <20210109075903.208222-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ky9AZ-002qhL-Gf
Subject: [f2fs-dev] [PATCH v2 11/12] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since I_DIRTY_TIME and I_DIRTY_INODE are mutually exclusive in i_state,
there's no need to check for I_DIRTY_TIME && !I_DIRTY_INODE.  Just check
for I_DIRTY_TIME.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 4cc6c7834312f..00bca5c18eb65 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4962,14 +4962,12 @@ static void __ext4_update_other_inode_time(struct super_block *sb,
 		return;
 
 	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-			       I_DIRTY_INODE)) ||
-	    ((inode->i_state & I_DIRTY_TIME) == 0))
+			       I_DIRTY_TIME)) != I_DIRTY_TIME)
 		return;
 
 	spin_lock(&inode->i_lock);
-	if (((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
-				I_DIRTY_INODE)) == 0) &&
-	    (inode->i_state & I_DIRTY_TIME)) {
+	if ((inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW |
+			       I_DIRTY_TIME)) == I_DIRTY_TIME) {
 		struct ext4_inode_info	*ei = EXT4_I(inode);
 
 		inode->i_state &= ~I_DIRTY_TIME;
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
