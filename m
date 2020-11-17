Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A452B675F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 15:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/rZ0/nfsJtAdIvYDyFx8udM3AAPqNkC/6W5/hUpk88=; b=ODHLpMDydvWtenlTYn9m7ldMvN
	ABYCtpFyYsVLe9nK1nMQd3/rV5Tj9YQ+k4Er8Xm8MWKjHFN31bRe6x+m00dgysNISLaPP4yPTWyx1
	nqhQpszuGTvwNIL2Gkg5h2pT1G9OyXUPXsclHZLSPmJor75129k2Trfj6Wz9Z2Qxjo90=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf1zh-0006yX-Ft; Tue, 17 Nov 2020 14:30:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ENmzXwYKAJUHzINzI5DD5A3.1DB@flex--satyat.bounces.google.com>)
 id 1kf1zg-0006yQ-FA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rw0Ed4Q8S7/0UOAJg6i7kX2tfO017R1DvnxFGE4XW9w=; b=f1MGKKmh9/uKjyD1GwjrysQXOW
 2OiFCradWscT/7jvDAEN/3tSMK3+EtXyvh+mF2KF4+99UD2xO++l2WrVTrEA3Ks/tCeEUbdbTSXBI
 n5oDn3FD7puoBjMG6e0qRCUFmqxJm9zTWwH58iivnLIn1ZhY+x+sesv6uVreWZdUxuOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rw0Ed4Q8S7/0UOAJg6i7kX2tfO017R1DvnxFGE4XW9w=; b=O
 AcSgHTL1/i7pom0AzVW9VC8eueBocAmSxvRqd0ypgyFfaPYJ3dKNGEjaOdVxAAcLLE1LZmggHqJ1+
 qvjVDx7wGH1nUClBgdBC7OB0kxHMJi4iWLCM00fDGAhSeCXFyBN5tqHoLEnvIX03PAyLCEex2+wSf
 JFsclBaIdXoCkA0M=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf1zX-000njq-PC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:30:04 +0000
Received: by mail-yb1-f201.google.com with SMTP id k196so25166274ybf.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=rw0Ed4Q8S7/0UOAJg6i7kX2tfO017R1DvnxFGE4XW9w=;
 b=NReczbaHu9/CFRDb3rdYVrym1fzuELIgzmiF/MaA0LhP6McoqXUvIt1+GWqRBSHUSW
 J+G5smAoIdIdorgeztNhxc5Hp2jzPwElnUVFEdjQWy+kWJt6EELV2uvDNshbwBt0Y7wo
 LtGflc9sQoffO21+ojbgkgjZQAzhLGMLASs/yfSH2FQsAesHOqWhKAggyXq2gxHlz+SE
 DQFI5bwzpRHkJ7tf99gWDfp+YGwCb0H3BN0BLLL5HTmVcQ8PQN+kuBK4ssD0De5hmqHp
 yUWCQOUr6+QhXISYNLA6ABu/QiSqy7Dyg2eEiDxT1w50/HuguMcbm2Rsbp2un5DTcsJl
 jNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=rw0Ed4Q8S7/0UOAJg6i7kX2tfO017R1DvnxFGE4XW9w=;
 b=tmOz9PoT7H+trVzbXQ2oRDM02dxfH4Fqm5vvFdlHThfMep7Zn/FHXWJUEULEtUh2QC
 lwDu0JWXM0Lp9FzElfmZ87QtoU0i4nZfMcmvo0R6AjfDFPjbQELsd4bbYPj6BR2Pohiv
 yQ9oFdzStQktHUJR0OoKzVrAj0QkC0qzi5YXAdxPJ5YxTquay8lkLCRqGya24R7ddPI4
 0ky+LROjoLZcSWi3l6OgYHXD5GOvASqohHhZBOHoQLzm7t7RJaRGtYD1YY4AQhfrMEkK
 8w95PJLMXAssoJH4P8jx26Jxf4bBLPz/XCYcoHKVjPBvefd52QeIEDWe8FpblLj8qUkI
 3tkQ==
X-Gm-Message-State: AOAM532D3iIE+M7rL4dXLXkgLGxqKplLBLcJKie4SkfIwV3yRSOEu1iT
 uhV3nHv1/DrF/LIqUnwvWOUptc5N1e4=
X-Google-Smtp-Source: ABdhPJxLL4xzfVKkB1iKAtBTgSADDClJLbPI3B9hR6JxqH7x/hZVCG3inPAnhmWtUy9asa1KCHNhTeqJtX8=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:7083:: with SMTP id
 l125mr35483953ybc.250.1605622032485; 
 Tue, 17 Nov 2020 06:07:12 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:00 +0000
Message-Id: <20201117140708.1068688-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kf1zX-000njq-PC
Subject: [f2fs-dev] [PATCH v7 0/8] add support for direct I/O with fscrypt
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
blk-crypto. It has been rebased on fscrypt/master (i.e. the "master"
branch of the fscrypt tree at
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git)

Patch 1 ensures that bios are not split in the middle of a crypto data
unit.

Till now, blk-crypto expected the offset and length of each bvec in a bio
to be aligned to the crypto data unit size. Patch 2 enables
blk-crypto-fallback to work without this requirement. It also relaxes the
alignment requirement that blk-crypto checks for - now, blk-crypto only
requires that the length of the I/O is aligned to the crypto data unit
size.

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
meaningful regressions. One regression was for generic/587 on ext4,
but that test isn't compatible with test_dummy_encryption in the first
place, and the test "incorrectly" passes without the 'inlinecrypt' mount
option - a patch will be sent out to exclude that test when
test_dummy_encryption is turned on with ext4 (like the other quota related
tests that use user visible quota files).

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
  block: ensure bios are not split in middle of crypto data unit
  blk-crypto: don't require user buffer alignment
  fscrypt: update documentation for direct I/O support

 Documentation/filesystems/fscrypt.rst |  21 ++-
 block/bio.c                           |   1 +
 block/blk-crypto-fallback.c           | 212 +++++++++++++++++++-------
 block/blk-crypto-internal.h           |  18 +++
 block/blk-crypto.c                    |  19 +--
 block/blk-merge.c                     |  96 ++++++++++--
 block/blk-mq.c                        |   3 +
 block/bounce.c                        |   4 +
 fs/crypto/crypto.c                    |   8 +
 fs/crypto/inline_crypt.c              |  74 +++++++++
 fs/direct-io.c                        |  15 +-
 fs/ext4/file.c                        |  10 +-
 fs/ext4/inode.c                       |   7 +
 fs/f2fs/f2fs.h                        |   6 +-
 fs/iomap/direct-io.c                  |   6 +
 include/linux/fscrypt.h               |  18 +++
 16 files changed, 431 insertions(+), 87 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
