Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CB974E2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 10:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SvfanO3+HtvwAqloFumtM9PbsY2/vIkO958Crl1hqKI=; b=dE0kxZqKFWSpsFvS8LN8dntEIW
	fpJUaCoQO03SaD1cZbgRp0BCI6ypc6na2w0lwrEXaMM/VW3UeseBYNJC+0mF4QCxe8LKMnfoPlhul
	PmazcbSz+Ur0C6G5sup0HmCUHatRXPLCebsq0EyQaDeNoGg/metNvq5X09Wm3I1fHr+I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0LwU-0001h4-81; Wed, 21 Aug 2019 08:26:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3XvlcXQYKALUnVotVobjjbgZ.Xjh@flex--satyat.bounces.google.com>)
 id 1i0LwS-0001gl-5y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBYw6rmUbKKC3VdJzzhZFbO54DY8EqjVVgF8hqQ2BVM=; b=HW1+KF1ub/uLYn3IQRS8QHOhUh
 PLMEb+w+Ou/jUWlpAX6tXt9sYd4Ux8VKki62xYS1xXUQkdFM8Okh4HYhVwc8RW+Zz7h4bVXfqPUMP
 q2jibBNpTAyvVPis0yQXqkGf1uaocpxzRjuiXsJ3BbAWKLhZVlxHiWvQ2suZhdyq02e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qBYw6rmUbKKC3VdJzzhZFbO54DY8EqjVVgF8hqQ2BVM=; b=R
 6I8hS64VfpVmdEsWPFGZD0KKCSg+8in9J2LacI/oG38i5lbOAVXSC62JXRVfWqgi7BhWratCvclj8
 qBOpKRf47bE68/ucGsrWvYGV8XtmUcHqsGXqkshd5wFtuNRFFoBQQZJES8RoMOCarROY7IT4+KoyO
 8+KNlonG7UZyHbTs=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i0LwI-00AL7n-Cg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:26:04 +0000
Received: by mail-qt1-f202.google.com with SMTP id z15so1827328qts.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Aug 2019 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=qBYw6rmUbKKC3VdJzzhZFbO54DY8EqjVVgF8hqQ2BVM=;
 b=m1XurgtoPK+fka2z8sNyW0/MqfW9/U9hjy3nSxr5IPDOY+nWylWHuogp9jrVH5zFCF
 GRsgogC4tQFk3Yzt2zQT9kLISOv5wsMBdy297GHb/QuCYDrRmyg2JdtW+8NtfbPKafxi
 MoLg4eK/kitx8SnWOv3uhXpr8bDQGHHsBReb86MT16AaTYiI4ybrwjzBQhOsUVclUYKi
 h2r8/Dd7NUpMxrwKnp57d20sNxfcj6ISWEOSO/xFG1m1dMw4JodcZVcOlV72zDWzTlT4
 5wuG+eNl+GhXM1Qy3JjnLN/UwBFCyLiLUmtCEd4Xvs+uLqtP4gboeKPIJ038cFUHYTcZ
 v+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=qBYw6rmUbKKC3VdJzzhZFbO54DY8EqjVVgF8hqQ2BVM=;
 b=QYp5xbeznwvNGHWW+UcdIwyvSdM6uX2P1WxNt9SO6VPU5J91odBadQHuq++0KxvYbq
 OrgEjVI4r6XJQ//aw1oz/KmZ8Oyl1vNVxTC12wRGbNdUsuPqEbsBQNh8mRcRKscnkxg3
 bZKhyO6IdO1/PDHkoy6VtEM94FOEVpIcBjFJiH6fCLK3y3M1+bhkuBScZ/R9KI7JJDYr
 3XgMOY2LIbhGWhnHUWipbLLHy+Mh6+1HqOWD+f9SYRZRlfSDWzhKvfFl4kqshJumMshR
 LPK6sGqG0V8WHfE5KIgxZsKT+q15D5V+cvDlpD1K7Jt/MNGbax/bDZKNPKgX2wkJ0XoE
 +z9Q==
X-Gm-Message-State: APjAAAVTX8bcg64SqZfn92DsLfttYg1zHbFrI/426WLVgaJTocCe4RxM
 smzvTOubFPDq//qPXkrhm5YUqI71dig=
X-Google-Smtp-Source: APXvYqyYG592CW3rXQWgTZpbKT/mH3YUzFok7GJ5iJ9kysnTWjWo+ii3lu2lURgc1SAlWfNK2GglwL02dCI=
X-Received: by 2002:a65:4507:: with SMTP id n7mr27027863pgq.86.1566374238228; 
 Wed, 21 Aug 2019 00:57:18 -0700 (PDT)
Date: Wed, 21 Aug 2019 00:57:06 -0700
Message-Id: <20190821075714.65140-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.202 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0LwI-00AL7n-Cg
Subject: [f2fs-dev] [PATCH v4 0/8] Inline Encryption Support
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
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
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

Changes v3 => v4:
 - Fixed the issue with allocating crypto_skcipher in
   blk_crypto_keyslot_program.
 - bio_crypto_alloc_ctx is now mempool backed.
 - In f2fs, a bio's bi_crypt_context is now set up when the
   bio is allocated, rather than just before the bio is
   submitted - this fixes bugs in certain cases, like when an
   encrypted block is being moved without decryption.
 - Lots of refactoring and cleanup of blk-crypto - thanks Eric!

Changes v2 => v3:
 - Overhauled keyslot manager's get keyslot logic and optimized LRU.
 - Block crypto en/decryption fallback now supports data unit sizes
   that divide the bvec length (instead of requiring each bvec's length
   to be the same as the data unit size).
 - fscrypt master key is now keyed additionally by super_block and
   ci_ctfm != NULL.
 - all references of "hw encryption" are replaced by inline encryption.
 - address various other review comments from Eric.

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

 Documentation/block/inline-encryption.txt | 186 ++++++
 block/Kconfig                             |  10 +
 block/Makefile                            |   2 +
 block/bio-crypt-ctx.c                     | 142 +++++
 block/bio.c                               |  23 +-
 block/blk-core.c                          |  14 +-
 block/blk-crypto.c                        | 737 ++++++++++++++++++++++
 block/blk-merge.c                         |  35 +-
 block/bounce.c                            |  15 +-
 block/keyslot-manager.c                   | 351 +++++++++++
 drivers/md/dm.c                           |  15 +-
 drivers/scsi/ufs/Kconfig                  |  10 +
 drivers/scsi/ufs/Makefile                 |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c          | 429 +++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h          |  86 +++
 drivers/scsi/ufs/ufshcd.c                 |  85 ++-
 drivers/scsi/ufs/ufshcd.h                 |  29 +
 drivers/scsi/ufs/ufshci.h                 |  67 +-
 fs/crypto/Kconfig                         |   6 +
 fs/crypto/bio.c                           | 137 +++-
 fs/crypto/fscrypt_private.h               |  23 +
 fs/crypto/keyinfo.c                       | 107 +++-
 fs/crypto/policy.c                        |   6 +
 fs/f2fs/data.c                            | 127 +++-
 fs/f2fs/super.c                           |  15 +-
 include/linux/bio-crypt-ctx.h             | 233 +++++++
 include/linux/bio.h                       |   1 +
 include/linux/blk-crypto.h                |  47 ++
 include/linux/blk_types.h                 |   6 +
 include/linux/blkdev.h                    |   6 +
 include/linux/fscrypt.h                   |  72 +++
 include/linux/keyslot-manager.h           |  94 +++
 include/uapi/linux/fs.h                   |   3 +-
 33 files changed, 3034 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/block/inline-encryption.txt
 create mode 100644 block/bio-crypt-ctx.c
 create mode 100644 block/blk-crypto.c
 create mode 100644 block/keyslot-manager.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
 create mode 100644 include/linux/bio-crypt-ctx.h
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

-- 
2.23.0.rc1.153.gdeed80330f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
