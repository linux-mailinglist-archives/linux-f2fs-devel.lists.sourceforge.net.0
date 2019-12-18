Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D24EB124B78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 16:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cdcUONZDgefaFZK7Y8+OB+YztCg+TZst+m0PhoNLJjg=; b=lqn9wOZKvi2xqld40O5yfP6gS/
	AFgysKXsAzFpYJWgqFbbb+XQO5L4DIEB6uOJ9qd0L6PNVVPqMriyeaCcxzIbsb1ltnjdhmfOsxDGr
	QtlUfEs+NF7NqOpIh2ly9EIHD1DGAxNRyckd9PL8Lz6nSD/LPdt526iTa4fW92n99eEA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihb8e-0003Aa-LG; Wed, 18 Dec 2019 15:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Iz36XQYKAHwxfy3fylttlqj.htr@flex--satyat.bounces.google.com>)
 id 1ihb8c-0003AS-OR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8STCQLeFYfFH1MQLPq9DpdL6vmJhOc+CHo4Yv7nqaT8=; b=diMkmy8o2zRlhXBNe/vVlMaGvE
 yz8ig3xCyX/W+GQsk5dO2mSI9T0wYoTPcZI5khZmT4oUHyVV6jbs4YWJFLPfHP0aPPo6DVOIMxAF/
 x+BwP/qFs9fS99LHSccV+V85qMCNPMZiHFjh0wTRrROn5e2+PmKZ+2Scz2+3XHuIquTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8STCQLeFYfFH1MQLPq9DpdL6vmJhOc+CHo4Yv7nqaT8=; b=k
 azuIPbTNeFsuXlnHty5f5XBrL/zEtWX0XPTsEJpbKAxKEFBkn8XpF9n048WGQVMm+kZ6qrRRhQwn1
 Ah3GxK/g6PkDdmHcn0vZTHmsnil9GBHzeSVn5sXPANMM3xnk/IuoGSnilaAZhqgARqFAWYwIperBH
 ZhFmDxKH6KZl0D8A=;
Received: from mail-yw1-f73.google.com ([209.85.161.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihb8b-008mhX-1o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 15:21:22 +0000
Received: by mail-yw1-f73.google.com with SMTP id v126so1526923ywf.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 07:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=8STCQLeFYfFH1MQLPq9DpdL6vmJhOc+CHo4Yv7nqaT8=;
 b=QfHBHMr+bADwCkP+k+BnbKSCG3L5/T+eQHsomyWoU9gwChEW+fony9ONDjYZokeK8U
 DQaLS9X6FCSZBont7Oe7qqWDhHkaV49l+O8rEmlVagTgIF1P0rY0N8qFWqv1IxIwibfJ
 abYd4ppG3eQ1cDUch3IiF9SfEQgkLLvxUuEQfExMTD51wpriW33xK1WYR7elDICGUOuq
 X2Vj9ugHjczCwTEgHZjkUt63bbIyn+iUBHGIutYsV8wSZZBCor/M7nX0pSsjst4x+QAM
 xQCfB5nzDcHr3jQuMlp0fbyDIC5NPwx9t9NNPICn7rzNmbzkn00u5bBlV8LPVggVuwKq
 8TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=8STCQLeFYfFH1MQLPq9DpdL6vmJhOc+CHo4Yv7nqaT8=;
 b=sN62ElPtswRON9Iu0nV9U6KcjSYO5n7oQ/0dSqeowsGi1XzSaP4ISwE4lSDe6wC5F5
 Khk7q/BdFmy8DiiPQ/9KmND9R2++K77lr5WIZ7rdP1AH1hPdGDYYIkJzQkMO40+jkcPB
 o4/JO1hlvfFwYI+OsE7KxUaRf+RRMRnM9P+3TgerAZrd/hBXym0aGYAQcRMVTKOHa3VF
 BdO2FnSC0cpCmBQNm9oXy4GiH+DiJp8E3+oUDYFwSg9lWRLVraWcdlIH4E0KhTZCgAqL
 tR469XG2fZwiLAtrLdQJOA/sVYNrerWzOni6+LKHnmG5Kw+NK8HfQPHQiMzGzsS+f6UP
 ztgA==
X-Gm-Message-State: APjAAAWKWc7iif4ro2zyqBZXeWw1oK6tOtKpysY7Tyx1A6eyFGYnzg05
 vhMRy7mnbx2ovTDPegAYKkiRM/8EXsE=
X-Google-Smtp-Source: APXvYqywUO/g1VSpSflkgFy68ztjZmb/pZBtvBq1T2PcLecZmsk5pah9fVqkmduzIySneFe2IK5O2DWEXoU=
X-Received: by 2002:a81:6c92:: with SMTP id h140mr2323545ywc.246.1576680739467; 
 Wed, 18 Dec 2019 06:52:19 -0800 (PST)
Date: Wed, 18 Dec 2019 06:51:27 -0800
Message-Id: <20191218145136.172774-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihb8b-008mhX-1o
Subject: [f2fs-dev] [PATCH v6 0/9] Inline Encryption Support
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
UFS, fscrypt, f2fs and ext4.

Note that the patches in this series for the block layer (i.e. patches 1, 2
and 3) can be applied independently of the subsequent patches in this
series.

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
(introduced in Patch 3), will use to program keys into inline encryption
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
hardware. Given that blk-crypto works as a software fallback, it may be
possible to remove file content en/decryption from fscrypt and simply use
blk-crypto in a future patch. For more details on blk-crypto, refer to
Documentation/block/inline-encryption.rst.

Patches 4-6 add support for inline encryption into the UFS driver according
to the JEDEC UFS HCI v2.1 specification. Inline encryption support for
other drivers (like eMMC) may be added in the same way - the device driver
should set up a Keyslot Manager in the device's request_queue (refer to
the UFS crypto additions in ufshcd-crypto.c and ufshcd.c for an example).

Patch 7 adds support to fscrypt - to use inline encryption with fscrypt,
the filesystem must be mounted with '-o inlinecrypt' - when this option is
specified, the contents of any AES-256-XTS encrypted file will be
encrypted using blk-crypto.

Patches 8 and 9 add support to f2fs and ext4 respectively, so that we have
a complete stack that can make use of inline encryption.

The patches were tested running kvm-xfstests, by specifying the introduced
"inlinecrypt" mount option, so that en/decryption happens with the
blk-crypto fallback. The patches were also tested on a Pixel 4 with UFS
hardware that has support for inline encryption.

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

Changes v5 => v6:
 - Blk-crypto's kernel crypto API fallback is no longer restricted to
   8-byte DUNs. It's also now separately configurable from blk-crypto, and
   can be disabled entirely, while still allowing the kernel to use inline
   encryption hardware. Further, struct bio_crypt_ctx takes up less space,
   and no longer contains the information needed by the crypto API
   fallback - the fallback allocates the required memory when necessary.
 - Blk-crypto now supports all file content encryption modes supported by
   fscrypt.
 - Fixed bio merging logic in blk-merge.c
 - Fscrypt now supports inline encryption with the direct key policy, since
   blk-crypto now has support for larger DUNs.
 - Keyslot manager now uses a hashtable to lookup which keyslot contains
   any particular key (thanks Eric!)
 - Fscrypt support for inline encryption now handles filesystems with
   multiple underlying block devices (thanks Eric!)
 - Numerous cleanups

Changes v4 => v5:
 - The fscrypt patch has been separated into 2. The first adds support
   for the IV_INO_LBLK_64 policy (which was called INLINE_CRYPT_OPTIMIZED
   in past versions of this series). This policy is now purely an on disk
   format, and doesn't dictate whether blk-crypto is used for file content
   encryption or not. Instead, this is now decided based on the
   "inlinecrypt" mount option.
 - Inline crypto key eviction is now handled by blk-crypto instead of
   fscrypt.
 - More refactoring.

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

Satya Tangirala (9):
  block: Keyslot Manager for Inline Encryption
  block: Add encryption context to struct bio
  block: blk-crypto for Inline Encryption
  scsi: ufs: UFS driver v2.1 spec crypto additions
  scsi: ufs: UFS crypto API
  scsi: ufs: Add inline encryption support to UFS
  fscrypt: add inline encryption support
  f2fs: add inline encryption support
  ext4: add inline encryption support

 Documentation/block/index.rst             |   1 +
 Documentation/block/inline-encryption.rst | 183 ++++++
 block/Kconfig                             |  17 +
 block/Makefile                            |   3 +
 block/bio-crypt-ctx.c                     | 140 +++++
 block/bio.c                               |  21 +-
 block/blk-core.c                          |  16 +-
 block/blk-crypto-fallback.c               | 648 ++++++++++++++++++++++
 block/blk-crypto-internal.h               |  58 ++
 block/blk-crypto.c                        | 242 ++++++++
 block/blk-merge.c                         |  11 +
 block/bounce.c                            |  12 +-
 block/keyslot-manager.c                   | 426 ++++++++++++++
 drivers/md/dm.c                           |   3 +-
 drivers/scsi/ufs/Kconfig                  |   9 +
 drivers/scsi/ufs/Makefile                 |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c          | 391 +++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h          | 107 ++++
 drivers/scsi/ufs/ufshcd.c                 |  56 +-
 drivers/scsi/ufs/ufshcd.h                 |  25 +
 drivers/scsi/ufs/ufshci.h                 |  67 ++-
 fs/buffer.c                               |   2 +
 fs/crypto/Kconfig                         |   6 +
 fs/crypto/Makefile                        |   1 +
 fs/crypto/bio.c                           |  28 +-
 fs/crypto/crypto.c                        |   2 +-
 fs/crypto/fname.c                         |   4 +-
 fs/crypto/fscrypt_private.h               | 122 +++-
 fs/crypto/inline_crypt.c                  | 319 +++++++++++
 fs/crypto/keyring.c                       |   4 +-
 fs/crypto/keysetup.c                      | 102 ++--
 fs/crypto/keysetup_v1.c                   |  16 +-
 fs/ext4/ext4.h                            |   1 +
 fs/ext4/inode.c                           |   4 +-
 fs/ext4/page-io.c                         |   6 +-
 fs/ext4/readpage.c                        |  11 +-
 fs/ext4/super.c                           |  13 +
 fs/f2fs/data.c                            |  65 ++-
 fs/f2fs/f2fs.h                            |   3 +
 fs/f2fs/super.c                           |  41 ++
 include/linux/bio-crypt-ctx.h             | 193 +++++++
 include/linux/bio.h                       |   1 +
 include/linux/blk-crypto.h                |  63 +++
 include/linux/blk_types.h                 |   6 +
 include/linux/blkdev.h                    |   6 +
 include/linux/fscrypt.h                   |  58 ++
 include/linux/keyslot-manager.h           |  60 ++
 47 files changed, 3462 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/block/inline-encryption.rst
 create mode 100644 block/bio-crypt-ctx.c
 create mode 100644 block/blk-crypto-fallback.c
 create mode 100644 block/blk-crypto-internal.h
 create mode 100644 block/blk-crypto.c
 create mode 100644 block/keyslot-manager.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
 create mode 100644 fs/crypto/inline_crypt.c
 create mode 100644 include/linux/bio-crypt-ctx.h
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
