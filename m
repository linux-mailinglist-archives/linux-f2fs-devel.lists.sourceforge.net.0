Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A44A215D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 01:56:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcwN9-00080t-Et;
	Wed, 29 Jan 2025 00:56:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tcwN2-00080a-Vl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJQf0TPyuhEeQZ0a4V+OZ72Iu2iKhB0OFe4o6fsP+TM=; b=aIIT3GOb7S1Tq3x7NNf9mujlIG
 zEUwQmZW+F2hQEdCNb5SP3LyaYxrHnBe108DYC9LPQEGpDRlMtEVZFtNnsa71rsNXejDAQ1PeTf02
 Vyk7jK7jUbjBIuuYd3u2pS/9bC4qmpB+7CoCIJF1I0pyvCwGeMzAcabL77HbK0x81Zrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJQf0TPyuhEeQZ0a4V+OZ72Iu2iKhB0OFe4o6fsP+TM=; b=NI0rvw0zYzjLNfbl2HS8+auFkF
 Rk9jaWttTPZSPsymkfmcoiOu7pM9wXefRl7uPP+3zbzuVka0ZTzyL783v/31Sk8Q7dpI+Kqf4k72E
 zpywvRNSijAxgJJfcSoF5Y+X2qL1eCgHMzTB1lgTuE4EDDqHruHtIHqdteRnvmLF5phY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcwN1-0001Lh-TM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6219CA415EA;
 Wed, 29 Jan 2025 00:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0E2C4CED3;
 Wed, 29 Jan 2025 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738112144;
 bh=7lLgfsbUvvXkuZ/CHyObEqTqK07OIPpnMi3L8CLFkWY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a0Tp33LEr5mdpx4Jdes8W04nWqwEaLorvXlTwLQeltYmYb4klZ+1dz2ywlTC1b8vX
 3+k4ui1fUmLbcFjL5APZZHqXajEfDw8XK18yEtuoVQbYLE2/KJ3OWDxcoyJSsIsYNE
 DtQEthCyYqS56sQa1kB1Swn6qPUBhCaLAgWkwja3f55uChLvycrhuijZWm8POhmtni
 ykUeyJuvAvFNmoLZJQP4RIXBzVayDzL59pE6M7xHqHJCz+rWiTvl4EPHbNFmFx8Chm
 4j7efWWME8OF3uvIkfJk+9cFoNkYjHICLOSesiRjPTBgLZGNKhAvpDasPjs5mHTnv5
 F99y903Tt3oVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE01380AA66; Wed, 29 Jan 2025 00:56:11 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173811217076.3973351.8137382917166262630.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jan 2025 00:56:10 +0000
References: <20241202010844.144356-1-ebiggers@kernel.org>
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Sun, 1 Dec 2024 17:08:25 -0800 you
 wrote: > This patchset applies to v6.13-rc1 and is also available in git
 via: > > git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 crc [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcwN1-0001Lh-TM
Subject: Re: [f2fs-dev] [PATCH v4 00/19] Wire up CRC32 library functions to
 arch-optimized code
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Sun,  1 Dec 2024 17:08:25 -0800 you wrote:
> This patchset applies to v6.13-rc1 and is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4
> 
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,01/19] lib/crc32: drop leading underscores from __crc32c_le_base
    https://git.kernel.org/jaegeuk/f2fs/c/0a499a7e9819
  - [f2fs-dev,v4,02/19] lib/crc32: improve support for arch-specific overrides
    https://git.kernel.org/jaegeuk/f2fs/c/d36cebe03c3a
  - [f2fs-dev,v4,03/19] lib/crc32: expose whether the lib is really optimized at runtime
    https://git.kernel.org/jaegeuk/f2fs/c/b5ae12e0ee09
  - [f2fs-dev,v4,04/19] crypto: crc32 - don't unnecessarily register arch algorithms
    https://git.kernel.org/jaegeuk/f2fs/c/780acb2543ea
  - [f2fs-dev,v4,05/19] arm/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/1e1b6dbc3d9c
  - [f2fs-dev,v4,06/19] loongarch/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/72f51a4f4b07
  - [f2fs-dev,v4,07/19] mips/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/289c270eab5e
  - [f2fs-dev,v4,08/19] powerpc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/372ff60ac4dd
  - [f2fs-dev,v4,09/19] s390/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/008071917dfc
  - [f2fs-dev,v4,10/19] sparc/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/0f60a8ace577
  - [f2fs-dev,v4,11/19] x86/crc32: update prototype for crc_pcl()
    https://git.kernel.org/jaegeuk/f2fs/c/64e3586c0b61
  - [f2fs-dev,v4,12/19] x86/crc32: update prototype for crc32_pclmul_le_16()
    https://git.kernel.org/jaegeuk/f2fs/c/1e6b72e60a5a
  - [f2fs-dev,v4,13/19] x86/crc32: expose CRC32 functions through lib
    https://git.kernel.org/jaegeuk/f2fs/c/55d1ecceb8d6
  - [f2fs-dev,v4,14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
    https://git.kernel.org/jaegeuk/f2fs/c/cc354fa7f016
  - [f2fs-dev,v4,15/19] lib/crc32: make crc32c() go directly to lib
    https://git.kernel.org/jaegeuk/f2fs/c/38a9a5121c3b
  - [f2fs-dev,v4,16/19] ext4: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/f2b4fa19647e
  - [f2fs-dev,v4,17/19] jbd2: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/dd348f054b24
  - [f2fs-dev,v4,18/19] f2fs: switch to using the crc32 library
    https://git.kernel.org/jaegeuk/f2fs/c/3ca4bec40ee2
  - [f2fs-dev,v4,19/19] scsi: target: iscsi: switch to using the crc32c library
    https://git.kernel.org/jaegeuk/f2fs/c/31e4cdde4d8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
