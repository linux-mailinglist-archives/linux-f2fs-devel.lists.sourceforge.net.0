Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4119E12FB6E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 18:14:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inQWf-0002Cv-D2; Fri, 03 Jan 2020 17:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1inQWe-0002Ca-2u
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CI7pCr11f+6bzxBsLEkwRNxxcrSYba/fPYStW3Uvkzo=; b=CZnu6nr8g4Fu/NYCMwZqxhVq3a
 e4o0L8lPphckC/ZZ3GXc7M8gaGuqJU9pi7sNdsTVzTZdqapEVtUDoiW3494zxshvRrNuPah7PvrjD
 loGN2fySCU9HdPrlGoQu8lnbqB2wCMrY1m8Jfc30xWt8RPS9jx5kctY23xTZ3aRIQ7sU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CI7pCr11f+6bzxBsLEkwRNxxcrSYba/fPYStW3Uvkzo=; b=YV5VMZ1vz++J1S7EOi7HeTomZ6
 fwm4hUNBqy60zYiHr7j/H2tybzUDpkUMPMk8WcJ9LUvhfZgBk8Xb1wS+/MEgOs4x8lWp4WjS6NSt8
 +wgwc2q6IGJMKBG/5z07tNDvhAp0O7pvX+owfxoCQVgJbO0uBZ3cA2rVtIlR4Y77nBXQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inQWS-008NnJ-VY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 17:14:16 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41B6820866;
 Fri,  3 Jan 2020 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578071637;
 bh=AuRBl8v/uqnhyO59/fcEhO8X0GrJrjk9X+uGwmn6iPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WjHl5s11l6p/ZZ2cE+Gms9M+r5fbBdtpkBoPQvsf+w4vofN9SL7w3OrjCZjSExGbQ
 66F8Xf/g5Rclf9S95up/kOzsPeZebE/TH76wPezXQIz8J1OpiuGQBsB3E18iDq4+DL
 i8ZCOjYhQ9AANFSzuONApx4WfqiTKJlC+GGzTA2c=
Date: Fri, 3 Jan 2020 09:13:55 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200103171355.GP19521@gmail.com>
References: <20191210183531.179836-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210183531.179836-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inQWS-008NnJ-VY
Subject: Re: [f2fs-dev] [PATCH v2] fs-verity: implement readahead for
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

On Tue, Dec 10, 2019 at 10:35:31AM -0800, Eric Biggers wrote:
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
> Changed v1 => v2:
> - Only do sync readahead when the page wasn't found in the pagecache at all.
> - Use ->f_mapping so that the inode doesn't have to be passed.
> 
> 
>  fs/verity/enable.c | 45 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 

Applied to fscrypt.git#fsverity for 5.6.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
