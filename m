Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A525B6EB608
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Apr 2023 02:03:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pq0ip-0005Rc-DH;
	Sat, 22 Apr 2023 00:03:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1pq0in-0005RS-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PyZUD/Tdm2b3E4bB/qLY+k9wsdbSiVXGFWr0vAmD/TI=; b=gTD9aWw56/cw4nDbvPDCF50PH6
 fSOWVr0oDv11AfqXCp93b5LdWodpWFWu1biDE44fD3KdzhRQCXgYddg+N+O5hsFTiJHdVShKZmjMH
 xwuXbeAPHi/TS6UK/fqBdLZcTmXbmEiVy9KoqEt2b1D9NP3XgQEJKU84kpNbrkiObex8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PyZUD/Tdm2b3E4bB/qLY+k9wsdbSiVXGFWr0vAmD/TI=; b=e
 vZIvUpcaEXl7Ml7IIl4sWpKMzB15WTWz7i6HP6GhTTz4CslVPik4IjxXfttep1Oh/6pHo4JBymmSj
 QGQl04XP9Rog3jcEJwk+NK4rbONSdVmAP5OZ6WHf4ETFgf2fK3eXMUPwsMNGnFlcF6DPIqECEQojf
 vaatLom9822+2voo=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pq0im-0008MU-Dc for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Apr 2023 00:03:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ABB4E21A27;
 Sat, 22 Apr 2023 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682121791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PyZUD/Tdm2b3E4bB/qLY+k9wsdbSiVXGFWr0vAmD/TI=;
 b=zTcyUO7WfUEXE+vfOO/VN89pZV6YZVk0h+8tla6aRKb1EkmXlZe/FXnTe1u9OLyRedJlXK
 nOPubC1ulBOL29zKf16cbBJxckcNIYgDMClNTgnSyc8xB8yC5fhTCnl/bWortyrt61JxTb
 URWQbyDfmwoRygmm7CFEqCBootv82CQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682121791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PyZUD/Tdm2b3E4bB/qLY+k9wsdbSiVXGFWr0vAmD/TI=;
 b=+8h8BVR57okqzpE8CvwZGVBz14FUcPFvwoVtT1tYYlDhetVhVb72f5vbUOtuidr2ljd1UO
 de1l6JvOedstvWAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74A7A138F2;
 Sat, 22 Apr 2023 00:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wMjxFj8kQ2TTdwAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 22 Apr 2023 00:03:11 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Date: Fri, 21 Apr 2023 20:03:03 -0400
Message-Id: <20230422000310.1802-1-krisman@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 This is the v2 of the negative dentry support on case-insensitive
 directories. It doesn't have any functional changes from v1, but it adds
 more context and a comment to the dentry->d_name access I'm d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pq0im-0008MU-Dc
Subject: [f2fs-dev] [PATCH v2 0/7] Support negative dentries on
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
Cc: krisman@suse.de, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

This is the v2 of the negative dentry support on case-insensitive directories.
It doesn't have any functional changes from v1, but it adds more context and a
comment to the dentry->d_name access I'm doing in d_revalidate, documenting
why (i understand) it is safe to do it without protecting from the parallell
directory changes.

Please, let me know if the documentation is sufficient or if I'm missing some
case.

Retested with xfstests for ext4 and f2fs.

--
cover letter from v1.

This patchset enables negative dentries for case-insensitive directories
in ext4/f2fs.  It solves the corner cases for this feature, including
those already tested by fstests (generic/556).  It also solves an
existing bug with the existing implementation where old negative
dentries are left behind after a directory conversion to
case-insensitive.

Testing-wise, I ran sanity checks to show it properly uses the created
negative dentries, observed the expected performance increase of the
dentry cache hit, and showed it survives the quick group in fstests on
both f2fs and ext4 without regressions.

* Background

Negative dentries have always been disabled in case-insensitive
directories because, in their current form, they can't provide enough
assurances that all the case variations of a filename won't exist in a
directory, and the name-preserving case-insenstive semantics
during file creation prevents some negative dentries from being
instantiated unmodified.

Nevertheless, for the general case, the existing implementation would
already work with negative dentries, even though they are fully
disabled. That is: if the original lookup that created the dentry was
done in a case-insensitive way, the negative dentry can usually be
validated, since it assures that no other dcache entry exists, *and*
that no variation of the file exists on disk (since the lookup
failed). A following lookup would then be executed with the
case-insensitive-aware d_hash and d_lookup, which would find the right
negative dentry and use it.

The first corner case arises when a case-insensitive directory has
negative dentries that were created before the directory was flipped to
case-insensitive.  A directory must be empty to be converted, but it
doesn't mean the directory doesn't have negative dentry children.  If
that happens, the dangling dentries left behind can't assure that no
case-variation of the name exists. They only mean the exact name
doesn't exist.  A further lookup would incorrectly validate them.

The code below demonstrates the problem.  In this example $1 and $2 are
two strings, where:

      (i) $1 != $2
     (ii) casefold($1) == casefold($2)
    (iii) hash($1) == hash($2) == hash(casefold($1))

Then, the following sequence could potentially return a ENOENT, even
though the case-insensitive lookup should exist:

  mkdir  d      <- Case-sensitive directory
  touch  d/$1
  touch  d/$2
  unlink d/$1   <- leaves negative dentry  behind.
  unlink d/$2   <- leaves *another* negative dentry behind.
  chattr +F d   <- make 'd' case-insensitive.
  touch  d/$1   <- Both negative dentries could match. finds one of them,
		   and instantiate
  access d/$1   <- Find the other negative dentry, get -ENOENT.

In fact, this is a problem even on the current implementation, where
negative dentries for CI are disabled.  There was a bug reported by Al
Viro in 2020, where a directory might end up with dangling negative
dentries created during a case-sensitive lookup, because they existed
before the +F attribute was set.

It is hard to trigger the issue, because condition (iii) is hard to test
on an unmodified kernel.  By hacking the kernel to force the hash
collision, there are a few ways we can trigger this bizarre behavior in
case-insensitive directories through the insertion of negative dentries.

Another problem exists when turning a negative dentry to positive.  If
the negative dentry has a different case than what is currently being
used for lookup, the dentry cannot be reused without changing its name,
in order to guarantee filename-preserving semantics to userspace.  We
need to either change the name or invalidate the dentry. This issue is
currently avoided in mainline, since the negative dentry mechanism is
disabled.

* Proposal

The main idea is to differentiate negative dentries created in a
case-insensitive context from those created during a case-sensitive
lookup via a new dentry flag, D_CASEFOLD_LOOKUP, set by the filesystem
the d_lookup hook.  Since the former can be used (except for the
name-preserving issue), d_revalidate will just check the flag to
quickly accept or reject the dentry.

A different solution would be to guarantee no negative dentry exists
during the case-sensitive to case-insensitive directory conversion (the
other direction is safe).  It has the following problems:

  1) It is not trivial to implement a race-free mechanism to ensure
  negative dentries won't be recreated immediately after invalidation
  while converting the directory.

  2) The knowledge whether the negative dentry is valid (i.e. comes from
  a case-insensitive lookup) is implicit on the fact that we are
  correctly invalidating dentries when converting the directory.

Having a D_CASEFOLD_LOOKUP avoids both issues, and seems to be a cheap
solution to the problem.

But, as explained above, due to the filename preserving semantics, we
cannot just validate based on D_CASEFOLD_LOOKUP.

For that, one solution would be to invalidate the negative dentry when
it is decided to turn it positive, instead of reusing it. I implemented
that in the past (2018) but Al Viro made it clear we don't want to incur
costs on the VFS critical path for filesystems who don't care about
case-insensitiveness.

Instead, this patch invalidates negative dentries in casefold
directories in d_revalidate during creation lookups, iff the lookup name
is not exactly what is cached.  Other kinds of lookups wouldn't need
this limitation.

* caveats

1) Encryption

Negative dentries on case-insensitive encrypted directories are also
disabled.  No semantic change for them is intended in
this patchset; we just bypass the revalidation directly to fscrypt, for
positive dentries.  Encryption support is future work.

2) revalidate the cached dentry using the name under lookup

Validating based on the lookup name is strange for a cache.  the new
semantic is implemented by d_revalidate, to stay out of the critical
path of filesystems who don't care about case-insensitiveness, as much
as possible.  The only change is the addition of a new flavor of
d_revalidate.

* Tests

There are a tests in place for most of the corner cases in generic/556.
They mainly verify the name-preserving semantics.  The invalidation when
converting the directory is harder to test, because it is hard to force
the invalidation of specific cached dentries that occlude a dangling
invalid dentry.  I tested it with forcing the positive dentries to be
removed, but I'm not sure how to write an upstreamable test.

It also survives fstests quick group regression testing on both ext4 and
f2fs.

* Performance

The latency of lookups of non-existing files is obviously improved, as
would be expected.  The following numbers compare the execution time of 10^6
lookups of a non-existing file in a case-insensitive directory
pre-populated with 100k files in ext4.

Without the patch: 10.363s / 0.349s / 9.920s  (real/user/sys)
With the patch:     1.752s / 0.276s / 1.472s  (real/user/sys)

* patchset

Patch 1 introduces a new flavor of d_revalidate to provide the
filesystem with the name under lookup; Patch 2 introduces the new flag
to signal the dentry creation context; Patch 3 introduces a libfs helper
to revalidate negative dentries on case-insensitive directories; Patch 4
deals with encryption; Patch 5 cleans up the now redundant dentry
operations for case-insensitive with and without encryption; Finally,
Patch 6 and 7 enable support on case-insensitive directories
for ext4 and f2fs, respectively.

Gabriel Krisman Bertazi (7):
  fs: Expose name under lookup to d_revalidate hook
  fs: Add DCACHE_CASEFOLD_LOOKUP flag
  libfs: Validate negative dentries in case-insensitive directories
  libfs: Support revalidation of encrypted case-insensitive dentries
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  ext4: Enable negative dentries on case-insensitive lookup
  f2fs: Enable negative dentries on case-insensitive lookup

 fs/dcache.c            | 10 +++++-
 fs/ext4/namei.c        | 34 ++----------------
 fs/f2fs/namei.c        | 23 ++----------
 fs/libfs.c             | 82 ++++++++++++++++++++++++++----------------
 fs/namei.c             | 23 +++++++-----
 include/linux/dcache.h |  9 +++++
 6 files changed, 88 insertions(+), 93 deletions(-)

-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
