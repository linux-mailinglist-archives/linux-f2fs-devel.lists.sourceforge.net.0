Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BED7077D849
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 04:16:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW65Z-00025H-Pj;
	Wed, 16 Aug 2023 02:16:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <35SLcZAYKAMgr526s1u22uzs.q20@flex--drosen.bounces.google.com>)
 id 1qW65Y-000255-Jq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4xbLVOeVgkdWDXqR24NE2nC3f9NqTiQMCDohIN4YrI=; b=NMbfnauu8aUwNfQ6BE/49EdiiX
 AwU6aR9Ulppu09tDHlPg0N/YuB4whN3vS0v5t3fnZRJs5r9HFyUvHL3bXTAN/wLQAdWd2TX9vLFDX
 x+g44/IBHD4HNciSSxdk9FQ+ex/slP0uc1aM+OHrwtYvF+GwmSZBpwhRzxlOBnR+znhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u4xbLVOeVgkdWDXqR24NE2nC3f9NqTiQMCDohIN4YrI=; b=D
 QvG2heVz9hc1Y9HMsD5Xbv6lxPdMFI0EQVX7UMWMtgmWhGwChpJSAs3WONxen5WDVQFwG+8KfJqRb
 NRsWH/WQr5Ot9QdKTiByV/rRIDJt5KQ6AYrCME4XPz0TniIY+jHEDqPbebNQXh+8QRZ9/or/ULsKV
 5/wrUZFxB2BEFgmY=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW65Z-006j8h-40 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:16:49 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-586a5ac5c29so78110967b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 19:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692152203; x=1692757003;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u4xbLVOeVgkdWDXqR24NE2nC3f9NqTiQMCDohIN4YrI=;
 b=UYgt6hIp0FfmS3iy1tkdNoaLJurXKH8Z13e/WZuCJaCDBhV/2I0F5unoqgUL79bPMx
 rMRvT7GLOi1F95MhyINhrZLYRCX/ayYxbhWgCzHNPLJd8XWTK72z6h/kQicECXkIAMem
 SRXqCkAaklJuU+Sbm2Y91TVn1NtI/tq6XH1WoQHFMb8x0L9tdMIo6KEAj+ykUWB717iO
 UK2FSeaJnNmt8gLAK0xvmPx+L3Xxto4ChYeJv0L1wAwkAoyEiwQkoetuSBm5ChaShYTx
 /79ReuNoZrlwN7eerEkZg79YgT+nU7Kt+MXqChOtKIL4R4sa5wDpEdBBN3+bMuljLhwE
 8TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692152203; x=1692757003;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u4xbLVOeVgkdWDXqR24NE2nC3f9NqTiQMCDohIN4YrI=;
 b=C1p5tuQklltRCkziAPN50mCj1zhpgjB2yZyedD/WY4gMKijvG92E6svKiSHZOELPLC
 mWkp0uzuPEb14RL9tUvI1420eizMFxHQPHxmOQYHNj0rTe1D3odxhfDqHpgwh2z/nZoH
 aHqysW3QotHpH2ID93JLxpbfUyW1sEKmgi8ep/sy2VcG+GArAj2qk31LcIV31MthWZei
 STqoKbKjj0v2LoJFHVOXAulIOFgVDO5ecatkT5x4PwFSXdyqKIoCRkFCqoH7h+y2Qm/N
 AB8RBC+86mN3XZiDRw7LsiwpCBHvgH1ncYf/d7Ho2cbfVrlJgadUMhYV4vMd1jivWMTt
 C8JA==
X-Gm-Message-State: AOJu0YzlwSL5laAv4ceMUSm0gd9Mn7BjfTU8J4n8ovTp/7lcrxqMaXFf
 hE584hahvxW9ifdSKHeSY5bjrTVcV/f6VTXr8yIhSln6qcwZ6cfRDGXeP78XZtMwPBwgtjuXKHk
 Diao365tQQFSxMRHaZpfCO1MnGd+nCF50M0QKgbiBssZuh/lcGpQOCVFjzCcmqo2LB3cAkSJKbL
 GmRuclZF8=
X-Google-Smtp-Source: AGHT+IFIrh35XrN0txHtTCkJq/+rvQNLzJqQvZ+OET40JSBcpSKmDOLnb2WE7uXay6gtT8p4NtsdyHPZTMc=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:19fa:33cd:f272:37ec])
 (user=drosen job=sendgmr) by 2002:a81:bc14:0:b0:576:b244:5a4e with SMTP id
 a20-20020a81bc14000000b00576b2445a4emr3311ywi.10.1692148453408; Tue, 15 Aug
 2023 18:14:13 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:13:52 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230816011359.1964484-1-drosen@google.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.201 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qW65Z-006j8h-40
Subject: [f2fs-dev] [PATCH 0/7] Add 16K Support for f2fs-tools
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


base-commit: 6ebf6f2967d0a5731af1767d5735f46e30fea0fc
-- 
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
