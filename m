Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B779779C05
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 02:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUcho-0003ma-33;
	Sat, 12 Aug 2023 00:42:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qUchm-0003mP-DD
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xrrpw3+HUsiXWHTjXG7RJBvNwihn1GUBNy+js8Leqss=; b=b6RrId//kP3TIwbi5x1T3P8oZH
 5iKupxw9Nr6WTV6h2AgKVb5dbl6jm2tGGcfH9JiwLBCKfyU4RSxn/mCiQbHntQCOtifXxUDDMe+Qx
 FaHYcw4ZBvLQS6qPZvICyAgcnJehJztLhVBS0o0Qw6nStzV/TRQWvKCd76Xy4JygyuPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Xrrpw3+HUsiXWHTjXG7RJBvNwihn1GUBNy+js8Leqss=; b=M
 w5xtN/YJvKDg2kadL7aWYMUkURs9a9iqmgym7C+i28oK9sNm0C+T5QarSQJdLEL7R1uM2eJnXj14Z
 XohnLd4NmP7j51bC7JuaMfRScxwavjQCP4se3AcfykYEGArj75oUz8kN4nRSS4O94S8o4dsFLnezx
 fRqPrgtZEsdJx7Bs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUchg-0002e6-4l for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:10 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D913218E0;
 Sat, 12 Aug 2023 00:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691800914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xrrpw3+HUsiXWHTjXG7RJBvNwihn1GUBNy+js8Leqss=;
 b=xZte8DD6iXDn04AdGNE5WpVyjAnG3v60jjUBMm2KJXecrvUkNEalSpFu2CN8AO5ZjzEtI2
 vFChXHP3Jnb1jIzk8peU70MsY5p/o6LLouUHce1CLZDTUKh4Tpz/cizVwwhRCyuLpzQjDe
 EuBiq95BCBTRMTR2sxg20LAMNEGVhBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691800914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Xrrpw3+HUsiXWHTjXG7RJBvNwihn1GUBNy+js8Leqss=;
 b=oYAsTjgtsHVDwEXGreH2/pXTVq6R0/U9/EYlX9xHjsi2gQ1kx2w8ymLSVDJYKClJNT/jHM
 oKP9h5RpYzaOchCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1214A13592;
 Sat, 12 Aug 2023 00:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id io6fOlHV1mT/DwAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 12 Aug 2023 00:41:53 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Fri, 11 Aug 2023 20:41:36 -0400
Message-ID: <20230812004146.30980-1-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, This is the v5 of this patchset. Thanks Christian and
 Eric for you review. In this version, the patchset grew a bit because it adds:
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qUchg-0002e6-4l
Subject: [f2fs-dev] [PATCH v5 00/10] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

This is the v5 of this patchset.  Thanks Christian and Eric for you
review.

In this version, the patchset grew a bit because it adds:

  - a preparation patch to merge d_revalidate_name and d_revalidate,
  attending Christian's request.  The original patch is now touching
  several filesystems to update the hook signature, so it has grown
  quite a bit. But, all of that was autogenerated with coccinelle and
  tested with allyesconfig only.

  - A new patch to expose a helper from libfs that I use in ecryptfs.

  - Code to prevent ecryptfs from mounting on top of casefolded
  directories. Also following on Christian's review.

Other than these, there are some minor fixes, listed in each patch
changelog, and more clarifications on the locking, thanks to the
excellent feedback from Eric.

Eric, I believe I have covered the cases where instantiation can happen
and I don't think it is possible for a dentry to become positive amidst
the d_revalidation, since we are holding the inode parent lock to
synchronize with creations.  Please let me know if you find anything
else.

Finally, I've dropped the r-b tags from patch "fs: Expose name under
lookup to d_revalidate hooks", because it changed too much since
the time of review.

Regarding testing, I verified it doesn't regress fstests for f2fs and
ext4, verified building all filesystems work fine with allyesconfig,
even with variation of CONFIG_FS_ENCRYPTION and CONFIG_UNICODE, and,
finally, I checked I wasn't able to mount or lookup casefolded
directories with ecryptfs and overlayfs.

Thanks,

Gabriel Krisman Bertazi (10):
  fs: Expose helper to check if a directory needs casefolding
  ecryptfs: Reject casefold directory inodes
  9p: Split ->weak_revalidate from ->revalidate
  fs: Expose name under lookup to d_revalidate hooks
  fs: Add DCACHE_CASEFOLDED_NAME flag
  libfs: Validate negative dentries in case-insensitive directories
  libfs: Chain encryption checks after case-insensitive revalidation
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  ext4: Enable negative dentries on case-insensitive lookup
  f2fs: Enable negative dentries on case-insensitive lookup

 Documentation/filesystems/locking.rst |   3 +-
 Documentation/filesystems/vfs.rst     |  11 ++-
 fs/9p/vfs_dentry.c                    |  11 ++-
 fs/afs/dir.c                          |   6 +-
 fs/afs/dynroot.c                      |   4 +-
 fs/ceph/dir.c                         |   3 +-
 fs/coda/dir.c                         |   3 +-
 fs/crypto/fname.c                     |   3 +-
 fs/dcache.c                           |   8 ++
 fs/ecryptfs/dentry.c                  |   5 +-
 fs/ecryptfs/inode.c                   |   8 ++
 fs/exfat/namei.c                      |   3 +-
 fs/ext4/namei.c                       |  35 +-------
 fs/f2fs/namei.c                       |  25 +-----
 fs/fat/namei_vfat.c                   |   6 +-
 fs/fuse/dir.c                         |   3 +-
 fs/gfs2/dentry.c                      |   3 +-
 fs/hfs/sysdep.c                       |   3 +-
 fs/jfs/namei.c                        |   3 +-
 fs/kernfs/dir.c                       |   3 +-
 fs/libfs.c                            | 124 +++++++++++++++++---------
 fs/namei.c                            |  18 ++--
 fs/nfs/dir.c                          |   9 +-
 fs/ocfs2/dcache.c                     |   4 +-
 fs/orangefs/dcache.c                  |   3 +-
 fs/overlayfs/super.c                  |  20 +++--
 fs/proc/base.c                        |   6 +-
 fs/proc/fd.c                          |   3 +-
 fs/proc/generic.c                     |   6 +-
 fs/proc/proc_sysctl.c                 |   3 +-
 fs/reiserfs/xattr.c                   |   3 +-
 fs/smb/client/dir.c                   |   3 +-
 fs/vboxsf/dir.c                       |   4 +-
 include/linux/dcache.h                |  10 ++-
 include/linux/fs.h                    |  21 +++++
 include/linux/fscrypt.h               |   4 +-
 36 files changed, 242 insertions(+), 148 deletions(-)

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
