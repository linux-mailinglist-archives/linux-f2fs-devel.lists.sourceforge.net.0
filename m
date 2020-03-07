Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2417CB0C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Mar 2020 03:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uIhv/BTPhX6lOvkHtfjbkloW6OAJXbKBN+KCyoICDi4=; b=KhuJbt96xbfKpdGTTD1sX1nJOj
	GKOxI6jgRFYg7tEuvqPD/ndgKfuwr/LpfG5hAeLj/sO2awOHYeKHqnoxci49yz9R/EjxZ6es3nwWl
	9mcIyXlzH7PodVhe0rkLH8z8CvVsx5m0gNIVe8LbDPxUsnquEX4tAWzFDBANYW+wTMJw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jAPKX-0004fU-P6; Sat, 07 Mar 2020 02:36:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3sQhjXgYKAEgn1y2oxqyyqvo.myw@flex--drosen.bounces.google.com>)
 id 1jAPKV-0004fL-56
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 02:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hL4QYmipQbbtBF3hqX0FdDc0KzQVh/PklVg+OKiKB0c=; b=li9GiTne7ckSAipWfQ+mkUb9cP
 yBfLk/m7rw0uaI4q3H7kZMYkA6TF733dAQsATVsaHaIzIGBtQlA3xGFXokfxZl+GIqF3x/R49I1Qf
 Tr+/JemWhwVHJ3ra0I2QJXjs94oJ3DFtLxOXaXG0juD5NsdYw8Yb8Xd/TE8CM6YQMde8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hL4QYmipQbbtBF3hqX0FdDc0KzQVh/PklVg+OKiKB0c=; b=P
 eixVhMou0ArgMW21rslgkaPkvfBouJzqvt825Y9RFfab/AoQza8Dg4jsz3UQQFJglmaSVnGoT0b2S
 H3vdDLLwVmscpOyRREeP3oJsx3sLoMjT4QzLt69418hIQPHK85rWHTvM/Mtcnb8rcsJK6g7I4griP
 WQFaJDVEcz8jWUwY=;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jAPKR-00AvYV-0c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 02:36:43 +0000
Received: by mail-pj1-f74.google.com with SMTP id r3so2338347pjj.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Mar 2020 18:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hL4QYmipQbbtBF3hqX0FdDc0KzQVh/PklVg+OKiKB0c=;
 b=fH4KDebpx8sfR/ExNItOLzsNNZbzuWPMaFA6X0gtKuiYWaa3VS/gCqm9U3BgcKI1kG
 e7/FD5PABlXZvNRNPlaiyvNYxjH7MJXMmOpwXyefWgZjzeJtvh26HfJuAjFe7Yy9lOA1
 t2TLyoLjiSbm5QKizkXqoTTxJuK4yPWtNqNJRJK26GNzaWFtpT4tlAJTLhqIhRhPxHpU
 4WYWqBTcoH+Bl6qgJCQ7uHhzGnrfa3KaK30WACW8WGDTDkP8dSqvFw1QpLKEpoGjkE21
 A1Z2i6nYM+2DB8zOPZiduwEW9dh0TwsUMvd2rF/qkovCw+rOowod48n/BhxsW34sUgWH
 3qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hL4QYmipQbbtBF3hqX0FdDc0KzQVh/PklVg+OKiKB0c=;
 b=J007S91nJsfiU8Vji+6j70RDu4/ByLM7jApuUbi8qR+xJ1d1LABMoJd4TseHqWZXkb
 e2GOmtCm103uMD3x2jye4mOF0uEFzyoTAuDf0AYr6oP7IQYGkQ3h0GQx6CU1fuhMhqrI
 Jsx6/6aikUYaaYUWMX8z4O3eMwQ+gIBlJaQdXCr1WLG9iTWHiIlA+hUpWdQRz3gBfhyI
 EQqMQ819oI2zY22OM0NP0rQJ5xxvLlIQxtNkDHUFccmvTzQwmEf39mLig9Yxem1XyW8g
 f96VJG+b/l7tIzksjtg4puaM8JyQz0yKvnxRHmt/I/89MF0N5dq7oxgDcunytJ/I2by2
 eYXw==
X-Gm-Message-State: ANhLgQ0UA8f8UJ+hHyYtoKM5bRZjYo+c5tAlTPlD41SyxBZGULef47hr
 Jcjzhsp4b60z79Ahej8lI4pqcs8zdZQ=
X-Google-Smtp-Source: ADFU+vvinrVh+l8QTv3HIUiABuCgsyoBanuoKAxU/xc+BcTv2eFzH5SpHBDbPai696SnQnmC+kbjhJ4IF6o=
X-Received: by 2002:a17:90b:3717:: with SMTP id
 mg23mr6425637pjb.89.1583548593063; 
 Fri, 06 Mar 2020 18:36:33 -0800 (PST)
Date: Fri,  6 Mar 2020 18:36:03 -0800
Message-Id: <20200307023611.204708-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.74 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.74 listed in wl.mailspike.net]
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jAPKR-00AvYV-0c
Subject: [f2fs-dev] [PATCH v8 0/8] Support for Casefolding and Encryption
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

I've left off the Ext4 patches that enable casefolding and ecryption from
this revision since they still need some fixups, and I haven't gotten around
to the fsck changes yet.

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

v8 changes:
Fixed issue with non-strict_mode fallback for hashing dentry op
Fixed potential RCU/unicode issue in casefolding dentry_ops.
Split "fscrypt: Have filesystems handle their d_ops" into a few smaller patches
Switched ubifs change to also use the dentry op function added in libfs.c
Added hash function in fs/unicode
changed super_block s_encoding_flags to u16. Didn't make unsigned int since
both filesystems using them use them as 16 bits, and want to avoid possible
confusion. Wouldn't really be opposed to that change though
Added kernel doc comments
misc other small adjustments
TODO:
 Investigate moving to a dentry flag to check for casefolding, or otherwise
 conditionally setting the casefolding dentry ops as needed, like fscrypt.
 Currently not done due to some issues with cached negative dentries and
 toggling casefolding on an empty directory.

 Ext4 fsck changes/debugging ext4 patches


v7 changes:
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
  unicode: Add utf8_casefold_hash
  fs: Add standard casefolding support
  f2fs: Use generic casefolding support
  ext4: Use generic casefolding support
  fscrypt: Export fscrypt_d_revalidate
  libfs: Add generic function for setting dentry_ops
  fscrypt: Have filesystems handle their d_ops
  f2fs: Handle casefolding with Encryption

 fs/crypto/fname.c           |   7 +-
 fs/crypto/fscrypt_private.h |   1 -
 fs/crypto/hooks.c           |   1 -
 fs/ext4/dir.c               |  51 -----------
 fs/ext4/ext4.h              |  16 ----
 fs/ext4/hash.c              |   2 +-
 fs/ext4/namei.c             |  21 ++---
 fs/ext4/super.c             |  15 ++--
 fs/f2fs/dir.c               | 127 +++++++++++-----------------
 fs/f2fs/f2fs.h              |  18 +---
 fs/f2fs/hash.c              |  27 ++++--
 fs/f2fs/inline.c            |   9 +-
 fs/f2fs/namei.c             |   1 +
 fs/f2fs/super.c             |  17 ++--
 fs/f2fs/sysfs.c             |  10 ++-
 fs/libfs.c                  | 164 ++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c              |   1 +
 fs/unicode/utf8-core.c      |  23 ++++-
 include/linux/f2fs_fs.h     |   3 -
 include/linux/fs.h          |  24 ++++++
 include/linux/fscrypt.h     |   6 +-
 include/linux/unicode.h     |   3 +
 22 files changed, 321 insertions(+), 226 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
