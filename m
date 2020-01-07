Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7B131F6A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 06:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iKQosmciVMlx9MIhHt54uWwXR9q0CGzKD5hu5d0tO7M=; b=bO546fb1cPw5o1XLmK/R924dUI
	LURv5AH4rvKDSa+mn4UOHNoDs7yi97xAEOZ5bThNhmksY0Ut0D7znXR6alscMwRvTtx5GKy+zZF2+
	H/d8VGaC3YeMLWgp4/FOB43ck9E3DWh2T+hFCMixEm1zuswwidXW/978wUzGmVd56bVk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iohd6-0001cI-Sg; Tue, 07 Jan 2020 05:42:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3PRQUXgYKAKwPdaeQZSaaSXQ.OaY@flex--drosen.bounces.google.com>)
 id 1iohd5-0001cB-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfX1tvKpjBFaGwVknnvW2VBwxewGwbcoGgPS02CBSEM=; b=CaheCPFIDLICN2LEJJ9ErQac9D
 4SIKTjZav7jTQvKr54q4gT4PNyGW0AIB4OkCH2Jog34ARYpwEHBCDCkBWAAWwkfLpJleDujbHoJE+
 4FwZbQzxZOKvHIrg/inhvffMIAQvfDMvSk0Hts3fEZcYrk9vdkKLojNVV7xNFPiK0NRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cfX1tvKpjBFaGwVknnvW2VBwxewGwbcoGgPS02CBSEM=; b=R
 7GjLwD6QKL4lEqiA0iiJzGBr3HjnLRJ6JW8b47+FhMldwjOdTHor7RBMpn9rwOoj9fPBhS7+hPTOO
 lXo2mmsG2q84TY722QlVApHp2AUpz5LUWnUrX8xaVPMk5DLz66YKkq/bRPbynCNgdOWn3S71b88At
 SgWrOPSYP5FjRBZc=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iohcu-00CBFg-2v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:42:11 +0000
Received: by mail-qt1-f201.google.com with SMTP id t4so35871264qtd.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jan 2020 21:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=cfX1tvKpjBFaGwVknnvW2VBwxewGwbcoGgPS02CBSEM=;
 b=Q40BGR+McgMbCgqtKK+XRsRmJJBj/BH4LjOY1inQamlLz1Onc25gJfKSbGCbLp3BV6
 kKbmIcg1Qs8OlNWNQNQVhlpP5eQeWpb8bdcg/T1uA1M21Nwy3AmiDfyWJt0tvnczfV4l
 F5+GHxcTVIFp5EjxqoKHbB5BR5AscstZMpWufBT8/BJSWPsoka2tUFUerrjyIkmcUjjK
 wZ3VxyoNX/QvFD5IuLtoVSHr99qrCNN1Y+s01aUz0lsnsY4sqo6j8cw1VnQNt7bNfDGH
 /9+qGi2HEFX3SqvMkNy9rSPpAhx5BvUPP3MMTK/c1L92gGjvYGn+U5QaEIouLcVwROXe
 FVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=cfX1tvKpjBFaGwVknnvW2VBwxewGwbcoGgPS02CBSEM=;
 b=bjFGhSftvt88lSk8/QdPCVxYSSngRbWxFe9nJtttvPSmEkaFh3NujevZ0XgOti9zLC
 C3P6crmJz+7+Lk6bFRzG6/r5FTcBLWsXlP3ZAfXyG16U1jvSl3YE06KjmKgDGSuXEs7g
 Zqv+PVUmdQAe2VeI8z7+yQHOK4owwxlcIYwmOP6VloiYbZ1ZvGTvwCW+l79EfVjKiM74
 S5orXnp/ypocWFrgBYiWsVmobWDrlxiNdMvdmJxa9XsKpwNTUSrIeDN8avX3EYdvmPjn
 7BYkp76RL3lZ0jsOpUPO328nogJB5Lv1syYT+Bwl7xjmeA5uJR7V7yizvbWMAqUkVWXm
 5lsA==
X-Gm-Message-State: APjAAAWo+f6Iy0TJFliao4rikPtbkQXjwA85yJk3wM37AR1KQXrAp34v
 BcqYM3eSuYFg5eh7tVoOA4B0xPM9Wh0=
X-Google-Smtp-Source: APXvYqzc67czlLj1xc/BSkQkduLdtiKKbLVUdrPq7hUPjUVp5UmYvrkDtchUfmBzIECNLQOquU+7Qzeor7M=
X-Received: by 2002:a1f:8d57:: with SMTP id p84mr56402733vkd.65.1578374205529; 
 Mon, 06 Jan 2020 21:16:45 -0800 (PST)
Date: Mon,  6 Jan 2020 21:16:32 -0800
Message-Id: <20200107051638.40893-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iohcu-00CBFg-2v
Subject: [f2fs-dev] [PATCH v2 0/6] Support for Casefolding and Encryption
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

Ext4 and F2FS currently both support casefolding and encryption, but not at
the same time. These patches aim to rectify that.

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

changes:
fscrypt moved to separate thread to rebase on fscrypt dev branch
addressed feedback, plus some minor fixes

Daniel Rosenberg (6):
  TMP: fscrypt: Add support for casefolding with encryption
  vfs: Fold casefolding into vfs
  f2fs: Handle casefolding with Encryption
  ext4: Use struct super_blocks' casefold data
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/Kconfig                            |   1 +
 fs/crypto/fname.c                            | 234 ++++++++++---
 fs/crypto/fscrypt_private.h                  |   9 +
 fs/crypto/keysetup.c                         |  32 +-
 fs/crypto/policy.c                           |  45 ++-
 fs/dcache.c                                  |  28 ++
 fs/ext4/dir.c                                |  75 +----
 fs/ext4/ext4.h                               |  87 +++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 ++-
 fs/ext4/namei.c                              | 326 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 114 +++----
 fs/f2fs/f2fs.h                               |  14 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |   8 +-
 fs/inode.c                                   |   7 +
 fs/namei.c                                   |  41 ++-
 include/linux/fs.h                           |  10 +
 include/linux/fscrypt.h                      |  96 ++----
 include/linux/unicode.h                      |  14 +
 25 files changed, 835 insertions(+), 477 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
