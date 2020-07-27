Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D5F22F587
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 18:38:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0690-0000OC-7N; Mon, 27 Jul 2020 16:38:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k068y-0000O3-RB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzofXxDe7AZW6cf2UnYEmIUmWUNHq7P9QlV99up0igI=; b=kV/r70tsKb2ZXJUICuDJpC2fo3
 LGxgmPDhyM60qJ0EpOF74d2ohb/W7RyB9bldKNnFe247tYbeM4leGC8BXBT85jHjvy2Ugz4KmwI2r
 6u6Q1g34fDRy+1g853OS2FA59zEX1EGSQ9e4umFwlgDGysN1uTiosMznryBwJzbAypc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzofXxDe7AZW6cf2UnYEmIUmWUNHq7P9QlV99up0igI=; b=KYyOvP/pVNxeDSSDD5HrcR79LB
 NE2+LkLvsM0c8K6tBq5RZHEJl7TRfVVmA6dqO5JK4zqx/3pnSHhK0CwBv+01UkvoGm+J236eLF0ae
 7bqFWw/K+LPbtmkIFRz23l4dWJYXrYVZdM3v3b6XCMouYdJqM0puwzbEZyQf9AiZ8YPg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k068x-001GX9-KP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:38:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16C6B20729;
 Mon, 27 Jul 2020 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595867902;
 bh=c5eT5k11z1+CS85OE5I4gSjQlV7ygf3FjoF9oxLpRMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MsmG70EFO0Xk7VnJqu5etQ5rAiSv75DK06bQvyYv+PKhPMp1qfqnS6omgE0sBtJwL
 El6ORUUQeMuqPbPX0PxioKkQ6+lj0j1qGL+YWnhuYLnUnlWMrAsq0ocatwnjlVwm0n
 12trzm+Ou4H+PIqNUs8r/jIbo99Jt+GizD78QPDY=
Date: Mon, 27 Jul 2020 09:38:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200727163820.GC1138@sol.localdomain>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k068x-001GX9-KP
Subject: Re: [f2fs-dev] [PATCH 0/5] fscrypt, fs-verity: one-time init fixes
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
Cc: linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 21, 2020 at 03:59:15PM -0700, Eric Biggers wrote:
> This series fixes up some cases in fs/crypto/ and fs/verity/ where
> "one-time init" is implemented using READ_ONCE() instead of
> smp_load_acquire() but it's not obviously correct.
> 
> One case is fixed by using a better approach that removes the need to
> initialize anything.  The others are fixed by upgrading READ_ONCE() to
> smp_load_acquire().  I've also improved the comments.
> 
> This is motivated by the discussions at 
> https://lkml.kernel.org/linux-fsdevel/20200713033330.205104-1-ebiggers@kernel.org/T/#u
> and
> https://lkml.kernel.org/linux-fsdevel/20200717044427.68747-1-ebiggers@kernel.org/T/#u
> 
> These fixes are improvements over the status quo, so I'd prefer to apply
> them now, without waiting for any potential new generic one-time-init
> macros (which based on the latest discussion, won't be flexible enough
> to handle most of these cases anyway).
> 
> Eric Biggers (5):
>   fscrypt: switch fscrypt_do_sha256() to use the SHA-256 library
>   fscrypt: use smp_load_acquire() for fscrypt_prepared_key
>   fscrypt: use smp_load_acquire() for ->s_master_keys
>   fscrypt: use smp_load_acquire() for ->i_crypt_info
>   fs-verity: use smp_load_acquire() for ->i_verity_info
> 
>  fs/crypto/Kconfig           |  2 +-
>  fs/crypto/fname.c           | 41 +++++++++----------------------------
>  fs/crypto/fscrypt_private.h | 15 ++++++++------
>  fs/crypto/inline_crypt.c    |  6 ++++--
>  fs/crypto/keyring.c         | 15 +++++++++++---
>  fs/crypto/keysetup.c        | 18 +++++++++++++---
>  fs/crypto/policy.c          |  4 ++--
>  fs/verity/open.c            | 15 +++++++++++---
>  include/linux/fscrypt.h     | 29 +++++++++++++++++++++-----
>  include/linux/fsverity.h    |  9 ++++++--
>  10 files changed, 96 insertions(+), 58 deletions(-)

Patches 1-4 applied to fscrypt.git#master for 5.9.
Patch 5 applied to fscrypt.git#fsverity for 5.9.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
