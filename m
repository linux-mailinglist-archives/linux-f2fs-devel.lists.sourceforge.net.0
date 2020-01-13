Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F6139A24
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2020 20:26:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ir5Lp-0006PD-L0; Mon, 13 Jan 2020 19:26:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ir5Ln-0006Oz-M4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 19:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s+yb7IeKyZ+kocp0Hrz6EwLpFb61hBpuC0+jCxna1iQ=; b=UXLziAaQI8TkwMmd80wFunPYrd
 5PdRNyh5vKOkysUuxCfBZuE3l/ERVGlsxxp7SK5lDcr9m0c2fsEQAwZKkLlo/w0U7/H4KPW+ytKQQ
 5nqXFwdiqAFLBQeQboC9/pc9n+duXtVtglqgy88LeYqf0+1L6xpjb31oMQIQJnkivYGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s+yb7IeKyZ+kocp0Hrz6EwLpFb61hBpuC0+jCxna1iQ=; b=lDiZEf9TIpoE6aKIIC4+0CN02o
 GmUuHLFxAxYQfUAswhqxxEn3fTbM0Q23xld5zucLrxiVLTT6l0TOUOGf98VV2qWuvp3O7XsXLKhRc
 Q1KgFlrMQZb7BqaF/R5XCnRH4wyLiV4XYB4YHdMXzG0TTyxJAAOtOWoHLoX7vKasK5MU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ir5Lj-001NoT-TG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 19:26:11 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 266C3207FD;
 Mon, 13 Jan 2020 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578943557;
 bh=DD5S9iuxYpXunhrL2cvqmMc66yE8jaSRJQ6onOdBnn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kp5N2J4n+ei+Cys6P1YvX4y73k7lkbiY6fksm6fMit1C/yn0DZMwvpd2OZrHFxtYW
 +6ShGO04bygqPbhtv/dpgDjl2Sm4pm04tY5vC6PgrLcbtYfhxMZ7zqp8Osd546cq8s
 VhZ2r+lTuPvWUPUECeYmMenNQTNLm9dV0O93MN4A=
Date: Mon, 13 Jan 2020 11:25:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200113192555.GA188743@gmail.com>
References: <20200106205533.137005-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106205533.137005-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Headers-End: 1ir5Lj-001NoT-TG
Subject: Re: [f2fs-dev] [PATCH v2] fs-verity: implement readahead of Merkle
 tree pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 06, 2020 at 12:55:33PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When fs-verity verifies data pages, currently it reads each Merkle tree
> page synchronously using read_mapping_page().
> 
> Therefore, when the Merkle tree pages aren't already cached, fs-verity
> causes an extra 4 KiB I/O request for every 512 KiB of data (assuming
> that the Merkle tree uses SHA-256 and 4 KiB blocks).  This results in
> more I/O requests and performance loss than is strictly necessary.
> 
> Therefore, implement readahead of the Merkle tree pages.
> 
> For simplicity, we take advantage of the fact that the kernel already
> does readahead of the file's *data*, just like it does for any other
> file.  Due to this, we don't really need a separate readahead state
> (struct file_ra_state) just for the Merkle tree, but rather we just need
> to piggy-back on the existing data readahead requests.
> 
> We also only really need to bother with the first level of the Merkle
> tree, since the usual fan-out factor is 128, so normally over 99% of
> Merkle tree I/O requests are for the first level.
> 
> Therefore, make fsverity_verify_bio() enable readahead of the first
> Merkle tree level, for up to 1/4 the number of pages in the bio, when it
> sees that the REQ_RAHEAD flag is set on the bio.  The readahead size is
> then passed down to ->read_merkle_tree_page() for the filesystem to
> (optionally) implement if it sees that the requested page is uncached.
> 
> While we're at it, also make build_merkle_tree_level() set the Merkle
> tree readahead size, since it's easy to do there.
> 
> However, for now don't set the readahead size in fsverity_verify_page(),
> since currently it's only used to verify holes on ext4 and f2fs, and it
> would need parameters added to know how much to read ahead.
> 
> This patch significantly improves fs-verity sequential read performance.
> Some quick benchmarks with 'cat'-ing a 250MB file after dropping caches:
> 
>     On an ARM64 phone (using sha256-ce):
>         Before: 217 MB/s
>         After: 263 MB/s
>         (compare to sha256sum of non-verity file: 357 MB/s)
> 
>     In an x86_64 VM (using sha256-avx2):
>         Before: 173 MB/s
>         After: 215 MB/s
>         (compare to sha256sum of non-verity file: 223 MB/s)
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> Changed v1 => v2:
>   - Ensure that the pages continue being marked accessed when they're
>     already cached and Uptodate.
>   - Removed unnecessary IS_ERR(page) checks.
>   - Adjusted formatting of the prototype of f2fs_mpage_readpages() to
>     avoid a merge conflict with the f2fs tree.
> 
>  fs/ext4/verity.c             | 47 ++++++++++++++++++++++++++++++++++--
>  fs/f2fs/data.c               |  2 +-
>  fs/f2fs/f2fs.h               |  3 +++
>  fs/f2fs/verity.c             | 47 ++++++++++++++++++++++++++++++++++--
>  fs/verity/enable.c           |  8 +++++-
>  fs/verity/fsverity_private.h |  1 +
>  fs/verity/open.c             |  1 +
>  fs/verity/verify.c           | 34 +++++++++++++++++++++-----
>  include/linux/fsverity.h     |  7 +++++-
>  9 files changed, 137 insertions(+), 13 deletions(-)
> 

Ted and Jaegeuk, any more comments on this?  Can you provide Acked-bys?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
