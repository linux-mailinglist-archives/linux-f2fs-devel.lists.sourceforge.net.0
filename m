Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F721AA0C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 23:55:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jteVY-00086O-Va; Thu, 09 Jul 2020 21:55:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jteVX-00083Q-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 21:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cMxx3qnB7/j4yqqLbG8GFA5JvTwM3wBROf0HeT1sKCg=; b=IzRGdASYcfZ51KuYNxq3X/1g/h
 O7u8SxA+uEhNoZyIjJNMNleBhWftVaF6IORxUPrjDLcJlqSI5NIVd77tP1lXz07oQuUuvMdJuTzrD
 U0Iqfy3WgPjKCXP5JvQpKw+KMcI6wjMF+IDFilHDqQDk6KN28oigFAGjmaNKrRht6uvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cMxx3qnB7/j4yqqLbG8GFA5JvTwM3wBROf0HeT1sKCg=; b=UgGby38Jg5JV/5S/dhZUuOcX2S
 FxAsqUl9R2XFMPT/hstMDE6zhXX8ijn41kPFmmri4edjFYpGcEqkCX+xcnIUEXh5nDWOiTfuAmG1w
 MsTI8pq1eeAVcZsVftOZxnZHe4/8aF7kB6ZsVMjexvBBghCpHq9Y8XGsgVgFzN7NOJZQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jteVV-00CbQ6-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 21:55:07 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2723820672;
 Thu,  9 Jul 2020 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594331700;
 bh=17t7u5FxwRuwcW6rNtkihmGzGdOtOv+v6GD8suZEV3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdkjFt0Ue4fI7oesmV7oIhfgvjKMAvuK4weMQ7ZeIomAJzcsxEkDPbbh5xldjJfmp
 tFWjL3tgmhIE/NE2SHWnz+zmMJPFpkLgGKEDrWBmnasWoYSoeWMMTmqH6dm8F0RvgY
 qjFgRYIh+npFHQvidp2glKI5JuYgo711bveB1GCU=
Date: Thu, 9 Jul 2020 14:54:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200709215458.GC3855682@gmail.com>
References: <20200709194751.2579207-1-satyat@google.com>
 <20200709194751.2579207-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709194751.2579207-2-satyat@google.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jteVV-00CbQ6-MJ
Subject: Re: [f2fs-dev] [PATCH 1/5] fscrypt: Add functions for direct I/O
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 09, 2020 at 07:47:47PM +0000, Satya Tangirala via Linux-f2fs-devel wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Introduce fscrypt_dio_supported() to check whether a direct I/O request
> is unsupported due to encryption constraints, and
> fscrypt_limit_dio_pages() to check how many pages may be added to a bio
> being prepared for direct I/O.
> 
> The IV_INO_LBLK_32 fscrypt policy introduces the possibility that DUNs
> in logically continuous file blocks might wrap from 0xffffffff to 0.
> Bios in which the DUN wraps around like this cannot be submitted. This
> is especially difficult to handle when block_size != PAGE_SIZE, since in
> that case the DUN can wrap in the middle of a page.
> 
> For now, we add direct I/O support while using IV_INO_LBLK_32 policies
> only for the case when block_size == PAGE_SIZE. When IV_INO_LBLK_32
> policy is used, fscrypt_dio_supported() rejects the bio when
> block_size != PAGE_SIZE. fscrypt_limit_dio_pages() returns the number of
> pages that may be added to the bio without causing the DUN to wrap
> around within the bio.

This commit message is a bit outdated, since the latest version of
"fscrypt: add inline encryption support" already makes IV_INO_LBLK_32
with block_size != PAGE_SIZE fall back to filesystem-layer encryption,
and hence it won't allow direct I/O.

> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Can you mention any changes you made, e.g.:

Signed-off-by: Eric Biggers <ebiggers@google.com>
[ST: split original change into separate patches, and updated to account
 for inline encryption no longer being allowed with IV_INO_LBLK_32 and
 blocksize != PAGE_SIZE]
Signed-off-by: Satya Tangirala <satyat@google.com>

> +/**
> + * fscrypt_limit_dio_pages() - limit I/O pages to avoid discontiguous DUNs
> + * @inode: the file on which I/O is being done
> + * @pos: the file position (in bytes) at which the I/O is being done
> + * @nr_pages: the number of pages we want to submit starting at @pos
> + *
> + * For direct I/O: limit the number of pages that will be submitted in the bio
> + * targeting @pos, in order to avoid crossing a data unit number (DUN)
> + * discontinuity.  This is only needed for certain IV generation methods.
> + *
> + * This assumes block_size == PAGE_SIZE; see fscrypt_dio_supported().

The note about block_size == PAGE_SIZE here is outdated.

I was also struggling a bit to decide what to name this function.  Note
that it's not really direct I/O specific.  Also, fs/iomap/direct-io.c
needs it but fs/direct-io.c does not.

What this function really does is batch together the mergeability checks
for a logical range.

Maybe the comment could explain this better, and maybe the function
should be called "fscrypt_limit_io_pages()" instead.

> + * Return: the actual number of pages that can be submitted
> + */
> +int fscrypt_limit_dio_pages(const struct inode *inode, loff_t pos, int nr_pages)
> +{
> +	const struct fscrypt_info *ci = inode->i_crypt_info;
> +	u32 dun;
> +
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return nr_pages;
> +
> +	if (nr_pages <= 1)
> +		return nr_pages;
> +
> +	if (!(fscrypt_policy_flags(&ci->ci_policy) &
> +	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
> +		return nr_pages;
> +
> +	if (WARN_ON_ONCE(i_blocksize(inode) != PAGE_SIZE))
> +		return 1;
> +
> +	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
> +
> +	dun = ci->ci_hashed_ino + (pos >> inode->i_blkbits);
> +
> +	return min_t(u64, nr_pages, (u64)U32_MAX + 1 - dun);
> +}

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
