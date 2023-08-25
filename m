Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5457891CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXK-0003NM-QV;
	Fri, 25 Aug 2023 22:44:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3uC7pZAYKAOcMaXbNWPXXPUN.LXV@flex--drosen.bounces.google.com>)
 id 1qZfXJ-0003NG-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hz2Du4gxfgtUmKF5Mvj7vndJqHDA1dVz464QcNbmjEE=; b=W2PlvHObtpCN7qvyi5FzAhxRqo
 mL7SbKyGHqM69kb4ic6mlyKLJTQBedUU4SVZpl9+OLN07Da3Uab0PtWlj0gCwep2jHH1QZUkFM8M3
 nGoxafgM2D8vT/LPySzvubmhmqzaIW03BJCu2t2SgqsyGQoCES5+bYpdNkwFYSS70KRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hz2Du4gxfgtUmKF5Mvj7vndJqHDA1dVz464QcNbmjEE=; b=m
 Fymtrc8hAMXDaUh43Nz4o74CSPGUPCmkpE0HWmapu3kI/0XweHJO9S6fwAzQf6x//Qh+l/uXobChD
 cXopPcYOK4d7cxREy2CVGOPpm46M9T5L5WTNiLTQPLhc+CKvIrv2065iVeYMFeDFeUlTSP6tHs4P6
 44SotUAH2xojGFSM=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXK-0007Mw-01 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:14 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-58fbc0e0c6dso20468297b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003448; x=1693608248;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hz2Du4gxfgtUmKF5Mvj7vndJqHDA1dVz464QcNbmjEE=;
 b=vUr/QcuZ9MCiYZil3Jim/aI+HevJ+cQS1nVWstlUqKdqCzMdcbRo2Y3aEvE4rDoMeA
 oi73S5WlKS5hVYYxajLmXwoLcRL3KXiab3BFTMpEPEOk3M6xjFbbAAGXuRDZH3T5TDzg
 6Lmu7f6Q3u+aClAaRCEf/yDMwHIYph+O8n6q5lboKBTVIc3eHkeReWYRZdXh3IpKQSxe
 NbULMImTc14m1Ndb45nMMXmtA8Ws8flaZmh5upFnqDmZltiCTsa7MiVp4ZkZHJfRzbT2
 2stthkosmt2jq+Xo6bZYHazPIXVP/R+FeC1ZK/mq9y0gYw7hpW7WjKA1Z27vqSIiba+o
 OXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003448; x=1693608248;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hz2Du4gxfgtUmKF5Mvj7vndJqHDA1dVz464QcNbmjEE=;
 b=CxmvN5/om6cVsf5p72SWjIfoLsdDPlfdNVZ7+d20jj9DTxR2OdRCnMoEF4EtHxemoZ
 8whNwcihIb4flVVuaiNXKWarDNyjNfbmN4azCjeuaj2MtFSDY3u0+G5Ii9R+GrMxmqQM
 FKBDi89HZnc5Vwc6daAMQLr6pvAvu3dc0Z/IZerr+8iZDY7JCqA7yNvz0z2wOa5Jsoo8
 xBbhzs/0AIO1TOiCMf83jfVvPlieyoGYMbkYhm4LC2R6+J5vgi6HhJ6WlUYBQjqDEcJZ
 VCd8QOL/ya+AOsp1+xN1DomIWbj9rghW2Vk9qkAjdrxJTnkRUisdlr0H9+63FeMQybHd
 icOA==
X-Gm-Message-State: AOJu0YzOPS1+ttDdLSV0tstlBxijfurlKOEA5QT8T7/8af0icQH/l6Gf
 oavjKAI4xfDIZ1rw2Utorvllzdr/ObscYn63F5KWOimOqla1EvRoBp32g0KPMdhyBCfeCOaV62P
 796d7oYjQQa216Xe5kXyJuQ096ioL5kZZDuhp7fucWpSKYzlquO9mxjLKO1yv9GvoMT0Efpkwh9
 Zz2/qQS5Q=
X-Google-Smtp-Source: AGHT+IGZgNuVy13ZjiOhW7ly8gbVGSdUolt2kQ8Nw5Vzz7GPjsLTkYa9zXl1hBzC6BTTiGdPc+OmdHL5IyE=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a81:af03:0:b0:583:9913:f293 with SMTP id
 n3-20020a81af03000000b005839913f293mr520930ywh.1.1693003448272; Fri, 25 Aug
 2023 15:44:08 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:43:53 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXK-0007Mw-01
Subject: [f2fs-dev] [PATCH v2 0/7] Add 16K Support for f2fs-tools
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
 fsck/fsck.c              |  72 +++++------
 fsck/fsck.h              |   5 +-
 fsck/main.c              |   1 +
 fsck/mount.c             |  93 ++++++++------
 fsck/node.c              |  12 +-
 fsck/node.h              |  20 +--
 fsck/resize.c            |   2 +-
 include/f2fs_fs.h        | 271 ++++++++++++++++++++++++++++-----------
 lib/libf2fs.c            |   4 +-
 man/sload.f2fs.8         |   2 +-
 mkfs/f2fs_format.c       |  90 ++++++-------
 mkfs/f2fs_format_main.c  |  14 +-
 mkfs/f2fs_format_utils.c |   2 +-
 16 files changed, 405 insertions(+), 263 deletions(-)


base-commit: b15b6cc56ac7764be17acbdbf96448f388992adc
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
