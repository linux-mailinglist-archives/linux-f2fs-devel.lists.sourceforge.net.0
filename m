Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782818038F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2020 17:32:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBhoG-0007fx-89; Tue, 10 Mar 2020 16:32:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jBhoF-0007fq-0w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6UUlXs6s/wfkxq7kKSxxRt/BhpkTl3aXYt0Mf3Q25U=; b=Bw05hDwuUhO8pSxOzPyVDFK+Fl
 2ljUecxw6RtWAcRlgqT/bEvR6c88TBfoCZTeZ6R+pL1ZcY1muSMxLZ+ps4MKxn8Tb838CRHzkzLOw
 cYf2kaVcKJk/UyrcN9kH7YkEjkE3iT3B5lIqypc+w1pAlvKonktcoEXXuxRqVFdYkuRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v6UUlXs6s/wfkxq7kKSxxRt/BhpkTl3aXYt0Mf3Q25U=; b=l8uHHrw81JFwIX+fQBLVCHTZAQ
 A7SW6WtUtYYSfPugYaHsYVMPjxJnzBoKxj0VSLqWtyILeY6VERN7ttHkgkfy4wmJJuAQohVXD6Qyl
 8hrjfK+YSr/jYNh4gVDvkZkh0ef7MZKIShN6X1p3Uxcx9i7YXVAG9NNH924OsXhadMDA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBhoD-007miM-9S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:32:46 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89DBD20848;
 Tue, 10 Mar 2020 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583857959;
 bh=/2iPAON56KiKp4VwG3w8X0u28X5Zi54HWAvPebGYCEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rb36kZ2IbhnZyB3p1V4V9GfgNg6bejDxx1CE6wjMZfT6YUH/psCRAb2RrJkPjMgH2
 Go0BJJKKyZ5lTjS5QhXBu42kon1eWwEY210z/9Ec+pBRGEjfzfyFtu+GiWsT6Os2CD
 XunWcletPjGcSg/F8kGYtouEaW6O5e0gn8UznE8s=
Date: Tue, 10 Mar 2020 09:32:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200310163239.GC240315@google.com>
References: <20200310125009.12966-1-yuchao0@huawei.com>
 <20200310125009.12966-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310125009.12966-2-yuchao0@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jBhoD-007miM-9S
Subject: Re: [f2fs-dev] [PATCH 2/5] f2fs: force compressed data into warm
 area
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/10, Chao Yu wrote:
> Generally, data shows better continuity in warm data area as its
> default allocation direction is right, in order to enhance
> sequential read/write performance of compress inode, let's force
> compress data into warm area.

Not quite sure tho, compressed blocks are logically cold, no?

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 601d67e72c50..ab1bc750712a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3037,9 +3037,10 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  	if (fio->type == DATA) {
>  		struct inode *inode = fio->page->mapping->host;
>  
> -		if (is_cold_data(fio->page) || file_is_cold(inode) ||
> -				f2fs_compressed_file(inode))
> +		if (is_cold_data(fio->page) || file_is_cold(inode))
>  			return CURSEG_COLD_DATA;
> +		if (f2fs_compressed_file(inode))
> +			return CURSEG_WARM_DATA;
>  		if (file_is_hot(inode) ||
>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
>  				f2fs_is_atomic_file(inode) ||
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
