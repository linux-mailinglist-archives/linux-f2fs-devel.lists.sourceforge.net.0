Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249136868
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 01:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CvY4Gl2+Trbd82iP/J/LO0ynwRqkILloeXmFIknNc3s=; b=V9MWUz3/hsQm2fiadJpZpCUsAV
	fzHZEfmDDKpA+OPT4fK266p4bI2ZAEvdoy+etjHG2/jOKL6hvCqs0yA1cgcBrx0rPL9aGMUf8qW0t
	hi7akPJyrQDfhQc/MDPMMylKPuk1EliWw0A3c83SZsPXN7t1ucC3ypRJGoJo9McUTD74=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYflI-0008Av-Pi; Wed, 05 Jun 2019 23:56:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3KFD4XAYKAJcJ1KP1K7FF7C5.3FD@flex--satyat.bounces.google.com>)
 id 1hYflG-0008Ae-RD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRO0aIkjYMBsNBc7+DIoU7JX9NOgY+kGQd5/xewYXlk=; b=aOa8glD8Kc7xLYNMTIeSLGI16x
 KfCrUyHGnwEeV3+iuqAEj9xXSx6NfDxMS6500iug0kHjHRJYeVR6wwrzygiltAAuzIDdnlrkD24zQ
 FJG/U/QNh78iM9zJaXjW7gvvetjYRlLPYqDDHSitiMOBEQTJV4rDZ1agsADETWHyT2WQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gRO0aIkjYMBsNBc7+DIoU7JX9NOgY+kGQd5/xewYXlk=; b=C
 vljJEIhwSxw6+gBv3sprw4WVMZnWyymPsoeGbcfHdlYdkHEi5K7nZdxG1WQG5xvANSO+2PEMV0w6O
 r9HgDIwTXhn4akPRwPNl690DjyHs5BO74ZdIxCb2cpR6gP4+pdFVCxJW5I4V/63qjfLYdP34VnB9W
 4CSAPfuOIg6ftsM4=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYflD-00BDfo-1j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:56:06 +0000
Received: by mail-pf1-f202.google.com with SMTP id a125so451033pfa.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2019 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gRO0aIkjYMBsNBc7+DIoU7JX9NOgY+kGQd5/xewYXlk=;
 b=UjUsYqhMfjCSgtwICU9RcqL+xxeWNLvzgYi4TAJ5I4+IMVG8sbSlWkpZQSp+j4nuQq
 97fA9gvCpbvVs5BjpH/06h+5CHQfsMA0GeR3A9KlwdxUpYZFJVu6I3oKcNzlXEuRPpwh
 HQYx91WCnQG84EuhE0DYB9w5B3XQlJ1mN4lKjtPqmOF1IXGgoq06Z6vYhwctzUT6GNcz
 NL71raZfKYlyZ/oTRi6rtLIOLmWxdVntpcjynPpC8JZRh0QJ+MQpzecIaSF8TamuwwJX
 Ss8ZvCG8BLDIfrxxjZ8LYkSt5b90qIAHMKhVUYm5Nlyo1YBeMiXm1L3zPtKfBJMUwuk6
 sNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gRO0aIkjYMBsNBc7+DIoU7JX9NOgY+kGQd5/xewYXlk=;
 b=Z5ofEquqeVvbxuYzcthtTQoLuBoiMFzuj1DY89qWCXQQzxWzdNbIItSN/ucXM8Dhcc
 iirYheU/CfJ6h/ZM561l02I97C6RdPKu3j5/3G8uZUvx60y8A7ZneukOVl94rNyoQHeK
 cUu5LnRndWo68UpFc0zVa7LneV93q3GW3QtvqjjjZrc1FkkaOjhPUD1WYFbFyPk8FHNh
 NkO1PQ/xqvZIsbikECazy6SVQHYy21SuPC+oAn/uh/uxAtK9QQWw3uinBOYh/f4eWBTO
 NrBPYYMtc6HOa1VJ2LucmXQ+E0i0aSBTzvFTEkVTRYqcXc5Dzv6TALrRL3wjH9QvrQOX
 FfXw==
X-Gm-Message-State: APjAAAWdtP5BNDqKpS7ckjLsjNajr+Jfqs31LY/xg2YhF0MBf6STAbhw
 bIEADTBIlkc6iX6y7WeCRl7ZJa97OnU=
X-Google-Smtp-Source: APXvYqzXuluP1xJXv83KQJmBTl6O5tQhTtSaDuikoPQNfY1VHAjaLmhSxTETZknHp6ujJjRDlasl8HLD5Ew=
X-Received: by 2002:a63:1663:: with SMTP id 35mr363300pgw.253.1559777320468;
 Wed, 05 Jun 2019 16:28:40 -0700 (PDT)
Date: Wed,  5 Jun 2019 16:28:29 -0700
Message-Id: <20190605232837.31545-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hYflD-00BDfo-1j
Subject: [f2fs-dev] [RFC PATCH v2 0/8] Inline Encryption Support
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
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for Inline Encryption to the block layer,
UFS, fscrypt and f2fs.

Inline Encryption hardware allows software to specify an encryption context
(an encryption key, crypto algorithm, data unit num, data unit size, etc.)
along with a data transfer request to a storage device, and the inline
encryption hardware will use that context to en/decrypt the data. The
inline encryption hardware is part of the storage device, and it
conceptually sits on the data path between system memory and the storage
device. Inline Encryption hardware has become increasingly common, and we
want to support it in the kernel.

Inline Encryption hardware implementations often function around the
concept of a limited number of "keyslots", which can hold an encryption
context each. The storage device can be directed to en/decrypt any
particular request with the encryption context stored in any particular
keyslot.

Patch 1 introduces a Keyslot Manager to efficiently manage keyslots.
The keyslot manager also functions as the interface that blk-crypto
(introduced in Path 3), will use to program keys into inline encryption
hardware. For more information on the Keyslot Manager, refer to
documentation found in block/keyslot-manager.c and linux/keyslot-manager.h.

Patch 2 introduces struct bio_crypt_ctx, and a ptr to one in struct bio,
which allows struct bio to represent an encryption context that can be
passed down the storage stack from the filesystem layer to the storage
driver.

Patch 3 introduces blk-crypto. Blk-crypto delegates crypto operations to
inline encryption hardware when available, and also contains a software
fallback to the kernel crypto API. Blk-crypto also makes it possible for
layered devices like device mapper to make use of inline encryption
hardware. Given that blk-crypto works as a software fallback, we are
considering removing file content en/decryption from fscrypt and simply
using blk-crypto in a future patch. For more details on blk-crypto, refer
to Documentation/block/blk-crypto.txt.

Patches 4-6 add support for inline encryption into the UFS driver according
to the JEDEC UFS HCI v2.1 specification. Inline encryption support for
other drivers (like eMMC) may be added in the same way - the device driver
should set up a Keyslot Manager in the device's request_queue (refer to
the UFS crypto additions in ufshcd-crypto.c and ufshcd.c for an example).

Patches 7 and 8 add support to fscrypt and f2fs, so that we have
a complete stack that can make use of inline encryption.

There have been a few patch sets addressing Inline Encryption Support in
the past. Briefly, this patch set differs from those as follows:

1) "crypto: qce: ice: Add support for Inline Crypto Engine"
is specific to certain hardware, while our patch set's Inline
Encryption support for UFS is implemented according to the JEDEC UFS
specification.

2) "scsi: ufs: UFS Host Controller crypto changes" registers inline
encryption support as a kernel crypto algorithm. Our patch views inline
encryption as being fundamentally different from a generic crypto
provider (in that inline encryption is tied to a device), and so does
not use the kernel crypto API to represent inline encryption hardware.

3) "scsi: ufs: add real time/inline crypto support to UFS HCD" requires
the device mapper to work - our patch does not.

Changes v1 => v2:
 - Block layer and UFS changes are split into 3 patches each.
 - We now only have a ptr to a struct bio_crypt_ctx in struct bio, instead
   of the struct itself.
 - struct bio_crypt_ctx no longer has flags.
 - blk-crypto now correctly handles the case when it fails to init
   (because of insufficient memory), but kernel continues to boot.
 - ufshcd-crypto now works on big endian cpus.
 - Many cleanups.

Satya Tangirala (8):
  block: Keyslot Manager for Inline Encryption
  block: Add encryption context to struct bio
  block: blk-crypto for Inline Encryption
  scsi: ufs: UFS driver v2.1 spec crypto additions
  scsi: ufs: UFS crypto API
  scsi: ufs: Add inline encryption support to UFS
  fscrypt: wire up fscrypt to use blk-crypto
  f2fs: Wire up f2fs to use inline encryption via fscrypt

 Documentation/block/blk-crypto.txt | 185 ++++++++++
 block/Kconfig                      |   8 +
 block/Makefile                     |   2 +
 block/bio.c                        |  17 +-
 block/blk-core.c                   |  11 +-
 block/blk-crypt-ctx.c              |  90 +++++
 block/blk-crypto.c                 | 557 +++++++++++++++++++++++++++++
 block/blk-merge.c                  |  34 +-
 block/bounce.c                     |   9 +-
 block/keyslot-manager.c            | 315 ++++++++++++++++
 drivers/md/dm.c                    |  15 +-
 drivers/scsi/ufs/Kconfig           |  10 +
 drivers/scsi/ufs/Makefile          |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c   | 438 +++++++++++++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h   |  69 ++++
 drivers/scsi/ufs/ufshcd.c          |  84 ++++-
 drivers/scsi/ufs/ufshcd.h          |  23 ++
 drivers/scsi/ufs/ufshci.h          |  67 +++-
 fs/crypto/Kconfig                  |   7 +
 fs/crypto/bio.c                    | 159 ++++++--
 fs/crypto/crypto.c                 |   9 +
 fs/crypto/fscrypt_private.h        |  10 +
 fs/crypto/keyinfo.c                |  69 ++--
 fs/crypto/policy.c                 |  10 +
 fs/f2fs/data.c                     |  77 +++-
 fs/f2fs/super.c                    |   1 +
 include/linux/bio.h                | 180 ++++++++++
 include/linux/blk-crypto.h         |  40 +++
 include/linux/blk_types.h          |  39 ++
 include/linux/blkdev.h             |   9 +
 include/linux/fscrypt.h            |  64 ++++
 include/linux/keyslot-manager.h    | 116 ++++++
 include/uapi/linux/fs.h            |  12 +-
 33 files changed, 2668 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/block/blk-crypto.txt
 create mode 100644 block/blk-crypt-ctx.c
 create mode 100644 block/blk-crypto.c
 create mode 100644 block/keyslot-manager.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

-- 
2.22.0.rc1.311.g5d7573a151-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
