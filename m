Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56D14134E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 22:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LdLNxt9nX9bO/Bfq9gth63S7jWqwStn9Qd8L3GtaoxA=; b=G+c54o3qMjkof8Vr2Tbf5HaypI
	QH0X6gfrUK2rtQUsDoZHJMAhc6vHXfnLkHupznoF8Aq9NF1+MetkWxBt3ZqhYEvm6quxEGBUUjMdv
	N0p2c2l0SpC0v/ol6Hs1a/Xw4ZZgt2jmPlbMLAv+BuO7ff9v3eGv8whUHsD7M5SleEA4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isZOT-0001xp-BM; Fri, 17 Jan 2020 21:43:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3XioiXgYKADMSgdhTcVddVaT.Rdb@flex--drosen.bounces.google.com>)
 id 1isZOQ-0001xc-QW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yBEf4c2Y/V+ZNwnYQzLFCcZKpZySQQ5dJ9X0QGzY9eo=; b=KDxbfkpARPjKZBlrOvASKCeOgU
 YyDFDFZpqI+DL4Ra9kqT/BUURidpDXDAyYkzJ6RxKyJTwwgdHw34uiEmjdIaW8z/ei5lk3Oziholp
 UmLqx/pbwME24KPUGTqiJYs2RmU0wrSsyLuipsgk2DHO9chm+rM6LU9BublfVjz4fdAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yBEf4c2Y/V+ZNwnYQzLFCcZKpZySQQ5dJ9X0QGzY9eo=; b=j
 tTaK2QXToIqZp8+zMrjdvlVmuc5BZPNixhFha6pNF6NNz309RYNz8AyI+Uz/UgU4HwQcKzFB2bb6K
 hGHffLEI9z93PdBbgWBC0aeG9u6mz4PkCMwPU7V0iFuUOw4RJPNEuX9GnSZEiyF6uVIz40RjUBntE
 5OcsUdyLH74+Op2Y=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isZOO-008f6s-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:43:02 +0000
Received: by mail-pl1-f202.google.com with SMTP id t17so11397389ply.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=yBEf4c2Y/V+ZNwnYQzLFCcZKpZySQQ5dJ9X0QGzY9eo=;
 b=hrp+gp+g8aB/jpumGkpuc5F5wkzC/eegSUgKsuaP5vuBUKLF33qoqqM2MafIuVh9s1
 jI2A1GYFMvU+zXn/tCLnmGXTqm3p0Gd4ZJGvWkGqgwBJx9K3w5rosKRTKFkLyeVpf7r7
 WFGq/cvvGa0UIt89Z8qEnh4tUigSQ7k5T7oowlnUjWNYSj1q2cLitkSLMyMd0jkKCkAD
 anxNB8ZROhRvpyrX/Yj82zl81n9GScBR9YTXGVMqHu3OoPibEEExYkK8+hQXWp7bAWgy
 5hmPB7B0i/vXCHN1gPjV6lJhuK5oImOVpW8qPq4w+BW8SnU9RkZI5NRwJt35MaEoucrI
 kOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=yBEf4c2Y/V+ZNwnYQzLFCcZKpZySQQ5dJ9X0QGzY9eo=;
 b=AAmyZJCEik5D3u2KmPqm9ZQQmsP5iTj7JCyTXMUJ7LRi1pFp0KxMSjNMcrYBCPr8lx
 HqSzjOCyr5rsx+/ug/539WdAJHwl6ReEvxSM8PHx4br2RiFpEpHkcAmjxz6cTy972V07
 tOt6ll4YyK6vRxpJBgFq8/ErkQU/hhuDtDMnnCimfYtD8S3tudLsWnoo3BbZ+e2WI+Yp
 y4aly4ALSAjDL7TW1kSDszKIbepv9JdxHbXl6buRg1uDyAxrFuKF64p4qe76l2OTsJmt
 X6wvLESC8bCDuAUYrKsv9KmdJYFSdb4DZCUUBkgY7xFlotPRSKdunXUzSXQ2hap0D+7H
 q8Wg==
X-Gm-Message-State: APjAAAVENVCkH+de8cSN3o3M5w6K8WSQgOoUh0iqg8vH+oL8ZmqA/mgg
 TERe05R+Vrt3dr9jkiPeVhFyQIv/jPw=
X-Google-Smtp-Source: APXvYqx/thRfotMiEcNYQU3muvCEizuxjwfQx4bfJuDJBpTmZngE9VJym447R2DaU34FJTWJBfRydBLRlJY=
X-Received: by 2002:a63:ff20:: with SMTP id k32mr45963088pgi.448.1579297374588; 
 Fri, 17 Jan 2020 13:42:54 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:37 -0800
Message-Id: <20200117214246.235591-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.202 listed in wl.mailspike.net]
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
X-Headers-End: 1isZOO-008f6s-Gb
Subject: [f2fs-dev] [PATCH v3 0/9] Support for Casefolding and Encryption
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

These patches are all on top of fscrypt's developement branch

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
need to adjust ext4's fsck's, although without access to the keys,
neither fsck will be able to verify the hashes of casefolded and encrypted names.

v3 changes:
fscrypt patch only creates hash key if it will be needed.
Rebased on top of fscrypt branch, reconstified match functions in ext4/f2fs

v2 changes:
fscrypt moved to separate thread to rebase on fscrypt dev branch
addressed feedback, plus some minor fixes


Daniel Rosenberg (9):
  fscrypt: Add siphash and hash key for policy v2
  fscrypt: Don't allow v1 policies with casefolding
  fscrypt: Change format of no-key token
  fscrypt: Only create hash key when needed
  vfs: Fold casefolding into vfs
  f2fs: Handle casefolding with Encryption
  ext4: Use struct super_blocks' casefold data
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/Kconfig                            |   1 +
 fs/crypto/fname.c                            | 232 ++++++++++---
 fs/crypto/fscrypt_private.h                  |   9 +
 fs/crypto/keysetup.c                         |  35 +-
 fs/crypto/policy.c                           |  53 +++
 fs/dcache.c                                  |  28 ++
 fs/ext4/dir.c                                |  75 +----
 fs/ext4/ext4.h                               |  85 +++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 +--
 fs/ext4/namei.c                              | 324 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 112 +++----
 fs/f2fs/f2fs.h                               |  12 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |   8 +-
 fs/inode.c                                   |   3 +-
 fs/namei.c                                   |  41 ++-
 include/linux/fs.h                           |  10 +
 include/linux/fscrypt.h                      |  95 ++----
 include/linux/unicode.h                      |  14 +
 25 files changed, 835 insertions(+), 473 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
