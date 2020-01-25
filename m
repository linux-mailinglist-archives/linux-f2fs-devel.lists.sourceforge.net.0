Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FA149332
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jan 2020 04:58:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ivCa7-0008Jp-TS; Sat, 25 Jan 2020 03:57:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1ivCa6-0008Ja-BK
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 03:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lx0lKKnkqhl0zcGVWH7r4Ty17wTgyP7eWJIw8u2UES8=; b=FqNySSs2CB6dAKGJFtLaye/4XJ
 S6mFEU3nAyYghXgYjGav8j0XJ9bdwPI7MLTNw8VFPLE9LsQ2yb5j0Ru0hOpRdmxSOacdw00jcR289
 VDNuUU8+1pkgx/8q5yHHP6U8MzSRnX4exiyGrC5DvIW2GA6SvklzEiPaeJWY5syvJvqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lx0lKKnkqhl0zcGVWH7r4Ty17wTgyP7eWJIw8u2UES8=; b=haHaOR8DJGfeyCh+q86ubq+MG+
 Pg3pErSdg7ehgwz3sqchrRMokzkXPlz1+gx6BlLWeis6go6IqTyVqS4miysNtiZQotwj9igGayGbz
 xFU5CPUi2sUSzCoNkU+W/X0dLTy6fp8y/vREbtKLPNI3KDokz4Ig1YN7Z0rirUIpUEJA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ivCa4-004Zr9-UP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jan 2020 03:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lx0lKKnkqhl0zcGVWH7r4Ty17wTgyP7eWJIw8u2UES8=; b=iH3BlPfu1A1X7J+NKyJSKjuXD
 GWqzxemtGZlidnfLckCSUlh3uxKqlLMl5js8/AGNlozsz4suLtaPnBfhlU0ZoR+ZBeDsuH61dOSi9
 ZeCNNq2MEgScp7QeMzsvrUxdbQB0gMj4y9N2wWBUt05isit6e3rne6azh/ncYVIpgl4BC0/x/geV3
 MxZcb38PFW5p4FysEyJvIi7Y7pQaG+3E4cv/YbsbMWHUeep1VQx1+AgB/Uj2eAtxRH9cLv+G5hgRX
 V/9VG8Kw9BgHVjEoUccJi2nM2CqhQSk0BLKO4Rw8wV+GqKIjZvJ0JAa8O8aKC06qH7YJEoRiGaNeD
 QO9xevOAg==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivCZp-0007SX-Sz; Sat, 25 Jan 2020 03:57:41 +0000
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
References: <20200125013553.24899-1-willy@infradead.org>
 <20200125013553.24899-5-willy@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
Date: Fri, 24 Jan 2020 19:57:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200125013553.24899-5-willy@infradead.org>
Content-Language: en-US
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ivCa4-004Zr9-UP
Subject: Re: [f2fs-dev] [PATCH 04/12] mm: Add readahead address space
 operation
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/24/20 5:35 PM, Matthew Wilcox wrote:
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7d4d09dd5e6d..bb06fb7b120b 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -706,6 +706,8 @@ cache in your filesystem.  The following members are defined:
>  		int (*readpage)(struct file *, struct page *);
>  		int (*writepages)(struct address_space *, struct writeback_control *);
>  		int (*set_page_dirty)(struct page *page);
> +		unsigned (*readahead)(struct file *filp, struct address_space *mapping,
> +				 pgoff_t start, unsigned nr_pages);
>  		int (*readpages)(struct file *filp, struct address_space *mapping,
>  				 struct list_head *pages, unsigned nr_pages);
>  		int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -781,6 +783,15 @@ cache in your filesystem.  The following members are defined:
>  	If defined, it should set the PageDirty flag, and the
>  	PAGECACHE_TAG_DIRTY tag in the radix tree.
>  
> +``readahead``
> +	called by the VM to read pages associated with the address_space
> +	object.  The pages are consecutive in the page cache and are
> +        locked.  The implementation should decrement the page refcount after
> +        attempting I/O on each page.  Usually the page will be unlocked by
> +        the I/O completion handler.  If the function does not attempt I/O on
> +        some pages, return the number of pages which were not read so the
> +        common code can unlock the pages for you.
> +

Please use consistent indentation (tabs).

>  ``readpages``
>  	called by the VM to read pages associated with the address_space
>  	object.  This is essentially just a vector version of readpage.


cheers.
-- 
~Randy



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
