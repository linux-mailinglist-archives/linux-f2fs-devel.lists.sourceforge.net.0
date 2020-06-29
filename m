Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C71C520CE88
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 14:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpemYDDIl3rcO2LGTxXbk271G7+0TBmxBTHqwi92vt8=; b=czW5Lm6IeesxParGxY8mDSIRDW
	QXaFc8uC3RdcEvZjjDApCkzatUNFDbuDf0sPUEj5Yc7NzWqMCJNiWCioMUMbl8OwGik5foVQe7Sh9
	0Br99smVxYsujxvnzsPVSfgMB7eeVEputeX3HoOz1j9ayzI4anuOA8vwpRm1zXLNfSFA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpswo-0000Iu-6I; Mon, 29 Jun 2020 12:31:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3vNj5XgYKAFMDvEJvE19916z.x97@flex--satyat.bounces.google.com>)
 id 1jpswn-0000If-DN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 12:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OgrownsdciRkQfHLu2Mfy3btRxxtBKOX+y4E3Oqteos=; b=C+3V716y4pC0ra9ZEFe2fpxSNJ
 cUrBS7UHsgUgvDS14NV0SUDIhaSfI27oh8MHbag+DwH6fiBNNXvu/q6fTLpsFy4Qo65VcBx2eovlw
 hP+mhTSL2FQYW6MduhoEmTIXARnUm4RuRgsu6D6ncWT6S9td5VGkHYjePgVDxk1+/3Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OgrownsdciRkQfHLu2Mfy3btRxxtBKOX+y4E3Oqteos=; b=F
 8dHHPywIFYXUcWaurEMXg9Xtpa9j0HKfXTKuiReafzITyOqE5Bbo8PejTdR7fB7CKaVRCMbCppLH2
 Dx5tTLOtxgaRYot8ec3yZSQ8cvS79yi+MXQD8kcU/QRhDAbtGN3Z6bCtCNgP2/Fx1jm29Gx4pYFh5
 Nk9rXSm35cYwHrtY=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpswl-0022ri-U1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 12:31:41 +0000
Received: by mail-qk1-f202.google.com with SMTP id u186so12181219qka.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2020 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OgrownsdciRkQfHLu2Mfy3btRxxtBKOX+y4E3Oqteos=;
 b=gBiZCVlEO4XDHJNS23BhAsQTP1jO1/1YSpaH/WgvMSS3FuMlqd+4vKZrSzJYaWnl/Y
 1n1gSdCt3z+pNV3CigPeOXG4eWXKbpivWBuPyrfPGp1RIgFeEDVv/cPemO6wV3JCho0e
 jtOIYCZIL5m5allS+ROBU+GL06J1VYIuxb9Z5y9RT3Zi8IiwzIYN+bmBk1wt2JfYac8c
 Ye2I8lshSh/FtnYECOI3yuRPOKNSi/QlD9zFMx5r0MsMNroQ3ZPLZjUGeLkHYYQ4sm3/
 3luLSZG+zTmBtBG1Ed7XTgsbFfmZSkITPVvXtYQ1D95XhQY/gcG72x8y0aBQeNDpQhaa
 CvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OgrownsdciRkQfHLu2Mfy3btRxxtBKOX+y4E3Oqteos=;
 b=HrUtAFLM7hdHGKBsiKlw5lplMu9KncI4x8S9CY7zrcQ/S+4eNd7M+P7aMIHyx8IV7L
 2bL08wxbC7KjMkkWKqd81MllLkpCa67qKHNvvC1wT7JZFxEjLhikuyk7198KpVqb6exs
 4PTxHJqZAZ/t4Xrx4tFM1to+9y3G3foQvc+0G0nre+v5v75DV49nr0KF1mjhaENabk9e
 nBxH+qDyo/n56LwG9MFAjaFrEZ7V/BZRZeD2lWVxQFT/BvnyOTbYCcxDDTlhbhQoWt8I
 sBKJ0+QDXmyYfhzT1qu59ncT5pRuiZ0Fpbru0K8TdbVBNN9IezYUrIfOOG/BzI0yXw7H
 U0yQ==
X-Gm-Message-State: AOAM5303Lb+VQTN2xjhuszEdx7lsJ80GriUh9oDXDNXz8b5tUJBU0Qxd
 a3vzkal8wEvfeALGLTqCAJbMfQsSryY=
X-Google-Smtp-Source: ABdhPJwYLTVSt9n1XjUVygrqIZ2mKYtW5G+8LSUlIBRmnIEmdQxeGLDbPT+he1blzav1wz1DLUaRqIPqKYM=
X-Received: by 2002:a17:902:c408:: with SMTP id
 k8mr13536731plk.279.1593432252439; 
 Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:04:01 +0000
Message-Id: <20200629120405.701023-1-satyat@google.com>
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
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jpswl-0022ri-U1
Subject: [f2fs-dev] [PATCH v2 0/4] Inline Encryption Support for fscrypt
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

 Documentation/admin-guide/ext4.rst    |   6 +
 Documentation/filesystems/f2fs.rst    |   7 +
 Documentation/filesystems/fscrypt.rst |   3 +
 fs/buffer.c                           |   7 +-
 fs/crypto/Kconfig                     |   6 +
 fs/crypto/Makefile                    |   1 +
 fs/crypto/bio.c                       |  50 ++++
 fs/crypto/crypto.c                    |   2 +-
 fs/crypto/fname.c                     |   4 +-
 fs/crypto/fscrypt_private.h           | 115 ++++++++-
 fs/crypto/inline_crypt.c              | 351 ++++++++++++++++++++++++++
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
 23 files changed, 804 insertions(+), 71 deletions(-)
 create mode 100644 fs/crypto/inline_crypt.c

-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
