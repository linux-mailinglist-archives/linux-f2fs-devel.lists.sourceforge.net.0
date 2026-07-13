Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WXuqCPdPVGr0kQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:39:51 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09D746AB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:39:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="H/COVUR1";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=PKctAHg9;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="g NHFeRz";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=OfToqvAw;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9L9v2H2O8ioLyeyDX3ve7K9etSrb/+GvtZoxEuyvrZM=; b=H/COVUR1/kMeBrOqqmrfq7xtE3
	B+ezz0eRsTAo1yDRrx2HqB4JC+XN5HFWRc4l0jnPIFBMEgpkvDuCGkacxjV9dr4gQ6H7InlywN22z
	bUgKdHBA2WziNQDvJxU3XQQQjWWq1hMrp/qxXG5LeoFfcHmGAjFcL0FWrCVWXACZvG2s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj6a3-0006bT-Nk;
	Mon, 13 Jul 2026 02:39:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wj6a1-0006bM-8I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Anvrc5QyuwQ48kzKoweg2kNJHM923i1rPiWcvi+taB4=; b=PKctAHg9i+Z+sL44I/1KF/J3WH
 SRTW/5oorWh03ChtOTOH/vvkFq8UqrydWLCxzeMJJ7EOhDcg1mrXUqfJP/unEoJDWdfnkCi86hA2X
 DahC3KaKzFVtjip7VVHowVQHymmQhRGFRD6CGhyvFIrphfJ5E/LFEoW/bTFnJM1N7Tvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Anvrc5QyuwQ48kzKoweg2kNJHM923i1rPiWcvi+taB4=; b=g
 NHFeRz2wqPVVoak0G8DclT/pk4XONPZxLwZYppn0CyX9dWdp9kyZv+mXVXHG7Xq/h3VoHMxpqUiDV
 sRFv1EtF+xPGGP2FLrCLv6RxhvuN+q9IOLlc8bdy87/fmLOM3f6yY7Wf6wOp+nUB0cvLNDObXTxSq
 bp8O/cTBP7Ixnpto=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj6a1-0003AL-7l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:39:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F58860018;
 Mon, 13 Jul 2026 02:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9F21F000E9;
 Mon, 13 Jul 2026 02:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783910371;
 bh=Anvrc5QyuwQ48kzKoweg2kNJHM923i1rPiWcvi+taB4=;
 h=From:To:Cc:Subject:Date;
 b=OfToqvAwxJnFISd+Iw7yOl5WvJFvukBFM+f2oqQndEK7Wxo5/Iy/E/p7TtFHnafU4
 gtmwxliwVifw6idYU8l0qQuSycJGd4UWIqO9y/5eNi/Z9kG/JOfF0jyp8MWHi/z2Bf
 Xfr15V8xlZNHScHaGqrU8JfJtDoEVMOqVLol2kZRiM+66f7YdIKfC1CjH8bIgDPLYA
 VUGKCp95jKux0j7WEDnzXHa3yJSeJTEw4N6T1S0Da81oADP8oX4Il0uj1q8MGhW9kP
 bMTmrbX4r5PJ/OWdywUJTX3JNwyefNO55kR7oVlNECzQxrT4Glw8x7sHLuKRNVbQid
 sZjvad5Un2vQQ==
To: linux-fscrypt@vger.kernel.org
Date: Sun, 12 Jul 2026 22:36:51 -0400
Message-ID: <20260713023708.9245-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series applies to commit 2d0afaac9137e9 of
 https://git.kernel.org/pub/scm/fs/fscrypt/linux.git/log/?h=for-next
 It can also be retrieved from: git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/
 fscrypt-blk-crypto-v3 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wj6a1-0003AL-7l
Subject: [f2fs-dev] [PATCH v3 00/17] fscrypt: Standardize on blk-crypto
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C09D746AB4

This series applies to commit 2d0afaac9137e9 of
https://git.kernel.org/pub/scm/fs/fscrypt/linux.git/log/?h=for-next
It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/ fscrypt-blk-crypto-v3

Currently, ext4 and f2fs (i.e., the block-based filesystems with fscrypt
support) have two file contents encryption implementations:

 - Filesystem-layer, where code in fs/crypto/ directly invokes
   crypto_skcipher to en/decrypt data using the CPU.  This
   implementation requires the management of bounce pages at the
   filesystem level.  It doesn't support direct I/O or large folios.

 - blk-crypto (also known as inline encryption), where the filesystem
   assigns bio_crypt_ctxs to bios, which are then processed either by
   the CPU using blk-crypto-fallback.c or by inline encryption hardware.
   This supports direct I/O and is compatible with large folios.

Currently, the latter implementation is enabled only when the
"inlinecrypt" mount option is given.

The persistence of the fs-layer implementation is mainly for historical
reasons, as it came first.  It's becoming increasingly hard to maintain,
especially as the filesystems get refactored to use iomap, large folios,
etc.  It's time to remove it and just rely on the similar code in
blk-crypto-fallback.  This series does that.

Some fs-layer encryption support remains in fs/crypto/ for non-block
based filesystems (UBIFS and CephFS), as well as directories and
symlinks.  So it's not entirely gone, but it's reduced.

To be clear, this just changes an internal implementation detail.  ext4
and f2fs continue to fully support encryption (fscrypt), regardless of
the presence of inline encryption hardware on the system.

Changed in v3:

  - Fixed bug in mpage_prepare_extent_to_map().

  - Updated a couple other places in fscrypt.rst.

  - Cleaned up outdated comments in {ext4,f2fs}_getattr().

  - Removed an orphaned function prototype.

  - Fixed accidental removal of @key_type kerneldoc.

Changed in v2:

  - Replaced the allow_hw bool with a flags argument.

  - Added patch "Documentation: fscrypt: Update docs for inlinecrypt"
    which updates the documentation more completely by updating not just
    fscrypt.rst (which was previously part of another patch), but also
    the documentation for inlinecrypt in ext4.rst and f2fs.rst.  

  - Removed extern from declarations of ext4_init_verity_caches() and
    ext4_exit_verity_caches()
 
  - Remove unused 'inode' argument from ext4_set_verity_work()

  - Added Reviewed-by tags

Eric Biggers (17):
  blk-crypto: Simplify check for fallback support
  blk-crypto: Fold __blk_crypto_cfg_supported() into its caller
  blk-crypto: Allow control over whether hardware is used
  fscrypt: Fully disallow IV_INO_LBLK_32 with s_blocksize != PAGE_SIZE
  fscrypt: Always use blk-crypto for contents on block-based filesystems
  Documentation: fscrypt: Update docs for inlinecrypt
  ext4: Remove fs-layer file contents en/decryption code
  ext4: Make ext4_bio_write_folio() return void
  ext4: Further de-generalize the bio postprocessing code
  f2fs: Remove fs-layer file contents en/decryption code
  fs/buffer: Remove fs-layer decryption code
  fscrypt: Replace calls to fscrypt_inode_uses_inline_crypto()
  fscrypt: Remove fscrypt_dio_supported()
  fscrypt: Remove fs-layer zeroout code
  fscrypt: Remove unused functions and workqueue
  fscrypt: Merge bio.c and inline_crypt.c into block.c
  fscrypt: Add safety checks to non-block-based en/decryption

 Documentation/admin-guide/ext4.rst          |   8 +-
 Documentation/filesystems/f2fs.rst          |  10 +-
 Documentation/filesystems/fscrypt.rst       |  58 ++--
 arch/loongarch/configs/loongson32_defconfig |   1 -
 arch/loongarch/configs/loongson64_defconfig |   1 -
 block/blk-crypto-fallback.c                 |   3 +-
 block/blk-crypto-internal.h                 |   3 -
 block/blk-crypto-profile.c                  |  22 --
 block/blk-crypto.c                          |  34 ++-
 drivers/md/dm-inlinecrypt.c                 |   3 +-
 fs/buffer.c                                 |  45 +---
 fs/crypto/Kconfig                           |   8 +-
 fs/crypto/Makefile                          |   3 +-
 fs/crypto/bio.c                             | 216 ---------------
 fs/crypto/{inline_crypt.c => block.c}       | 284 ++++++++++----------
 fs/crypto/crypto.c                          | 140 ++++------
 fs/crypto/fscrypt_private.h                 |  28 +-
 fs/crypto/keysetup.c                        |  31 +--
 fs/crypto/policy.c                          |  17 ++
 fs/ext4/crypto.c                            |   2 +-
 fs/ext4/ext4.h                              |   6 +-
 fs/ext4/inode.c                             |  71 +----
 fs/ext4/page-io.c                           |  74 +----
 fs/ext4/readpage.c                          | 139 +++-------
 fs/ext4/super.c                             |   6 +-
 fs/f2fs/compress.c                          |  31 +--
 fs/f2fs/data.c                              |  93 +------
 fs/f2fs/f2fs.h                              |   2 -
 fs/f2fs/file.c                              |   6 +-
 fs/f2fs/segment.c                           |   2 -
 fs/f2fs/super.c                             |   2 +-
 include/linux/blk-crypto.h                  |  13 +-
 include/linux/fscrypt.h                     |  96 ++-----
 33 files changed, 387 insertions(+), 1071 deletions(-)
 delete mode 100644 fs/crypto/bio.c
 rename fs/crypto/{inline_crypt.c => block.c} (61%)


base-commit: 2d0afaac9137e95e504bd3ad3512a9044745536b
-- 
2.55.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
