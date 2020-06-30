Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4420F474
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 14:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTEId8jK6gGI4jMhSAe1T4Jqspx+4Hkp6t/EzqeOpsc=; b=BNRN8tNfIbSi/ryCVOlAmMJs8f
	wo3Ufl4BGb8J9cR2nWP5/ni6iQMqja1yxnANi0SJ9TxczN3wZjnTjH5q1hG+gTlsCslelHoEGB8Uu
	3+uwMBscEeDMfnpJud09tWmBpOlShejirncu/khIghpYY1GcZXiUk+uV5+WapVNMknUc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqFFD-00046b-1M; Tue, 30 Jun 2020 12:20:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3syz7XgYKAPYqYrwYremmejc.amk@flex--satyat.bounces.google.com>)
 id 1jqFFB-00046U-S2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 12:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lhA0BWoSWsBTuwKzKn01wZo9Oy70PMD7N1A7rW96zZc=; b=ZkAY04IHeQEVJG+UOER8hUUn7X
 YVQ/T7oqIOoSjf+Oaix9bRqQ7d1+qXBdBWfyIK2XOldQBvlYf8xiH1/cagfvykvHRx0PjlIx3sxV8
 gNsWRkSY1lX5UIcHK8r8t+b2Rw9Xg7fQvcF2QbwVhWcVqwRpsOj20L7YWsIneiTaFQW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lhA0BWoSWsBTuwKzKn01wZo9Oy70PMD7N1A7rW96zZc=; b=M
 50UujCXz0DLD7oue/7OZEpS1HZVV4jPunfjFuSFuZRAz2Z2Blh4+rUn3z5cfj1lqfoZ2wRAPP2CTo
 IwvhnL7coO7LnugcQcYuwL71XZDK+VjS1zBgUuPDSaUnGLT0IZ8iTkTZx40CToNIT3SpDMMyi28r7
 I75EzNNL/R3ORVlg=;
Received: from mail-ot1-f73.google.com ([209.85.210.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqFFA-007I2G-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 12:20:09 +0000
Received: by mail-ot1-f73.google.com with SMTP id b22so5042393otp.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2020 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lhA0BWoSWsBTuwKzKn01wZo9Oy70PMD7N1A7rW96zZc=;
 b=Yf2T2rzyob0oJjaxt0VAVSVU7RtyTQTloLFyysxD+7tOEox6O0w6u6uNVA7lVNprXh
 SQQYFdez1F5TGZVN4lSw4TnqPYpciAIRvTUsntD9m7woLfjh43R7PrVWe2Qtbf60l4Xs
 SJ7gFsGfV11H8cDRSoAR2jf0eQIlCwuSeQTWZWFiSpmcBtkkIzKff6UE+YIybzU+Zsbo
 qF3e2oYLtOqsCNLFkm9IZA745dR9XvYldgqBK69sUEtf/7haBMalAiiZJQSbFa+HYoQX
 /f2sZu89aEa8LzaztOQMCuLcYLWd7YvscLhYTKJhE7qSLXK8gMKVvbjlSWjnw/rXjQ05
 hPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lhA0BWoSWsBTuwKzKn01wZo9Oy70PMD7N1A7rW96zZc=;
 b=CbFP2KKNKpC1vLMsoP5FbV5qNfD4weqCpu1kObI/xikuy0iR+HrlAdXW5jKgufXh7V
 oUpdw7O5WrQjQox6Pc0kVHY+OwILrBH2tQRDJYfD2RbwpwkrWOiK4RYDsdp3ygHnOemP
 jGpZBHdkUUaBGT3pwA4oT+RUUKNn5+YKZCcS+6ReynMd8B8jhXyR14XxIVFs0BPl9tkJ
 XYV/6mwpanaVNFNxu8uwLtVPPanOo8F5Nc5BksfVebBbDW/iuauYTNPna8zOSGkCHao3
 eCVdD/TilsuozMYhR3Pdv8j/2xYJnh5nnANfdKYtfOhGPvNFBnGdjphg1scfEC1qVn6E
 Cc9Q==
X-Gm-Message-State: AOAM533q4W+ClcBup0XiHRhVk760eiluEgNa0soy3BNPMSKvkh304za4
 hexbITrBPKJWtNqpkxv2BGY9nlKdM3k=
X-Google-Smtp-Source: ABdhPJwAHOyLt+3kT7UZQ7QETmF2sx1NwYFgJgFhaQoJiYfMqjNMWPplC+KCJoZ+BYN22obKmbu7zEAVADQ=
X-Received: by 2002:a17:90a:d30c:: with SMTP id p12mr739331pju.4.1593519283036; 
 Tue, 30 Jun 2020 05:14:43 -0700 (PDT)
Date: Tue, 30 Jun 2020 12:14:34 +0000
Message-Id: <20200630121438.891320-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqFFA-007I2G-Ii
Subject: [f2fs-dev] [PATCH v3 0/4] Inline Encryption Support for fscrypt
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
the block layer, and has been rebased on v5.8-rc3.

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
 fs/f2fs/data.c                        |  78 +++++-
 fs/f2fs/super.c                       |  35 +++
 include/linux/fs.h                    |   1 +
 include/linux/fscrypt.h               |  82 ++++++
 23 files changed, 819 insertions(+), 71 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
