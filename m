Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A228B77D994
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 07:08:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW8lb-0001qS-K3;
	Wed, 16 Aug 2023 05:08:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qW8lY-0001qL-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kxsKmHWGtKjTsaPWvpb6GoO8un05d93uluQteuNEpjk=; b=FmedBt78fLyR/AbvDdtgXbpKce
 wHxvpd/b6RPD7mS2+RMQHOkbAoQk9rLS6sktum456o+MhpxhCCNfpDQUmvodMboc/FzjGI5yExB3t
 KwOxnPI7q0CSrcb+e9BTJJu/ZGtLIhNTFKOgGNMPwFNm6A2o68AYctwTBHm0ywpj9rPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kxsKmHWGtKjTsaPWvpb6GoO8un05d93uluQteuNEpjk=; b=O
 uGCWcO3I8uREAUFxn5Z8bCyaaVGmSH0mfa1xBI7ZSInV5lPehXFIQWssCldyYWCq8pBhI4JsASTy+
 D5+aS0QXXkFExarjIDdJm4NiInZNKixTbYXZAtuvabkBbkJI6oHPPJO3sE8oGZABA7tYDuQzWCEvk
 +6o0Iv+tX6IF2060=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW8lV-006njC-Nz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 05:08:20 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 317AB21961;
 Wed, 16 Aug 2023 05:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692162488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kxsKmHWGtKjTsaPWvpb6GoO8un05d93uluQteuNEpjk=;
 b=h5KhqvcTyvJEGrqCdtIGrrikRGa185BCSx0hEuYqm8RPpkL+I9tQ8zCxb3YjlX25ACh+Yy
 piOoQIsJd4vPIEEu14tHvtFqxDgwAdlb7oUHSRa0zeb2LreRu/YiBFMVYaJM/7E39Azy5c
 /BdECTDEOyf/kom8KcxdHx/KVXt39vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692162488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kxsKmHWGtKjTsaPWvpb6GoO8un05d93uluQteuNEpjk=;
 b=Gi4uKrMGQ6x2tutZgxjlXf3ZfXUKxHPVlAYyNHkQPyusJ2pTcRd5XbK/xUZA6AfS+PZpd8
 wFx/61RDUNoyv3Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED675133F2;
 Wed, 16 Aug 2023 05:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gOE8NLdZ3GTTTgAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 16 Aug 2023 05:08:07 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Wed, 16 Aug 2023 01:07:54 -0400
Message-ID: <20230816050803.15660-1-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, This is v6 of the negative dentry on case-insensitive
 directories. Thanks Eric for the review of the last iteration. This version
 drops the patch to expose the helper to check casefolding directories, [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qW8lV-006njC-Nz
Subject: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
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

This is v6 of the negative dentry on case-insensitive directories.
Thanks Eric for the review of the last iteration.  This version
drops the patch to expose the helper to check casefolding directories,
since it is not necessary in ecryptfs and it might be going away.  It
also addresses some documentation details, fix a build bot error and
simplifies the commit messages.  See the changelog in each patch for
more details.

Thanks,

---

Gabriel Krisman Bertazi (9):
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
 fs/ext4/namei.c                       |  35 +--------
 fs/f2fs/namei.c                       |  25 +-----
 fs/fat/namei_vfat.c                   |   6 +-
 fs/fuse/dir.c                         |   3 +-
 fs/gfs2/dentry.c                      |   3 +-
 fs/hfs/sysdep.c                       |   3 +-
 fs/jfs/namei.c                        |   3 +-
 fs/kernfs/dir.c                       |   3 +-
 fs/libfs.c                            | 107 ++++++++++++++++++--------
 fs/namei.c                            |  18 +++--
 fs/nfs/dir.c                          |   9 ++-
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
 include/linux/fscrypt.h               |   4 +-
 35 files changed, 216 insertions(+), 136 deletions(-)

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
