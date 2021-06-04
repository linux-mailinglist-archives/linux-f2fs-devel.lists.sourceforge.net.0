Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686E39C296
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 23:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PK9LUvBvfJo1AZekfLEWpnXqMAi8ThsReJNAmyQPiMc=; b=d6VAF3R/yfYeVCL2TF2PhYH0W
	HO7v2UToxddYomw5+Isd8gQkyespbOTfHSgNCsxe7qtGjVg7ddsCxbrU28wSifFjJtYtpRzYXksBD
	SNpeo/uFrhbrg4wj2pB4yF9E8XihnKm/N3owj6sH5xySntWx2yBr6QUsRwI2dJaM4NgsA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpHVp-0004x8-NG; Fri, 04 Jun 2021 21:37:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3fpa6YAYKAKETBUZBUHPPHMF.DPN@flex--satyat.bounces.google.com>)
 id 1lpHVn-0004ws-R2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9BcqtLCkYahip03kuRnuf7gXu/E/crKmMbXBSPc/Uvg=; b=Dsa2/iBDDqHd6XS0FyE1+dF3L
 54BTAjgAnS04uC6AjHypYxzvB/eOqMR/uLCzsibBwe1MGWjtvxw63XSPUmrTqL5SDZPeQhWgur0Zn
 F7t4+f90xXV1qAwb72Nqicp3sPQ017aRhrVVqpBMNBlH+fv2PUSSeKY2JJLwU9malJKHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9BcqtLCkYahip03kuRnuf7gXu/E/crKmMbXBSPc/Uvg=; b=WyjZXF1Ubc+KEFPMnDAkBhTwiV
 MVucvFcoO/wRuUAPPwfhOnxmiq5HVGqF10qka2LICj1DIzP/Eyf2c/ZyB5TC62SSXL61jmUtRClcL
 9EKEYJ8MHDwgdwpctQipnXGloG99ceqxzPTO88qYUu9xGkw7UE6FeMuzyfwDrkKtAMrM=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpHVf-00AsT8-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:37:52 +0000
Received: by mail-vs1-f73.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso3471482vsi.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9BcqtLCkYahip03kuRnuf7gXu/E/crKmMbXBSPc/Uvg=;
 b=QW5Kxzl6EXIE5ugNtoOGXViSlNInd8SrlO8Beh/QzLyDbfSyMdTdmYKbRpLpu68sod
 XDCQBa4ui+uU1IuoV4WMm3lNyBElOUbgc7+HQyR9AIl6hQ5XEqQ1V0rji9JD/Nspg6y4
 RakQjBXdNV9KepJ9OqowwQvnDS8Ouo0vJGyEJe47wFSn7tbgQ4Zh3NuuG+9FVTwsZsFd
 ZiYbIprwR+8eyGGwjm98fHgm3bY3Q699yk5zFWUsRxSkon77390wrHMmB8vtjUsLC5af
 9+OCpw8xRk1QegJsOwD64XDcoYUtUYbbiBMJC9RgHShDwlE7+QaapU57T6I+Yt8FYaqR
 h71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9BcqtLCkYahip03kuRnuf7gXu/E/crKmMbXBSPc/Uvg=;
 b=plYfrRoYRQJvUJx3b0dxH+tbm0Ogg3YENDGhxeJSWZn69G65hR6mzPxRyPKX7S1Mgr
 JjePHq2QoWoRxzMg5EY7QZLwqjI0GvLa057dFHpLiHSE2HzjlakY40CRt6ntsWdzFWPx
 F74OaRWFlRETVjwLtk2ndLZoIgj+ez47B7hbmvIYcS/Dhlr4EoWASz1YnRZcZpEX+F5g
 blTMDwuIq8ZHtHMkmvvuOOfAAWhPhOnbX7WOkzXiPluxgrzI9qSOM8rzREmxsjc88hcM
 dSlC2lZl9NsbDW6Zi2I/EW7mwwEQo+uW6iywTNI+kxk+4zg7kNb/7zwdvsMBiwG8Z1jo
 TkKg==
X-Gm-Message-State: AOAM533NQ3Uq6HO1yIMztiUQWAp8duL8vCxo8cApm2DHnEZvE/TMm8rm
 gPgD6Jzucds9dRX0S8WCvbnYI3m2FW4=
X-Google-Smtp-Source: ABdhPJxgk02c9+fXdTtbO2iZcSrGJNMdNgq2Ji6Xc1aRp0U/sfalFFR8mjElyDxbEU1XEUxA6IbhvBZxcCk=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a0c:e84b:: with SMTP id
 l11mr6830971qvo.52.1622840958230; 
 Fri, 04 Jun 2021 14:09:18 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:03 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-5-satyat@google.com>
Mime-Version: 1.0
References: <20210604210908.2105870-1-satyat@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpHVf-00AsT8-Aq
Subject: [f2fs-dev] [PATCH v9 4/9] direct-io: add support for fscrypt using
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
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
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
index b2e86e739d7a..328ed7ac0094 100644
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
@@ -392,6 +393,7 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	      sector_t first_sector, int nr_vecs)
 {
 	struct bio *bio;
+	struct inode *inode = dio->inode;
 
 	/*
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
@@ -399,6 +401,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 */
 	bio = bio_alloc(GFP_KERNEL, nr_vecs);
 
+	fscrypt_set_bio_crypt_ctx(bio, inode,
+				  sdio->cur_page_fs_offset >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = first_sector;
 	bio_set_op_attrs(bio, dio->op, dio->op_flags);
@@ -765,9 +770,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
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
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
