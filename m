Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E06A2FF8E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hdIeXbTCz4iu6pMrVonUJ0QDJnB1lrfR028uZpa9Hhg=; b=LV8eNWu720t/et/iU6chJuqakC
	ZsNzmy96/20chVkKejRnC/keSivzetEcvsJjRSNJwV74POJO/vi7ge+118McOA1Cci9OOXK97otaw
	vcFaVj9z8drn+yY0M56km35qA4Jnaq1HHkuBYBtar1tF7T40mfoePFMJJogqss/SdzdI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2jP9-0001yP-GY; Thu, 21 Jan 2021 23:30:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3SwgKYAYKAIo6o7Co7u22uzs.q20@flex--satyat.bounces.google.com>)
 id 1l2jP8-0001yH-Ct
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a86C6J2KAGK7N8gUuXwqncIpGvzm+wukETDy7ToYVa4=; b=JIlUbBmpcYvgfkHWf7S0VPPriN
 B3mnPpYGGVTr7T4xVOOh9JQuZ471x/DOccK/zZeTldxSwvUCArXupHZL8tAiwnqIBi9S/d2BU9g4G
 Oz1SICDS6z5Lx8EhNgBJAwlP4MwFHJaiUdbpHJH3bPigbvBeC8u516HFdKKvGSJEvTC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a86C6J2KAGK7N8gUuXwqncIpGvzm+wukETDy7ToYVa4=; b=B
 yBz4e5/Llt6dcqogLtoryUagvNa8Qs29QKPgxlHOLUxuPB4ekD+mthphAlqLfR4WHbtuJD07jYtHk
 LrI2OlY53VRJ+X5yABVIX/1mYknAczGJd8G2w8OcsBf5xxPUPeQ2rMEVUvKQrBtpcf54nh4G+tOFa
 RizWh8zAKZN6SaIE=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2jP6-006Vs1-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:30:18 +0000
Received: by mail-pj1-f73.google.com with SMTP id j11so2465853pjw.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=a86C6J2KAGK7N8gUuXwqncIpGvzm+wukETDy7ToYVa4=;
 b=KEMt5GTLgB0F309NJ/ui9d0wbtXY4Ffss7tcitx4GSvL1eI92Um9URMa1KANG05fa0
 dGOGUizaeQuZP45yQNN1mwXHpoQ2ga4p6mQ2OSu+G6FP10NkEVjxX0v3pkY07cEpYbo1
 1jS28VTJSRoOgzn9XCUORVbCqccHajlNmMdwm3zIloJEx8q03KemuwG+iQvN17z1ciag
 2TsJ6dVRI3QxFldm74zyost/zy86a8f84h+wVu0DKP8jeu9CbX0JZDhktdWNYxxOrsLE
 IL0hye+W51IPiYxGrtf4yrCRqjq03ACkItiXwBfTiVrVb7XRmsDRhYYLvQ/Pq4WHXolm
 K/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=a86C6J2KAGK7N8gUuXwqncIpGvzm+wukETDy7ToYVa4=;
 b=EtvkVKDCecboBFRb4zyRTKG7L3dbMDhe9RhFda7oGAx2MEjrBloYMwti9SPYYVV7wO
 ZJKjVqdOVH/YC+dgY6/ucuVhicQZg9oKMu1qVy5qo5eeAYACsUbUZDBsP9Z9XNQZ4BVm
 pU1kA5r7bfccWMnn9VmmUUGEyglJ1FAaLdcJiKuW662V24eesTVRw9DlsRvdwQ6y9PfV
 E1IIhR0i1zvJgkDveto6E7lLVOTcNS6iD5fWAsbjIUk9bCYUVSKv0kCiluspMY63YWs9
 703p+XIEF+Dq5bJYGGXglKrhFnwyya6NjVijBuIPe9wbd/AvS6QzjzjHA7qjB9mgtdQz
 pB4Q==
X-Gm-Message-State: AOAM530bf2rCKPqAvsW8MqZbNYBkJTh8dygWzI03+toM1x1V8G+3Y2hH
 hE6z+DW9OCLEMj/ruP2U9ThnBE6uVtM=
X-Google-Smtp-Source: ABdhPJxWxaz7w6s2m6FBn5/tpe7d7n0Ntq7IDWS5vtwLqnUB2fZpoE5VgKC3P+2iYBpAUdhnybwb2HfbgUE=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a05:6214:4e2:: with SMTP id
 cl2mr1744643qvb.27.1611270219738; Thu, 21 Jan 2021 15:03:39 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:28 +0000
Message-Id: <20210121230336.1373726-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2jP6-006Vs1-IQ
Subject: [f2fs-dev] [PATCH v8 0/8] add support for direct I/O with fscrypt
 using blk-crypto
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
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for direct I/O with fscrypt using
blk-crypto.

Till now, the blk-crypto-fallback expected the offset and length of each
bvec in a bio to be aligned to the crypto data unit size. This in turn
would mean that any user buffer used to read/write encrypted data using the
blk-crypto framework would need to be aligned to the crypto data unit size.
Patch 1 enables blk-crypto-fallback to work without this requirement. It
also relaxes the alignment requirement that blk-crypto checks for - now,
blk-crypto only requires that the length of the I/O is aligned to the
crypto data unit size. This allows direct I/O support introduced in the
later patches in this series to require extra alignment restrictions on
user buffers.

Patch 2 relaxes the alignment check that blk-crypto performs on bios.
blk-crypto would check that the offset and length of each bvec in a bio is
aligned to the data unit size, since the blk-crypto-fallback required it.
As this is no longer the case, blk-crypto now only checks that the total
length of the bio is data unit size aligned.

Patch 3 adds two functions to fscrypt that need to be called to determine
if direct I/O is supported for a request.

Patches 4 and 5 modify direct-io and iomap respectively to set bio crypt
contexts on bios when appropriate by calling into fscrypt.

Patches 6 and 7 allow ext4 and f2fs direct I/O to support fscrypt without
falling back to buffered I/O.

Patch 8 updates the fscrypt documentation for direct I/O support.
The documentation now notes the required conditions for inline encryption
and direct I/O on encrypted files.

This patch series was tested by running xfstests with test_dummy_encryption
with and without the 'inlinecrypt' mount option, and there were no
meaningful regressions. Without any modification, xfstests skip any
direct I/O test when using ext4/encrypt and f2fs/encrypt, so I modified
xfstests not to skip those tests.

Among those tests, generic/465 fails with ext4/encrypt because a bio ends
up being split in the middle of a crypto data unit.  Patch 1 from v7 (which
has been sent out as a separate patch series) fixes this.

Note that the blk-crypto-fallback changes (Patch 1 in v8 in this series)
were also tested through xfstests by using this series along with the patch
series that ensures bios aren't split in the middle of a data unit (Patch 1
from v7) - Some tests (such as generic/465 again) result in bvecs that
don't contain a complete data unit (so a data unit is split across multiple
bvecs), and only pass with this patch.

Changes v7 => v8:
 - Patch 1 from v7 (which ensured that bios aren't split in the middle of
   a data unit) has been sent out in a separate patch series, as it's
   required even without this patch series. That patch series can now
   be found at
   https://lore.kernel.org/linux-block/20210114154723.2495814-1-satyat@google.com/
 - Patch 2 from v7 has been split into 2 patches (Patch 1 and 2 in v8).
 - Update docs

Changes v6 => v7:
 - add patches 1 and 2 to allow blk-crypto to work with user buffers not
   aligned to crypto data unit size, so that direct I/O doesn't require
   that alignment either.
 - some cleanups

Changes v5 => v6:
 - fix bug with fscrypt_limit_io_blocks() and make it ready for 64 bit
   block numbers.
 - remove Reviewed-by for Patch 1 due to significant changes from when
   the Reviewed-by was given.

Changes v4 => v5:
 - replace fscrypt_limit_io_pages() with fscrypt_limit_io_block(), which
   is now called by individual filesystems (currently only ext4) instead
   of the iomap code. This new function serves the same end purpose as
   the one it replaces (ensuring that DUNs within a bio are contiguous)
   but operates purely with blocks instead of with pages.
 - make iomap_dio_zero() set bio_crypt_ctx's again, instead of just a
   WARN_ON() since some folks prefer that instead.
 - add Reviewed-by's

Changes v3 => v4:
 - Fix bug in iomap_dio_bio_actor() where fscrypt_limit_io_pages() was
   being called too early (thanks Eric!)
 - Improve comments and fix formatting in documentation
 - iomap_dio_zero() is only called to zero out partial blocks, but
   direct I/O is only supported on encrypted files when I/O is
   blocksize aligned, so it doesn't need to set encryption contexts on
   bios. Replace setting the encryption context with a WARN_ON(). (Eric)

Changes v2 => v3:
 - add changelog to coverletter

Changes v1 => v2:
 - Fix bug in f2fs caused by replacing f2fs_post_read_required() with
   !fscrypt_dio_supported() since the latter doesn't check for
   compressed inodes unlike the former.
 - Add patches 6 and 7 for fscrypt documentation
 - cleanups and comments

Eric Biggers (5):
  fscrypt: add functions for direct I/O support
  direct-io: add support for fscrypt using blk-crypto
  iomap: support direct I/O with fscrypt using blk-crypto
  ext4: support direct I/O with fscrypt using blk-crypto
  f2fs: support direct I/O with fscrypt using blk-crypto

Satya Tangirala (3):
  block: blk-crypto-fallback: handle data unit split across multiple
    bvecs
  block: blk-crypto: relax alignment requirements for bvecs in bios
  fscrypt: update documentation for direct I/O support

 Documentation/filesystems/fscrypt.rst |  21 ++-
 block/blk-crypto-fallback.c           | 203 ++++++++++++++++++++------
 block/blk-crypto.c                    |  19 +--
 fs/crypto/crypto.c                    |   8 +
 fs/crypto/inline_crypt.c              |  74 ++++++++++
 fs/direct-io.c                        |  15 +-
 fs/ext4/file.c                        |  10 +-
 fs/ext4/inode.c                       |   7 +
 fs/f2fs/f2fs.h                        |   6 +-
 fs/iomap/direct-io.c                  |   6 +
 include/linux/fscrypt.h               |  18 +++
 11 files changed, 315 insertions(+), 72 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
