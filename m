Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D937E2CCC6C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:23:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeH1-0007s5-KE; Thu, 03 Dec 2020 02:23:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeGz-0007rm-3A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U3b0B8HCS3uJ2lx7XRmyu7rMlITmjx3B1Li5gAaFvV8=; b=cwX0U/y9gk+gHYHd28jSP1a/gU
 3lfO8no0EOIBocEqPNud/TLgMl6ahokzt0EDzIns1d+Z8jvq9XtDYsNt9FDCczKc8WDeyXEE9K95p
 L1J2QJjApxXVQQpdGW4g4JUtdgKpCSluS6YF+yzL8SFyj13er5RVAnmoyClaOv0/3iPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U3b0B8HCS3uJ2lx7XRmyu7rMlITmjx3B1Li5gAaFvV8=; b=hZYMbidHd8GmSy+vK+LgDqBjoY
 HZ6hCTYUefz/h5CbBdREpIaeL2PNHFj3hTvbjU4ix+BDuK1CLJ3tjAPMxDnNB9hK0MzkFgJEFF20I
 VNdGhpy2Obzy8ZjdHOtDqY86EC0Y95wu9ujGwz43Yf1m74Rqnb7hOtdU4HF6oIEksPZo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGr-00CSon-9t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:08 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:36 -0800
Message-Id: <20201203022041.230976-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1kkeGr-00CSon-9t
Subject: [f2fs-dev] [PATCH v2 4/9] ext4: don't call
 fscrypt_get_encryption_info() from dx_show_leaf()
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
Cc: linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger@dilger.ca>,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The call to fscrypt_get_encryption_info() in dx_show_leaf() is too low
in the call tree; fscrypt_get_encryption_info() should have already been
called when starting the directory operation.  And indeed, it already
is.  Moreover, the encryption key is guaranteed to already be available
because dx_show_leaf() is only called when adding a new directory entry.

And even if the key wasn't available, dx_show_leaf() uses
fscrypt_fname_disk_to_usr() which knows how to create a no-key name.

So for the above reasons, and because it would be desirable to stop
exporting fscrypt_get_encryption_info() directly to filesystems, remove
the call to fscrypt_get_encryption_info() from dx_show_leaf().

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/namei.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 793fc7db9d28f..7b31aea3e0253 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -643,13 +643,7 @@ static struct stats dx_show_leaf(struct inode *dir,
 
 				name  = de->name;
 				len = de->name_len;
-				if (IS_ENCRYPTED(dir))
-					res = fscrypt_get_encryption_info(dir);
-				if (res) {
-					printk(KERN_WARNING "Error setting up"
-					       " fname crypto: %d\n", res);
-				}
-				if (!fscrypt_has_encryption_key(dir)) {
+				if (!IS_ENCRYPTED(dir)) {
 					/* Directory is not encrypted */
 					ext4fs_dirhash(dir, de->name,
 						de->name_len, &h);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
