Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 413912B6846
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 16:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jROzgE61VPIwWf4m/Yhq0t6QIJ+cRxTOGvDcssIUD4k=; b=Z9hPBp0lVEDQ0PnblSlB2kE89
	vKVgc95iFa1XrV7Vp8LRRP4TxC5TqrB0QQaOZn8VS8cpV+mR/fHnKvDxY+vT6v+6FgCUm6aSusb8U
	3YNqK9/sgM8JyNxCf6xYI/FpTrE+vo6c8E/1nPH5qg4OfTqoNMSs5Mf44IzpsMLw26hTc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf2cT-0000gT-HH; Tue, 17 Nov 2020 15:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3K9mzXwYKALAiQjoQjWeeWbU.Sec@flex--satyat.bounces.google.com>)
 id 1kf2cS-0000gH-Bi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BwiyyJFpFKuHzxO9ElSEoW591wjEhbpMFVEeLerCK4A=; b=Oye520vc3pwvKyDL6jPNQUexu
 Cg/JYPF4/3m2eVHbP7ljdl3U8DZ2mXPZJmir457iiXm8DPFzoT2jdZn/B09QBPPNMiyLWDgpbk+k+
 6RRXyiO1ttfuYLAnJxbh6uCoClSa0pUQvTTI3OsJEI94z5p2l5h3kmXGPPg5GW0J7EYMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BwiyyJFpFKuHzxO9ElSEoW591wjEhbpMFVEeLerCK4A=; b=f/CKS8T5r9BLUU9Ouh8pYUUpL+
 QeAXCXG8POlBUxQ4pSm/ZI0CBPRQkDel2aYC7RXoGOwzXQiM3QEIgw5beBkpDr1mwR5IxrNpXTN4z
 MDrexQUv6l4NzTnlzOy9V/VkzCsXQOhzy+CNkq493ZJDKx5p7pLo2LpkEVS2DIK4ALs4=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf2cG-000tLp-0t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 15:10:08 +0000
Received: by mail-yb1-f202.google.com with SMTP id c9so25503993ybs.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=BwiyyJFpFKuHzxO9ElSEoW591wjEhbpMFVEeLerCK4A=;
 b=B6mSrSI+KLsPLHZOubezapg1w7KyF48Gcd5KvqiZAUUomrvCt93BMFte58x4CeD/eg
 k0xlCR7goDt3KvTfbq6ZMZJTRtCUUnhHZa0njAuLo6BAWtOyT0lG1N+rkq1ohiO1t97Q
 qemqcHPO0pfn6jMj0SXbr2ZPFcNslQAZJlIrb9BwOmPHHl8x9VSfb8bJ8B9PJOSyLNxA
 sh1xch+eqx6drXfRAgiE1e5/U0BiaXHV0kNKfFjq0GDmh5MgGwrgrpp+Gb33sSAE+/7N
 uiK1X9QiX7TLKFELMTbOhucdRKr0jLm77xygNNOq76Vp9Flin7B1n7wnTkkNWd/qi3VO
 sykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BwiyyJFpFKuHzxO9ElSEoW591wjEhbpMFVEeLerCK4A=;
 b=nhOEGSgBySNK7lwW+oP545urHsPkegwkesorbUXENrg4nzs3+Tk+dgutSkulP2yANz
 PB4GBMUEDX1JM5K6yTqIIApOTmYnnylWLlE9olOgU01OtyBflHpBSz8uKVulSho0gIac
 ri/ijbdHGP+wQ52O+YC7h12o0szkl2jyK7Ovm0nqHk3ReYXhDuk2ryr7+H7ILE0+2Ei+
 o3DV4LmNRunaI0QVXA4BsptmbKS8gRX/YaJ36W+m/kMwC3PMUWWd3LU0In0oX8B1V8PT
 2o5n7gPkA1qlS69PJdKchB5ZmBhYsGGQb8GMEfYszFRHkSbzp3TLDQtzLylbB9IQpC3+
 lHSw==
X-Gm-Message-State: AOAM533WbZlC1/Od1+PBGty+UMhD4iIxdGlzRLZtbot0NSDkfCRuC2Tj
 x1Qou8y+mqnueWEAZWaJqP/4Iqm8C3g=
X-Google-Smtp-Source: ABdhPJzSl4jy6BzVHmPfkYxBH8ET6UtBl4AEksaq1fddCMgxT0uxzDjjRNZm1PxWWWwhr7bOMNiWNibk17E=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:2fcf:: with SMTP id
 v198mr26506998ybv.492.1605622059376; 
 Tue, 17 Nov 2020 06:07:39 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:07 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-8-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kf2cG-000tLp-0t
Subject: [f2fs-dev] [PATCH v7 7/8] f2fs: support direct I/O with fscrypt
 using blk-crypto
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

Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when the *length* of the
I/O is aligned to the filesystem block size (which is *not* necessarily the
same as the block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..d518e668618e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4120,7 +4120,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
