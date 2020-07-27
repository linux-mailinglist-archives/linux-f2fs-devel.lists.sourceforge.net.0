Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357A22F597
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jul 2020 18:43:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k06Dg-0000k9-Qa; Mon, 27 Jul 2020 16:43:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1k06Dg-0000k3-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGCYX5cp2EM+MhfWUUVGNJkbVh6W13QIdEuDBeimAaw=; b=LU89Djw5ky2tqwj7pb2PQbnaTk
 Hx1MmKwwtJPUOyUWlKmi5YPJ5fSQ88klqysnM+Qh+rUuH3yaiM7BoSyBgJbDLN+dsdthYt7j+Mx8g
 Ope/Nn4oMyIiImuBu5fYRApH8KHslCoyoO+e7cL8nivr3BU1pMg3zhuvztVsCn2DPtx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cGCYX5cp2EM+MhfWUUVGNJkbVh6W13QIdEuDBeimAaw=; b=mB47/zF+0D9NEMC1XfPPma1/UF
 7FT8lvrLiNrNcdCwmMdoJF+mtxtpoYQeNqGRoZ4pZET7cjqXHZ894QuAFCKCHjrlCLegX8OLVIint
 ISpWYBuo6g1YCu+1OadAkdaOkiWiZx3dCJigQVoCYpvHCug0FMlGn/JM1kGFJ7mCF6Sc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k06Dd-001Gib-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jul 2020 16:43:20 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 584542073E;
 Mon, 27 Jul 2020 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595868192;
 bh=WCH9zfyg8tmZ1CDKwMEvUMAMGGTDY/5uLOBdgMEDeOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6aKlvnwdyjHmrcM++1cTpF4QI1KZKk6ArDU/w7++2I/AKBbnfSS5KX619WzGAKPJ
 1paTP8Uy6DubwHcQksRt0Gm1lV+Kxy/VPtRRHVXW7BOvi5gEiU7/sR5eJG40Vn/7UR
 YHh0Memr/gx3lWSCnXiYRCsI8iA/F9AQYM0APa5A=
Date: Mon, 27 Jul 2020 09:43:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200727164310.GD1138@sol.localdomain>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724184501.1651378-7-satyat@google.com>
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
X-Headers-End: 1k06Dd-001Gib-Uo
Subject: Re: [f2fs-dev] [PATCH v6 6/7] fscrypt: document inline encryption
 support
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 24, 2020 at 06:45:00PM +0000, Satya Tangirala wrote:
> Update the fscrypt documentation file for inline encryption support.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/filesystems/fscrypt.rst | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index 1a6ad6f736b5..423c5a0daf45 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -1204,6 +1204,18 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
>  buffers regardless of encryption.  Other filesystems, such as ext4 and
>  F2FS, have to allocate bounce pages specially for encryption.
>  
> +Fscrypt is also able to use inline encryption hardware instead of the
> +kernel crypto API for en/decryption of file contents.  When possible,
> +and if directed to do so (by specifying the 'inlinecrypt' mount option
> +for an ext4/F2FS filesystem), it adds encryption contexts to bios and
> +uses blk-crypto to perform the en/decryption instead of making use of
> +the above read/write path changes.  Of course, even if directed to
> +make use of inline encryption, fscrypt will only be able to do so if
> +either hardware inline encryption support is available for the
> +selected encryption algorithm or CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK
> +is selected.  If neither is the case, fscrypt will fall back to using
> +the above mentioned read/write path changes for en/decryption.
> +
>  Filename hashing and encoding
>  -----------------------------
>  
> @@ -1250,7 +1262,9 @@ Tests
>  
>  To test fscrypt, use xfstests, which is Linux's de facto standard
>  filesystem test suite.  First, run all the tests in the "encrypt"
> -group on the relevant filesystem(s).  For example, to test ext4 and
> +group on the relevant filesystem(s).  One can also run the tests
> +with the 'inlinecrypt' mount option to test the implementation for
> +inline encryption support.  For example, to test ext4 and
>  f2fs encryption using `kvm-xfstests
>  <https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md>`_::

Since this patch is separate from the direct I/O support, I've applied it to
fscrypt.git#master for 5.9.  I'm not applying the direct I/O patches yet.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
