Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4D3C67CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 03:03:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m36pB-00077A-DJ; Tue, 13 Jul 2021 01:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1m36p9-00076w-RC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 01:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2UAwQ9ZVgQGqDdPeaxGAkvz1PPEOg8m4IdLozVtCErc=; b=N2RoNXZBdkeZO6LHi+MHqpzHh1
 8qBagSGCaTWoyfabO64ZGTnHn8YH3FQwTYzRbvI8Iet3T0So+DpMKa0vjMmRRs0lRQMWIOW2Ram3P
 LPKm8i66kTtjs4ZJxnaepS0BgaKRqXT061fRFEUL6Wus4HykPikLYggJoSQU67HCT2cM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2UAwQ9ZVgQGqDdPeaxGAkvz1PPEOg8m4IdLozVtCErc=; b=BeeLZF7wC+COLGu672wkRIR1a2
 7jdYOEDm6JDoWpZVZLLZkDFbr/0ytxOlNEVMvHTevRyD70j70DuQFWaBtBU9TLIEApNAI22pkoqEA
 37qJbBobAoUfxRuAf9jR3Y+woIZNqyJ5SSnTfr0m0kgIxg+vZrRcmNnPxdyPVAR7By60=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m36ot-006NfE-HL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 01:02:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EC2A611CC;
 Tue, 13 Jul 2021 01:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626138147;
 bh=wmsUL1R2xXv/lc0kVW0n4SuQ1K4WRdLz0Vs5Mq0sQQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z7msqr9I4jFcGyIIVaVeeFiSdV1KAox118ZjCxQe4nvCayB4615onakJ7fWb8kiPe
 qFIm9jMVYNQT64+ZKSOez774UGtAozFQQEXZqUGWWPyrwWgcmP2GDGf0DQ94Vp5eaP
 59t8ZA7xm3usHNzAJBRwuST9unrJqNcRg+t2i77q5vNp7kMsSg++9Zp1F+KLYk91y2
 KeczINZZCSvp3INrsc6INpR0LSm/k5pAAISF2N4jx6aoDcee8WJHXESX2qMlEbtTSi
 7vS9s3efb3T1OPcbLvjQZMSCaZlgdDiSd/bAgMC/v938DAqkvuzHctHnl5/KnQRbR+
 BY6L9JH1OP4CA==
Date: Mon, 12 Jul 2021 18:02:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210713010227.GC23236@magnolia>
References: <20210712163901.29514-1-jack@suse.cz>
 <20210712165609.13215-2-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712165609.13215-2-jack@suse.cz>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m36ot-006NfE-HL
Subject: Re: [f2fs-dev] [PATCH 02/14] documentation: Sync file_operations
 members with reality
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 12, 2021 at 06:55:53PM +0200, Jan Kara wrote:
> Sync listing of struct file_operations members with the real one in
> fs.h.
> 
> Acked-by: Darrick J. Wong <djwong@kernel.org>

Might as well upgrade this to:
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  Documentation/filesystems/locking.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 2183fd8cc350..cdf15492c699 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -506,6 +506,7 @@ prototypes::
>  	ssize_t (*write) (struct file *, const char __user *, size_t, loff_t *);
>  	ssize_t (*read_iter) (struct kiocb *, struct iov_iter *);
>  	ssize_t (*write_iter) (struct kiocb *, struct iov_iter *);
> +	int (*iopoll) (struct kiocb *kiocb, bool spin);
>  	int (*iterate) (struct file *, struct dir_context *);
>  	int (*iterate_shared) (struct file *, struct dir_context *);
>  	__poll_t (*poll) (struct file *, struct poll_table_struct *);
> @@ -518,12 +519,6 @@ prototypes::
>  	int (*fsync) (struct file *, loff_t start, loff_t end, int datasync);
>  	int (*fasync) (int, struct file *, int);
>  	int (*lock) (struct file *, int, struct file_lock *);
> -	ssize_t (*readv) (struct file *, const struct iovec *, unsigned long,
> -			loff_t *);
> -	ssize_t (*writev) (struct file *, const struct iovec *, unsigned long,
> -			loff_t *);
> -	ssize_t (*sendfile) (struct file *, loff_t *, size_t, read_actor_t,
> -			void __user *);
>  	ssize_t (*sendpage) (struct file *, struct page *, int, size_t,
>  			loff_t *, int);
>  	unsigned long (*get_unmapped_area)(struct file *, unsigned long,
> @@ -536,6 +531,14 @@ prototypes::
>  			size_t, unsigned int);
>  	int (*setlease)(struct file *, long, struct file_lock **, void **);
>  	long (*fallocate)(struct file *, int, loff_t, loff_t);
> +	void (*show_fdinfo)(struct seq_file *m, struct file *f);
> +	unsigned (*mmap_capabilities)(struct file *);
> +	ssize_t (*copy_file_range)(struct file *, loff_t, struct file *,
> +			loff_t, size_t, unsigned int);
> +	loff_t (*remap_file_range)(struct file *file_in, loff_t pos_in,
> +			struct file *file_out, loff_t pos_out,
> +			loff_t len, unsigned int remap_flags);
> +	int (*fadvise)(struct file *, loff_t, loff_t, int);
>  
>  locking rules:
>  	All may block.
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
