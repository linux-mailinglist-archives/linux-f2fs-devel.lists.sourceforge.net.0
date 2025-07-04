Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A57BAF9400
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 15:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhDE3a7B2xVwQ3S+OgpSVoDvWXj28aQ2aBw0zfQCcWg=; b=dFEq7fbMIOTXbfN0jF4NmfrMYU
	NzBq7NscwY+qjqizT5Rmf2HBCRYpJ41WDdo7rGYH6Nmi43EYQEQ4tKfCZidCeqnrbvXV/CfkkfDnS
	mtRhby1A/gbtFWBIZDJQGweAEbg9ZPu70M4p58Tu2TbBYkS/5xTFFP0WN4151T1/GEYk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXgQi-0008VZ-9I;
	Fri, 04 Jul 2025 13:26:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1uXgQh-0008VS-0q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 13:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xP+rKGgbK/sciI32uu9zS3JuW57wwQ57jes/GPlVXp0=; b=AksqDt6GTdfL1cPlGnRZez/QcN
 +64ENnIRXrbXS4IJ8SqF9ktJXhr/1wrGMugAcITinqNkgIH633H3+wX+so0ECmLYgu5TQgBcqOgbl
 CZfSZDZxqLhTxV1k13q5m2D4vvqzREJHCl4nlv0j+95meIgCpUPKf4eP2KuPape8FL+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xP+rKGgbK/sciI32uu9zS3JuW57wwQ57jes/GPlVXp0=; b=DxZW5AyAB3Xc6uJw7g0jcvkUAi
 cLDoUAOGb9u3VArisE6pLcEcm4IuCpw/V5oj0MbtyPIk739wMVy+eSMbIAm/rP0UqctycztG0hwP0
 3M+RE/8Wb9ADp7Iu3hG7vO+OfNcTeqEm0cxH4IdRy5emNQpBiQR4LHMZsQu9T01XaPK4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXgQg-0000Ng-GU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 13:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D20C5C56F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 13:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AB0C4CEEE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751635568;
 bh=QfccnA0zgksNdZVm05TGsQ7eVbfl0jI/QjcOiED9+eg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mmRzdqSfD8ONxtlGzxNB29pHclwkaak8zScqIQshytzm/cx6ARkj8sp/kG8pRTdJ9
 COVGmCqf3SMaFTMRL1UsX8p/pWgLzL/AlQNhTJsLDojq0gdJO0yYlB7cGeYiFeTFUR
 BTZsySFOieY3QEO/6yWvG1qVXUlrIq/GNukGVrYDV9hcVEKBcdpy1ZfELW06zoXnxd
 F19/yKj/2aNYCZHSAlyLsP+LmzSCeJH8FFnmr9+aA92aAirL9B0lSlkLHbJwrK1Fjd
 ziZVgt8C6WW1KXEDQA+u6Nxf1bbhJ52bTRiBSIbpgVd5kB9SSIZJhaHaFFQdYHUgAQ
 ha89IDa3Cu5Sg==
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-553b584ac96so930195e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jul 2025 06:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXhppv30Atlwge1fAgeNRFk+yWmYD7YZuXQ2eKY+qi8Hj95CxZPTabk75PCENXm6q3koM6uhRiTIjjASurLFi5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyj+R1XIN9b1/sA0Ak6mkahsiQRRvb4trCDjCki6+K3lffRXWGL
 iFowJqItL3ZshAd9zRi5SchVT0uPr2bH+wGp8jDn/BCRlAqVVSNVhmE3j2ztW8NXXr7KlUF5ROa
 3JHxVcD1+KaZ+Shx4nXCj3SEBiGFIA7o=
X-Google-Smtp-Source: AGHT+IGvVOO4kge0EEISokAVNGwR5hqz4/i/BGd42crh5oVCF+hAQX4pwsOeZZ2n1F20FE5+Y24MNfsy4OsedRlOW9Q=
X-Received: by 2002:a05:6512:3a88:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-556dbe8b3e7mr1012627e87.9.1751635567154; Fri, 04 Jul 2025
 06:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250630172224.46909-1-ebiggers@kernel.org>
In-Reply-To: <20250630172224.46909-1-ebiggers@kernel.org>
Date: Fri, 4 Jul 2025 15:25:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG-eYjzxsZbCZKaje_a3jLAJMPXEu8Bb76O7ueO4tgisQ@mail.gmail.com>
X-Gm-Features: Ac12FXxiAnERbdwaoRjBCKkpahtdEbFUP_6dhB0XhYuW8ofqI7av77U-BIpSKE4
Message-ID: <CAMj1kXG-eYjzxsZbCZKaje_a3jLAJMPXEu8Bb76O7ueO4tgisQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 30 Jun 2025 at 19:24,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > This series, including all its prerequisites, is also available
 at: > > git fetch https://git.kernel.org/pub/scm/linux/kerne [...] 
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
X-Headers-End: 1uXgQg-0000Ng-GU
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
From: Ard Biesheuvel via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ard Biesheuvel <ardb@kernel.org>
Cc: fsverity@lists.linux.dev, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 30 Jun 2025 at 19:24, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series, including all its prerequisites, is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git fsverity-libcrypto-v1
>
> This series makes fs/verity/ use the SHA-2 library API instead of the
> old-school crypto API.  This is simpler and more efficient.
>
> This depends on my SHA-2 library improvements for 6.17 (many patches),
> so this patchset might need to wait until 6.18.  But I'm also thinking
> about just basing the fsverity tree on libcrypto-next for 6.17.
>
> Eric Biggers (2):
>   lib/crypto: hash_info: Move hash_info.c into lib/crypto/
>   fsverity: Switch from crypto_shash to SHA-2 library
>


Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  Documentation/filesystems/fsverity.rst |   3 +-
>  crypto/Kconfig                         |   3 -
>  crypto/Makefile                        |   1 -
>  fs/verity/Kconfig                      |   6 +-
>  fs/verity/enable.c                     |   8 +-
>  fs/verity/fsverity_private.h           |  24 +--
>  fs/verity/hash_algs.c                  | 194 +++++++++----------------
>  fs/verity/open.c                       |  36 ++---
>  fs/verity/verify.c                     |   7 +-
>  lib/crypto/Kconfig                     |   3 +
>  lib/crypto/Makefile                    |   2 +
>  {crypto => lib/crypto}/hash_info.c     |   0
>  12 files changed, 107 insertions(+), 180 deletions(-)
>  rename {crypto => lib/crypto}/hash_info.c (100%)
>
> --
> 2.50.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
