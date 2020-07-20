Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28314226F26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 21:40:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxbeS-0006e7-Ah; Mon, 20 Jul 2020 19:40:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxbeQ-0006e0-Uc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y6BVDpL52lCgALkuLLIFKysM/ajhZN7Q5+fbXzkSpik=; b=PJxfw76PGuWU4xeBCmq7Au/kO+
 LKeh7UG+Hb7gCXb2drAQqKwsmE1cWR6AQjZXbQ55Wq0rfkXZhNkhuN8xK2Y9MYCPFxL29k/zy4tVV
 hlpJC3AjgGQxsq5wyj6RXFA3hBInDuJstJxaYn0bIBhdqfo1vM7slgHCDb5wwAatjaJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y6BVDpL52lCgALkuLLIFKysM/ajhZN7Q5+fbXzkSpik=; b=GJVWwnBOvTp0lAmLgWsLWCHomu
 hmXE0FUXe1Jfqv7HT58uSRree8vMqT2QRyORAX/wdGh08Z6mvTA1xArR27QiGANx9aRAG4/gjj/1U
 TmU2qHqUF7OJ5oOztIP6rTHdVMPgOLhFfHqV2APfY+7Kmg1DEYrRBEmNFHS0dRG6zkKk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxbeP-001zt3-On
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 19:40:38 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 328B920672;
 Mon, 20 Jul 2020 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595274032;
 bh=lAH/pO7NHoNYrDfJluSLCpW3uOX8+hweYMlfZ1rH62Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xintglz7XrZi1QsSOvZaC1N4Gx4Y0EBpdxbtteU3G7LoI/O6Cy9epxk2ektQ5pK1I
 GmAWXF+s74OAODL31vHTzmZ8JGtJHWc/hpKps/NK/BV+9jEoO69bK7NXwh9vKWQBjG
 bEHvuN4oIUxfjPkvNMRfQ6Ba/4N/GAqUL3xNfgq8=
Date: Mon, 20 Jul 2020 12:40:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200720194030.GI1292162@gmail.com>
References: <20200717014540.71515-1-satyat@google.com>
 <20200717014540.71515-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717014540.71515-8-satyat@google.com>
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
 -1.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxbeP-001zt3-On
Subject: Re: [f2fs-dev] [PATCH v3 7/7] fscrypt: update documentation for
 direct I/O support
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

On Fri, Jul 17, 2020 at 01:45:40AM +0000, Satya Tangirala wrote:
> Update fscrypt documentation to reflect the addition of direct I/O support
> and document the necessary conditions for direct I/O on encrypted files.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  Documentation/filesystems/fscrypt.rst | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index f3d87a1a0a7f..95c76a5f0567 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -1049,8 +1049,10 @@ astute users may notice some differences in behavior:
>    may be used to overwrite the source files but isn't guaranteed to be
>    effective on all filesystems and storage devices.
>  
> -- Direct I/O is not supported on encrypted files.  Attempts to use
> -  direct I/O on such files will fall back to buffered I/O.
> +- Direct I/O is supported on encrypted files only under some circumstances
> +  (see `Direct I/O support`_ for details). When these circumstances are not
> +  met, attempts to use direct I/O on such files will fall back to buffered
> +  I/O.

Nit: "such files" => "encrypted files".

Nit: most of the text in this file is formatted with textwidth=70.

>  
>  - The fallocate operations FALLOC_FL_COLLAPSE_RANGE and
>    FALLOC_FL_INSERT_RANGE are not supported on encrypted files and will
> @@ -1257,6 +1259,20 @@ without the key is subject to change in the future.  It is only meant
>  as a way to temporarily present valid filenames so that commands like
>  ``rm -r`` work as expected on encrypted directories.
>  
> +Direct I/O support
> +------------------
> +
> +Direct I/O on encrypted files is supported through blk-crypto. In
> +particular, this means the kernel must have CONFIG_BLK_INLINE_ENCRYPTION
> +enabled, the filesystem must have had the 'inlinecrypt' mount option
> +specified, and either hardware inline encryption must be present, or
> +CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK must have been enabled. Further,
> +any I/O must be aligned to the filesystem block size (*not* necessarily
> +the same as the block device's block size) - in particular, any userspace
> +buffer into which data is read/written from must also be aligned to the
> +filesystem block size. If any of these conditions isn't met, attempts to do
> +direct I/O on an encrypted file will fall back to buffered I/O.

This is placing "Direct I/O support" as a subsection of the
"Implementation details" section.

But the direct I/O support is more than just an implementation detail.

How about moving it to a top-level section?

I'd probably put it between "Access semantics" and
"Encryption policy enforcement".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
