Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1C50AB51
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8h-0007va-IS; Thu, 21 Apr 2022 22:19:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8e-0007v7-IH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azxt38Al1G/K6xwQhVGC3f/Mzi7iGAOqgHhaI15NkAQ=; b=Ij6c/Isn0MU8z5y3cxY1+AAhdx
 VcsYRfQC7L9+eY3nwNy5ZNlh/62RFTLN/9mfEyvxGSQf/yIpk0IN714f4D/6PYXaruuXNHd6lPKA5
 7eea03WrW4s6MTLnmNbex2dvhUtS0nI8PNw/1GtwSH2bi0xGm/PmWB8KK9M16dSmlS8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=azxt38Al1G/K6xwQhVGC3f/Mzi7iGAOqgHhaI15NkAQ=; b=C
 saHPH/MzLG/FHgGQELjp+Q0jvtx68qfSn3pgDwhba01PWGL7fEEr6QCVXuoLfU6yYh4dCVVmWcUSL
 rJzQRWQUYL32ilRM7UPLVe4Ol5ZBKodtyVcoYaw70QDZF0TuYJleC8NbQMngq2NBrgQiHa4vT14Z6
 XP63mipKyFtdc7jI=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8Y-0002ts-0U
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:18:59 +0000
Received: by mail-pg1-f177.google.com with SMTP id i63so5770862pge.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=azxt38Al1G/K6xwQhVGC3f/Mzi7iGAOqgHhaI15NkAQ=;
 b=7ZLhPkjgQPoXMidy4uWzfcmz3fngEkVAmxUtPiqyMd52b1p0kwcMQIEiGQ6WMbKveZ
 8TRhXapHEbPMNr7LG/TIdDcoMMtXErSJLgO0WNgLwtXvEjb2YwJC+vDRKYh4z7wdKp19
 wG4k+1Ol0fcI7+hSEJLFJfh3DaHqiC0sb8GJlwCojqrr5nVRjfUMlcW15VSGicstORoc
 Yg6y3j3ke6NVXX0AI1uslrxRQWn3HBXbOhM0ICvW1f6OgkfX0EosyJRb1/3xUGsEbRYG
 rBv4+RONvUrF+6vOtQ+1iJy4EFAqN4hEpFmq7m745zQZW3G5l92zQw5XTdve6oCKwEgF
 u6HA==
X-Gm-Message-State: AOAM532FI9kLwm+MrHgBZkrdzDh6V4ylsA+ZZn7DBTm1ttSuYAttPGmY
 CJBNgS6g/RM3Hc2+acGgJKwZ+XBYLck0nw==
X-Google-Smtp-Source: ABdhPJzPwE4fZb9h4jyekSSnlu2bWq1Rfdxa+PKCRCnR1KLwQDIWwt9hIu/yIz5WO44Th3SqCoJfPg==
X-Received: by 2002:a63:444f:0:b0:39d:4a93:844 with SMTP id
 t15-20020a63444f000000b0039d4a930844mr1284248pgk.229.1650579528048; 
 Thu, 21 Apr 2022 15:18:48 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:47 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:05 -0700
Message-Id: <20220421221836.3935616-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk, This patch series should make f2fs-tools easier
 to maintain and fixes a few smaller bugs. Although these patches have been
 compile-tested only, please consider these patches for the upstream f2fs-tool
 [...] Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8Y-0002ts-0U
Subject: [f2fs-dev] [PATCH 00/31] Make f2fs-tools easier to maintain
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

This patch series should make f2fs-tools easier to maintain and fixes a few
smaller bugs. Although these patches have been compile-tested only, please
consider these patches for the upstream f2fs-tools repository.

Thanks,

Bart.

Bart Van Assche (31):
  configure.ac: Stop using obsolete macros
  configure.ac: Remove two prototype tests
  configure.ac: Enable the automake -Wall option
  configure.ac: Sort header file names alphabetically
  configure.ac: Enable cross-compilation
  Switch from the u_int to the uint types
  Change the ANDROID_WINDOWS_HOST macro into _WIN32
  ci: Build f2fstools upon push and pull requests
  Change one array member into a flexible array member
  Verify structure sizes at compile time
  Suppress a compiler warning
  f2fs_fs.h: Use standard fixed width integer types
  Remove unnecessary __attribute__((packed)) annotations
  Move the be32_to_cpu() definition
  Include <stddef.h> instead of defining offsetof()
  Use %zu to format size_t
  Fix the MinGW build
  configure.ac: Detect the sparse/sparse.h header
  configure.ac: Detect selinux/android.h
  mkfs/f2fs_format.c: Suppress a compiler warning
  fsck: Remove a superfluous include directive
  tools/f2fscrypt.c: Fix build without uuid/uuid.h header file
  fsck/main.c: Suppress a compiler warning
  Change #ifdef _WIN32 checks into #ifdef HAVE_.*
  fsck/segment.c: Remove dead code
  tools/f2fs_io: Fix the type of 'ret'
  Annotate switch/case fallthrough
  Suppress a compiler warning about integer truncation
  Support cross-compiliation for PowerPC
  Fix PowerPC format string warnings
  ci: Enable -Wall, -Wextra and -Werror

 .github/workflows/ci.yml |  70 ++++++++++
 README                   |   1 -
 configure.ac             | 131 +++++++++++--------
 fsck/Makefile.am         |   2 +-
 fsck/dir.c               |   8 ++
 fsck/f2fs.h              |  14 +-
 fsck/fsck.c              |   5 +-
 fsck/main.c              |  21 ++-
 fsck/mount.c             |  54 ++++----
 fsck/quotaio.c           |   4 +-
 fsck/quotaio.h           |   3 -
 fsck/quotaio_tree.h      |   4 +-
 fsck/quotaio_v2.h        |  12 +-
 fsck/resize.c            |  28 ++--
 fsck/segment.c           |   3 +-
 fsck/sload.c             |  15 ++-
 fsck/xattr.h             |   4 +-
 include/f2fs_fs.h        | 276 +++++++++++++++++++++++----------------
 include/quota.h          |  30 +++--
 lib/libf2fs.c            |  34 ++---
 lib/libf2fs_io.c         |  24 ++--
 lib/libf2fs_zoned.c      |  18 +--
 mkfs/f2fs_format.c       |  95 ++++++++------
 mkfs/f2fs_format_main.c  |  12 +-
 mkfs/f2fs_format_utils.c |   9 +-
 mkfs/f2fs_format_utils.h |   2 +-
 tools/Makefile.am        |   5 +-
 tools/f2fs_io/f2fs_io.c  |  26 +++-
 tools/f2fs_io/f2fs_io.h  |   8 +-
 tools/f2fscrypt.c        |  19 ++-
 tools/fibmap.c           |   2 +
 31 files changed, 586 insertions(+), 353 deletions(-)
 create mode 100644 .github/workflows/ci.yml



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
