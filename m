Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445E156256
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 02:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NBWIsAh/OBq1qDGaKRtusIWwkKtuMwsZTsbde98bKpQ=; b=RSxz9In8h+c5a7+jj8ZwnKBYTE
	WXWbtP3nrkVEtOzUkotSPVvTIof5JVTOMV+5WxxZ+Gn0S+V6Sjgj6KI+ffD7YQ0SX9jYCYKxRti3w
	ZDC5YFzStIKrArxbS8UGzFzXPVBV7FgYlh6qxTZv1KXAhZpMn1JT9kImPnZhy36W7R1o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0F2T-0005CM-UO; Sat, 08 Feb 2020 01:36:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3fBA-XgYKAI0u859v4x55x2v.t53@flex--drosen.bounces.google.com>)
 id 1j0F2S-0005CA-O0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=; b=NQvVnfVe0xs7KhbiV1I8SmJryp
 yex6t9+hYxTKSerbZd67cLdAyWy+uokJ36rkyaaGmXhY+K/UZjrotRtj0p5Y1IiV5Us+wMPdgeI42
 L8PJrmZ+sSV7wHGPvTDP7OFV6EpHM3msTJaloAQNmlOoYU+qGeBP251LWwSdjY5nlrws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=; b=K
 EJ//ws5rYyLDGoSbsD5oN1daObuJAZyCQRZesJpYpw/pjhtoU2Bzkr7STgeGVInqz+ruzl9hvtzLo
 bg6Y/A/pgdgpz3lzx/yxrA4A6z+gZLWzqt2g1FKKzURgCNDAEQnQMb8X/pyZUy8BJlyEgT+z7Kh7X
 j/GB7rZ9U99O3Ajk=;
Received: from mail-pl1-f202.google.com ([209.85.214.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j0F2Q-00DrP3-4k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:04 +0000
Received: by mail-pl1-f202.google.com with SMTP id 36so622938plc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2020 17:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=;
 b=NEywg0M14MnLDWsKOucPQs1roEACrJM00yn5kNJb9zMFZHTZqInTtQiy8IBGz9p2Hj
 S2N+jRLMGwbFKmZnn0koP7Tcjk3PRRe25bAoZCO6ZvkOdazou5mlWmZGxidYIkcSGuOg
 Nc74v+ubh+mtZLefCCwVuXd9BDeFc8qAxw99sNFE3K2Kpg4BaE72oOWDN6XOg4MbOAr3
 dE6k/7AgKUChxUQkZAzZOa2U+EcNbV65+xrCtvviZzWWuHM3cy3/YjezlVDdUeYdz/l0
 cT1t9iCftO1kkoHUVh9CSB9TUY9yRGjwmslRWvlUSeA23a9y0cc6gFqjzMT4jbC4J+6s
 Ch8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GmdJt27134kNRYXiKp4wrB+O4TXMZQXM52BZBGOfEtM=;
 b=jYl4+Tu0CCAoU8qvX2bxktxJ+wHWptqscnF6V7e1QeydaMr4b/YHChSibOzzw5UTLK
 Vd0tHdv2GJ2XAOKtT4PDFzFuVzgwd8i8JDo59QiNoplgcfce0wiOHaQiU5zd9RlnxanT
 BAa/OOTOa6vHVPDmfRpbIINsYyEwuPDpgNH2/4EQRipXqyozUYWK7IsTpOg7CnvohYeV
 ZLjjTxdc+57ImP9iOP0cek9wh6BgbBw+WKH7dydomSgvwVcV/+YXT1qb9tV7+NIKcq0D
 Yt3kOkHwo2iaOpps0C1W8NuWAfnYsU2DNubL/V1icZVUnKkaw2LaN4+ZHJwMr6/XXde4
 fyYg==
X-Gm-Message-State: APjAAAW5pL66gGvRTg8u9GGrqf5v9qVLlxhiJlCOsbRTfNKDorCFMJAW
 QsgAUMN90O36N2ZdOo0x+MR6YlV0Z60=
X-Google-Smtp-Source: APXvYqzX2zjDvOsycNvWYLOgK+VBNHyLR+WR4NBkkN5UhCL4Cx9+zC71iQcfsB2K3n5Ocuz6cv+mlKk8NrQ=
X-Received: by 2002:a63:211f:: with SMTP id h31mr1939792pgh.299.1581125756217; 
 Fri, 07 Feb 2020 17:35:56 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:44 -0800
Message-Id: <20200208013552.241832-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.8 (-------)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0F2Q-00DrP3-4k
Subject: [f2fs-dev] [PATCH v7 0/8] Support fof Casefolding and Encryption
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
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These patches are all on top of torvalds/master

Ext4 and F2FS currently both support casefolding and encryption, but not at
the same time. These patches aim to rectify that.

I moved the identical casefolding dcache operations for ext4 and f2fs into
fs/libfs.c, as all filesystems using casefolded names will want them.

I've also adjust fscrypt to not set it's d_revalidate operation during it's
prepare lookup, instead having the calling filesystem set it up. This is
done to that the filesystem may have it's own dentry_operations. Also added
a helper function in libfs.c that will work for filesystems supporting both
casefolding and fscrypt.

For Ext4, since the hash for encrypted casefolded directory names cannot be
computed without the key, we need to store the hash on disk. We only do so
for encrypted and casefolded directories to avoid on disk format changes.
Previously encryption and casefolding could not be on the same filesystem,
and we're relaxing that requirement. F2fs is a bit more straightforward
since it already stores hashes on disk.

I've updated the related tools with just enough to enable the feature. I
still need to adjust ext4's fsck's, although without access to the keys,
neither fsck will be able to verify the hashes of casefolded and encrypted
names.

v7 chances:
Moved dentry operations from unicode to libfs, added new iterator function
to unicode to allow this.
Added libfs function for setting dentries to remove code duplication between
ext4 and f2fs.

v6 changes:
Went back to using dentry_operations for casefolding. Provided standard
implementations in fs/unicode, avoiding extra allocation in d_hash op.
Moved fscrypt d_ops setting to be filesystem's responsibility to maintain
compatibility with casefolding and overlayfs if casefolding is not used
fixes some f2fs error handling

v4-5: patches submitted on fscrypt

v3 changes:
fscrypt patch only creates hash key if it will be needed.
Rebased on top of fscrypt branch, reconstified match functions in ext4/f2fs

v2 changes:
fscrypt moved to separate thread to rebase on fscrypt dev branch
addressed feedback, plus some minor fixes


Daniel Rosenberg (8):
  unicode: Add utf8_casefold_iter
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption
  ext4: Hande casefolding with encryption
  ext4: Optimize match for casefolded encrypted dirs

 Documentation/filesystems/ext4/directory.rst |  27 ++
 fs/crypto/fname.c                            |   7 +-
 fs/crypto/fscrypt_private.h                  |   1 -
 fs/crypto/hooks.c                            |   1 -
 fs/ext4/dir.c                                |  78 +----
 fs/ext4/ext4.h                               |  93 ++++--
 fs/ext4/hash.c                               |  26 +-
 fs/ext4/ialloc.c                             |   5 +-
 fs/ext4/inline.c                             |  41 ++-
 fs/ext4/namei.c                              | 325 ++++++++++++-------
 fs/ext4/super.c                              |  21 +-
 fs/f2fs/dir.c                                | 127 +++-----
 fs/f2fs/f2fs.h                               |  15 +-
 fs/f2fs/hash.c                               |  25 +-
 fs/f2fs/inline.c                             |   9 +-
 fs/f2fs/namei.c                              |   1 +
 fs/f2fs/super.c                              |  17 +-
 fs/f2fs/sysfs.c                              |  10 +-
 fs/libfs.c                                   | 127 ++++++++
 fs/ubifs/dir.c                               |  18 +
 fs/unicode/utf8-core.c                       |  25 +-
 include/linux/f2fs_fs.h                      |   3 -
 include/linux/fs.h                           |  24 ++
 include/linux/fscrypt.h                      |   6 +-
 include/linux/unicode.h                      |  10 +
 25 files changed, 671 insertions(+), 371 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
