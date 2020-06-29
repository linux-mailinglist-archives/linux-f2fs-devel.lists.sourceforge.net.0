Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE66720D2B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 20:53:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpyuV-00037W-6O; Mon, 29 Jun 2020 18:53:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jpyuS-00037M-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQJf8LHmMUXt50NU+avX3dMtH4TRcIqcMmjj5D6zJRo=; b=bCOp3dSIF7vlDl6rI2BORbEd9L
 KbArNuhVHROEZtmbtNDKZTSyriqvPXhs/+348swnWXUXLjYOADOKh0rPbBRyz1j3Nf8S5VlWAKGPG
 H1XyWvcoLK7PyPELzYLJbWGlKoAMR4dWTCYNFXilBH/BlzgsqAHh6/Y+vRpTpbdKUM3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQJf8LHmMUXt50NU+avX3dMtH4TRcIqcMmjj5D6zJRo=; b=UNUAu7hnwEvL9N1GR6wrVkc+3R
 mqb3hIxrTS2ASfFqS1/ecAWV8X3gxNAsN0oUKovdgyVarVaTIEsmXWIzUt8Ie7XmFYG+5orhE+Gh6
 VRq/Ncl+R3gvaguZ4awOP7k3rDC9EEeKxcfj6X3tH1hHfQvFTVQN6BT9Us2aZw3esst4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpyuM-002Jcz-L7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:53:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1E37204EC;
 Mon, 29 Jun 2020 18:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593456802;
 bh=W1gAL231GdpfTzeSawMbnT+/vhlibbLVm5O4BlAr+To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKjmzYSiQ96d+bPzFXbNs1Z1D7M6nBioD7k2Kk8wAD8D1sdT0KwrP+7dRymuowCMk
 W1GS85/L4li6HodUiqTV1+eyHgI6f+hLnjoWdVc8se4XffmDaW3gEVcjeX4I5DiRhT
 ryu6Fs1b9zJdpFPcejncKZrU0eIuvxpXWkQEFnC8=
Date: Mon, 29 Jun 2020 11:53:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200629185320.GH20492@sol.localdomain>
References: <20200629120405.701023-1-satyat@google.com>
 <20200629120405.701023-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629120405.701023-4-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpyuM-002Jcz-L7
Subject: Re: [f2fs-dev] [PATCH v2 3/4] f2fs: add inline encryption support
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 12:04:04PM +0000, Satya Tangirala via Linux-f2fs-devel wrote:
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
> Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Eric Biggers <ebiggers@google.com>

> ---
>  Documentation/filesystems/f2fs.rst |  7 +++
>  fs/f2fs/compress.c                 |  2 +-
>  fs/f2fs/data.c                     | 78 +++++++++++++++++++++++++-----
>  fs/f2fs/super.c                    | 35 ++++++++++++++
>  4 files changed, 108 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 099d45ac8d8f..8b4fac44f4e1 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -258,6 +258,13 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
>                         on compression extension list and enable compression on
>                         these file by default rather than to enable it via ioctl.
>                         For other files, we can still enable compression via ioctl.
> +inlinecrypt
> +                       When possible, encrypt/decrypt the contents of encrypted
> +                       files using the blk-crypto framework rather than
> +                       filesystem-layer encryption. This allows the use of
> +                       inline encryption hardware. The on-disk format is
> +                       unaffected. For more details, see
> +                       Documentation/block/inline-encryption.rst.
>  ====================== ============================================================

Last time I suggested adding "When possible, ", and it got added here but not in
the ext4 patch.  It should go in both.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
