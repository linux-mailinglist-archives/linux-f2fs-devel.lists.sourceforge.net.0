Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD822DD3A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQW/lhoZdeLReqk+pD9P+JHohiDqe+5JljL3+b0mm+Y=; b=SKo2O92KfS71qMaRofwZMzm3ev
	9fs0qCrxTIw5dFRY386tAdfV2gfUI2LVJJXphPH/RE/MdlgbTm1B/fxCak8uW/NXSyxzD7DPR8HEL
	19fA1pB2zN+yEzjHVvUG6V2X0Spbc7RgNXRyWadaOxO1APQuqrlRGBUd+xyMSMWf4O1A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpupy-0005Z6-3f; Thu, 17 Dec 2020 15:05:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3jHPbXwYKAOUZHafHaNVVNSL.JVT@flex--satyat.bounces.google.com>)
 id 1kpupv-0005Yp-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yk0fWIDpYSRXNFlvOOk6G8jCPlvAFL7y91EQrAZ1ReI=; b=F5Dl1yTyIDku2nTW9QfihpyuPz
 B4U6vgGeBHfLjP63yRA16XgUZyT7arLMVJI/gXAyr9rV0BYS1VqUJpoUrBrFVpwC7HqQz5+2paKxR
 X0hLNuqVhecES55UJBWHqno/1xCxN2oZIeP/0UDFyr0tF6Yo7JTAdaM+SIlaNcuQPGvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Yk0fWIDpYSRXNFlvOOk6G8jCPlvAFL7y91EQrAZ1ReI=; b=N
 SH5I38AAQZKyoaAJ3Usds4URgkt+37Z/npeeRigiwYoOKxr1DrQT04FlOUJjXUaG07IZSBza4YfVn
 vqXS4KFqEofX7QhBhqQvnzmgK0uiA+RUaHMGNXTqywPaufSDzwPrwVOvbCnYuUt6S36QHWs/1v6rp
 8sJ5nD46wUiY+JTs=;
Received: from mail-qv1-f73.google.com ([209.85.219.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpupm-00025q-I7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:04:59 +0000
Received: by mail-qv1-f73.google.com with SMTP id t16so21034313qvk.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Yk0fWIDpYSRXNFlvOOk6G8jCPlvAFL7y91EQrAZ1ReI=;
 b=mr2pGb6Ug8sFbn6nsJV39BmxtDqXSgMty9VRhi4fw/oUwA1VVRxorzdlpbwaLHHhW6
 kClxH6KlsV0JluSSglqx7kq4oym5rQyH2bP2DCw2jvxjER47Kn9LfeK09AFDlB6w0X/M
 CoysKAxeKEYFY9N5JMIsgzw0on0XJmTRpVRvo0k7ggiBVUzI/XukO4gAtM1qU/9VVn87
 FTg1Fhfr53JAtgdMUl7sj3cGSxp6o15ExwemihkSL3sP8+KaCHbwoaAyMpWP7CyRqo3P
 y4/LEK7ijSCnSS7LGHSD0Tp1UanZhsZOhzendhCedxSA8OU7thFa+RSx/dfmP8UYNnQX
 r6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Yk0fWIDpYSRXNFlvOOk6G8jCPlvAFL7y91EQrAZ1ReI=;
 b=Pf9wSuJJ2F+h6N8wtp2n1dsp0JV5c2MXGctYcbDlpLMEjUzZtQ8LIwKwAVe29VZrgT
 JlVp0OZTsbMXn9kiVZUtw4MILlLmFmODzEVpCTPTCU7XSLDX89bTIqO+sa8sX555qGZn
 lHoktYnL0g5VcfLoIuHjxd+puKytBkNu3z8fbAdRvIUgBXXdSk8hEb7CxkcU4TKT6mHl
 Bm/d7Tk9lHe9LynFikp3UuCMPARwq2UZbdxD1QyOJZL4cXrQ27m4i+CG7IqVahpNE5OL
 Z2GlFWPXXKDQ6Y4ieBHo3A2p6o8ApydoPikN430l8xSJdxg2ZbBW0XLrjKshRWJ2ZFla
 qfKg==
X-Gm-Message-State: AOAM531MYKAQcLSZC9GoJaorr95ZWBp1uCHR65KcLjHn2YsOX8xkE4Ru
 IpsSOELaEa+MizUoMu9x00QnplFX8UM=
X-Google-Smtp-Source: ABdhPJzt/WpiPThyfJOP52ud+2ffcF3oKSw6cetCFfe4FYdRSEvVK4B8STY6mFD+mtQDqMOq19ELoJDkEVU=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:ad4:4c8c:: with SMTP id
 bs12mr50361550qvb.11.1608217484419; 
 Thu, 17 Dec 2020 07:04:44 -0800 (PST)
Date: Thu, 17 Dec 2020 15:04:32 +0000
Message-Id: <20201217150435.1505269-1-satyat@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpupm-00025q-I7
Subject: [f2fs-dev] [PATCH v2 0/3] add support for metadata encryption to
 F2FS
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
Cc: linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series adds support for metadata encryption to F2FS using
blk-crypto.

Currently, F2FS supports native file based encryption (FBE) via fscrypt.
FBE encrypts the contents of files that reside in folders with encryption
policies, as well as their filenames, but all other file contents
and filesystem metadata is stored unencrypted. We'd like to have metadata
and the contents of non-FBE files encrypted too, to protect data like
file sizes, xattrs, locations, etc. which can be valuable in certain
contexts.

The simplest way to do metadata encryption would be to run the filesystem
over dm-crypt (set up to encrypt all bios with the metadata encryption
key). This would essentially encrypt file contents twice (once with the FBE
key and once with the metadata encryption key).  On many android devices,
this is slower than we'd like, and also doesn't play well with inline
encryption engines (which only allow for one layer of encryption, so the
other layer must be done by the kernel crypto API).

Android currently has metadata encryption, and due to the drawbacks
listed above, doesn't use the above mentioned approach, and avoids
double encryption. Metadata encryption on android is currently
implemented using a new DM target (dm-default-key) that encrypts any
bio it receives that has data which has not previously been encrypted
(in practice, it checks for the presence of bio->bi_crypt_context, and
if it's missing, dm-default-key adds a bi_crypt_context to the bio with
the metadata encryption key that it was configured with). This works fine
as long as filesystems submit bios without bi_crypt_contexts for
filesystem metadata/unencrypted file contents, or submit bios with
bi_crypt_contexts for encrypted file contents. However, filesystems like
F2FS sometimes want to read the ciphertext of fscrypt encrypted data
contents (so F2FS will submit a bio without any bi_crypt_context, but
expects to receive ciphertext rather than the file contents decrypted
with the metadata encryption key). To address this issue, F2FS sets a flag
on the bio which essentially instructs dm-default-key not to add a
bi_crypt_context on that bio even though there isn't already one on it.
We'd like to try to come up with a metadata encryption solution that avoids
this layering violation.

The most natural solution that avoids double encryption and layering
violations is to let the filesystem take care of metadata encryption,
since the filesystem is what's responsible for knowing where the filesystem
metadata/unencrypted file contents/encrypted file contents are. This patch
series follows that approach, and adds support for metadata encryption to
F2FS and fscrypt.

Patch 1 replaces fscrypt_get_devices (which took an array of request_queues
and filled it up) with fscrypt_get_device, which takes a index of the
desired device and returns the device at that index (so the index passed
to fscrypt_get_device must be between 0 and (fscrypt_get_num_devices() - 1)
inclusive). This allows callers to avoid having to allocate an array to
pass to fscrypt_get_devices() when they only need to iterate through
each element in the array (and have no use for the array itself).

Patch 2 introduces some functions to fscrypt that help filesystems perform
metadata encryption. Any filesystem that wants to use metadata encryption
can call fscrypt_setup_metadata_encryption() with the super_block of the
filesystem, the encryption algorithm and the descriptor of the metadata
crypt key. The descriptor is looked up in the logon keyring of the
current session with "fscrypt:" as the prefix of the descriptor. The
metadata crypt key is not directly used for encryption - the actual
metadata encryption key is derived from this metadata key (refer to
fscrypt_setup_metadata_encryption() in fs/crypto/metadata_crypt.c for
details). 

The patch also introduces fscrypt_metadata_crypt_bio() which an FS should
call on a bio that the FS wants metadata crypted. The function will add
an encryption context with the metadata encryption key set up by the call
to the above mentioned fscrypt_setup_metadata_encryption().

The patch also introduces fscrypt_metadata_crypt_prepare_all_devices().
Filesystems that use multiple devices should call this function once all
the underlying devices have been determined. An FS might only be able to
determine all the underlying devices after some initial processing that
might already require metadata en/decryption, which is why this function
is separate from fscrypt_setup_metadata_encryption().

Finally, the patch makes the metadata crypt key for the filesystem part
of the key derivation process for all fscrypt file content encryption
keys used with that filesystem - this way, the file content encryption
keys are at least as strong as the metadata encryption key. For more
details please refer to fscrypt_mix_in_metadata_key() in
fs/crypto/metadata_crypt.c

Patch 3 wires up F2FS with the functions introduced in Patch 2. F2FS
will encrypt every block (that's not being encrypted by some other
encryption key, e.g. a per-file key) with the metadata encryption key
except the superblock (and the redundant copy of the superblock). The DUN
of a block is the offset of the block from the start of the F2FS
filesystem.

Please refer to the commit message for why the superblock was excluded from
en/decryption, and other limitations. The superblock and its copy are
stored in plaintext on disk. The encryption algorithm used for metadata
encryption is stored within the superblock itself. Changes to the userspace
tools (that are required to test out metadata encryption with F2FS) are
also being sent out - I'll post a link as a reply to this mail once it's
out.

Changes v1 => v2:
 - The metadata crypt key is no longer used directly for encryption. The
   actual metadata encryption key is now derived from the metadata crypt key.
   A key identifier is also derived from the metadata crypt key (and this
   identifier is verified at FS mount time). The key identifier is stored
   directly in the F2FS superblock, so there's no longer a need for any new
   mount options.
 - The metadata crypt key is now mixed into the key derivation process for
   all subkeys derived from fscrypt master keys
 - Make the metadata key payload in the keyring just the raw bytes of the
   key (instead of having it represent a struct fscrypt_key)
 - export some of the metadata_crypt.c functions, since F2FS can be built
   as a module
 - make FS_ENCRYPTION_METADATA depend on FS_ENCRYPTION_INLINE_CRYPT
 - fscrypt_set_bio_crypt_ctx() calls fscrypt_metadata_crypt_bio()
   directly, so filesystems only need to call fscrypt_set_bio_crypt_ctx()
 - Cleanups and updated docs

Satya Tangirala (3):
  fscrypt, f2fs: replace fscrypt_get_devices with fscrypt_get_device
  fscrypt: Add metadata encryption support
  f2fs: Add metadata encryption support

 Documentation/filesystems/fscrypt.rst |  86 +++++++-
 fs/crypto/Kconfig                     |  12 +
 fs/crypto/Makefile                    |   1 +
 fs/crypto/bio.c                       |   2 +-
 fs/crypto/fscrypt_private.h           |  46 ++++
 fs/crypto/hkdf.c                      |   1 +
 fs/crypto/inline_crypt.c              |  52 ++---
 fs/crypto/keyring.c                   |   4 +
 fs/crypto/metadata_crypt.c            | 303 ++++++++++++++++++++++++++
 fs/ext4/readpage.c                    |   2 +-
 fs/f2fs/data.c                        |  17 +-
 fs/f2fs/f2fs.h                        |   2 +
 fs/f2fs/super.c                       |  60 ++++-
 include/linux/f2fs_fs.h               |   7 +-
 include/linux/fs.h                    |  10 +
 include/linux/fscrypt.h               |  50 ++++-
 16 files changed, 586 insertions(+), 69 deletions(-)
 create mode 100644 fs/crypto/metadata_crypt.c

-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
