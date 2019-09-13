Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D88ACB263C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2019 21:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i8rWt-0004C9-Py; Fri, 13 Sep 2019 19:46:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i8rWs-0004Bk-5R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Sep 2019 19:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GADpTG2Aqw4hg4TYWLUxahrjOch3J57AwFVeB8NMaXg=; b=XeDbhlRnRDwptaXVx+wloE3G5c
 z40E29J9Mu2GmyMgSa7+Du+flFsYiO3sMxyt3uMiteWuHRMBK4LGx915Qcd2+8fvEAATnH2vDWrNR
 y4lZmaJQANgJj7Dt+rYiwfwZW0HZZFfXaqJAPNDSffyRS9GbzK5Yo4+d0dLb2rGYDMv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GADpTG2Aqw4hg4TYWLUxahrjOch3J57AwFVeB8NMaXg=; b=SEcjrlWX4z5SJMqubUI7QoVE66
 d6g3LjydYS3z2caXKB1Jg3BnSm70YNjDiwbGe1WBOJZM5rl4buaAWGD1FeKN/tBmFdWxvpgo7tqH2
 uPBD6hKoMq/tVITZD0yUf/VBcNVlcqPYE3YvxoRrRcbrTZEUbx0CbgUv4OAWbHcTtHSQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i8rWq-0056ON-CG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Sep 2019 19:46:50 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A93E206BB;
 Fri, 13 Sep 2019 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568404002;
 bh=XON54BABhwtc7YnZj3oasAxG322VD3nzpVqlD7VH1FY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yw9PkNNKrrShtHir46qOSEdHEDSgM0cDdxpJ3nkDpFGPykez/8K7MT5wGu5X32A+0
 S41WTnrhBUQG4REzhc80KYa8l3CzbGMsJbUT5SiOYM39n0SlQNr4jW3qC7sytEDQiy
 gQMjdC896k32gehMh5fA/aMiB2uXZ2LZ9q5i4SlQ=
Date: Fri, 13 Sep 2019 12:46:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Goldwyn Rodrigues <rgoldwyn@suse.de>
Message-ID: <20190913194641.GA72768@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-4-rgoldwyn@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911164517.16130-4-rgoldwyn@suse.de>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i8rWq-0056ON-CG
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix inode rwsem regression
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
Cc: david@fromorbit.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, Goldwyn Rodrigues <rgoldwyn@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, andres@anarazel.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=ebef4d7eda0d06a6ab6dc0f9e9f848276e605962

Merged. Thanks,

On 09/11, Goldwyn Rodrigues wrote:
> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> Apparently our current rwsem code doesn't like doing the trylock, then
> lock for real scheme.  So change our read/write methods to just do the
> trylock for the RWF_NOWAIT case.
> 
> We don't need a check for IOCB_NOWAIT and !direct-IO because it
> is checked in generic_write_checks().
> 
> Fixes: b91050a80cec ("f2fs: add nowait aio support")
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/f2fs/file.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 3e58a6f697dd..c6f3ef815c05 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3134,16 +3134,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		goto out;
>  	}
>  
> -	if ((iocb->ki_flags & IOCB_NOWAIT) && !(iocb->ki_flags & IOCB_DIRECT)) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT) {
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode)) {
>  			ret = -EAGAIN;
>  			goto out;
>  		}
> +	} else {
>  		inode_lock(inode);
>  	}
>  
> -- 
> 2.16.4


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
