Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4C3D41AB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 22:43:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m720k-0008Rz-Bv; Fri, 23 Jul 2021 20:43:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m720j-0008Rs-5b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 20:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gshdmV5sCPIyTsnONig0vf9pb2L6W0zCgVoo+HoA69Q=; b=C/iZVh2WkPrhzCZmMh6+SJvMv2
 xA29jHSISJasp3PL4zesk2zic7MCXP0h74l6fvZm1p+BuX7CS4YnQl63BhDM19NXE8cBOB4vXxHh5
 ro0pCzaJViZZB6fJi35HhiZiVbGCq0VlwewjcXhjiQo92wMjBmRV4EFh6rEP2AG9wGVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gshdmV5sCPIyTsnONig0vf9pb2L6W0zCgVoo+HoA69Q=; b=KTYftvD5ZX1mqG3x5JLhtPF1RI
 hlnsV81HYxQYVLixQjmVJMIA1YGqc9aGk3XNSFyRym72OkyYrfRurnpOVJ872UFdyTdNMLWutZquN
 frc08ketHha1gNJnANC/hKi/NR0aV7pM5bEQbAaYzpFCyNynLChdVjP5B8wJsClRPYbM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m720b-00070d-9L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 20:43:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75F8160F23;
 Fri, 23 Jul 2021 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627072975;
 bh=TQl9qpbSL80dQcAC9WCWLAGTK4VIfAAnAyZ6NEgT94M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T1+CBtZyuA9OIlEWZhVkp/TH/VYyWc/syzT/QR7XR/sSNAqlNn4jkiyy5MWY4ad6H
 /Um9CPCGc2BTgVe5udLbu6YXr3zNu3Tj5HTvkQldQws8yBAst9mXG058FjKfPYm8FG
 lFJv6t0o9xd+CM25ebapR9MFZ743Q7FMKIF+9QvEHFTAhKIuHuJaYlfVVWUROJlykA
 9LGt8F0IwH4Yu59CYyJB1g283VPmCE8tIHrKm3ZwrE5NG7h+eag7crHnaHOCMmKILg
 pfBQULmJlkI7OqponWRHDB+NsVIcDvIZxNi9duVI8cF5ib/oA7qYRGN+5NBvFy7E3B
 i+m57No0e/C6w==
Date: Fri, 23 Jul 2021 13:42:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <YPspzik6k71BD/EJ@gmail.com>
References: <20210604210908.2105870-1-satyat@google.com>
 <20210604210908.2105870-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604210908.2105870-4-satyat@google.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m720b-00070d-9L
Subject: Re: [f2fs-dev] [PATCH v9 3/9] fscrypt: add functions for direct I/O
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 04, 2021 at 09:09:02PM +0000, Satya Tangirala wrote:
> +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	const struct inode *inode = file_inode(iocb->ki_filp);
> +	const unsigned int blocksize = i_blocksize(inode);
> +
> +	/* If the file is unencrypted, no veto from us. */
> +	if (!fscrypt_needs_contents_encryption(inode))
> +		return true;
> +
> +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return false;
> +
> +	/*
> +	 * Since the granularity of encryption is filesystem blocks, the I/O
> +	 * must be block aligned -- not just disk sector aligned.
> +	 */
> +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_count(iter), blocksize))
> +		return false;

The above comment should make it clear that "block aligned" here intentionally
applies to just the position and total length, not to the individual data
buffers, for which only disk sector alignment is required.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
