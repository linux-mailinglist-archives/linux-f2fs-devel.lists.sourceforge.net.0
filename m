Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A977443
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 00:46:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hr8yU-0005Qw-Cv; Fri, 26 Jul 2019 22:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hr8yT-0005Qp-8K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SNhhwfsls0EybgPnATVWhJNzE3V5212UYdqYLE1dj4Q=; b=aEn6BVV7DDTOCxby9Eb0iM0WXB
 g49BGoPFzNklGVFgj1Wvgal2sY4rzME354CJ5fU1YwTRN8k9cO2AL5KjzY5q6/9lHGLhiwZKRmzd4
 bHNBNUBxCojtDmOSaGlMSM6aNC63BSQopU4qLcjTTQOe4SE0/ZhKAhPsXp3Gz5MtqtSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SNhhwfsls0EybgPnATVWhJNzE3V5212UYdqYLE1dj4Q=; b=N
 6H/rHtCKLyv9Qq7C9knUBwUCPj1yr1yaxxNtUQYxFk1hZrIy6+7fA2jnV7MUmE4XqyfGg0Co/cu66
 3SEyAFJL0JDfZr8a+v3rNPk3hJjv0lefzeUUoPQq+CJ6MEWYgbtj5wX64b/UNgqSJqKRXrix/0KVj
 KgXn5d9KupLkPRuM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hr8yP-0008eS-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:05 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4CB1218B0;
 Fri, 26 Jul 2019 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564181156;
 bh=WjS0jvCksh/aySG03DCroHPwJAunfHDm6VDkmeVCnQY=;
 h=From:To:Cc:Subject:Date:From;
 b=DPIVahC7+GeBRXjiBQy/Ap4fTOqzNHa6uEJLk+ecKPY0ZKwv03jz69JjFYFcBd3uv
 eLZ4PGMxnXdE76B6sYBtXqPvV1m0M6lLqkpu5rCkWFVlC6FsnLn7ZDxZHBBS+b+HF+
 PMeCcvQ8depLFKA+uTKe3ol86Ce2vOMLGid7EIWY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 26 Jul 2019 15:41:25 -0700
Message-Id: <20190726224141.14044-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hr8yP-0008eS-Nr
Subject: [f2fs-dev] [PATCH v7 00/16] fscrypt: key management improvements
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

[Note: I'd like to apply this for v5.4.  Additional review is greatly
 appreciated, especially of the API before it's set in stone.  Thanks!]

This patchset makes major improvements to how keys are added, removed,
and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
adding new ioctls that add and remove encryption keys directly to/from
the filesystem, and by adding a new encryption policy version ("v2")
where the user-provided keys are only used as input to HKDF-SHA512 and
are identified by their cryptographic hash.

All new APIs and all cryptosystem changes are documented in
Documentation/filesystems/fscrypt.rst.  Userspace can use the new key
management ioctls with existing encrypted directories, but migrating to
v2 encryption policies is needed for the full benefits.

These changes solve four interrelated problems:

(1) Providing fscrypt keys via process-subscribed keyrings is abusing
    encryption as an OS-level access control mechanism, causing many
    bugs where processes don't get access to the keys they need -- e.g.,
    when a 'sudo' command or a system service needs to access encrypted
    files.  It's also inconsistent with the filesystem/VFS "view" of
    encrypted files which is global, so sometimes things randomly happen
    to work anyway due to caching.  Regardless, currently almost all
    fscrypt users actually do need global keys, so they're having to use
    workarounds that heavily abuse the session or user keyrings, e.g.
    Android and Chromium OS both use a systemwide "session keyring" and
    the 'fscrypt' tool links all user keyrings into root's user keyring.

(2) Currently there's no way to securely and efficiently remove a
    fscrypt key such that not only is the original key wiped, but also
    all files and directories protected by that key are "locked" and
    their per-file keys wiped.  Many users want this and are using
    'echo 2 > /proc/sys/vm/drop_caches' as a workaround, but this is
    root-only, and also is overkill so can be a performance disaster.

(3) The key derivation function (KDF) that fscrypt uses to derive
    per-file keys is nonstandard, inflexible, and has some weaknesses
    such as being reversible and not evenly distributing the entropy
    from the user-provided keys.

(4) fscrypt doesn't check that the correct key was supplied.  This can
    be a security vulnerability, since it allows malicious local users
    to associate the wrong key with files to which they have read-only
    access, causing other users' processes to read/write the wrong data.

Ultimately, the solutions to these problems all tie into each other.  By
adding a filesystem-level encryption keyring with ioctls to add/remove
keys to/from it, the keys are made usable filesystem-wide (solves
problem #1).  It also becomes easy to track the inodes that were
"unlocked" with each key, so they can be evicted when the key is removed
(solves problem #2).  Moreover, the filesystem-level keyring is a
natural place to store an HMAC transform keyed by each key, thus making
it easy and efficient to switch the KDF to HKDF (solves problem #3).

Finally, to check that the correct key was supplied, I use HKDF to
derive a cryptographically secure key_identifier for each key (solves
problem #4).  This in combination with key quotas and other careful
precautions also makes it safe to allow non-root users to add and remove
keys to/from the filesystem-level keyring.  Thus, all problems are
solved without having to restrict the fscrypt API to root only.

The patchset is organized as follows:

- Patches 1-8 add new ioctls FS_IOC_ADD_ENCRYPTION_KEY,
  FS_IOC_REMOVE_ENCRYPTION_KEY, and FS_IOC_GET_ENCRYPTION_KEY_STATUS.
  Adding a key logically "unlocks" all files on the filesystem that are
  protected by that key; removing a key "locks" them again.

- Patches 9-12 add support for v2 encryption policies.

- Patches 13-15 wire up the new ioctls to ext4, f2fs, and ubifs.

- Patch 16 updates the fscrypt documentation for all the changes.

This patchset applies to v5.3-rc1 with the pending fscrypt cleanup
patches applied (https://patchwork.kernel.org/patch/11057589/ and
https://patchwork.kernel.org/cover/11057583/).
You can also get it from git at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
	Branch:       fscrypt-key-mgmt-improvements-v7

I've written xfstests for the new APIs.  They test the APIs themselves
as well as verify the correctness of the ciphertext stored on-disk for
v2 encryption policies.  The tests can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git
	Branch:       fscrypt-key-mgmt-improvements

The xfstests depend on new xfs_io commands which can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfsprogs-dev.git
	Branch:       fscrypt-key-mgmt-improvements

I've also made proof-of-concept changes to the 'fscrypt' userspace
program (https://github.com/google/fscrypt) to make it support v2
encryption policies.  You can find these changes in git at:

	Repository:   https://github.com/ebiggers/fscrypt.git
	Branch:       fscrypt-key-mgmt-improvements

To make the 'fscrypt' userspace program experimentally use v2 encryption
policies on new encrypted directories, add the following to
/etc/fscrypt.conf within the "options" section:

	"policy_version": "2"

Finally, it's also planned for Android and Chromium OS to switch to the
new ioctls and eventually to v2 encryption policies.  Work-in-progress,
proof-of-concept changes by Satya Tangirala for AOSP can be found at
https://android-review.googlesource.com/q/topic:fscrypt-key-mgmt-improvements

Changes v6 => v7:
    - Rebase onto v5.3-rc1 and the pending fscrypt cleanups.
    - Work around false positive compile-time buffer overflow check in
      copy_from_user() in fscrypt_ioctl_set_policy() when building an
      i386 kernel in a specific config with an old gcc version.
    - A few very minor cleanups.

Changes v5 => v6:
    - Change HKDF to use the specification-defined default salt rather
      than a custom fixed salt, and prepend the string "fscrypt" to
      'info' instead.  This is arguably needed to match how RFC 5869 and
      SP 800-56C are worded.  Both ways are secure in this context, so
      prefer the "boring" way that clearly matches the standards.
    - Rebase onto v5.2-rc1.
    - A few small cleanups.

Changes v4 => v5:
    - Simplify shrink_dcache_inode(), as suggested by Al Viro;
      also move it into fs/crypto/.
    - Fix a build error on some architectures by calling
      copy_from_user() rather than get_user() with a __u64 pointer.

Changes v3 => v4:
    - Introduce fscrypt_sb_free() to avoid an extra #ifdef.
    - Fix UBIFS's ->drop_inode().
    - Add 'version' to union fscrypt_policy and union fscrypt_context.

Changes v2 => v3:
    - Use ->drop_inode() to trigger the inode eviction during/after
      FS_IOC_REMOVE_ENCRYPTION_KEY, as suggested by Dave Chinner.
    - A few small cleanups.

v1 of this patchset was sent in October 2017 with title "fscrypt:
filesystem-level keyring and v2 policy support".  This revived version
follows the same basic design but incorporates numerous improvements,
such as splitting keyinfo.c into multiple files for much better
understandability, and introducing "per-mode" encryption keys to
implement the semantics of the DIRECT_KEY encryption policy flag.

Eric Biggers (16):
  fs, fscrypt: move uapi definitions to new header <linux/fscrypt.h>
  fscrypt: use FSCRYPT_ prefix for uapi constants
  fscrypt: use FSCRYPT_* definitions, not FS_*
  fscrypt: add ->ci_inode to fscrypt_info
  fscrypt: refactor v1 policy key setup into keysetup_legacy.c
  fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
  fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
  fscrypt: add FS_IOC_GET_ENCRYPTION_KEY_STATUS ioctl
  fscrypt: add an HKDF-SHA512 implementation
  fscrypt: v2 encryption policy support
  fscrypt: allow unprivileged users to add/remove keys for v2 policies
  fscrypt: require that key be added when setting a v2 encryption policy
  ext4: wire up new fscrypt ioctls
  f2fs: wire up new fscrypt ioctls
  ubifs: wire up new fscrypt ioctls
  fscrypt: document the new ioctls and policy version

 Documentation/filesystems/fscrypt.rst | 670 ++++++++++++++----
 MAINTAINERS                           |   1 +
 fs/crypto/Kconfig                     |   2 +
 fs/crypto/Makefile                    |  10 +-
 fs/crypto/crypto.c                    |  12 +-
 fs/crypto/fname.c                     |   5 +-
 fs/crypto/fscrypt_private.h           | 366 +++++++++-
 fs/crypto/hkdf.c                      | 181 +++++
 fs/crypto/keyinfo.c                   | 627 -----------------
 fs/crypto/keyring.c                   | 957 ++++++++++++++++++++++++++
 fs/crypto/keysetup.c                  | 569 +++++++++++++++
 fs/crypto/keysetup_legacy.c           | 340 +++++++++
 fs/crypto/policy.c                    | 428 +++++++++---
 fs/ext4/ioctl.c                       |  24 +
 fs/ext4/super.c                       |   3 +
 fs/f2fs/file.c                        |  46 ++
 fs/f2fs/super.c                       |   2 +
 fs/super.c                            |   2 +
 fs/ubifs/ioctl.c                      |  16 +
 fs/ubifs/super.c                      |  11 +
 include/linux/fs.h                    |   1 +
 include/linux/fscrypt.h               |  48 +-
 include/uapi/linux/fs.h               |  54 +-
 include/uapi/linux/fscrypt.h          | 164 +++++
 24 files changed, 3583 insertions(+), 956 deletions(-)
 create mode 100644 fs/crypto/hkdf.c
 delete mode 100644 fs/crypto/keyinfo.c
 create mode 100644 fs/crypto/keyring.c
 create mode 100644 fs/crypto/keysetup.c
 create mode 100644 fs/crypto/keysetup_legacy.c
 create mode 100644 include/uapi/linux/fscrypt.h

-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
