Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22210F777
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQCT/VFUz8v6+MSyuA7H3+eApR41mofnMYp5n+MchHk=; b=iQZoVzQbsu++HAp83Cm96AX6Hc
	POYsNuTV3eFHEnxQbJ3qiUsSmE7++piTlgUd+9WnfaeUuaDpv/6O0Sn2izkwuDQcgKAJBzgNYMoHN
	Q6k4SDv7nftTP+Tt8XUPPKwwkbGZP6WbLWJec5Wk1/IiC61qRIZCyLGAgEwSUz5whzbM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0yG-0001vj-Hq; Tue, 03 Dec 2019 05:43:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3de7lXQYKAN4DROSENGOOGLE.COM@flex--drosen.bounces.google.com>)
 id 1ic0yF-0001vb-Cu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=; b=k4LVuJSYAynfRFcm4Ld8k7TyUy
 tBoMVZTZPeAPmNGIRMsXdMQtndt4t6ee5sbwp2DMqRTa1sL1ExEkYat+7qrxm5qsz9nxOlIxQxJh0
 H1MhiP+Glnln7usyzWdZQ3/KTqf+otELSo3Ek/gaIOdSIyl5t4Q/Uw4/rGSWXbl3UmvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=; b=j
 EbWn+tcSgGkixina5rNM4tY/JEAataI92JeSVBCE5bfUOaCcRMQdwUqrz1qB/MtP96aBlAFiRPIE9
 28xiE587N/X++dWSEyMosPcvVcKomEgVWXl2j6/OOqczyTAjD3AnFnNsgsGxdc8h+z5CsyWfcJ12N
 XdfRNExDBFSXBxfM=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0yA-005KTy-Jc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:43:35 +0000
Received: by mail-pl1-f202.google.com with SMTP id be1so1185937plb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=;
 b=K1e8TPhpNMFVfy3zpUvxGh3rgUGzKKm5sRwldvLEOIz/KQFH4IXBVzoD7xIeXW+sI+
 OHuBZYRP4c76okFVaCmF7t+ZhiyQ47NNKd8za4hEYxZ/9eN2nJNM68LEf9dSAhEHOwN4
 a9+fCrUqBS2/vijwnB/zHYZ3QZP70NycgF/0gJuHNVgL4OVsK9mXOkllWTRUysHBF+wa
 Gak/gb8gp9GJqewrQ7lybxNuknjIdN/43X38dwmp6wpmPxfFAzDAyu5634JeWK/S45eI
 j3VRm8PmCQYeh3ZNcfCFmHhOhd5swp1KGjEMgNcsj8Lz9Zt42UsPXNuvXXoYDhc3LwDH
 UWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=JS26lqPOsyf+GCzfh2q7I14K35HWfvfL+jqbIeTiEhs=;
 b=bANdFEZy36fwjmsvnCluVXXzJwbuoWPTilyoeT2K8A0AcSwIQBG4N4DhA6O1Q935Fp
 bOExvOKUUannTZFNrLw37Tu54+jWfRzVIbFYdgMKII2gD+24xTBnJKJfevPOlNVkWuQA
 L+tsmClXhQXV9xFnNNJHKNIL+WqjJtgZJpVCwADvhrBdw/0Dfboi55xmO0D76Y81DT9X
 Bv6UEBC8lzOj0/cc3+ZlmVojcga6kr2+UQkKQ9dP6ApK/juF5aLv9sD744t5tUojPxTq
 gixtitMhCpTAiFl6ItC4zq6BI8SGyzroZsXbZHCwsdWFduwMBdMLT4tBsJueKNC3Vfj1
 n2wQ==
X-Gm-Message-State: APjAAAUykRt/GcU/1gIJeicvTKJ0mrCsq2cxlgdvN4MNBsM2jte2ONnO
 oRMzEe0r+y/SIRpL0HoIBTLQap39kaE=
X-Google-Smtp-Source: APXvYqwAUHq1SM7kgd3huIBZdhakSOyUU8oN/jfGh2+n4qRA8Pa17aUBVqzak3AMNCxa4UE+GvJKUKnGXqc=
X-Received: by 2002:a63:4104:: with SMTP id o4mr3339080pga.169.1575349877576; 
 Mon, 02 Dec 2019 21:11:17 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:41 -0800
Message-Id: <20191203051049.44573-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.8 (-------)
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic0yA-005KTy-Jc
Subject: [f2fs-dev] [PATCH 0/8] Support for Casefolding and Encryption
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ext4 and F2FS currently both support casefolding and encryption, but not at the
same time. These patches aim to rectify that.

Since directory names are stored case preserved, we cannot just take the hash
of the ciphertext. Instead we use the siphash of the casefolded name. With this
we no longer have a direct path from an encrypted name to the hash without the
key. To deal with this, fscrypt now always includes the hash in the name it
presents when the key is not present. There is a pre-existing bug where you can
change parts of the hash and still match the name so long as the disruption to
the hash does not happen to affect lookup on that filesystem. I'm not sure how
to fix that without making ext4 lookups slower in the more common case.

I moved the identical dcache operations for ext4 and f2fs into the VFS, as any
filesystem that uses casefolding will need the same code. This will also allow
further optimizations to that path, although my current changes don't take
advantage of that yet.

For Ext4, this also means that we need to store the hash on disk. We only do so
for encrypted and casefolded directories to avoid on disk format changes.
Previously encryption and casefolding could not live on the same filesystem,
and we're relaxing that requirement. F2fs is a bit more straightforward since
it already stores hashes on disk.

I've updated the related tools with just enough to enable the feature. I still
need to adjust their respective fsck's, although without access to the keys,
they won't be able to verify the hashes of casefolded and encrypted names.


Daniel Rosenberg (8):
  fscrypt: Add siphash and hash key for policy v2
  fscrypt: Don't allow v1 policies with casefolding
  fscrypt: Change format of no-key token
  vfs: Fold casefolding into vfs
  f2fs: Handle casefolding with Encryption
  ext4: Use struct super_blocks' casefold data
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/Kconfig                            |   1 +
 fs/crypto/fname.c                            | 204 +++++++++---
 fs/crypto/fscrypt_private.h                  |   9 +
 fs/crypto/keysetup.c                         |  29 +-
 fs/crypto/policy.c                           |  26 +-
 fs/dcache.c                                  |  35 ++
 fs/ext4/dir.c                                |  72 +----
 fs/ext4/ext4.h                               |  87 +++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 +--
 fs/ext4/namei.c                              | 318 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 115 +++----
 fs/f2fs/f2fs.h                               |  14 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |   8 +-
 fs/inode.c                                   |   8 +
 fs/namei.c                                   |  43 ++-
 include/linux/fs.h                           |  12 +
 include/linux/fscrypt.h                      | 107 +++----
 24 files changed, 797 insertions(+), 462 deletions(-)

-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
