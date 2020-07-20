Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5C226F87
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jul 2020 22:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxcAx-0005oA-AW; Mon, 20 Jul 2020 20:14:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxcAw-0005o3-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 20:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsGMGhzKIpTaob8DadHHmrZfJzdmog+xLTQECJDRdFI=; b=RM+j2AB9x3rFzpqPb+P2EJOwnD
 i0Fq8pZD3dvVeBQ3Mcj/2b+5v1K8RHNsvXpe7wE9kORr/9LKlT0hnDd5AI4NyRlpKSOVtK7wa0ozH
 cz2/eMr8DY5O+e7NREVZ5afsYznXeaVmbqnbmNtYD17xuaTYNFmb8fhUx3edFUGD/0ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EsGMGhzKIpTaob8DadHHmrZfJzdmog+xLTQECJDRdFI=; b=MgqLN8Jh9THIHp4h2Dgd5nwi88
 yYKX6ZZGEqLrNU/fpIv2jidjY8lRAfEpnzcJRMN11fNrUBFt8Nk29TNUvPUHEP4itZEEEPl7b7zXa
 rO+g+c8Z/xzLgl7sEwfz6yV/aECoO2nY4GARqKOgYaL+yj6F9nfAw/vsO/rWV3WFU980=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxcAv-0021uM-Cc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 20:14:14 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 680AD2080D;
 Mon, 20 Jul 2020 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595276045;
 bh=wDxijBprww99JyKZ7zq1b0Bm+gBJfpxa+gZiTN2MMac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPMtmi5EfngGRLVXC4qUYRQ1gdrrDIyuG8biGtRFAryZ0R9CC8s/0ZXIdD+Ovfbla
 JnQVA+559vhRMT7XehRKOYcnDREV63fo/E7ZW17Y80AOMn3OmELWauhiaC/+dIA1E8
 5l8h0NDI2Cq1StzoLJGfBfBTNTRRaqlHa6Pc2oyE=
Date: Mon, 20 Jul 2020 13:14:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200720201404.GJ1292162@gmail.com>
References: <20200717014540.71515-1-satyat@google.com>
 <20200717014540.71515-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717014540.71515-2-satyat@google.com>
X-Spam-Score: 2.4 (++)
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
X-Headers-End: 1jxcAv-0021uM-Cc
Subject: Re: [f2fs-dev] [PATCH v3 1/7] fscrypt: Add functions for direct I/O
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

On Fri, Jul 17, 2020 at 01:45:34AM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Introduce fscrypt_dio_supported() to check whether a direct I/O request
> is unsupported due to encryption constraints, and
> fscrypt_limit_io_pages() to check how many pages may be added to a bio
> being prepared for direct I/O.
> 
> The IV_INO_LBLK_32 fscrypt policy introduced the possibility that DUNs
> in logically continuous file blocks might wrap from 0xffffffff to 0.
> Since this was particularly difficult to handle when block_size !=
> PAGE_SIZE, fscrypt only supports blk-crypto en/decryption with
> the IV_INO_LBLK_32 policy when block_size == PAGE_SIZE, and ensures that
> the DUN never wraps around within any submitted bio.
> fscrypt_limit_io_pages() can be used to determine the number of logically
> contiguous blocks/pages that may be added to the bio without causing the
> DUN to wrap around within the bio. This is an alternative to calling
> fscrypt_mergeable_bio() on each page in a range of logically contiguous
> pages.

This is a bit hard to read, especially the second paragraph.  How about:


"Introduce fscrypt_dio_supported() to check whether a direct I/O request
is unsupported due to encryption constraints.

Also introduce fscrypt_limit_io_pages() to limit how many pages can be
added to a bio being prepared for direct I/O.  This is needed for the
iomap direct I/O implementation to avoid DUN wraparound in the middle of
a bio (which is possible with the IV_INO_LBLK_32 IV generation method).
Elsewhere fscrypt_mergeable_bio() is used for this, but iomap operates
on logical ranges directly and thus needs doesn't have a chance to call
fscrypt_mergeable_bio() on every block or page.  So we need a function
which limits a logical range in one go."


In particular, the detail about PAGE_SIZE better belongs in the code, I think.

> +/**
> + * fscrypt_limit_io_pages() - limit I/O pages to avoid discontiguous DUNs
> + * @inode: the file on which I/O is being done
> + * @pos: the file position (in bytes) at which the I/O is being done
> + * @nr_pages: the number of pages we want to submit starting at @pos
> + *
> + * Determine the limit to the number of pages that can be submitted in the bio
> + * targeting @pos without causing a data unit number (DUN) discontinuity.
> + *
> + * For IV generation methods that can't cause DUN wraparounds
> + * within logically continuous data blocks, the maximum number of pages is
> + * simply @nr_pages. For those IV generation methods that *might* cause DUN
> + * wraparounds, the returned number of pages is the largest possible number of
> + * pages (less than @nr_pages) that can be added to the bio without causing a
> + * DUN wraparound within the bio.

How about replacing the second paragraph here with:
 
 * This is normally just @nr_pages, as normally the DUNs just increment along
 * with the logical blocks.  (Or the file is not encrypted.)
 *
 * In rare cases, fscrypt can be using an IV generation method that allows the
 * DUN to wrap around within logically continuous blocks, and that wraparound
 * will occur.  If this happens, a value less than @nr_pages will be returned so
 * that the wraparound doesn't occur in the middle of the bio.  Note that we
 * only support block_size == PAGE_SIZE (and page-aligned DIO) in such cases.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
