Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C55554E0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 21:46:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o46J0-000467-LE; Wed, 22 Jun 2022 19:46:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1o46Iz-000461-DG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 19:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H8d2BBELVbCOnX1yjwgUXq+cgz/kk7yZJazQP73nCZA=; b=O9ZkNgFKWgGp0qJuXqojayVyUP
 +Ufw0V/yEDiDrxnjiqy3o5CcWuTrpeSWHr8QqSIDBX/OBPQu6Ri0SjFki5wPe2haCq8scJ/jdIkHe
 8l+ymVfRlkhmk44rcGrMiCKEPw2Tpk3Yq49kck/AzIdDt92XxMawSORd0E21hbO2pjZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H8d2BBELVbCOnX1yjwgUXq+cgz/kk7yZJazQP73nCZA=; b=H
 6zJgGQX6CGYjzQfhvn3Kiz47Z06WRcs7msasj4qRIGtOLb7hlQDDWQeyn0UTf7yWky5Y6HFORMvW4
 nTrwFQcmttSB/Ce0HeFqaYUF1KkJ7GOwpM7lQHD81q8rPwxhieSMJCEb0C5gZjMlj8/6SPC/jLgBX
 PVwDxRQR/sHB0/E0=;
Received: from madras.collabora.co.uk ([46.235.227.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o46Iu-00AYXT-Rl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 19:46:25 +0000
Received: from localhost (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: krisman)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B300E66016F3;
 Wed, 22 Jun 2022 20:46:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655927172;
 bh=rIq9G9WEvJZyAUyEkrDdZv+8Yo0DNeSgDs1AKsKFotI=;
 h=From:To:Cc:Subject:Date:From;
 b=MJXSxcZfwcI0EjBheFBOJOkeVGWWEiNQ+mMqFeyywrKdgxCSuoqDTu09ohOW4MQbr
 BtNPBEjemnEnz5yfsW/RWXey7puVcQ0Ap2DD4erDcMMxFq/KO3E8qbwFt+byeNUsm8
 zArsSh4AjTpASui9TjMpDTo2UUKGRHnY2DkC54bc/+Y5dBa9Il0sz3rLFqhT40iXCR
 k1+uvrDJ5c6WvthOGqe8odqKpuH8LJXxvPu3Tk/Vf3Fp8HOUVIbYegTq3GYv3RkIT4
 bS3WRzNpjE6QwqJqMtgNZ3iUUY3pNKIzlPJu7RuxvyMZwDUHCCqmFJbezbJ8MX9frj
 SYG9+gMXJa36w==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org
Date: Wed, 22 Jun 2022 15:45:56 -0400
Message-Id: <20220622194603.102655-1-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 This survives every corner case I could think of for negative
 dentries on case-insensitive filesystems, including those already tested
 by fstests. I also ran sanity checks to show it uses the created [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o46Iu-00AYXT-Rl
Subject: [f2fs-dev] [PATCH 0/7] Support negative dentries on
 case-insensitive directories
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

This survives every corner case I could think of for negative dentries
on case-insensitive filesystems, including those already tested by
fstests.  I also ran sanity checks to show it uses the created negative
dentries, and I observed the expected performance increase of the
negative dentry cache hit.

* Background

Negative dentries have always been disabled in case-insensitive
directories because they don't provide enough assurance that every case
variation of a filename doesn't exist in a directory and because there
are known corner cases in file creation where negative dentries can't be
instantiated.

In the trivial case the upstream implementation already works for
negative dentries, even though it is disabled. That is: if the lookup
that caused the dentry to be created was done in a case-insensitive way,
the negative dentry can already be trusted, since it means that no valid
dcache entry exists, *and* that no variation of the file exists on
disk (since the lookup failed). A following lookup will then be executed
with case-insensitive-aware d_hash and d_lookup, it will find the right
negative dentry and can trust it.  It has a creation problem, though,
discussed below.

The first problem appears when a case-insensitive directory has negative
dentries that were created when the directory was case-sensitive.  A
further lookup would incorrectly trust it:

This sequence demonstrates the problem:

  mkdir  d
  touch  d/$1
  touch  d/$2
  unlink d/$1   <- leaves negative dentry.
  unlink d/$2   <- leaves negative dentry.
  chattr +F d
  touch  d/$1   <- finds one of the negative dentries, makes it positive
  < if d/$1 is d_drop somehow >
  access d/$2   <- Might find the other negative dentry, get -ENOENT

There are actually a few problems here.  The first is that a preexisting
negative dentry created during a case-sensitive lookup doesn't guarantee
that no other variation of the name exists. This is not a big problem
in the common case, since the directory has to be empty to be converted,
and the d_hash and d_compare are case-insensitive; which means they will
find the same dentry and reuse it most of the time (except for
invalidations and hash collisions).  But it means that we are leaving
behind a stalled dentry that shouldn't be there.

The real problem happens if $1 and $2 are two strings where:
    (i) casefold($1) == casefold($2)
    (ii) hash($1) == hash($2) == hash(casefold($1))

This condition is the worst case.  Both negative dentries can
potentially be found during a case-insensitive lookup if the wrong
dentry is invalidated.

In fact, this is a problem even on the current implementation.  There
was a bug reported by Al in 2020 [1], where a directory might end up
with dangling negative dentries created during a case-sensitive lookup,
because when the +F attribute is set; even though that code requires an
empty directory, it doesn't check for negative dentries.

Condition (ii) is hard to test, but not impossible.  But, even if it
is not present, we still leave negative dentries behind, which shouldn't
currently exist for a case-insensitive directory.

A completely different problem with negative dentries on
case-insensitive directories exist when turning a negative dentry to
positive.  If the negative dentry has a different case than what is
currently being looked up, the dentry cannot be reused without changing
its name, because we guarantee filename-preserving semantics.  We need
to either change the name or invalidate the dentry. This is currently
done in the upstream kernel by completely stopping negative dentries
from being created in the first place.

* Proposal

The proposed solution is to differentiate negative dentries created from
a case-insensitive context from those created during a case-sensitive
one via a new dentry flag, D_CASEFOLD_LOOKUP, set by the filesystem
during d_lookup.  Since a negative dentry created during a
case-insensitive lookup can be trusted (except for the name-preserving
issue), we can check that flag during d_revalidate to quickly accept or
reject the negative dentry.

Another solution for that problem would be to guarantee that no negative
dentry exists during the Case-sensitive to case-insensitive directory
conversion (the other direction is safe).  This has the following
problems:

  1) It is not trivial to implement a race-free mechanism to ensure
  negative dentries won't be recreated immediately after invalidation
  while converting the directory.

  2) The knowledge whether the negative dentry can be is
  valid (i.e. comes from a case-insensitive lookup) is implicit on the
  fact that we are correctly invalidating dentries when converting the
  directory.

Having a D_CASEFOLD_LOOKUP avoids both issues, and seems to be a cheap
solution to explicitly decide whether to validate a negative dentry.

As explained, in order to maintain the filename preserving semantics, it
is not sufficient to reuse the dentry.

One solution would be to invalidate the negative dentry when it is
decided to turn it positive, instead of reusing it. I implemented that
in the past (2018) but my understanding is that we don't want to incur
costs on the VFS critical path for other filesystems who don't care
about case-insensitiveness.  I think there is also a challenge in making
this invalidation race-free, but it might be simpler than I thought.

Instead, I'm suggesting that we only validate negative dentries in
casefold directories during lookups that will instantiate the dentry
when the lookup name is exactly what is cached.

* caveats

1) Encryption

Currently, negative dentries on encrypted directories are also disabled.
No semantic change on encrypted directories is intended in this
patchset; we just bypass the revalidation directly to fscrypt, for
positive dentries.  I'm working on this case as future work.

2) revalidate the cached dentry using the name under lookup

This is strange for a cache.  the new semantic is implemented on
d_revalidate() to stay out of the critical path of filesystems that
don't care about case-insensitive.  But this requires the revalidation
hook to validate based on what name is under lookup, which is odd for a
cache.

* Tests

There are a few tests for the corner cases discussed above in
generic/556.  They mainly verify the name-preserving semantics.
The invalidation when converting the directory is harder to test,
because it is hard to force the invalidation of specific cached dentries
that occlude a dangling invalid dentry.  I tested it with forcing the
positive dentries to be removed, but I'm not sure how to write an
upstreamable test for it.

This also survives smoke test on ext4 and f2fs.

* patchset

Patch 1 introduces a new version of d_revalidate to provide the
filesystem with the name under lookup; Patch 2 introduces a new dentry
flag to mark dentries as created during a case-insensitive lookup; Patch
3 introduces a libfs helper to validate negative dentries on
case-insensitive directories; Patch 4 deals with encryption; Patch 5
cleans up the now redundant dentry operations for case-insensitive with
and without encryption; Finally, Patch 6 and 7 enable negative dentries
on case-insensitive directories for ext4 and f2fs, respectively.

Gabriel Krisman Bertazi (7):
  fs: Expose name under lookup to d_revalidate hook
  fs: Add DCACHE_CASEFOLD_LOOKUP flag
  libfs: Validate negative dentries in case-insensitive directories
  libfs: Support revalidation of encrypted case-insensitive dentries
  libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
  ext4: Enable negative dentries on case-insensitive lookup
  f2fs: Enable negative dentries on case-insensitive lookup

 fs/dcache.c            |  9 +++++-
 fs/ext4/namei.c        | 35 +++-----------------
 fs/f2fs/namei.c        | 23 ++------------
 fs/libfs.c             | 72 ++++++++++++++++++++++++------------------
 fs/namei.c             | 23 ++++++++------
 include/linux/dcache.h |  9 ++++++
 6 files changed, 78 insertions(+), 93 deletions(-)

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
