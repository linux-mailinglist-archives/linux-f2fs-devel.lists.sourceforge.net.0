Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7372230A7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0nK/ge3d0/YOtetj5CsSo0+/Edm1KQECYe1iSUBJwbs=; b=gKJqzNLeLF1Sl21vCtg+bCsbx
	GkSnOSpcV5G+Rt2tzfNgr+fkEVSWHB3mVQj8DUTAt4LUR42WYY5D8ilLBmM3KA4LfPEkgINkwiGwo
	5A+bI2cdbwi4qqSHxch4RumAnT6DLDpQG/ak1WbiHv2itB0P5+51cDEM0s1Nt2j02AxY8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFRm-0001jO-SF; Fri, 17 Jul 2020 01:45:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ywIRXwYKABQCuDIuD08805y.w86@flex--satyat.bounces.google.com>)
 id 1jwFRk-0001jD-Vf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=; b=JF4ViaEbkQlCsVcCew68MYcg4
 Dj4y4lXWtM/jl0M4qq8Bc/omXDRjPqRwoOnN9w2G7Qsf8h71aVRQCC3B7hN3ly+HhI0zQYIHqQWIo
 mjQj64GTsvRbyq3bdbKxAaGd0Fn2ZgLhGecgq7FR0djU/r/TIUOA/0D/0Qz9B+8PkYs1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=; b=VvHhgiyuNNGyV5D3NCOXW3xJwU
 eLsyQK587UylNwVfU46yo7igv4pJqRhwZms+NW5nXLYmA9ApLzRquptm21sPdYybuW9aRAOYGo+Ts
 uiZJZGepKtLzVMDTrnTYYdzc3HcfXhcBRUfIKZfuVpXKAigNRrnvwXylbv6sNDlzh0Kc=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFRh-003lgZ-Tz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:45:56 +0000
Received: by mail-yb1-f202.google.com with SMTP id j187so9489539ybj.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=;
 b=p36HscUchAg0CPB1IVlLAHSXs2vt/CAtvnGZGYh+pgGb8ff5pnVy92OpuvFkRtll4M
 SI5aSrhV3PxrLbwz17jamuLN6negVlYOyUO0lVR594tXatTmLzOco1s3uJGTt9G0c02T
 oGCMZyhVeE5Rx/Y4UrAqp28VHMbYuQav1xwBQCWuZUTwsEly/5H7VsNZS6EQ79Dy4jsm
 ylGUbOu6BuqAvds98BLPpY+r2Ujizq6ziG99s99QZJPq2K6KpQk33kIgRGXyAgj8CE8A
 e/8DA/xD/kOPAsUIfxdTPXOBYEdxznO4bFVFYb8uJoYP8nKKJ9E5RyrGSz68UIXgrnZx
 mu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zp9IyNE/WOqMjmmUo5OQb7An9Jck4EABFW2ZtXIp0J8=;
 b=rjsK4QlgaudbRS/ZjuPvDP3/44xoGmwns4z5gaURBwU5F+2I1wJNpxzUUcqFOCpscL
 3swwd3gkLBuXZsJZ5GTZdT0q1HL+svZXhBHnBBNILhPfN8XVkaIG/zAkJH1aqjXHitlo
 MuqGa/tiiUCbw/5XyVwilVxxul904x8mysfXkBq1RiRk0F/9KFJIlsuhbxhs9jNg6s2Y
 /NEvG3zt9yN9soZMTVIZj4oYZuJwB82rm30tzo5HtID/QQPxCwA8I6VsapmFzaDtMSUr
 lu53+px83y1TUcpXC3/eWPaAqhE3DOm7osmqjCGaYYTvAXNI3WsVa++ABMFXQ1UebmaK
 qvXQ==
X-Gm-Message-State: AOAM531cCs7gHwjWIg8p+e09CJd9/jivL0vHdkBoPKMzk+Zqz+RUEecp
 HJbaW8AE5X5o+/CRQ28sdM9FfLijHLI=
X-Google-Smtp-Source: ABdhPJzr5GCoe/5L+0bMuPjqymASle/2ldfXTMtsEz86fUAPPo0bs236xCphulrBw+iau6eQYoDrV+vdm10=
X-Received: by 2002:a25:4c81:: with SMTP id
 z123mr10656827yba.309.1594950347400; 
 Thu, 16 Jul 2020 18:45:47 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:45:35 +0000
In-Reply-To: <20200717014540.71515-1-satyat@google.com>
Message-Id: <20200717014540.71515-3-satyat@google.com>
Mime-Version: 1.0
References: <20200717014540.71515-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFRh-003lgZ-Tz
Subject: [f2fs-dev] [PATCH v3 2/7] direct-io: add support for fscrypt using
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
