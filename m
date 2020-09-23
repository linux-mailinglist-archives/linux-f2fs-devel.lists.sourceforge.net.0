Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBE274E89
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 03:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NO06jLI7SiyehXO2TT9FaEfB+ulmFp4Zcni81Y83lbU=; b=WhcggQsXeC5RtSz17Ded/qg5pA
	vcWkVxC+DimrwC/egXTfeiVKj+QC8gGqaLkaOouOt2WtR1nm9bGwS/ZX9fc/bzjX57x3BalrQAHRM
	u2MC17uEgqzhN/9XqNi+sFBymDD3YUy3nWorV5Q9K75GiqwUc6LloEkHY8SLV03dFs3o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKtjn-0004vX-21; Wed, 23 Sep 2020 01:38:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3PqBqXwYKACsKYVZLUNVVNSL.JVT@flex--drosen.bounces.google.com>)
 id 1kKtjl-0004vG-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=; b=kV5XMmpe7RXigfYN+/1N7b+MCg
 FyKJ/goVRZjenVfg5F8FiA3k8pcA+HvDqz8e2r2z6KWmNvgW4uprXEo6tPdZFvaFQHezLv95QFaSl
 vjpbs52kmL0LjRCiOlWaI8avON/hQHFZ2Xb4Bqla+bPhdvEWDZWjRVOIM/Cj+yU5DLRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=; b=F
 BqbYock5Ub1uA7BhXosJlA9+O+pjVi4HvLAVOSPr+RscAJA5bCXo+a9GTl1z9od2rnsnlGLNbDQwY
 nIP/4EnCEKU2LyxKkTnbU4t2v5FBaoO/oTxf2GAIeZqTWG3nzZDjhE/s5T3OPp2E583Ghde6WaMiA
 M2arATVsL2Ako4Gk=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKtjd-001vFR-0e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:38:25 +0000
Received: by mail-yb1-f202.google.com with SMTP id e190so17912096ybf.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Sep 2020 18:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=VzYml5mRARymBMqJuBNvlalVRmIpcIRL7rCYhdalEJ6bKiRq37APrmAer+cndQz7ow
 HDgQ8sObYp4idOZvJsIB8XMBdAbJDoPCXf8RcjD8zqSkhEpxPKkDqW19XQG4XFjZvJaz
 8jEIjxaKoJcRnQ8fhGfMGPAbu8NwMdXX1LmNNI+9aYl3v1FIDXUdjNESPhuk/al8UMRu
 iwH+o2SnESdtrDrKMurtAfxp8eGbb3YAnwpecd7/CBg1WdTaJUzuh/5gxIJHiCHdeBs/
 OuNNmgOyE5L/7V98+v4aCcawDaDAqbTrPsoF6o6qWk/oSi7nQACkmrj0atUkhEeP/rkK
 mCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=gd9BXK6Qogm8GWzcEx/RRuoN03o4stNhU2BMPs3db+g=;
 b=W2dl2DN3Qtf0YV0ob16pMDKs3agpiJrqVJW/uuKWhZPJUXZWXa9cue3xdCYxAjJARB
 5gBqrFp0hH0wxHcLJzJPuv8B1XT6yuvQBFxx7FAVKSG7OYVB0EtHYfMWrtRMlP5rf+hy
 ac+X+1btHILtV2kbKfdG+320ZeDtvVeaFZcrnKt8ZhFygn+E7oMsCbhIMUYl/bJzdnOM
 1dMKZ36i70PD85Rs6Xd2sxYVv85t84CtW31iqH7e0vRS1aP37OL7DOmK2SbX4eXKwLwW
 +ZkfLC7aTDnl3EmF+XOdrJJoJznB53CfpoyfkfAfyp8UoHZwnRYbMe3g3WfqJsONAiEo
 NyvQ==
X-Gm-Message-State: AOAM5306qfeg5t3ijo4J/vMJptkS5OK7qSoubcP4R7+iQNp9h1Sav2kW
 HEsYI2J1PzUOKSE98dbSoKu5Omsr58g=
X-Google-Smtp-Source: ABdhPJw5IYwBppbdbWip5F74kDHHvTSDqolnxLv2PtjxebJu9eXnJbODevPPAagFkTBzSK+vbQomxUmmEHU=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:6dc6:: with SMTP id
 i189mr10208913ybc.355.1600823358686; 
 Tue, 22 Sep 2020 18:09:18 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:46 +0000
Message-Id: <20200923010151.69506-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kKtjd-001vFR-0e
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
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
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
