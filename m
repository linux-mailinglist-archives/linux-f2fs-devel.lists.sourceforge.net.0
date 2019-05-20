Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7A23D6F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBS-0001Yk-3w; Mon, 20 May 2019 16:30:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBP-0001Xr-Ne
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGrHvUsuSE7IoVSjVFZqvAeWaLWDncEjkW1a/5Cxa24=; b=f0rhZm6a4zEEDvK8o/CD9dHKQX
 7Z08+lLrs7UNtR50+anhZC+05inDbkOinfTW7ZN4OS/+hei58MOM8+EhCrlqcznfn3HI8uvWnTEOH
 ePEeHJBWuUMVU1ejUNnW+CtHHUzS/3C8Ly9OO+BTnRJq8m9BpDh4/VIsk7ZZv337knoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dGrHvUsuSE7IoVSjVFZqvAeWaLWDncEjkW1a/5Cxa24=; b=EPOdhsXHTr7WnDLA++bcVHzEBo
 kbd+M33+5X26cLd54GI9uIxpGMaG/JJwXzBsQkOea8i1yU1WTzKyztf/ojsnB1bjnAb1sOdDcV7sF
 sl4M/IXlaNk8jfCCRdc8e6iJ//fkjFWLvFGiF3iIt0l80PM5ze+0dcOpguBSc42GDezY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBO-0005Je-3G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:39 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 253F2217D7;
 Mon, 20 May 2019 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369825;
 bh=bNfXVLtoITf8LG1OztsuiNKS3cmbu3tuokayi1NgBvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICE9E/nKHvk1KzmTsv7NT0zAmnnMv0GrRE2cFsDrCO79Pr0l3xR0tSZLRKaQVfww+
 F04rJTlzFdv6lvY0pRaVYsuTSOPIoF++p0FCAK1lDPym0h4D0leBHCyOc51fQtejoy
 koS9Idc5jJ0aNk3g4RQTFT+39LtMR4UmJSSj47mg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:51 -0700
Message-Id: <20190520162952.156212-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBO-0005Je-3G
Subject: [f2fs-dev] [PATCH v2 13/14] ext4: decrypt only the needed block in
 __ext4_block_zero_page_range()
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chandan Rajendra <chandan@linux.ibm.com>

In __ext4_block_zero_page_range(), only decrypt the block that actually
needs to be decrypted, rather than assuming blocksize == PAGE_SIZE and
decrypting the whole page.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
(EB: rebase onto previous changes, improve the commit message, and use
 bh_offset())
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 8b3ea9c8ac988..77c43c50e4580 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4075,9 +4075,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 		if (S_ISREG(inode->i_mode) && IS_ENCRYPTED(inode)) {
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
-			BUG_ON(blocksize != PAGE_SIZE);
 			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
-						page, PAGE_SIZE, 0));
+					page, blocksize, bh_offset(bh)));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
