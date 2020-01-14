Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0F13B45A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 22:32:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irTnW-0005ff-HO; Tue, 14 Jan 2020 21:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1irTnN-0005fE-9F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZd7WF+QzAlg+j1cDCZOmZwyR7MO2sG59WK7olIJpVU=; b=MSm98KRRdAdAL2DFnz5+dnZaBJ
 Ch6wYZuI6coeWstGPpaL/m4mgNxr1UZosOIRw5kkBoEGtax9waCugeRn5b4NJscolcBDfGTe/fx34
 Dc2+GCHf8M3NucgI9hlEX8y7NBIw+PSgDOXWL/NB0MC80xawAuRia3OyYS8/TcVnoXEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZZd7WF+QzAlg+j1cDCZOmZwyR7MO2sG59WK7olIJpVU=; b=kz23fWO6kU/CN6VekW1mmWHq/U
 ow96IT3jPwv+4y/VWhUOc67hI2P4CPI9rzkXFAz3sCZTNLHhMROW7vuiI7QNPtSkKm5zj4HdG4ed+
 5jacs8CiWxnhG/pCbBYQoF/XgeftQpqCe6a6SOBcf9CUk6ltGB1AnlSQlL8hPs0q63Ts=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irTnJ-003Wet-T2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 21:32:17 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F10824656;
 Tue, 14 Jan 2020 21:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579037528;
 bh=1BLiOHY3+U5mgGQo0sq5tDdGfHavHOxZk/eO8aynUDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFAbY7RhdWOk14PGf8+P83JLb5NFJ0dIyAnlJOVYqj+j9q4AXhxPdWEQ5YxFbPRux
 3jJ4P2cwG2NOCfpyDCukOWJQ+2fbb0qD5N1hWCW+nD6sv8nKPhcdGIHj1Aq4Eidi00
 k14FYq1As+ta64nKhGMRtDCzi9Ke8z9/5k4Ckrtk=
Date: Tue, 14 Jan 2020 13:32:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200114213206.GH41220@gmail.com>
References: <20200106205410.136707-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106205410.136707-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irTnJ-003Wet-T2
Subject: Re: [f2fs-dev] [PATCH v3] fs-verity: implement readahead for
 FS_IOC_ENABLE_VERITY
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

On Mon, Jan 06, 2020 at 12:54:10PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When it builds the first level of the Merkle tree, FS_IOC_ENABLE_VERITY
> sequentially reads each page of the file using read_mapping_page().
> This works fine if the file's data is already in pagecache, which should
> normally be the case, since this ioctl is normally used immediately
> after writing out the file.
> 
> But in any other case this implementation performs very poorly, since
> only one page is read at a time.
> 
> Fix this by implementing readahead using the functions from
> mm/readahead.c.
> 
> This improves performance in the uncached case by about 20x, as seen in
> the following benchmarks done on a 250MB file (on x86_64 with SHA-NI):
> 
>     FS_IOC_ENABLE_VERITY uncached (before) 3.299s
>     FS_IOC_ENABLE_VERITY uncached (after)  0.160s
>     FS_IOC_ENABLE_VERITY cached            0.147s
>     sha256sum uncached                     0.191s
>     sha256sum cached                       0.145s
> 
> Note: we could instead switch to kernel_read().  But that would mean
> we'd no longer be hashing the data directly from the pagecache, which is
> a nice optimization of its own.  And using kernel_read() would require
> allocating another temporary buffer, hashing the data and tree pages
> separately, and explicitly zero-padding the last page -- so it wouldn't
> really be any simpler than direct pagecache access, at least for now.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> Changed v2 => v3:
>   - Ensure that the pages continue being marked accessed when they're
>     already cached and Uptodate.
> 
> Changed v1 => v2:
>   - Only do sync readahead when the page wasn't found in the pagecache
>     at all.
>   - Use ->f_mapping so that the inode doesn't have to be passed.
> 
>  fs/verity/enable.c | 45 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)

Applied to fscrypt.git#fsverity for 5.6.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
