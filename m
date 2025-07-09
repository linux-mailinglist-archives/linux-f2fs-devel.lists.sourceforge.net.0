Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C9AFF300
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 22:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVDiMCIke+A0q43y6Z7MRpQMwZxwuxiMEkp01DpEa2M=; b=b6vnxu3ZK4De9EfKU8qrzibtzL
	B2jLuJ770YnJlpI30ctS91KjjIPbcQ0XprAZp68DHJBttgDK/CzgSxni5yn3WIOYdtnk4WnOg1k9C
	SkSVQMynI1hKVl+SwDdc07nMd7EyRnUVyUgCSo5XyinBXaXUjjSbQ6pkG3Z8tM00BQ/A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZbQk-00064E-KV;
	Wed, 09 Jul 2025 20:30:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uZbQi-00063v-Hz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 20:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a94Wtpso2tjTZo6CUauALxzsSCXyVS+wNbXkuHkqNrM=; b=kvnMyBtpQhCSYhBK1LFCxhyPdw
 +gJHdS1y1Lj5f08HfhiSSa7L6AlNnZtx/LStAdsOMI/c04APpFe1VgcWi9qRleioHxo0u60/IwCsL
 7yJ7LR9M0ee51nnAoeamGqLXXIN0hhKzwRkmKKGJyfo3TP/p305k/3vnE0dS/kueZdJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a94Wtpso2tjTZo6CUauALxzsSCXyVS+wNbXkuHkqNrM=; b=G2cr1kUj4Gnl8WOOvmg+FmQN5O
 TtnAH3lnnmUu+ZNmSDia1ran4+RUwfi5HutFHiICegw3IZIuE/sEC+1DruFEuR88xERjMjTGSQbtm
 kBQ5hgn3ZrgfOch1R6dmgZpkK0IlJoxhAYDG2+5RIGeq8lG0Az+IDbrkxF8PcYoilQ7A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZbQh-0008Fj-5F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 20:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFE6A444B0;
 Wed,  9 Jul 2025 20:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B8EC4CEEF;
 Wed,  9 Jul 2025 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752093005;
 bh=9Q96tyvmm/n832GH6zIRTtNun3XU6jZzOe2zJCOpOjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3t2jKeHbZuG7Nf2jb48r87sW/ovq5oI0hQqRvXSzVBenc+MhgjDPuZwFeNPhCNTQ
 ZB8pBdcNfn7V/cqJfGyRxiysWM2GluEVqtxIk1SqRNqbAI6ATQqTS/cnxEEJZLzZy/
 GHmJuPAQ+nK4kE6WyEkibLwKq3jm2KexhTxlVpo8JvcxrjZl/e+K00Wf6LxJBgVH4D
 woliFppHMtlHfXNNGu3q6h44jB8yBm/5uGVjl3XRLgbVnoQQrw170iEHExLiZHr8Ho
 qOoh1Pubd+oO21Vpze5Yisjr463TADW/M+3LC60egjb8qRN7siN45tnsQ0FkNHFbqd
 KTtK7EPOR6PvA==
Date: Wed, 9 Jul 2025 13:29:21 -0700
To: fsverity@lists.linux.dev
Message-ID: <20250709202921.GC28537@sol>
References: <20250630172224.46909-1-ebiggers@kernel.org>
 <20250709192650.GB28537@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709192650.GB28537@sol>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 09, 2025 at 12:26:50PM -0700, Eric Biggers wrote:
 > On Mon, Jun 30, 2025 at 10:22:22AM -0700, Eric Biggers wrote: > > This
 series, including all its prerequisites, is also available at: > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZbQh-0008Fj-5F
Subject: Re: [f2fs-dev] [PATCH 0/2] Convert fs/verity/ to use SHA-2 library
 API
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 09, 2025 at 12:26:50PM -0700, Eric Biggers wrote:
> On Mon, Jun 30, 2025 at 10:22:22AM -0700, Eric Biggers wrote:
> > This series, including all its prerequisites, is also available at:
> > 
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git fsverity-libcrypto-v1
> > 
> > This series makes fs/verity/ use the SHA-2 library API instead of the
> > old-school crypto API.  This is simpler and more efficient.
> > 
> > This depends on my SHA-2 library improvements for 6.17 (many patches),
> > so this patchset might need to wait until 6.18.  But I'm also thinking
> > about just basing the fsverity tree on libcrypto-next for 6.17.
> > 
> > Eric Biggers (2):
> >   lib/crypto: hash_info: Move hash_info.c into lib/crypto/
> >   fsverity: Switch from crypto_shash to SHA-2 library
> 
> FYI, I've applied this series to
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next
> so that it gets linux-next coverage.
> 
> As mentioned, it depends on the SHA-256 and SHA-512 improvements in
> lib/crypto/.  But Linus has also expressed a preference to not put too
> much in one pull request.
> 
> My current plan is to do 3 pull requests:
> 
>     1. "Crypto library updates" - most patches, mainly SHA-256 and
>        SHA-512 library improvements
> 
>     2. "Crypto library tests" - based on (1) but adds:
>         lib/crypto: tests: Add hash-test-template.h and gen-hash-testvecs.py
>         lib/crypto: tests: Add KUnit tests for SHA-224 and SHA-256
>         lib/crypto: tests: Add KUnit tests for SHA-384 and SHA-512
>         lib/crypto: tests: Add KUnit tests for Poly1305
> 
>     3. "Crypto library conversions" - based on (1) but adds:
>         apparmor: use SHA-256 library API instead of crypto_shash API
>         fsverity: Explicitly include <linux/export.h>
>         fsverity: Switch from crypto_shash to SHA-2 library
> 
> I'll put all of these in libcrypto-next for linux-next coverage, but (3)
> will have a slightly different base commit in the final version.

Correction: everything can have the same commit ID in libcrypto-next as
in the final pull requests, if I put (2) and (3) on their own branches
and merge them together.  I've done that.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
