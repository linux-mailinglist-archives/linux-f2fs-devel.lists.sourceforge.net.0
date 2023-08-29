Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0378BC4D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 03:06:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qanB2-0005yR-Ch;
	Tue, 29 Aug 2023 01:05:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3ZETtZAYKAM8yC9Dz819916z.x97@flex--drosen.bounces.google.com>)
 id 1qanAx-0005yK-No for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/C3RNhWuUmCk4yaySwblVis40pKGiJWYRU4ngvg8n4A=; b=ayGjZz0S61OnCUXzGydrJb6iC6
 9W2h6qkCswjz8leYPPfi5Y0Tn52Md1glkzC8Ir//JMEDK+DK3xv8N5anYPntrjnSEN0Go0m95zdT0
 C3dkDyJ313muBZ84Pj/wZwDIsuFhHDAxg683LCJ8Cy1/pqsABbZU3mVa4crzljazN3Gk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/C3RNhWuUmCk4yaySwblVis40pKGiJWYRU4ngvg8n4A=; b=e
 IM5uq8vyL+gt9xnK4oxc9nY2yI3B/VKzWwjFUlKW68mCoAPAkF7JBdVqblftmmlD2zaSjLZI2U1Ya
 VGohOD5ep9WDfimJMv+KyrViYcLnEj9k39slGIweGUHJG0Wp7AuJRlUJhRusgtRun5qby+gSVkNUh
 X8N2Le8EgapY4+9I=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qanAv-001TkV-Us for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 01:05:47 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-5925fb6087bso55754877b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693271140; x=1693875940;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/C3RNhWuUmCk4yaySwblVis40pKGiJWYRU4ngvg8n4A=;
 b=pH44l2va/GVmLavmU1aNCkYeTUbX/UBK/Ue9kpEyaEqbEPFJCYtOvedwWBHYbb6c4g
 rulwvMbnq5H6+kZmEAihFPau0A0Zq/h/CVzvnw9DbOfl3LJkrrppxFDk9CVASiN7VoO8
 Po1k3l7k0oeL4V8dH/hCYE60KwzFzFYdZo4LiaP7gPm89bjbKtDnyn49Op3bzv/fJLz8
 PQgHy1eDxAIunIj6nPI9OHfMhznZorMc+nIRV4ks4xHvVny2jv1SzS+fCxRxZe2QEi08
 DBEw9a6pwIfjg3euY6hhW74Nz8eWD99D523E0841MGcwd9LlFH4FmUm/w2EHN+42UqE8
 F7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693271140; x=1693875940;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/C3RNhWuUmCk4yaySwblVis40pKGiJWYRU4ngvg8n4A=;
 b=MY1reJA97KLqcH5ic+2MgpefY5exo+qsYV0a65vevge4jiyhrQKd/2BIScnBRB7SGE
 53ya5Bt+wDVEgiMpHufxKqPSZ0DX4EbJS2570pqorrfnlBJVOziO76FmGjkQZ4EEGJN1
 SS+9bMrECv8GXP1CrAZlzjx6VzvNYkEC5mJZSTAUAgOmS7FDz11s2D9xU75jIr8sT1X6
 S/XMVi8ksDW5vh+OYMslQY5XfQsdMXVY52ELBOqqkQhgmCCtSBrQ4ff2GTzIfO/M+0Sq
 gDI02g/8gm/wQNiCvDgqIwZiU9hd7DP61KnLjH8UI44Cep+EVizfFh85ue/8lsC8jLNF
 mDyg==
X-Gm-Message-State: AOJu0YyhgPP8vp+Qmtut8HqCWk7KXbrwaHP8mbS2BoSq/8j2A/gLiKMt
 0UqW5doXv+kBLC3n2+2wU0NfsfF5UdA2g3NAye+WPwzGhKOFixI0HfO4HwFRgKA7XlXHk2b4P6q
 4ptd2qSVqXUzsNEyB9gp0pG7+r6uJg1KqDOjhzgvcjisp10Ovvpw1cefitdKCEBc9ErCNN0qwWy
 9usWFJzoA=
X-Google-Smtp-Source: AGHT+IHmPFXpvjcXp6GtBvIexFilan/VtRY9f0N8KcRbdWuOQsLHN4mBz1XqGpbCyUzpWjVK0jrD3IzAZCg=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:d11f:7395:bc0b:a192])
 (user=drosen job=sendgmr) by 2002:a81:af59:0:b0:56d:1b6:5360 with SMTP id
 x25-20020a81af59000000b0056d01b65360mr936470ywj.5.1693271140118; Mon, 28 Aug
 2023 18:05:40 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:05:29 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230829010536.3044883-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This adds support for different block sizes to f2fs-tools.
 The first patch redefines all block size based constants to be based on the
 block size. After this patch, you should be able to compile a version of
 f2fs-tools that works for a given blocksize by just [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qanAv-001TkV-Us
Subject: [f2fs-dev] [PATCH v3 0/7] Add 16K Support for f2fs-tools
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds support for different block sizes to f2fs-tools.

The first patch redefines all block size based constants to be based on the
block size. After this patch, you should be able to compile a version of
f2fs-tools that works for a given blocksize by just setting F2FS_BLKSIZE_BITS
in f2fs_fs.h. Running fsck on an f2fs filesystem of a different block size will
fail early, and should leave the fs untouched.

I was unsure how to handle things under tools/, so I've left them as is.

The rest of the patches refactor the code to allow it to handle different block
sizes with the same binary. The final patch puts this under a block size
argument in make_f2fs.

The refactor splits apart structs that have components with sizes derived from
the blocksize in the middle. If the component is at the end, it's treated as a
variable length array. This means that sizeof on affected structs will not work
as expected, and should be replaced with F2FS_BLKSIZE where appropriate. The
affected static_asserts are replaced with runtime asserts.

It touches a lot of places, but I think it's probably with it to be able to use
a single binary, particularly if we're ever going to be able to mount different
blocksize f2fs filesystems using the same kernel.

I was unable to get xfstests running on my 16k arm setup, so I wasn't able to
test it as thoroughly as I'd like to have, but it behaved the same on a 4k
x86_64 system, and fsck/mounted successfully on an arm64 system.

---
changes in v3:
Fixed runtime asserts in check_block_struct_sizes
Now calls check_block_struct_sizes in mkfs
Fixed stack corruption in move_one_curseg_info

changes in v2:
Moved some 4096=>Block Size changes up to initial patch
Fixed build error in initial patch

Daniel Rosenberg (7):
  f2fs-tools: Define constants in terms of BLKSIZE
  f2fs-tools: Refactor Orphan Block struct
  f2fs-tools: Refactor f2fs_node struct and friends
  f2fs-tools: Refactor SIT/NAT block structs
  f2fs-tools: Refactor Summary block struct and friends
  f2fs-tools: Refactor f2fs_dentry_block struct
  f2fs-tools: Support different block sizes

 fsck/dir.c               |  46 +++----
 fsck/dump.c              |  28 ++--
 fsck/f2fs.h              |   6 +-
 fsck/fsck.c              |  72 +++++-----
 fsck/fsck.h              |   5 +-
 fsck/main.c              |   1 +
 fsck/mount.c             |  99 ++++++++------
 fsck/node.c              |  12 +-
 fsck/node.h              |  20 +--
 fsck/resize.c            |   2 +-
 include/f2fs_fs.h        | 274 ++++++++++++++++++++++++++++-----------
 lib/libf2fs.c            |   4 +-
 man/sload.f2fs.8         |   2 +-
 mkfs/f2fs_format.c       |  90 ++++++-------
 mkfs/f2fs_format_main.c  |  15 ++-
 mkfs/f2fs_format_utils.c |   2 +-
 16 files changed, 412 insertions(+), 266 deletions(-)


base-commit: b15b6cc56ac7764be17acbdbf96448f388992adc
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
