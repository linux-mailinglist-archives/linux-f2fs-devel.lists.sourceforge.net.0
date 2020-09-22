Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F84273FF7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 12:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NO06jLI7SiyehXO2TT9FaEfB+ulmFp4Zcni81Y83lbU=; b=UZOurgZ/F0qF/pRa7uNZJGQOeF
	3t8/jHQJMQCMZjlJRRuGvAaOjeTxnI3CsZqJ3ydVc6iFRhh+0QQgEPPmcUClMok5b2PWzMB5JEchC
	KmEn55Z/rhkvo9GA6rGSOqD388F5qBdYvHf0kuNFsVc7jeKKR0lAAOQAYvacN7cgpDP0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKfvz-0006HX-Di; Tue, 22 Sep 2020 10:54:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@android.com>) id 1kKfvx-0006HO-Ti
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 10:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=; b=UXQO3ZFLkh51JTLJHLl4VDajq+
 eCvFjHLJH7PWkMABKUnok82zOIwShylt113Rwnnz5K6LBsRVPzI8JDYwH6HPEAP8aTfwY+p2QJD90
 N7hy1yWP6nFv0Z5oQGnzeBqhYiAKscGvX9EliQRC3uHRgelvikUh02MbeemqRoR08Wd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=; b=A
 YQUeLWC+Z5UEGL29Frev2JDcKTR63Lflj3W0KRu6DOubRDg6o4lfN459PPccsptXHfJk9um2IJD2E
 9yYuU6xqBdj4PcUQtiy7yoG1GHFBuNs8f7B6hmbEa5wwCNReExgBjeEmARks9nL/48LTfNuGtLSuQ
 Sr4ngdM11K680lH0=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKfvt-001E4A-1m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 10:54:05 +0000
Received: by mail-oi1-f193.google.com with SMTP id a3so20585337oib.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Sep 2020 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=cjBL0njHm+8zUypttYPB1lyQmH9E2S3jK9rf/cmZXEh6EGhIdRL9gIUk/vQojZYKYn
 IihVstLnA999VhtdeYb2+OGsEINb8d80uZmj0iYuYKmjzqdzEUI76X8MpUdm0QgCwDJk
 oPFPSJ3Z+Ng/XKbFdKJfbc2uQyDB1AM3XB46PycPUVTODJj7MfvUhH1c9SOBH6hy3fN7
 +MmI5yEbIvmoO31Bcs6jUoukXNaA5DDoZecxGw2h+gJmXdQsHQE99QS9XqsD892baliJ
 wjhdtIqH6uXDr1VRf4Cpg35fClhascX89HcZ86PTKJaI3hQP1+2H5OmowlFkWHmQUA8X
 0uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=UEOetMyYa7F4uWgB85jHbtpYiBjGhgO20N5Vvtquv0fMaOa1fIWkb+TK55lT8YREdX
 mBnN/kKxBv2pbDiSMbBsuRJbBfvEKyvgsDqlDqwvRDOjozkbvzpAXS3Chsmh2C1ilSNG
 eXtBttyGqxHF5N3ycAqnqSEwTYXOf7c4SFwMgqvsB0C2WYxZbpsP6pATuoVmRYALYkX5
 XssAco6NUWqIvjhiVTypMgm4xFarjm6ye1vYhLX4CARodUwXJqqzC16E+uyIHIWE3C50
 +t0ybnfo4a7HnIDdmZlwKN0kywsPYqLNvzQ0FjFnbQMbEC0xb0rgCQ53GnTmdzIif+cH
 EnLg==
X-Gm-Message-State: AOAM530FrduvSkAyqxQcvLyolOElgwTLMuc9s4rQBb8qOehI4KHz0u1L
 02QitYbFRQSSAuN6c0bbQeiX+BGGuYXB0X+7ehA=
X-Google-Smtp-Source: ABdhPJxmaXOIQxSeBKkx6n6E73BxPgRUl72SH7IqG1Psmqep24Gl/+025pnEfhuIqXdYNK3DnALwOg==
X-Received: by 2002:a17:90a:e10:: with SMTP id
 v16mr3235865pje.84.1600771699965; 
 Tue, 22 Sep 2020 03:48:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-231-5-90.hsd1.ca.comcast.net.
 [73.231.5.90])
 by smtp.gmail.com with ESMTPSA id kk17sm1958427pjb.31.2020.09.22.03.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 03:48:19 -0700 (PDT)
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Sep 2020 03:48:02 -0700
Message-Id: <20200922104807.912914-1-drosen@android.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kKfvt-001E4A-1m
Subject: [f2fs-dev] [PATCH 0/5] Add support for Encryption and Casefolding
 in F2FS
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
Reply-To: Daniel Rosenberg <drosen@android.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These patches are on top of the f2fs dev branch

F2FS currently supports casefolding and encryption, but not at
the same time. These patches aim to rectify that. In a later follow up,
this will be added for Ext4 as well. I've included one ext4 patch from
the previous set since it isn't in the f2fs branch, but is needed for the
fscrypt changes.

The f2fs-tools changes have already been applied.

Since both fscrypt and casefolding require their own dentry operations,
I've moved the responsibility of setting the dentry operations from fscrypt
to the filesystems and provided helper functions that should work for most
cases.

These are a follow-up to the previously sent patch set
"[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"

Daniel Rosenberg (5):
  ext4: Use generic casefolding support
  fscrypt: Export fscrypt_d_revalidate
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c       |  7 ++---
 fs/crypto/hooks.c       |  1 -
 fs/ext4/dir.c           | 67 -----------------------------------------
 fs/ext4/ext4.h          | 16 ----------
 fs/ext4/hash.c          |  2 +-
 fs/ext4/namei.c         | 21 ++++++-------
 fs/ext4/super.c         | 15 +++------
 fs/f2fs/dir.c           | 64 ++++++++++++++++++++++++++++++---------
 fs/f2fs/f2fs.h          | 11 +++----
 fs/f2fs/hash.c          | 11 ++++++-
 fs/f2fs/namei.c         |  1 +
 fs/f2fs/recovery.c      | 12 +++++++-
 fs/f2fs/super.c         |  7 -----
 fs/libfs.c              | 49 ++++++++++++++++++++++++++++++
 fs/ubifs/dir.c          |  1 +
 include/linux/fs.h      |  1 +
 include/linux/fscrypt.h |  6 ++--
 17 files changed, 148 insertions(+), 144 deletions(-)

-- 
2.28.0.681.g6f77f65b4e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
