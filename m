Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A5B44490
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Sep 2025 19:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA5jKYqB9W9jg3aRvUadohNcB7cqoAcU91mgr7vVXrI=; b=QmFD77rcRhoeTlWIuKzM94VxMd
	CVDYlZEGGD0+oIDSyoil4/WirvsHTk1uEFfyu4x2bfb6+id8z+yDqqIt3z86LoZPQX351qbiqPaq+
	tJZ1HgjcTzwTv9gJdC5A3507evW8JUnosJigsIGa9UnJp3YQAi9gLqK58WGJ1o6AhuPY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uuDvn-0008BC-9N;
	Thu, 04 Sep 2025 17:39:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uuDvm-0008B6-Js
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 17:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VmCY9U4df+c3Y7iv+zxeOnIJBH8FQGRA4dO1F0hP2WU=; b=UwLq3eK7rr2LUaDPX/mGZ1pV51
 SRlwr9ABlq3D6m1WJHIk2WMNnW2xLLW3QzAiroKfyoG5YJB3PgNP2TkOkIf2TP7OQR/2F1/c+ucJy
 e/casoQ93/3H+LWJ1tg+I0PvRVRKmMjs6Sp5pNyIzvPJvntC5A8npIOVJsyrR2yBtJZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VmCY9U4df+c3Y7iv+zxeOnIJBH8FQGRA4dO1F0hP2WU=; b=DsNcgxaRSv3zxV22+Wu3maKG0y
 KuqDI5IB1WRUIIuzOYd13Wx3yxo7d0Vo8tccOWHYulKKlmzIj7wQ+TEc9oWFVY6aOqnsoBmbraz0v
 Uaj2/t8+lxgMyLTgfjXfyQ9j8J2vgCYRpKVhheX8vE67UmuuWQpL17gOct40KWLRXUDk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuDvm-0002Wf-7C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 17:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86A4160247;
 Thu,  4 Sep 2025 17:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA160C4CEF0;
 Thu,  4 Sep 2025 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757007559;
 bh=0TFVItmf9nXUHxwT077yaL+fpDSVSKq3dUyp0d4NDEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J83wFC/TCNlaLnUUOjMjVjrGL0c+vX3rbfHdQIxMpQ30ar9MaHUgG9JXETzwc07GF
 Gtfdjs1f5xJHVKdDz3nr3/SU7eNsqppEEDM7e845VK8E/yeQhLuJI4I/SQa+Pjpzei
 vEKqE7UdaZVN4l+9JJD4hbSJYftwEkjyIh6VR7GjBFQmB+1RmWpxbTlkkoSNixI2Pn
 qXRuPlboqpK0v839jhpubw6c7WhDmfErLOhJ2CSmJKMb51W/EE4YFhsNLL+AGi45WS
 2Ga99FLHB72JueCRjmTnkgj0l6xjtywX4Wwr0kdzhYJ2PSFnjloGDXRh22rrIZs6tO
 mxoQXeyX17N9Q==
Date: Thu, 4 Sep 2025 17:39:17 +0000
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <20250904173917.GB854551@google.com>
References: <20250904085449.290354-1-jprusakowski@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904085449.290354-1-jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 04, 2025 at 10:54:49AM +0200, Jan Prusakowski
 wrote: > _verify_ciphertext_for_encryption_policy() checks if encryption works
 > correctly by reading encrypted file's contents directly from [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uuDvm-0002Wf-7C
Subject: Re: [f2fs-dev] [PATCH v1] common/encrypt: Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 04, 2025 at 10:54:49AM +0200, Jan Prusakowski wrote:
> _verify_ciphertext_for_encryption_policy() checks if encryption works
> correctly by reading encrypted file's contents directly from a block device and
> comparing it to a known good ciphertext.
> 
> This, however, won't work if the file systems is also compressed. So this patch
> disables tests using this function when a compressed FS is used.

Apparently this is for f2fs.  There isn't really any such thing as a
"compressed filesystem" for f2fs.  Rather, f2fs supports compression on
a per-file basis: the filesystem can contain a mix of compressed and
uncompressed files.  Probably you used 'compression_extension=*', which
caused f2fs to automatically enable compression on the files that
xfstests created, which caused the test failure.  But that behavior is
specific to 'compress_extension=*', not to compression support per se.

> diff --git a/common/f2fs b/common/f2fs
> index 1b39d8ce..c46e2aa2 100644
> --- a/common/f2fs
> +++ b/common/f2fs
> @@ -25,3 +25,10 @@ _require_scratch_f2fs_compression()
>  		_scratch_unmount
>  	fi
>  }
> +
> +_require_f2fs_no_compress()
> +{
> +	if _normalize_mount_options "$MOUNT_OPTIONS" | grep -q "compress"; then
> +		_notrun "This test requires no compression enabled"
> +	fi
> +}

That just checks for compression support, not whether the test file is
actually compressed.

But also, we don't really need to skip these tests.  Instead, how about
using 'chattr +m' to explicitly set the test file to uncompressed?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
