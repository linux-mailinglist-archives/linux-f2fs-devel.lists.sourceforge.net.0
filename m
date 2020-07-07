Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7682216BF2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 13:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Agx89swR5Q1BQzYautQ6v2o/6qNoNlQDvehDFrwqGjg=; b=WzmpiPl+wUSGeQOrqaEYqN/kwz
	BEXg01I4kLd4mll0h7SnzHYuqHDNGgqJQNzCx1A5qMSggy3ImARMntsLPNpswgF9+yuCraaqgfG3c
	VwtBANm/GA4MCBsH88AT/YVLv6BlXsBisncdti0qssD+5m1Zwy9yiJvTK0vGXyOZUpec=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsm2R-00009i-WC; Tue, 07 Jul 2020 11:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3R2AEXwYKABg1FCG2B4CC492.0CA@flex--drosen.bounces.google.com>)
 id 1jsm2Q-00009P-EE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LLQSBg64iwWxTtcpWWM6iR9wTgF8QbEH02Vy+2bg9Hg=; b=AY8cQl6et/L3WL6JMvu8ZY302C
 Y4bKSVQga0YoIn1saJyUb0ctzj3+JbbmxuW5kXYMKIDIogmBPrBLKZuXf599hAzdGGRpnrd3uyoZ8
 yAR9UcyAs92OuIQtwdR9/unb8RUZ3uVvZnKqAGQXwdU4LKIR4g/AMhL4+/YoXVRfcsz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LLQSBg64iwWxTtcpWWM6iR9wTgF8QbEH02Vy+2bg9Hg=; b=k
 uDwKBXEIYNRwsPoW37jg8cyVr7vihZY1AM8+512B6hlf5wO9+miEl+TuWt66gBiLNAmMW0x2Whvd/
 fGn+QjYf2i2cz4qwi4wNXy3zzP41lu07gy+00jfdWEgIsXW6pFs6JjlV+6fUL68OWVgme7WbjMB/d
 Qq4at8Qm3/leOU/Q=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsm2O-00G6lS-4h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:45:26 +0000
Received: by mail-yb1-f202.google.com with SMTP id d202so1103162ybh.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jul 2020 04:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=LLQSBg64iwWxTtcpWWM6iR9wTgF8QbEH02Vy+2bg9Hg=;
 b=vaUinhNZkQN3RAVXNuIvu2m9UALKLZu6+nRg7EiTfijttvY5uvU/HlfVTs6MFI3BjD
 Er2jhbF7pByOmGUAkA0Rwjx6r1yRJYYD9O+cl25wvja83NKdtmmp1zngnkV02lhR5H60
 b5PjacpY1TP2NcUr9fiYcugKPCAjjR9rmlEhUHB0wiSX4QdOcSpvSGrvsQV0rT/nifCK
 2ZKi0Cmb2t3TuutVgBjI50QCH9omrBcU2W/h5TS/pS3DnoIpdnsJzSM7wmedPsCcY2wS
 ytB1vf691KXilc3nIafaO0kmcuwa8X3LA+tSoYg6SrxvtuS6RBnGMpkCLIhuojqhRuKM
 4b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=LLQSBg64iwWxTtcpWWM6iR9wTgF8QbEH02Vy+2bg9Hg=;
 b=lZ/wxTrq3DnXLYxH+JAfULcrkf5tEYbU5TsDhYAQCGk1BH/UGFRZBLnRlvGDpzBXBL
 7DHE3m557Sy7w4OfFFwn9kcTTic3VqWqDmEH7F7gz5Fy3EGCsD1IXRHkqbASIMGBUY9w
 aye1KTnFf0qMuhNfI5qJ5oZikNem9Yg9NwliO4x4wKKLDp3KUcaEb6mBjseeu8KyCYyD
 wH1sVrbq/JbuHIBdH9g8aRAxQGceRRkT+iYXn4/7+dZFlarXTBp5Cz4qoytD2K/HtwDj
 6rcGLFQw+sQTDiax3RtJH8ezj2HFCP4m3cJh4tGKE3iogxFPlj46OsBbSIIJyDZN7Apf
 n5XQ==
X-Gm-Message-State: AOAM531+MTZx7ohUaEFGjG0ggR5+JJjNHrxWq6hFwDiTowVTUafdEaHW
 8xTnt4zBjGs2vyVlJrSoUDFvlLkWmZU=
X-Google-Smtp-Source: ABdhPJwLxIHBchd80Gve4mlw6g7Mb8civMvZG5ZcJoCOlzyO/mCAmx2JmX2IzIWBOuqsBIRGM+219TLjngU=
X-Received: by 2002:a25:b903:: with SMTP id x3mr32504935ybj.445.1594122311275; 
 Tue, 07 Jul 2020 04:45:11 -0700 (PDT)
Date: Tue,  7 Jul 2020 04:31:19 -0700
Message-Id: <20200707113123.3429337-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jsm2O-00G6lS-4h
Subject: [f2fs-dev] [PATCH v10 0/4] Prepare for upcoming
 Casefolding/Encryption patches
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This lays the ground work for enabling casefolding and encryption at the
same time for ext4 and f2fs. A future set of patches will enable that
functionality.

These unify the highly similar dentry_operations that ext4 and f2fs both
use for casefolding. In addition, they improve d_hash by not requiring a
new string allocation, and ensure we don't attempt to casefold the no-key
token of an encrypted filename.

Daniel Rosenberg (4):
  unicode: Add utf8_casefold_hash
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support

 fs/ext4/dir.c           | 64 +--------------------------
 fs/ext4/ext4.h          | 12 ------
 fs/ext4/hash.c          |  2 +-
 fs/ext4/namei.c         | 20 ++++-----
 fs/ext4/super.c         | 12 +++---
 fs/f2fs/dir.c           | 83 ++++-------------------------------
 fs/f2fs/f2fs.h          |  4 --
 fs/f2fs/super.c         | 10 ++---
 fs/f2fs/sysfs.c         | 10 +++--
 fs/libfs.c              | 96 +++++++++++++++++++++++++++++++++++++++++
 fs/unicode/utf8-core.c  | 23 +++++++++-
 include/linux/f2fs_fs.h |  3 --
 include/linux/fs.h      | 16 +++++++
 include/linux/unicode.h |  3 ++
 14 files changed, 174 insertions(+), 184 deletions(-)

-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
