Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D4E6D8F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aS+L+Gzyvj56EZ4G6WUkAMeBd3SZX0dPJQR08bx2rKg=; b=Q3DnJawxxmWRy5Qkv4s3BKjbK/
	z65Dw/xqnQgqc4zm8A1zlr5XAuICXC8xZbA7hhNq66craqeoj5u4ZlsEnQRqotbnN5jsvi9gTa4nW
	uL/efa77t1ntwUM/qqRP5wY5Fq8n+qKUC8hbInPqLaFqxnqp02JAYHzfV+qTOdX9NJSI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzo0-0006Bx-9M; Mon, 28 Oct 2019 07:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xZa2XQYKAMAygz4gzmuumrk.ius@flex--satyat.bounces.google.com>)
 id 1iOzny-0006Bo-VF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8kmYTlsw2t8uqVQHy3hjWqwncfgaTXrr/brl20vQcnE=; b=I2oH6M78Oewb2OoqM4MI9viQxp
 v7ZDhmFOKgHu2Yj5/S84n6HNm1B3n1x/nRahPihU1iH28/Cgvy9rhTyWYQGTiY+BzrCP54FbzYYdP
 oErhG1E9IYiyeHUcre+a+43ANuFPIHAlmQy6iskZnbQgBV7saU5P1zbs9pntQ3teb1q0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8kmYTlsw2t8uqVQHy3hjWqwncfgaTXrr/brl20vQcnE=; b=c
 6jENh0gcNF27x46l7GLYtpS/2GCF836qrH4Olc5NLMiPZrEqLsHWvLkebuh8J6NP+AUzsuN0JSD3V
 eHkh0ZUIVMbIOmEbLeh96VxlxMUA2PnWyU+aaoVLg7Ew8AvEfYMx2rEPz7dDxTJ3WY5Q0IPfZ8Wl/
 cWK6KG9Y7nfudD8o=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iOznu-0036Wl-3J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:51:10 +0000
Received: by mail-pl1-f201.google.com with SMTP id x18so5499042plm.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2019 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=8kmYTlsw2t8uqVQHy3hjWqwncfgaTXrr/brl20vQcnE=;
 b=d6uRgzSIVYSUN6Q4PBQzkUYWOciotNoa1eOq+lYLJ+qHtWSTwr4jPK0mljK7qbxjKh
 EK+0/sjiHTlf8d7MVyRQb0quHURUFqLTp40E9DmNua4A7GZo8ZrJBOa57YIZ0GNO8P6T
 n3qCfiEmL92uqb1qx+XM/vMPIu5gYrwNQ5lGabPLTJWLonjCsQPWpDc3T+YMugoZwttk
 LTMelmHqSxIb63rEH5t4rGjLb033enMkz9X/szYiBOpGE4UVdR0UL5j2AUQhPnh9wTs5
 zdcEi5Yk+Ky+7r7hdcPRWFCzhTBxqm0UzkmxI2ANC4s0PaQr3clDm+E2W25WZXDnKwr9
 /VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=8kmYTlsw2t8uqVQHy3hjWqwncfgaTXrr/brl20vQcnE=;
 b=ngGoW3nEO3xjidoLaxQvvRc+/wDgkr3vEQ6MJie4/rv78KT65jnN9l0dkNLQIThh2p
 zoQYDg+0H9kt/P33kYWZERNjElwNLFgeIbf39DJ4Y9cwOTBNpyWIEq7yFohXM8L9jPsq
 bn+bckRMIU1r5yGMER4gwodzYPH4Q3JPvTijG/gv5pUHiHekXgR4CCTN8N6yhOYFOrmc
 iDIPNUghvZMu7hMAOn2RhyR+e1HAjxsx8ndJPDRvFKSoqZAugXkRRTzGIzh2RKVPSv6E
 OYrVDD/pGVpFp2fCFmfAOecpSnCkCHZG1Wf55OqW5qtgG/e0b1ORNNnay5gD56bbWRWj
 fAXw==
X-Gm-Message-State: APjAAAXljepdQDU/fmToA13JZPtsYpSBtS8JPM+cwd9TcJnJ5pCwD8S3
 3HmZUFzsElGy+czzq1yEYhrye1++PM4=
X-Google-Smtp-Source: APXvYqzGoWEuWUo5LuR0LP+ddntICuUCcDvRp2KMGQ5a+PqGu4jL2F1naa/4tbHematPk1HSVrYtg6dlN5U=
X-Received: by 2002:a63:cf0b:: with SMTP id j11mr19081716pgg.240.1572247237715; 
 Mon, 28 Oct 2019 00:20:37 -0700 (PDT)
Date: Mon, 28 Oct 2019 00:20:23 -0700
Message-Id: <20191028072032.6911-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iOznu-0036Wl-3J
Subject: [f2fs-dev] [PATCH v5 0/9] Inline Encryption Support
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

This patchset applies to fscrypt.git#master with the additional patchset
"[PATCH 0/3] fscrypt: support for inline-encryption-optimized policies"
applied.  It can be retrieved from git at
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=inline-encryption-v5
Note however, that the patches for the block layer (i.e. patches 1, 2 and 3)
can be applied independently.

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
hardware. Given that blk-crypto works as a software fallback, we are
considering removing file content en/decryption from fscrypt and simply
using blk-crypto in a future patch. For more details on blk-crypto, refer
to Documentation/block/inline-encryption.rst.

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
"inlinecrypt" mount option, so that encryption happens in blk-crypto.

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

Eric Biggers (1):
  ext4: add inline encryption support

Satya Tangirala (8):
  block: Keyslot Manager for Inline Encryption
  block: Add encryption context to struct bio
  block: blk-crypto for Inline Encryption
  scsi: ufs: UFS driver v2.1 spec crypto additions
  scsi: ufs: UFS crypto API
  scsi: ufs: Add inline encryption support to UFS
  fscrypt: add inline encryption support
  f2fs: add inline encryption support

 Documentation/block/index.rst             |   1 +
 Documentation/block/inline-encryption.rst | 183 +++++
 block/Kconfig                             |  10 +
 block/Makefile                            |   2 +
 block/bio-crypt-ctx.c                     | 142 ++++
 block/bio.c                               |  23 +-
 block/blk-core.c                          |  14 +-
 block/blk-crypto.c                        | 798 ++++++++++++++++++++++
 block/blk-merge.c                         |  35 +-
 block/bounce.c                            |  15 +-
 block/keyslot-manager.c                   | 352 ++++++++++
 drivers/md/dm.c                           |  15 +-
 drivers/scsi/ufs/Kconfig                  |   9 +
 drivers/scsi/ufs/Makefile                 |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c          | 391 +++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h          |  86 +++
 drivers/scsi/ufs/ufshcd.c                 |  85 ++-
 drivers/scsi/ufs/ufshcd.h                 |  25 +
 drivers/scsi/ufs/ufshci.h                 |  67 +-
 fs/buffer.c                               |   3 +
 fs/crypto/Kconfig                         |   6 +
 fs/crypto/Makefile                        |   1 +
 fs/crypto/bio.c                           |  31 +-
 fs/crypto/fscrypt_private.h               |  72 ++
 fs/crypto/inline_crypt.c                  | 390 +++++++++++
 fs/crypto/keyring.c                       |   2 +
 fs/crypto/keysetup.c                      |  18 +-
 fs/ext4/ext4.h                            |   1 +
 fs/ext4/inode.c                           |   4 +-
 fs/ext4/page-io.c                         |  11 +-
 fs/ext4/readpage.c                        |  15 +-
 fs/ext4/super.c                           |  13 +
 fs/f2fs/data.c                            |  76 ++-
 fs/f2fs/f2fs.h                            |   3 +
 fs/f2fs/super.c                           |  20 +
 include/linux/bio-crypt-ctx.h             | 226 ++++++
 include/linux/bio.h                       |   1 +
 include/linux/blk-crypto.h                |  62 ++
 include/linux/blk_types.h                 |   6 +
 include/linux/blkdev.h                    |   6 +
 include/linux/fscrypt.h                   |  60 ++
 include/linux/keyslot-manager.h           |  98 +++
 42 files changed, 3318 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/block/inline-encryption.rst
 create mode 100644 block/bio-crypt-ctx.c
 create mode 100644 block/blk-crypto.c
 create mode 100644 block/keyslot-manager.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
 create mode 100644 fs/crypto/inline_crypt.c
 create mode 100644 include/linux/bio-crypt-ctx.h
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
