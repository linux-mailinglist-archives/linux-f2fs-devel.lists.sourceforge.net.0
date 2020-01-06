Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CC1316E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 18:39:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioWLz-0003sl-6X; Mon, 06 Jan 2020 17:39:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ioWLy-0003sc-IS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 17:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3PL/H4roKUaPXFc/poI+WD68zJSurEf6ubUqNKq85Y=; b=NxK+O1irNSRdrMMbYjlTEl/CCj
 RZEFBsADLQJZ7t7ORIx36baigreW9WZ3GTKZwN1pTt9cjRd+cY5Vv83L4hRB5G+fknPgWG+68SoAN
 RV6gLte3Xgd0QkVcfU1MORI3J6cPoUaP5s5QJcAyDudaEy9y716GHhh+IzMV4AKFx4F8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T3PL/H4roKUaPXFc/poI+WD68zJSurEf6ubUqNKq85Y=; b=SPHlS9C2Kkrkj2oNGfzSu+juol
 bEOeWh9+U1XqurbKfa8XYVwaI2vOPH1hSiumadooqfJt9DKQtIv7txSN1jFo4PfqNChe7ichpePer
 WYDn4kdjwiku6Y10aVQqRfXkciUwYG3QTkHLZv0NzE/QKRf5t2PLbbfSibm6Vz33NMVI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioWLk-00CWFY-7g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 17:39:46 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DB1D2072A;
 Mon,  6 Jan 2020 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578332366;
 bh=OXZgf0k7xd7rBA1tZNKolmh6j+YPkTUZo0qqiYRHM58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z70GJeJgdAOBVUnpxon9w4jApnha9hivCtqOl7MSzyiFbCgJ2qqs3QPkNVG8Pcyg/
 yjSCMDMA/F5kjpEjwAVYwRBCWcWxAN64Z7T9Yh7uatA3dGZcr1QAWg+BQQOoyV56SL
 JUcfL5xp3ylE+jEzTEeRqfla+OZVvHgZs3Yl6DjM=
Date: Mon, 6 Jan 2020 09:39:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200106173924.GA168318@gmail.com>
References: <20191216181112.89304-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216181112.89304-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioWLk-00CWFY-7g
Subject: Re: [f2fs-dev] [PATCH] fs-verity: implement readahead of Merkle
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

On Mon, Dec 16, 2019 at 10:11:12AM -0800, Eric Biggers wrote:
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
>     On ARM64 phone (using sha256-ce):
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
>  fs/ext4/verity.c             | 49 ++++++++++++++++++++++++++++++++++--
>  fs/f2fs/data.c               |  6 ++---
>  fs/f2fs/f2fs.h               |  3 +++
>  fs/f2fs/verity.c             | 49 ++++++++++++++++++++++++++++++++++--
>  fs/verity/enable.c           |  8 +++++-
>  fs/verity/fsverity_private.h |  1 +
>  fs/verity/open.c             |  1 +
>  fs/verity/verify.c           | 34 ++++++++++++++++++++-----
>  include/linux/fsverity.h     |  7 +++++-
>  9 files changed, 143 insertions(+), 15 deletions(-)

Ted and Jaegeuk, have you had a chance to review this patch?  I could use your
Acked-bys on it, since it touches fs/ext4/ and fs/f2fs/.

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a034cd0ce0217..8a6b3266bd794 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1881,9 +1881,9 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>   * use ->readpage() or do the necessary surgery to decouple ->readpages()
>   * from read-ahead.
>   */
> -static int f2fs_mpage_readpages(struct address_space *mapping,
> -			struct list_head *pages, struct page *page,
> -			unsigned nr_pages, bool is_readahead)
> +int f2fs_mpage_readpages(struct address_space *mapping,
> +			 struct list_head *pages, struct page *page,
> +			 unsigned int nr_pages, bool is_readahead)
>  {

FYI, I'm aware that the f2fs compression patch (which is queued in f2fs/dev)
also makes f2fs_mpage_readpages() non-static, but uses slightly different
formatting.  If/when I apply this patch I'll adjust it to match f2fs/dev so that
there's no merge conflict.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
