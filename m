Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05F22CE07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eVC+Gx7lWYL3FuCK691aB5cbpQ9M+nA6bdZFypm0ozc=; b=HVvojM2BSbM2U6mKlJNLPaF5g
	mv+SLfY/MXdGJHy5RgwDXRsUhYG2f3fmM2pJ7F71LK0Iewxxrr7/zufIP/ZFaqk5hs+G87qOKPOPR
	UcbZ8PXX8ROKaBGoN+rZXcsJG6JPPrSwQo1BUKI5369ky51pqLf4wM5R+eia0JTzNsjDE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2h3-0003ia-Pg; Fri, 24 Jul 2020 18:45:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3NSwbXwYKAPgxfy3fylttlqj.htr@flex--satyat.bounces.google.com>)
 id 1jz2h2-0003iT-5g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VSwfu85pneIFmS24X/ynlOi1yjIof1V3mRCitL8rAYY=; b=K9Dal36jUty+aqcogqgzRGdoi
 KW99LFjWv3K+Dgzk7Fzh/3ckgRz4Xzv+3Q8Rh5m11mj/IpMOkt6WYe5Y/EAeCJVBN56Otb+RMV2uB
 vFieD8qxNVP6+XsT3XmCQW/Q5tDRW7ac/FbN7A9iFLXowkM7h9XHKm7zfeezWKWRm148g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VSwfu85pneIFmS24X/ynlOi1yjIof1V3mRCitL8rAYY=; b=AzPJt9FRmMlzZFDDdkwHkYlSq+
 zf5ipEMEgLcM4DzqN06+GN+1dv3VpO8y+YaQYssG9qg7H/3fiz2G8ni6xC/8SNQnUxOo9u0m8TMRX
 um4yWPBCJo5DB+fMJVSkcdEkCmyq/QVPnzcO2IZ+jYfeVj0bcEP423xztGH6kBPLU7qc=;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2h1-001epa-01
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:16 +0000
Received: by mail-pj1-f74.google.com with SMTP id t12so6030461pju.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VSwfu85pneIFmS24X/ynlOi1yjIof1V3mRCitL8rAYY=;
 b=maAmxJ7NYpOeYwEieVBxCvRDZINBI5z01Z7yoA6Kvl2IYqByL1XVGCthlTgPirzHTR
 5nXxBJvJ9Wt7KA1zuGzaQDvSG5JBu4jne2azUTlVKbGojdVvR/GsCiiOGhYZfls55xX+
 vb7IqBleMcL/eF/RiTCPxqdypPn2KKzoMLJ6OlgoiFw2wmrMpqEd0oGoa/cAUN16dbVJ
 mbvl5Pjm/9rEEPXF1iygFadnE/pcA3dJdwaWGdx4RU8aeSSpToh7gK1ay2iYWIqrnIqQ
 wGwk93dF3mWAgl2urxtmiGQyZwx8qsrDPbHwP4m2RhCl25zv7XND4Kaft04Xv2XS6LU/
 rOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VSwfu85pneIFmS24X/ynlOi1yjIof1V3mRCitL8rAYY=;
 b=imJaMWw5LYi4gX8c64UhrlEzUu5sepuoskp8gEqdkul4Ip7AJnfzpEyZKN6cF3XtAx
 5GeRH4qQy/FcTGA4dUUqtXvEoyKGP2Bn/kFF+33+SzgEqE2vMkj+y20R5zG0bNaCZcqO
 vPmK93ZpZivXAMCzdqnfEpmPmsD8/hyXH68RCxdN21FuV1lAM8eGmuvfhOBh3aal+TO+
 y+Pkg7YQ9E/Z3bzkROvh4iotNa5HxakY37yrw1zrkP4emoPdi5cJvNvGN/J9rf/fEW50
 2pNWqdM0M+Ki/yj4vHSIaICtuE6mfQTS/27+QKnri6hEv+hjlrYdZuqXOORsQfwut9Mr
 /bZA==
X-Gm-Message-State: AOAM532/pU2x+oL1PHcK3xeFKmdnJy1t264nmx8qebhFxz/uOpnuNX4I
 LwDSSlyv+9l3gNj4h4ZnRVFL3B7L0jQ=
X-Google-Smtp-Source: ABdhPJyT41z7Bo2DJVXrD2yfQgUGfnGWGnRtL9zK9eYdoIYIP8wyrLRC6/JqsXYyBn0KLNCSTVI1XabDyNk=
X-Received: by 2002:a17:90b:1296:: with SMTP id
 fw22mr6730717pjb.20.1595616309435; 
 Fri, 24 Jul 2020 11:45:09 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:44:56 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-3-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.74 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2h1-001epa-01
Subject: [f2fs-dev] [PATCH v6 2/7] direct-io: add support for fscrypt using
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
Cc: linux-xfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
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
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
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
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
