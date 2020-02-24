Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D699316B12C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 21:51:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Kh1-0006yj-Hx; Mon, 24 Feb 2020 20:51:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j6Kgz-0006yK-UY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 20:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6W+sNfj/1MTXjduMkepO88V8Uiy2/7erPQFFCUQqjE0=; b=ZGNrwIbqBu1ss34L05tTRYw3fh
 wQTsMYK7G1P4LFPhc4aYPjwzNFZ4LrO9L/t4jc1CeHlpxg0YfJQwHP+ZkdS0dInGruX4DreiXL3Oe
 MhJjYn4LNtWVQ0BF9ovmzVosoEUUyPrhfa7OSIATmRRU/Br5AFIEkiPxY5VS2H4dAiJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6W+sNfj/1MTXjduMkepO88V8Uiy2/7erPQFFCUQqjE0=; b=AMh5XPh9ArmpOsfc2Uw3rhu8TE
 81cdWCdFKlUW0JA/fJoglqPnDvNYvFKMOK0Wk0rBVOAqMX5oQgs9aBqyB4v1T1aJyYGU21CxFl68R
 tzvYP3VNc/dJGPUTsqzozBi6nDOlUsFF0iGS8AAXHk6HuwJ088ms7bfUmF2E8gFKtSDg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Kgs-00FQGe-UO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 20:51:05 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FAF220726;
 Mon, 24 Feb 2020 20:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582577453;
 bh=3ws2XCyy6ILZso2oH4i/yzvd9uzvxwvQWJJv4TRuz70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9K9/4BBR6t94BgsvQWvL0MElmPNMiRWdsQHvAkOcAoRolDDWAYFaRQbGHAX/th9Y
 RfGNU35wJz/tbi+gRRQcx+ddhCAfCvP4LZS2XAnCxT4tDvB3hZsUZzmiW3hP0rlS1M
 0H4NWqJWja70WOgXrjABzy9YWTQImgBaVYFeNivo=
Date: Mon, 24 Feb 2020 12:50:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: mtk.manpages@gmail.com
Message-ID: <20200224205051.GE109047@gmail.com>
References: <20200128192449.260550-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128192449.260550-1-ebiggers@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 4.5 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.6 FSL_HELO_FAKE          No description available.
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
X-Headers-End: 1j6Kgs-00FQGe-UO
Subject: Re: [f2fs-dev] [man-pages PATCH v2] statx.2: document
 STATX_ATTR_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-man@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 28, 2020 at 11:24:49AM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Document the verity attribute for statx(), which was added in
> Linux 5.5.
> 
> For more context, see the fs-verity documentation:
> https://www.kernel.org/doc/html/latest/filesystems/fsverity.html
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  man2/statx.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/statx.2 b/man2/statx.2
> index d2f1b07b8..d015ee73d 100644
> --- a/man2/statx.2
> +++ b/man2/statx.2
> @@ -461,6 +461,11 @@ See
>  .TP
>  .B STATX_ATTR_ENCRYPTED
>  A key is required for the file to be encrypted by the filesystem.
> +.TP
> +.B STATX_ATTR_VERITY
> +Since Linux 5.5: the file has fs-verity enabled.  It cannot be written to, and
> +all reads from it will be verified against a cryptographic hash that covers the
> +entire file, e.g. via a Merkle tree.
>  .SH RETURN VALUE
>  On success, zero is returned.
>  On error, \-1 is returned, and
> -- 
> 2.25.0.341.g760bfbb309-goog
> 

Ping?  Michael, can you apply this man-pages patch?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
