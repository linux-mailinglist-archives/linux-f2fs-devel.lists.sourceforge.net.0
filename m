Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB267DB26A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Oct 2023 05:04:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qxJW1-0003hJ-Aq;
	Mon, 30 Oct 2023 04:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qxJW0-0003hD-0I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Oct 2023 04:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M0/er4qz3Vn17zN+A6+aVAlrWBsIixD3smsud6voVdk=; b=JMYWXbLyb4Zo1Ome92asLBhUzJ
 vVkqaAUmm5nNA7LBD/f3Wa+3YKqu4/H+dag5CTDA+Z+KWjrNyddrIxOFFvomvPAxi0xufAjkSSMy+
 zsZK3Kf4lXtcFNcE08DIxRaQSJMWRK6T+sp2dBSfBdmif63GMgxkj8wRRLNJLIn8ypmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M0/er4qz3Vn17zN+A6+aVAlrWBsIixD3smsud6voVdk=; b=A
 5NJ8YSIRmwg2s7MTiN1zghl/ldBGyN7XLpTLjk6GCg7NjXefe9F9uJnozGRROpoVikLIax+M/4aLE
 VqcgoQhvPJM2mvQBBn2T7GegFP2mTVMOv1yp+5m3flgXbK6o5/eSSoouSGwd01IlqMHdkhHnIO5od
 ZYBKJHMMMO0SYwUM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qxJVy-00020e-0x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Oct 2023 04:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 615B5CE11EA;
 Mon, 30 Oct 2023 04:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4AAC433C8;
 Mon, 30 Oct 2023 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698638661;
 bh=UkCm3OTWARRE3MTGj4hMs3g9sGwjnFjvdJrOft2PCWM=;
 h=Date:From:To:Cc:Subject:From;
 b=RtH8udXQmHNy7sD8UiM8laIiFptr75k6TMDW5G9xwNZO/XRRhqsNvv29IlUG12jJ7
 FWDTxb/On3c0tvaBgpRQUqbSlrbpIRsOO06xVIbl7m0VWoUAs3QUp3kKDQp3rzEpuI
 a3DCf/YWO6mh+iSMitfF8NrvLF+49M6X8ytT7Socn2iewAC6lGOKoT1QZOOqgEsnl6
 TUzvzXejaKIN7/j0DOQ0lmZNJvxJrDTs1E0BWzC3iY4Gu8YOrhiHcasSDoDZN5CKAh
 IQdbK+cLayLqnQDGxYZgFAl9HboHL5tWPC1agPrMnBrG2AIRZA5UQNniYmLR7nvAAv
 rELkLw3Fzf4Sg==
Date: Sun, 29 Oct 2023 21:04:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231030040419.GA43439@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 6465e260f48790807eef06b583b38ca9789b6072:
 Linux 6.6-rc3 (2023-09-24 14:31:13 -0700) are available in the Git repository
 at: Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qxJVy-00020e-0x
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 6.7
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus

for you to fetch changes up to 15baf55481de700f8c4494cddb80ec4f4575548b:

  fscrypt: track master key presence separately from secret (2023-10-16 21:23:45 -0700)

----------------------------------------------------------------

This update adds support for configuring the crypto data unit size (i.e.
the granularity of file contents encryption) to be less than the
filesystem block size. This can allow users to use inline encryption
hardware in some cases when it wouldn't otherwise be possible.

In addition, there are two commits that are prerequisites for the
extent-based encryption support that the btrfs folks are working on.

----------------------------------------------------------------
Eric Biggers (6):
      fscrypt: make it clearer that key_prefix is deprecated
      fscrypt: make the bounce page pool opt-in instead of opt-out
      fscrypt: compute max_lblk_bits from s_maxbytes and block size
      fscrypt: replace get_ino_and_lblk_bits with just has_32bit_inodes
      fscrypt: support crypto data unit size less than filesystem block size
      fscrypt: track master key presence separately from secret

Josef Bacik (1):
      fscrypt: rename fscrypt_info => fscrypt_inode_info

 Documentation/filesystems/fscrypt.rst | 121 ++++++++++++++++++-------
 fs/ceph/crypto.c                      |   1 +
 fs/crypto/bio.c                       |  39 ++++----
 fs/crypto/crypto.c                    | 163 ++++++++++++++++++---------------
 fs/crypto/fname.c                     |   6 +-
 fs/crypto/fscrypt_private.h           | 164 ++++++++++++++++++++++------------
 fs/crypto/hooks.c                     |   4 +-
 fs/crypto/inline_crypt.c              |  32 +++----
 fs/crypto/keyring.c                   |  82 ++++++++++-------
 fs/crypto/keysetup.c                  |  62 +++++++------
 fs/crypto/keysetup_v1.c               |  20 +++--
 fs/crypto/policy.c                    |  83 +++++++++++------
 fs/ext4/crypto.c                      |  13 +--
 fs/f2fs/super.c                       |  13 +--
 fs/ubifs/crypto.c                     |   3 +-
 include/linux/fs.h                    |   4 +-
 include/linux/fscrypt.h               |  82 ++++++++++-------
 include/uapi/linux/fscrypt.h          |   3 +-
 18 files changed, 546 insertions(+), 349 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
