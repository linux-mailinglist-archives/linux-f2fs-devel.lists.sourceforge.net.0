Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396BDF868
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 01:07:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMgm1-0001XA-Db; Mon, 21 Oct 2019 23:07:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMgly-0001Wd-9H
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 23:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etEiCtfrTlCjrPUc0CX+ZxcbeglYBiC+EqMURFd7jpo=; b=SK80TvLWdOkE6JHDyUe706zaeG
 k0dAmrnrnzMybuQiykMv+yIoAB7w/gSBFgQlBmfFDYqux5AYlPGHkdyar04H7fNKVfhfB85JETIUV
 7HJ+3UYqBUTzI3Tt6qz2U2RB1Xfu+zSlaa+P+qEn344A67EBM8rOKXz1miGfNKF1CL10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=etEiCtfrTlCjrPUc0CX+ZxcbeglYBiC+EqMURFd7jpo=; b=U
 a/W2MgVJILhe5q2CTimVln+BVU4Yq6YuUraydOPbXOavCQViqarcEujw75xNpFIca5r4zV1UfSELV
 DX9kfM5tV6VTI6BLjHVsSzACmctTXGn4sN85CNq/OnBDsM18g3fZME6usGlQAP8UzQ2abfaycdm/+
 Fm+Yvx7hkzV3VlK4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMglw-00GIlh-VZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 23:07:34 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C812F2086D;
 Mon, 21 Oct 2019 23:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571699242;
 bh=Pe7Lis/ulx8/IwkmeLuv53LKYhthEU3xhU7qcvrWXZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=KFqCookuLvhUWmmwBtVb2etKPO0Oto0GcX9cwodQRQNs2/xlaPbje2qinGny1YdhG
 34Z6+AuL/AuHZ/lDvAKibQh0ft7asFQOQiIoMfRwwMVndg90X1oJg9z7TTsgGx/cQ9
 3FPe8cmn2ZRnZyEzQrXJ9OGqx45lrhuB5zRNyYLI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 21 Oct 2019 16:03:52 -0700
Message-Id: <20191021230355.23136-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMglw-00GIlh-VZ
Subject: [f2fs-dev] [PATCH 0/3] fscrypt: support for
 inline-encryption-optimized policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

In preparation for adding inline encryption support to fscrypt, this
patchset adds a new fscrypt policy flag which modifies the encryption to
be optimized for inline encryption hardware compliant with the UFS
standard --- specifically, to use a smaller number of keys while still
using at most 64 IV bits.  This required adding the inode number to the
IVs.  For ext4, this precludes filesystem shrinking, so I've also added
a compat feature which will prevent the filesystem from being shrunk.

I've separated this from the full "Inline Encryption Support" patchset
(https://lkml.kernel.org/linux-fsdevel/20190821075714.65140-1-satyat@google.com/)
to avoid conflating an implementation (inline encryption) with a new
on-disk format (INLINE_CRYPT_OPTIMIZED).  This patchset purely adds
support for INLINE_CRYPT_OPTIMIZED policies to fscrypt, but implements
them using the existing filesystem layer crypto.

We're planning to make the *implementation* (filesystem layer or inline
crypto) be controlled by a mount option '-o inlinecrypt'.

This patchset applies to fscrypt.git#master and can also be retrieved from
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=inline-crypt-optimized-v1

A ciphertext verification test for INLINE_CRYPT_OPTIMIZED policies can
be found at
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=inline-encryption

Work-in-progress patches for the inline encryption implementation of
both INLINE_CRYPT_OPTIMIZED and regular policies can be found at
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=inline-encryption-wip

Eric Biggers (3):
  fscrypt: add support for inline-encryption-optimized policies
  ext4: add support for INLINE_CRYPT_OPTIMIZED encryption policies
  f2fs: add support for INLINE_CRYPT_OPTIMIZED encryption policies

 Documentation/filesystems/fscrypt.rst | 53 +++++++++++++++++++--------
 fs/crypto/crypto.c                    | 11 +++++-
 fs/crypto/fscrypt_private.h           | 20 +++++++---
 fs/crypto/keyring.c                   |  6 ++-
 fs/crypto/keysetup.c                  | 47 +++++++++++++++++++-----
 fs/crypto/policy.c                    | 42 ++++++++++++++++++++-
 fs/ext4/ext4.h                        |  2 +
 fs/ext4/super.c                       | 14 +++++++
 fs/f2fs/super.c                       | 26 ++++++++++---
 include/linux/fscrypt.h               |  3 ++
 include/uapi/linux/fscrypt.h          | 15 ++++----
 11 files changed, 191 insertions(+), 48 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
