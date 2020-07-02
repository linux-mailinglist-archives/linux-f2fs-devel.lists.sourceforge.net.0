Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A12119E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xTP+xlSaCD16i9kFXxME174jaNdi4Y0vNR4wHzCf6k=; b=UUBvlB2+TO71flmW8ngQXS/Yxp
	ZjgiRFZmS824mcMEBWz7KA5tXCZ8PMPSQJDh4eb99EXTCnY+juPrbWKFEyLuuSwc4EYXzUEu8b6Pl
	LPTbgQuBtxjfnwmhyPYWONU3OQ6w52p7G5yrSsQ39yoOq7H+Uzf1KgabXn64wjAkGOcQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqoSZ-0004lF-7T; Thu, 02 Jul 2020 01:56:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3uj79XgYKACsZHafHaNVVNSL.JVT@flex--satyat.bounces.google.com>)
 id 1jqoSX-0004l8-RN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 01:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAITaULtdMDEOzvw+l2Rasjf1QfU0QQ930xQ9EFFDhw=; b=GL2vgUgunuK/J243VjQcK2kePv
 HZu4GRJNnlLxiQ90mpon9YdcDsDLsj2OUYwNwRklERQEEdJbx8uMecBtUASkaQMh2J3pt+twbiz9p
 H4+eFINSmLQqY6BNM/qg6JDeVD+zTTFRkMrKSH+4vmoTdpZjcaSG4c2MuJwRVhbNH6Ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xAITaULtdMDEOzvw+l2Rasjf1QfU0QQ930xQ9EFFDhw=; b=K
 dc81siDMFrqRVoNiglH/NDguClvyAUfD0vBESd2dWUUgiCxyh9i+tUXvC9ZP5GK6nyAwPUbuwEd0X
 wtisgWvhGDSuLhWBlI+Ka3NRnls0CBeg7ojnuY7OnczGVMRYhGdowKqm5aJ6CtKu333CjG33wvb1h
 vP/dMHMTZCYW6gS4=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqoSW-007Ufd-8I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 01:56:17 +0000
Received: by mail-yb1-f201.google.com with SMTP id s9so28179706ybj.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xAITaULtdMDEOzvw+l2Rasjf1QfU0QQ930xQ9EFFDhw=;
 b=mJr6dns1TdHPLaPk1l1nUCN4IUtvYtOpMd2odmYKWwr0/WbLXDSazaIVv1ciEv9fJ6
 SutKMg5RIy1dEiGwT8tnYEFpjFd9W3ngQvNkiALl+UdZ0ZpNdu4FjIE80wjAdsRl8PXr
 qpPoSKhwncdhK0vfriwJb2pRIZrTdVXv1cetv5y7HizWBttesdKay1ggMdGpx0GXDBNT
 5dmnOm8hmCDyzG+8x4qUxQgWyr8aQpbgx3O9tMQF8yy3S+D+8d8nHIzsCTwDEX5dtTE9
 viXRGOQoHfzNzEwu76bLCC0Nna/lluLtAlSJGwqypdkfxZWTZKMdIexOw/mnSePGmjfr
 uazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xAITaULtdMDEOzvw+l2Rasjf1QfU0QQ930xQ9EFFDhw=;
 b=MeKVLoDb64+27O6O3UI+QGMl07w5YI6h+AIhlg4hXQ18y37Wem5RqzClm07oEa+s/Q
 g5QIrJQK1VsC1EjWVIZeAxa7QtQX9ZYuc67Jp5s9ueCu9APHOxt/fmYAPipRaviqRqxb
 UL81kHDeOGSJimjqfd7/o/vyqqDra/J6+Bpq0XTvjEw7wIpy3H2FInygExKwvWHz3W60
 lvQTkTT9Je1ZPbZhZBOQGzvCpQ8klXsidJf44AkbRaWbq/tf8LH17vCVsp42xaatkZl9
 /nHp2nZzxM2JkgIjhbUmXJOQOLyvwfQ8ypLMD08zTZ94R2tS+gc0L95Fre5DUM5GPd+F
 Wrnw==
X-Gm-Message-State: AOAM533Bt9an6EuH9VmXF1efQAKzfgxwKoEETxsdYPVetyl1XPlqY/il
 Kq0/9maF6aWKKx/cp1w6tymyMaQ+HQ0=
X-Google-Smtp-Source: ABdhPJwJQVRpteo2WlW4RD45U90u9w3Bir/5IPPjxXl6Q7riTU/fQWHTNswcF38H+KG41biaAsLKtQ7YqWM=
X-Received: by 2002:a25:3bca:: with SMTP id
 i193mr46883130yba.182.1593654970400; 
 Wed, 01 Jul 2020 18:56:10 -0700 (PDT)
Date: Thu,  2 Jul 2020 01:56:03 +0000
Message-Id: <20200702015607.1215430-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqoSW-007Ufd-8I
Subject: [f2fs-dev] [PATCH v4 0/4] Inline Encryption Support for fscrypt
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
Cc: Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for Inline Encryption to fscrypt, f2fs
and ext4. It builds on the inline encryption support now present in
the block layer, and has been rebased on v5.8-rc3. Note that Patches 1 and
2 can be applied independently of Patches 3 and 4 (and Patches 3 and 4 can
be applied independently of each other).

This patch series previously went though a number of iterations as part
of the "Inline Encryption Support" patchset (last version was v13:
https://lkml.kernel.org/r/20200514003727.69001-1-satyat@google.com).

Patch 1 introduces the SB_INLINECRYPT sb options, which filesystems
should set if they want to use blk-crypto for file content en/decryption.

Patch 2 adds inline encryption support to fscrypt. To use inline
encryption with fscrypt, the filesystem must set the above mentioned
SB_INLINECRYPT sb option. When this option is set, the contents of
encrypted files will be en/decrypted using blk-crypto.

Patches 3 and 4 wire up f2fs and ext4 respectively to fscrypt support for
inline encryption, and e.g ensure that bios are submitted with blocks
that not only are contiguous, but also have continuous DUNs.

This patchset was tested by running xfstests with the "inlinecrypt" mount
option on ext4 and f2fs with test dummy encryption (the actual
en/decryption of file contents was handled by the blk-crypto-fallback). It
was also tested along with the UFS patches from the original series on some
Qualcomm and Mediatek chipsets with hardware inline encryption support
(refer to
https://lkml.kernel.org/linux-scsi/20200501045111.665881-1-ebiggers@kernel.org/
and
https://lkml.kernel.org/linux-scsi/20200304022101.14165-1-stanley.chu@mediatek.com/
for more details on those tests).

Changes v3 => v4
 - change the page_is_mergeable() check in add_ipu_page() to an f2fs_bug_on
   since the only caller of add_ipu_page() already checks page_is_mergeable
 - add reviewed by

Changes v2 => v3
 - Fix issue with inline encryption + IV_INO_LBLK_32 policy found by Eric
 - minor cleanup

Changes v1 => v2
 - SB_INLINECRYPT mount option is shown by individual filesystems instead
   of by the common VFS code since the option is parsed by filesystem
   specific code, and is not a mount option applicable generically to
   all filesystems.
 - Make fscrypt_select_encryption_impl() return error code when it fails
   to allocate memory.
 - cleanups
 
Changes v13 in original patchset => v1
 - rename struct fscrypt_info::ci_key to ci_enc_key
 - set dun bytes more precisely in fscrypt
 - cleanups

Eric Biggers (1):
  ext4: add inline encryption support

Satya Tangirala (3):
  fs: introduce SB_INLINECRYPT
  fscrypt: add inline encryption support
  f2fs: add inline encryption support

 Documentation/admin-guide/ext4.rst    |   7 +
 Documentation/filesystems/f2fs.rst    |   7 +
 Documentation/filesystems/fscrypt.rst |   3 +
 fs/buffer.c                           |   7 +-
 fs/crypto/Kconfig                     |   6 +
 fs/crypto/Makefile                    |   1 +
 fs/crypto/bio.c                       |  51 ++++
 fs/crypto/crypto.c                    |   2 +-
 fs/crypto/fname.c                     |   4 +-
 fs/crypto/fscrypt_private.h           | 115 +++++++-
 fs/crypto/inline_crypt.c              | 364 ++++++++++++++++++++++++++
 fs/crypto/keyring.c                   |   6 +-
 fs/crypto/keysetup.c                  |  70 +++--
 fs/crypto/keysetup_v1.c               |  16 +-
 fs/ext4/inode.c                       |   4 +-
 fs/ext4/page-io.c                     |   6 +-
 fs/ext4/readpage.c                    |  11 +-
 fs/ext4/super.c                       |  12 +
 fs/f2fs/compress.c                    |   2 +-
 fs/f2fs/data.c                        |  79 +++++-
 fs/f2fs/super.c                       |  35 +++
 include/linux/fs.h                    |   1 +
 include/linux/fscrypt.h               |  82 ++++++
 23 files changed, 820 insertions(+), 71 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
