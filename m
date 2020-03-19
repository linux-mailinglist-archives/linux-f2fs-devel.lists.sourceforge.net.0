Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3418BEC2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 18:50:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEzJ7-00013e-W6; Thu, 19 Mar 2020 17:50:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jEzJ6-00013O-5w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 17:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n3v7Qo7UXMC2dDYdfryQhqZTVU4gCuDB5SArvY8EYfI=; b=Agbly2RpfqKr0fZOya1K+j/mtM
 pVNfehVJBB5nnl/FCn1SLWlP1nGZ4aQVre+YA73YZBCEj8A6UB78f6QjTpKptxck8A7NhY0AsjUKz
 xZI0PApfILXO1Vdq141E7SkLTQS3LkDu05COQ0YRNGO0i5HeU0Xp3W4tbEFiJCj0pD0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n3v7Qo7UXMC2dDYdfryQhqZTVU4gCuDB5SArvY8EYfI=; b=bdP4PERn9kcR7mlJ0Y13GUcvC+
 awwkquADBZt6zi9TYcjdwgSNCXsh3iXnbcOwb7HjVxNG+AWewl35kfX1CBsWJWfJ5jKfv2q1T/wpa
 KhPS9URNEtz6m2KGyGeto0M2DHGbcorq3JcYEDZFhh1C1JA9KtlejmmakVsF1J2o+5FE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEzJ2-00ENg2-IU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 17:50:12 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEAF320754;
 Thu, 19 Mar 2020 17:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584640198;
 bh=q270uO9rTu9c4Si3zJtl3gemlVNKHIaUhROgwEp7OBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RjAeE0xh2CCBZepqFsBambYtHD23HJxQcmO5QvWPIVvcL9Hj3zrL/gqQXSIPdsLQV
 wf18INyaAJRrwz4uM3izP8cWDD0FPXAt7Ws1mnPcPaCgqIXnwR72MZo90M6T8GsYbY
 gv602IpzAB8trxpqGo8X3iDp5eociKy8nLMp6X0s=
Date: Thu, 19 Mar 2020 10:49:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200319174956.GA86395@gmail.com>
References: <20200314205052.93294-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314205052.93294-1-ebiggers@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jEzJ2-00ENg2-IU
Subject: Re: [f2fs-dev] [PATCH 0/4] fscrypt: add ioctl to get file's
 encryption nonce
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 14, 2020 at 01:50:48PM -0700, Eric Biggers wrote:
> This patchset adds an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves
> the nonce from an encrypted file or directory.
> 
> This is useful for automated ciphertext verification testing.
> 
> See patch #1 for more details.
> 
> Eric Biggers (4):
>   fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE ioctl
>   ext4: wire up FS_IOC_GET_ENCRYPTION_NONCE
>   f2fs: wire up FS_IOC_GET_ENCRYPTION_NONCE
>   ubifs: wire up FS_IOC_GET_ENCRYPTION_NONCE
> 
>  Documentation/filesystems/fscrypt.rst | 11 +++++++++++
>  fs/crypto/fscrypt_private.h           | 20 ++++++++++++++++++++
>  fs/crypto/keysetup.c                  | 16 ++--------------
>  fs/crypto/policy.c                    | 21 ++++++++++++++++++++-
>  fs/ext4/ioctl.c                       |  6 ++++++
>  fs/f2fs/file.c                        | 11 +++++++++++
>  fs/ubifs/ioctl.c                      |  4 ++++
>  include/linux/fscrypt.h               |  6 ++++++
>  include/uapi/linux/fscrypt.h          |  1 +
>  9 files changed, 81 insertions(+), 15 deletions(-)
> 
> 
> base-commit: 98d54f81e36ba3bf92172791eba5ca5bd813989b

Any comments on this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
