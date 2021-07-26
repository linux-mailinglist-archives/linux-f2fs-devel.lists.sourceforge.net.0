Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3463D51FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jul 2021 05:59:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7rlY-0005LS-0G; Mon, 26 Jul 2021 03:58:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m7rlX-0005LM-Gd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 03:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/wZKk/9M4mrA/k2eksngnMyL5wb+6hSiwwO2LHSHRfI=; b=L3bATCanroqUIxB+47R5TrNIul
 iLnYPMQPty7/EXOdWCo4uJ1uw54/YRAuEJf9UdDurGOEDMHjJSE/a7Uw0P3YYFiU+ZYs/0nZVKHYT
 Z/0COt7y93GQ2nf+0eZFUmnhZBXgHi36fgKkvWzy5ejB/WOGkuLV5LRnXQVZ7LK/55ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/wZKk/9M4mrA/k2eksngnMyL5wb+6hSiwwO2LHSHRfI=; b=g8B3Q4m2mdZ0y96+LyTtkPGSJG
 ceWwoful0+8gfLi4BMMVr1pgeUJu3klqQUBUZHQdDnaVYHMA5D9SikTxYJkmcC/Q+GUk2GbwrL+V2
 GB4LmlLEfRca48BQ2vEZggdI0PCQGmViA5xWhCrVgCKt4fkcEFyAq1tpSel5QxkW9l0M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7rlN-0007f8-NW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 03:58:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FA6960EB2;
 Mon, 26 Jul 2021 03:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627271915;
 bh=WPLxji5Fu3Q2Q6hrxcLMN8a8q3esfgs4pl4CERub5YQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qgmYCrRdhNjrVPAoHCovW00SjzclRfqwwr+TF3YR2+VJF1OfgIcpNJhkK4eByklBX
 1XsJZZP4DbXkPdxsLdLYxA0F0+DFSdkn+q82TKancpVQOq8njTx5CMjF365UH0jLct
 +XR0U8gxeOY8AKCfFMl8mQ4vk8iUZzr5EkvUdRyExEMjbU5Ihr5JHoZbSbzkOIcn1x
 KnYkutj0MPTAemKe1UU4n1kFuON6bpcSgNOo/rQL9qTHaQ9hC4omSBP1szv45dUwzW
 D9kauqkb7x7Q6cQlBmkD77q96XTWfchBYyNXTSZkExEq3gQ9n9Bt7ND2MMha2wKIni
 Y6XgTywBxx92g==
Date: Sun, 25 Jul 2021 20:58:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YP4y6izInCXVJMup@sol.localdomain>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -1.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m7rlN-0007f8-NW
Subject: Re: [f2fs-dev] [PATCH 0/5] fscrypt: report correct st_size for
 encrypted symlinks
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 01, 2021 at 11:53:45PM -0700, Eric Biggers wrote:
> This series makes the stat() family of syscalls start reporting the
> correct size for encrypted symlinks.
> 
> See patch 1 for a detailed explanation of the problem and solution.
> 
> Patch 1 adds a helper function that computes the correct size for an
> encrypted symlink.  Patches 2-4 make the filesystems with fscrypt
> support use it, and patch 5 updates the documentation.
> 
> This series applies to mainline commit 3dbdb38e2869.
> 
> Eric Biggers (5):
>   fscrypt: add fscrypt_symlink_getattr() for computing st_size
>   ext4: report correct st_size for encrypted symlinks
>   f2fs: report correct st_size for encrypted symlinks
>   ubifs: report correct st_size for encrypted symlinks
>   fscrypt: remove mention of symlink st_size quirk from documentation
> 
>  Documentation/filesystems/fscrypt.rst |  5 ---
>  fs/crypto/hooks.c                     | 44 +++++++++++++++++++++++++++
>  fs/ext4/symlink.c                     | 12 +++++++-
>  fs/f2fs/namei.c                       | 12 +++++++-
>  fs/ubifs/file.c                       | 13 +++++++-
>  include/linux/fscrypt.h               |  7 +++++
>  6 files changed, 85 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 3dbdb38e286903ec220aaf1fb29a8d94297da246

All applied to fscrypt.git#master for 5.15.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
