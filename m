Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC72A0EB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJ0-0001ZD-QS; Fri, 24 May 2019 22:04:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIIz-0001Z0-Kd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m6hRKqsKTWfZHs7VM9oGvBX8/8Fh5WP6i7q5xNkR0Pc=; b=kxvqoZsVuENoX1KytITEHJHDM/
 YHtvJ8yCo3CX7ILl5nWzSdkMw1CD7Qs8WWcov1/mibZ70HYhhvIRQiuwssb0UjRYdysLG87VIbiyr
 AVifctKUweWEeIiTTWptsNyW0XYylBr4nPi5YAgUZJWTeJsvAT/aqXu9bfZrSj2I8F18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m6hRKqsKTWfZHs7VM9oGvBX8/8Fh5WP6i7q5xNkR0Pc=; b=k
 u3gyBp2kCFZdHZp0GPtmUOwrGvIwgQ5yBqeTLMGAK84/zdhs7b3E9VSkyKYBM/n4CpTQtH08Tplcb
 4DadbzumJd+8cSK4Pch1uEeFuEaCQcqR6e6Ve7n9cq+SgSyWVTiLY1Q0MoftXW607Nj4Un4T4TWXr
 5oHJWJE3rujyOmsc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIIy-00EpED-0q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59C3A217F9;
 Fri, 24 May 2019 22:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735481;
 bh=ZxgHKvU763F27jYNcNQ89B6QO75hoW7PKOE4wcdlm+4=;
 h=From:To:Cc:Subject:Date:From;
 b=dD/pt71ghmJqxKMWRcvdhgMX5jo9ovFhPqyjGx7KVc+wmhbfr6/3XJVqtZGJH48ZZ
 et9WN6uflvv7DmkuceihproLGhJF+H4mkifQbI0CaLAHs2cElw3nKN55vcVscSOY07
 OvbKnvq7nWvfnBIvxALb7P6O1ZwDb1f5MJH8Z8jU=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:18 -0700
Message-Id: <20190524220425.201170-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hUIIy-00EpED-0q
Subject: [f2fs-dev] [PATCH v2 0/7] xfstests: verify fscrypt-encrypted
 contents and filenames
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

This series adds xfstests which verify that encrypted contents and
filenames on ext4 and f2fs are actually correct, i.e. that the
encryption uses the correct algorithms, keys, IVs, and padding amounts.
The new tests work by creating encrypted files, unmounting the
filesystem, reading the ciphertext from disk using dd and debugfs or
dump.f2fs, and then comparing it against ciphertext computed
independently by a new test program that implements the same algorithms.

These tests are important because:

- The whole point of file encryption is that the files are actually
  encrypted correctly on-disk.  Except for generic/399, current xfstests
  only tests the filesystem semantics, not the actual encryption.
  generic/399 only tests for incompressibility of encrypted file
  contents using one particular encryption setting, which isn't much.

- fscrypt now supports 4 main combinations of encryption settings,
  rather than 1 as it did originally.  This may be doubled to 8 soon
  (https://patchwork.kernel.org/patch/10952059/), and support for ext4
  encryption with sub-page blocks is in progress too.  We should test
  all settings.  And without tests, even if the initial implementation
  is correct, breakage in one specific setting could go undetected.

- Though Linux's crypto API has self-tests, these only test the
  algorithms themselves, not how they are used, e.g. by fscrypt.

Patch 1 is a cleanup patch.  Patches 2-4 add the common helpers for
ciphertext verification tests.  Patches 5-7 add the actual tests.

For ext4 these tests require e2fsprogs v1.45.1 or later, for a recent
debugfs fix.  For f2fs they require f2fs-tools built from the "dev"
branch (which should eventually become v1.13.0), for a dump.f2fs fix.
The tests check for the presence of these fixes before they run.

This series can also be retrieved from git at
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git
branch "ciphertext-verification".

I also have patches on top of this series which verify the ciphertext
produced from v2 encryption policies, which are proposed by my kernel
patch series "fscrypt: key management improvements"
(https://patchwork.kernel.org/cover/10951999/).  v2 encryption policies
will use a different key derivation function, and thus their ciphertext
will be different.  These additional patches can be found at branch
"fscrypt-key-mgmt-improvements" of my git repo above.  But I've arranged
things such that this shorter series can be applied earlier, to test
what's in the kernel now.

Changed since v1:

  - Drop the _require_get_encpolicy() helper function.
  - Rename some functions:
  	- _get_on_disk_filename() => _get_ciphertext_filename()
	- _get_file_block_list() => _get_ciphertext_block_list()
	- _dump_file_blocks() => _dump_ciphertext_blocks()
  - Mention minimum e2fsprogs and f2fs-tools versions in comments.
  - Use _fail() instead of _notrun() when support was already checked.
  - Minor cleanups to fscrypt-crypt-util.

Eric Biggers (7):
  common/encrypt: introduce helpers for set_encpolicy and get_encpolicy
  fscrypt-crypt-util: add utility for reproducing fscrypt encrypted data
  common/encrypt: support requiring other encryption settings
  common/encrypt: add helper for ciphertext verification tests
  generic: verify ciphertext of v1 encryption policies with AES-256
  generic: verify ciphertext of v1 encryption policies with AES-128
  generic: verify ciphertext of v1 encryption policies with Adiantum

 .gitignore               |    1 +
 common/encrypt           |  479 ++++++++++-
 src/Makefile             |    3 +-
 src/fscrypt-crypt-util.c | 1633 ++++++++++++++++++++++++++++++++++++++
 tests/ext4/024           |    3 +-
 tests/generic/395        |   26 +-
 tests/generic/395.out    |    2 +-
 tests/generic/396        |   15 +-
 tests/generic/397        |    3 +-
 tests/generic/398        |    5 +-
 tests/generic/399        |    3 +-
 tests/generic/419        |    3 +-
 tests/generic/421        |    3 +-
 tests/generic/429        |    3 +-
 tests/generic/435        |    3 +-
 tests/generic/440        |    5 +-
 tests/generic/700        |   41 +
 tests/generic/700.out    |    5 +
 tests/generic/701        |   41 +
 tests/generic/701.out    |    5 +
 tests/generic/702        |   43 +
 tests/generic/702.out    |   10 +
 tests/generic/group      |    3 +
 23 files changed, 2292 insertions(+), 46 deletions(-)
 create mode 100644 src/fscrypt-crypt-util.c
 create mode 100755 tests/generic/700
 create mode 100644 tests/generic/700.out
 create mode 100755 tests/generic/701
 create mode 100644 tests/generic/701.out
 create mode 100755 tests/generic/702
 create mode 100644 tests/generic/702.out

-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
