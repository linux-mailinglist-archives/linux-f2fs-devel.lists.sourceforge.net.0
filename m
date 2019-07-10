Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A264EE6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 00:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JMsRNyQb5ZGOVAHkOcoVL6IaGa2VEs/RqagxmbBRGWA=; b=WvnIbqzLJLOZY7OtmSRw2E/u20
	NLSeEHRntK0xQFY0nhRgHLZABW+rmPRxTSg2lZdMlAF87awl/rwgAl29BzW+dQ0UppnS9vLPkvt0m
	PwWgpPt6QDz/fF8coUdCcMdGQfMIk1IrSJZoCAhxQHaP298qOh2rDj8swET4iR82Hduo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlLVh-00080Q-W6; Wed, 10 Jul 2019 22:56:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3DW0mXQYKAHAgOhmOhUccUZS.Qca@flex--satyat.bounces.google.com>)
 id 1hlLVg-00080J-Ca
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=32EvgBFnAv8ONpLqCSd3ioyTEVOAmc+wOjmDzUT8IVQ=; b=aUkktQwPU8WKf/8Xb/+Tman/5M
 O5W/w9pTUc8jhzXqu4fG/LF1hAOoXCUX949LJLSyYjzTVx1QZfLbfnnkV1f2Yha9Vj+kfQRoIy4VH
 2THgTJ/07+L4M2Kgy92c7e/uzhfrXVr7koaq1za4pUZd4BTR2uRsaxuYRItqpsEMZhXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=32EvgBFnAv8ONpLqCSd3ioyTEVOAmc+wOjmDzUT8IVQ=; b=K
 gJgDIVy8buBeIpETl1TpBc059Jv3rzCujOFNcFMnMnyEpq8oIO+6fXDOWlxCAsiczfY6Ku81yDzd6
 x0jUqhbJ024Wd9RGufi8DL2VtSHMuOPFopyydh4zEZcOsmyUbQajCBsp9Hzc4wmDD8tOJeMowb8+q
 WdiNz1IXFstBMdFU=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlLVb-00F2nT-Ie
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 22:56:24 +0000
Received: by mail-pl1-f202.google.com with SMTP id g18so2050425plj.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2019 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=32EvgBFnAv8ONpLqCSd3ioyTEVOAmc+wOjmDzUT8IVQ=;
 b=U98632Z82hYy5Krk4Woknk4M3J9Oxbj8OLfRcRkOhGhPsLAgvlQ8rL9cjAJhLQGT0e
 nCfY2aMLctKH69TtquMoZpasiCSaNu9WP3yBAzUUbRQV4pKQdoUmylbSx427Z6QJe+Zc
 XUyFaop39sDlqJv7rWzmRkcjpxyL+cehPcD3+KZr4BOSB2t4QIKV2J9aUANKGFF0b4RV
 SEPT/+e+lPQTrLb0lC8jN6riSephuN1tXaX5Jqeb9/n+hVCc1tFDWqp8O6PDklw8PheP
 TahcnXsLHuoRbvMEJGYz1WRDNelCbzAdlcE/6FLE+qvY21MZ2HRfX3yQtfzql02E8Qjb
 zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=32EvgBFnAv8ONpLqCSd3ioyTEVOAmc+wOjmDzUT8IVQ=;
 b=hN9dkNfCsw3mGdSETYuJB7cUeUJ9Ludp5VZAy2eGeB6ZyzDB/jK8LT3GeaIogVIGU4
 er5p7KZbSHcQdP7fOjk6nvnn7LsqjvbJ3vpMawu7mZUGHO+9/YP22zxYuYpKID6weWtK
 1GK60YDSanMY6tudBsiU5YI0gvZiHyhAo9X6c4neQ9aDVe+Upld19z7RVdM+Nchrz6Ny
 Mh8T5tietMtAU2StttZdQjdY7/xX+H0g2Tg5ks8VnxsV8kel4cs45haqR5VgPQ7aBUkh
 euay73jgnFn2JS+K34qEhxaVVBRpT9qQNqzucZGtDMdA2YydnCKdfk+kkd9316DqrXBK
 Ar2Q==
X-Gm-Message-State: APjAAAWVjj6kPFtuMCfSOZJSdXuPTTiMmNQKL7KmKd4Nh2Dvqbmmd+Gn
 ZWd6jgP9S44uyRZK6z2heclTLiLQf60=
X-Google-Smtp-Source: APXvYqzdWJGCD39Cu1PKryLNuGp95rnlt/uZL9RjQk8mERUDsK4hp6quJ1mm2cPMcmKqqfHIDneVHcjisAg=
X-Received: by 2002:a63:b904:: with SMTP id z4mr749685pge.388.1562799373417;
 Wed, 10 Jul 2019 15:56:13 -0700 (PDT)
Date: Wed, 10 Jul 2019 15:56:01 -0700
Message-Id: <20190710225609.192252-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hlLVb-00F2nT-Ie
Subject: [f2fs-dev] [PATCH v3 0/8] Inline Encryption Support
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Satya Tangirala <satyat@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Changes v2 => v3:
 - Overhauled keyslot manager's get keyslot logic and optimized LRU.
 - Block crypto en/decryption fallback now supports data unit sizes
   that divide each of the bio's segment's lengths (instead of requiring
   each segment's length to be the same as the data unit size).
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

 Documentation/block/inline-encryption.txt | 185 +++++++
 block/Kconfig                             |   8 +
 block/Makefile                            |   2 +
 block/bio-crypt-ctx.c                     | 122 +++++
 block/bio.c                               |  16 +-
 block/blk-core.c                          |  11 +-
 block/blk-crypto.c                        | 585 ++++++++++++++++++++++
 block/blk-merge.c                         |  34 +-
 block/bounce.c                            |   9 +-
 block/keyslot-manager.c                   | 314 ++++++++++++
 drivers/md/dm.c                           |  15 +-
 drivers/scsi/ufs/Kconfig                  |  10 +
 drivers/scsi/ufs/Makefile                 |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c          | 435 ++++++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h          |  86 ++++
 drivers/scsi/ufs/ufshcd.c                 |  84 +++-
 drivers/scsi/ufs/ufshcd.h                 |  29 ++
 drivers/scsi/ufs/ufshci.h                 |  67 ++-
 fs/crypto/Kconfig                         |   6 +
 fs/crypto/bio.c                           | 138 ++++-
 fs/crypto/crypto.c                        |   4 +
 fs/crypto/fscrypt_private.h               |  11 +
 fs/crypto/keyinfo.c                       |  94 +++-
 fs/crypto/policy.c                        |  10 +
 fs/f2fs/data.c                            |  83 ++-
 fs/f2fs/super.c                           |  13 +-
 include/linux/bio.h                       | 208 ++++++++
 include/linux/blk-crypto.h                |  40 ++
 include/linux/blk_types.h                 |   7 +
 include/linux/blkdev.h                    |   6 +
 include/linux/fscrypt.h                   |  62 +++
 include/linux/keyslot-manager.h           |  75 +++
 include/uapi/linux/fs.h                   |   3 +-
 33 files changed, 2697 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/block/inline-encryption.txt
 create mode 100644 block/bio-crypt-ctx.c
 create mode 100644 block/blk-crypto.c
 create mode 100644 block/keyslot-manager.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
 create mode 100644 include/linux/blk-crypto.h
 create mode 100644 include/linux/keyslot-manager.h

-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
