Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A3399F52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 12:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XmzRVc2YP5RmYokpzmhBPi7M1/nt4B5NL1yGSEyjz+A=; b=m99gZ6a0BUJDevjGA0YpcE4kP
	AtIK1dDreS6Tfqb53vqGrcn7712otXG35y8wkglHtmuZRskt1P63xnJlTi3WwskV7BruTDOYKi0p1
	xrj0J2Hjh4x4aWSCosN3wu6Zk2Xb43xC+y3c5ZaAH/rb+csPpCMYHQjJYjih0mW/6ONDM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lol1W-0007t5-84; Thu, 03 Jun 2021 10:56:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <39KW4YAYKAC8OcZdPYRZZRWP.NZX@flex--drosen.bounces.google.com>)
 id 1lol1N-0007sj-Vn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 10:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kR7sRAYJgYzXAltawUkgM6QLDKs+TdWaYFMXl70NU30=; b=L0mIwfja4de8PHBUkGLv4SHBy
 Vd511JMBaGL670xOqr2HhMhZm5Iw2VAjGOuMDGEWWHKWN2/FYTRYptCqhdzg6elbEA45ZmPYEZ9c/
 m5Jh0g6XQwLVEgaOtCOsp9u7+P0wNjOXNT5D7GdYeOp7SUUyAS+bY3y/LMq42usiz0mZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kR7sRAYJgYzXAltawUkgM6QLDKs+TdWaYFMXl70NU30=; b=A4+t1dJ6tPNftvpCmUJz/nnV9o
 TAZmFBJmQNbMs/zVlulfTJIcVEOyibB9s5K/lz5H2eccfO4dcdS+uHNctDiG76ZGTl4SppjTUX9ym
 fyZlLfZMnmmhzJeLF/xWidu50Xe4jjsJZleBJy48cSshqvd3qvclnCAOPGGKww/oPeK4=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lol1L-008mRn-J5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 10:56:18 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 22-20020a250d160000b0290532b914c9f4so7173743ybn.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 03 Jun 2021 03:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kR7sRAYJgYzXAltawUkgM6QLDKs+TdWaYFMXl70NU30=;
 b=LJKZ6LsL2aYsJR1+AehJQAJ7FIgxPEQJIitSrKRyU7XfGtmDPMPSNJEHLM8HTRS5m0
 dWlIDs81zCAdesoohP+0GRT1s3FWql/S2+zquZr7AgfYstU4BGdkDoRjh63t9CQXvwPf
 LtAAb9RqanCPcIgZWoHx4PsRswyPai5x9KKxBFLKC4ZXzc/kRkITdtGrYzTkwlNGCBaG
 XIUQ8dQo/rYaOvXyTufGfx6C2LmrZ/ZbiUoCeX+RX7rrm5jeKYCTHZ77w07DPYopaYMb
 uM8WpcWu30HynSfGekZZGg13SEbYvOHMSZ7QS/h+jHGv6bcNXYpPJRZ/nYl9y1OM7qUQ
 9YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kR7sRAYJgYzXAltawUkgM6QLDKs+TdWaYFMXl70NU30=;
 b=PL8GT4x6imJbqHJ6dueJeB+67OTBMlC/HJgmSYgYrTf034oW4zlKfhH18uZwq30u2Z
 z24AeahTTvCJeVSRm0bKEE+aNRRHcrIyUSh+WyiLF+0nohOVOUUF4Rnci7rCpuelYmnY
 ++Ly3U4nBgP8E2UPItUUxXayuro5Q06KgJJIOK2LPdKSE4zuD1B3Dzo/ioMLoY/j0Gmr
 +9VEy27HTrRMST9QtHKAtFO+ONHCHuReS7yVlTuLU4A/nuqmQjqWW1B6JH4vJDfIAwEE
 HNb4UhvoSS+tWtWAMh6myM1oPJUiyBHDT4+uxbFPWszTmwkViKcvMEYDT0/KZ9rLrolb
 8xKw==
X-Gm-Message-State: AOAM533cR3L1Zkz5OG+ZazDqnSN6SL/1yJofXOzKf1Bg2MITPwZPE6Oz
 teiIWwBAi/c8vh85ZOqbDXyAfRG4ff0=
X-Google-Smtp-Source: ABdhPJwg9zQpmTee0HJgwJoqlYYAiV6WD/aVlCidtVhW+RhGawkkIOnjZoxsSBgw9O6LZXS5cWzq2nbANLM=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:3d6:: with SMTP id
 205mr9832485ybd.350.1622713844030; 
 Thu, 03 Jun 2021 02:50:44 -0700 (PDT)
Date: Thu,  3 Jun 2021 09:50:37 +0000
In-Reply-To: <20210603095038.314949-1-drosen@google.com>
Message-Id: <20210603095038.314949-2-drosen@google.com>
Mime-Version: 1.0
References: <20210603095038.314949-1-drosen@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lol1L-008mRn-J5
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Show casefolding support only when
 supported
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The casefolding feature is only supported when CONFIG_UNICODE is set.
This modifies the feature list f2fs presents under sysfs accordingly.

Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index dc71bc968c72..09e3f258eb52 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -720,7 +720,9 @@ F2FS_FEATURE_RO_ATTR(lost_found, FEAT_LOST_FOUND);
 F2FS_FEATURE_RO_ATTR(verity, FEAT_VERITY);
 #endif
 F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
+#ifdef CONFIG_UNICODE
 F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
+#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
@@ -829,7 +831,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(verity),
 #endif
 	ATTR_LIST(sb_checksum),
+#ifdef CONFIG_UNICODE
 	ATTR_LIST(casefold),
+#endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
