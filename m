Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45753226F18
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 21:35:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxbZ5-0003k1-Pr; Mon, 20 Jul 2020 19:35:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxbZ4-0003ju-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lA1+qC7QACb23R53MaCLPvkBM3lRFGEEvxB2LF7DgAw=; b=I/1EHRoUtZ2FY0/Edl3DcMWafj
 4f6QXEYODSPKKikNOfvhYSVdDfQGOrh35hrChUYCRpNb7Ls7v7pcmqmnZbgZVEN77dzJQTVwWnEj8
 j11JTqbYYa5noGMqa7ll1KePodPSbOdOsCR8ETIaFrqwaaAAG9lhKuaKA/yAfanMGohA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lA1+qC7QACb23R53MaCLPvkBM3lRFGEEvxB2LF7DgAw=; b=D/HjX553S7qWAc947fFXYk14GT
 2wVzHnCM38WtJpadqJCDrrXunG0lxe4DQmj4ZWXcclI6d9AjWjpv3EIH3uv6wQWIDUzapQf/3a0ZF
 XQl5dZsD75OOQwS2mAoWLdRyzOw1pgd/SRJTblPV46MEoc+I9JWA/BbJOaAK3I6BAZSg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxbZ3-00BCJ0-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:35:06 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F190F207DF;
 Mon, 20 Jul 2020 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595273695;
 bh=gvoR90bmjWKLI6StivijfjivWNaNOvpnS43HZMXXkI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0ECqOAP5qntFeHvHP3rCgmLeWZmcRzkVpjPjpKKX7kc222b4dMmX7dKOhC4k0q20s
 s+qvigsG3jg0HwEhIG6q2zoyS//842FNc1Fb7Fh45OW6uxRqipMEFAIlYpdpg0AwOE
 edNygX41zP00UlndM2ZspUciOB1QqJ7lXDZa41AQ=
Date: Mon, 20 Jul 2020 12:34:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200720193453.GH1292162@gmail.com>
References: <20200717014540.71515-1-satyat@google.com>
 <20200717014540.71515-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717014540.71515-7-satyat@google.com>
X-Spam-Score: 0.9 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxbZ3-00BCJ0-CJ
Subject: Re: [f2fs-dev] [PATCH v3 6/7] fscrypt: document inline encryption
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 17, 2020 at 01:45:39AM +0000, Satya Tangirala wrote:
> Update the fscrypt documentation file for inline encryption support.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>

> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index f5d8b0303ddf..f3d87a1a0a7f 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -1204,6 +1204,18 @@ buffer.  Some filesystems, such as UBIFS, already use temporary
>  buffers regardless of encryption.  Other filesystems, such as ext4 and
>  F2FS, have to allocate bounce pages specially for encryption.
>  
> +Fscrypt is also able to use inline encryption hardware instead of the
> +kernel crypto API for en/decryption of file contents.  When possible, and
> +if directed to do so (by specifying the 'inlinecrypt' mount option for
> +an ext4/F2FS filesystem), it adds encryption contexts to bios and
> +uses blk-crypto to perform the en/decryption instead of making use
> +of the above read/write path changes.  Of course, even if directed to make
> +use of inline encryption, fscrypt will only be able to do so if either
> +hardware inline encryption support is available for the selected encryption
> +algorithm or CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is selected.  If neither
> +is the case, fscrypt will fall back to using the above mentioned read/write
> +path changes for en/decryption.
> +

Nit: most of the text in this file is formatted with textwidth=70.

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
>  
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
