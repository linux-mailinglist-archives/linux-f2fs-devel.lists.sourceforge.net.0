Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E152FF869
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:06:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7zmv4am8EC/NJ+m8CNu3hnYJL7La073v3Ag1FUhgHPA=; b=X7xrri6gyjrGdEXLp7dRKnyJu
	l76hd2LU/xpkpQrtTAZwaBW2ovjn3VIF9ini3bKpVSs86g2zXTcC6FCYdeF8E+Q6LXMmVANmfj7yg
	oAE7o3hCyyHSSMRUweRMlnq0ZLIFgkwKyDJvYBUXsw/nb4b4zVF/xThe8ySgETJyS6ims=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j24-0005iV-RZ; Thu, 21 Jan 2021 23:06:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3UwgKYAYKAJIEwFKwF2AA270.yA8@flex--satyat.bounces.google.com>)
 id 1l2izk-0005eL-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73jUIQHuj0265QRP8P3oVVOaSevfoFr6R3Pxp4Z8uk0=; b=Ww/LaghBXhWsDQYz6OlxmFTjR
 BoYvMnsxMfD+evM5+UiKyEpuRcqWtx5SkalNO752fW+A+v8qAyhB1xFwmGLRx204NcxKncWq05r6x
 pIkpg8lAJcVI5iVv2/stl7Kr9wJbW5JYmR970lxfCXYo5gVmJBCWju4pP7fKyk+rtZWmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=73jUIQHuj0265QRP8P3oVVOaSevfoFr6R3Pxp4Z8uk0=; b=lyU0g3VbSEadIo7N/CWwY6Zfgj
 igS0FBJvcaUlWfeFAr3W7u7MpoOqVtIDNM/cFcKRM74ai90H2Y6tjXp3Ogc7cAme12xgxhqvkjQvV
 Lt8/7W3OcbyqhTVl1rVcAOEYasl4fmAwzkTo9q8Wgw1QHh4To6cs5U6Vwjnwe5QRSq/o=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2izY-00BrDj-QI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:02 +0000
Received: by mail-pf1-f201.google.com with SMTP id e4so2128988pfc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=73jUIQHuj0265QRP8P3oVVOaSevfoFr6R3Pxp4Z8uk0=;
 b=RpM4qKLA+63xTwFiz255mspkEHNICv4dlhm7EHfnRU0UFN2Ihke5P4zOrKCiazdR7d
 bXOol4JvqiZOdRVsLQZnm4+9mSTLVh42aPGA5Y4Y5IB+y5B3KInSnmfMLfUe5WfbPlV5
 VxFwpZ2Vqn0u1sbV9D8cI0VjEg3QNpJhpPWDPwb+anXbPJOiIr/ySdiPWgUfOjgjdgkA
 IdEjApFDSNmguJFxEjGJY6eDJTmCCZhgIUZiGfP7Ni5urYiytgymML2bkgTyZ9IBfFd0
 PUCS2z8FThCRQC0kEqTRjWh5yf4h+dirIoOYGRoPF8cFverIpktw4+4nKzBCaAqBcI22
 stXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=73jUIQHuj0265QRP8P3oVVOaSevfoFr6R3Pxp4Z8uk0=;
 b=oNeHjcKUeHSNRBSmRUuTEfguueIdMcGyjHROZZsdW7U70JWeQoLx5AFWkRDr9rlQ0F
 s+ug2HZ0BNh3wMbn+zPkGPIUQ/AoFY+ntF0ngGnwuEveXJ0qN9lf2p0yLbVL0qamEW99
 Qs2LBpiM0iTJxfpPrToioeM2BoUZlCbr6LpIeyHevd/PbJ/BL22jMAEu1unurlQHV1NQ
 nRwjI5BnHewxAgvFx/OpFYg9QkuV42vZHzwWwVx6eJcQ6UU48cS9zOCzLDi6xzMJXs6p
 xrbOvh8taoT8XdRXJKA3kqhT2DFNOpscFCg/a4V9yef4gku4Fxx738A2L1dIa9+fAUJ+
 goqg==
X-Gm-Message-State: AOAM530SeNnNibWNR+awDUTlAWXxE+QolOtS9xsDDmw1dgidxCM3Tx1B
 ggeVfD1x9Sx5RbRz8uvH1cDYxn/PubY=
X-Google-Smtp-Source: ABdhPJwJkQ2FWOp1yUHZk7nzCbAeBUq10CoEvBoJQOw9xo3NYsJVQXsuE+AArFPbdsM6X5/w9fvQdGdj3Ek=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a17:90b:370d:: with SMTP id
 mg13mr1905409pjb.161.1611270227094; Thu, 21 Jan 2021 15:03:47 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:32 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-5-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2izY-00BrDj-QI
Subject: [f2fs-dev] [PATCH v8 4/8] direct-io: add support for fscrypt using
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
index d53fa92a1ab6..f6672c4030e3 100644
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
@@ -763,9 +768,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
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
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
