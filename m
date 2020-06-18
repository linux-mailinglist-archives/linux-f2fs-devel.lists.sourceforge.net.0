Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B641FFE58
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 00:50:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm3Ma-0005hV-8H; Thu, 18 Jun 2020 22:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jm3MY-0005hE-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 22:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0DnPzYvCNIqmY8RYk2xDZMjL3vkiT+YNHz0Ogz4IlI=; b=jxxDsCtfuI0k22vv7fqtGxqZNx
 EKHhc5ipLr08xjUW0bKSnQBuuzAq7RZxIr6wbRWjCHfBNlefojuIItm52wbn8DSYrcGazGHI806Lr
 BJolIQnl9ZTIDrCmxufGbwKwVlWjQmNNhk8BNaowcblRyOYrKDIsqN0gXQZjYnMC7AB8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C0DnPzYvCNIqmY8RYk2xDZMjL3vkiT+YNHz0Ogz4IlI=; b=Hx/yRVcw13+sEbwD7aJyrvbkEe
 Q/wvYPXEZWIAM1joGhp1M5oGecLT9Rf2D3PFReTkvURGd+4Yw0g9D1+zsrDPRueqiqSOX8GmOR9jt
 XrxqId969MGD7hArFUYBY/o7F7okYWI3afR8fCV2tDXIugXjOwj8/ZxgMLQh/vkych+w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jm3MW-009DQ6-W6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 22:50:26 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56F5220720;
 Thu, 18 Jun 2020 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592520611;
 bh=HYGod6h7F0uGZKxft0EPpj5IScO/V7jm1M/teBNdy6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+1dinT/55/j1xVvfBjHT5Et+P7+8KZg4YS557H8LYrg195s8hd/bYt7q+cQL6ZeO
 zlEj41LEnzrCKAAZ0yeGfyZbsTZY5xWsQemwiJN0ywf0k+qS4Mj4zfUXpiFe+wuBrG
 vLVCAVzIkptKANY2O81F1qNWTAD3JJQ4Bwcjs+OQ=
Date: Thu, 18 Jun 2020 15:50:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200618225009.GA35732@gmail.com>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617075732.213198-4-satyat@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jm3MW-009DQ6-W6
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: add inline encryption support
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 17, 2020 at 07:57:31AM +0000, Satya Tangirala wrote:
> Wire up f2fs to support inline encryption via the helper functions which
> fs/crypto/ now provides.  This includes:
> 
> - Adding a mount option 'inlinecrypt' which enables inline encryption
>   on encrypted files where it can be used.
> 
> - Setting the bio_crypt_ctx on bios that will be submitted to an
>   inline-encrypted file.
> 
> - Not adding logically discontiguous data to bios that will be submitted
>   to an inline-encrypted file.
> 
> - Not doing filesystem-layer crypto on inline-encrypted files.
> 
> This patch includes a fix for a race during IPU by
> Sahitya Tummala <stummala@codeaurora.org>
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  Documentation/filesystems/f2fs.rst |  7 ++-
>  fs/f2fs/compress.c                 |  2 +-
>  fs/f2fs/data.c                     | 81 ++++++++++++++++++++++++------
>  fs/f2fs/super.c                    | 32 ++++++++++++
>  4 files changed, 104 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 099d45ac8d8f..4dc36143ff82 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -258,7 +258,12 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
>                         on compression extension list and enable compression on
>                         these file by default rather than to enable it via ioctl.
>                         For other files, we can still enable compression via ioctl.
> -====================== ============================================================

The above line being deleted marks the end of a table, so it shouldn't be
deleted (it should go after the part below).

> +inlinecrypt
> +                       Encrypt/decrypt the contents of encrypted files using the
> +                       blk-crypto framework rather than filesystem-layer encryption.
> +                       This allows the use of inline encryption hardware. The on-disk
> +                       format is unaffected. For more details, see
> +                       Documentation/block/inline-encryption.rst.

Like I commented on one of the commit messages -- this doesn't make it clear
what happens in cases where blk-crypto can't be used.  Maybe just replace:
"Encrypt/decrypt" => "When possible, encrypt/decrypt".

Likewise for the ext4 documentation for this same mount option.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
