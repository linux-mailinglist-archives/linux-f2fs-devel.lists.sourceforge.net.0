Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA122731D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0nK/ge3d0/YOtetj5CsSo0+/Edm1KQECYe1iSUBJwbs=; b=T6qNSL1PHHMjpeLtAEQ0a/4Vi
	RmNTypjI2luNaiiRISggxqfLpDJIqTCq5Z0LTmlZt1zUPhg5632264fgryC7tAfWYOFtIXmwHNGzA
	dtsfvF2LyRwKKfjJwvHRUNwyX/hPkEmIo/c8xiOjAdIyYnqzcy6rjfnxxA0bnSyoarK14=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfM2-0005qR-KQ; Mon, 20 Jul 2020 23:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ySoWXwYKAHYmUnsUnaiiafY.Wig@flex--satyat.bounces.google.com>)
 id 1jxfM0-0005qJ-Tw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=; b=euxoF6pc0wMlOk4VDfkPCpYXT
 bD6a8HQQhn4uyUSvqXS5Fr4T8lEwCY2+fK6DEX7gX1LGBOFnV5h5LUVvz4USM08ZxzQR9NIS9XSR4
 slOGTSHmKLR4hKM86l+zTDvGYgBdCA2Qai4PLVMIhH2gEUrLQ8CyTVHnSOEotJv4GIfI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=; b=TQEs2kKT+N2mOIDYhj54ILhIar
 1htFOM/DHK+0oHU8feFEz4IdRuNgasgUhSosKMNvGGtJo1M1OTDaLfXjMTFpxnvXFhUT/PUfrC08d
 7vp2SlYoeMsgQdZG8/Fw8e5IdTPTkUmda7nXwP0/W0vesvYeF1E7QU8GBBMru5qkzCBg=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfLz-00BOmj-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:52 +0000
Received: by mail-yb1-f201.google.com with SMTP id d202so23437814ybh.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=;
 b=se5eGY6PRRXqrWQRBE/mzCAA5RErc7l2kj05TDRN7Jro80qb/pJ+rA+riJ/Xykv7F9
 NQ5EcWcqex+EPU0AL0qs5tmsavm6jy7rKVphM1+zpocIAHdvARYAtIGgDy3GBqqpd3xa
 aBmkNWC1mgTceW2cH+pPKpVnviueK1DVlwESp8gXuDHR4UQLn8uHTruCGCPv/BvQRicd
 S1LlPhpAkgsAFimnUYIYUdsCrDJG80+1qUF4CXWZjigFnFEbVHUyzLf9Uk5tjRgFKYhx
 TaA9J/wV992TQY5EbqsiWdVrqMzJkVUO70+qXkefnqGr+h4AZ2vo+qBrDjxey9sz1bqD
 7tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=;
 b=EbsS2MrwDjKCq5hrCQUUbrjplcuTmV5nLMfuTCEoL1nbZviD28l051BnRhwMjc86/1
 25G5oDc//5KfOZ0dWz8vE43iO+wdoeekhlPyKwaDxEecstrPLfb+tWz/yGC0W9/x77RI
 7rlrMJNFppJT168R75rqyK67aHpbF/Rp3DPIRJlqdmgLZi6CAnVywIUvC3wqiYSRBlVr
 1PBcdmAgJD1KMY/HQZOVqDOdjYCjeS/mEpRxaWJLEf+9wXrHjbzlb9ZPVLxVJRwboRSm
 Y4ao+qUQRaQMrcdSAEm/Ud8xWNxaf6VobJBU0b30HEake4mbQXHAC80qtbq/eZZmqgmP
 wnPw==
X-Gm-Message-State: AOAM531fdOprKh7s7Oe83uJv8TjuqyO7atFA+OsS7hHg3wHrUp/eAgH/
 RO0aGphQ1+5b4fOsEmsRjjsZLIbJDdk=
X-Google-Smtp-Source: ABdhPJyKficGk3ieKw3vV0YvwmGNGBZ7vrBM2X1BKiz+4fP3nNViUcmmhhj708RT1qDOLsOq29xR99aneog=
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr8527687ybc.319.1595288265808; 
 Mon, 20 Jul 2020 16:37:45 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:34 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-3-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxfLz-00BOmj-OJ
Subject: [f2fs-dev] [PATCH v4 2/7] direct-io: add support for fscrypt using
 blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Set bio crypt contexts on bios by calling into fscrypt when required,
and explicitly check for DUN continuity when adding pages to the bio.
(While DUN continuity is usually implied by logical block contiguity,
this is not the case when using certain fscrypt IV generation methods
like IV_INO_LBLK_32).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/direct-io.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 6d5370eac2a8..f27f7e3780ee 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -411,6 +412,7 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	      sector_t first_sector, int nr_vecs)
 {
 	struct bio *bio;
+	struct inode *inode = dio->inode;
 
 	/*
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
@@ -418,6 +420,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 */
 	bio = bio_alloc(GFP_KERNEL, nr_vecs);
 
+	fscrypt_set_bio_crypt_ctx(bio, inode,
+				  sdio->cur_page_fs_offset >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = first_sector;
 	bio_set_op_attrs(bio, dio->op, dio->op_flags);
@@ -782,9 +787,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
 		 * current logical offset in the file does not equal what would
 		 * be the next logical offset in the bio, submit the bio we
 		 * have.
+		 *
+		 * When fscrypt inline encryption is used, data unit number
+		 * (DUN) contiguity is also required.  Normally that's implied
+		 * by logical contiguity.  However, certain IV generation
+		 * methods (e.g. IV_INO_LBLK_32) don't guarantee it.  So, we
+		 * must explicitly check fscrypt_mergeable_bio() too.
 		 */
 		if (sdio->final_block_in_bio != sdio->cur_page_block ||
-		    cur_offset != bio_next_offset)
+		    cur_offset != bio_next_offset ||
+		    !fscrypt_mergeable_bio(sdio->bio, dio->inode,
+					   cur_offset >> dio->inode->i_blkbits))
 			dio_bio_submit(dio, sdio);
 	}
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
