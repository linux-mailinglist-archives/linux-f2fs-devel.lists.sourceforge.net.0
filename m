Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A9168B28
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 01:45:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5Iut-0007uk-U5; Sat, 22 Feb 2020 00:45:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1j5Iun-0007uW-7u
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RJWVxIQBtpVgLNZnOCgy+9DNBRETFyaw+B0IqQ80Smk=; b=j8fEIQD43PcNKNu9MszKXzfryq
 7s127gjiqDZavMSmN3E+uFdK+CGjgP0vXKOthLw8RRXhE3I0T7c0YuW6axPq2SHL2WZSik87zk7WW
 oC2KnKIHZREw0l3/fsJpB7+bsiJ1n2pPlKSzpBQxDqDbzl+gcjUzbumBcV9JA6CanDAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RJWVxIQBtpVgLNZnOCgy+9DNBRETFyaw+B0IqQ80Smk=; b=WIZTFGf4ed+XBGitrU6Z1Rdkso
 ocN/NJ/q28f/pvRKp/ugmGVuize07pBtDjBPKYT12UxGOnRAKbfVRNflIltkSam4hXffMNTkucmJe
 8dT1+Ddp28I8iFQLcMPZalY0LlwiKITEFO1kA2OWn2hXupOVDHQ4atHEDwIID25ZROHc=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5Iuk-003gJE-9L
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:45:05 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01M0iXKo069490;
 Sat, 22 Feb 2020 00:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RJWVxIQBtpVgLNZnOCgy+9DNBRETFyaw+B0IqQ80Smk=;
 b=nN7Sv9aAp1H5VNNHgY3l0Y8a6GkUkVAQwxYCK7nBY3u4+U0MhiP8X5I4zx8YknXK7zVO
 kSiV7uX0W1ht1ti0UCfB9WMesmmPQQNYMgrjYAKzWbu9+zDyk1QLFzxk2eXMBu12OgOb
 IK11lZpex2Vs79Mc9GOI67PGIte05b1FhvOddV/Hmp6TCKu+/8YmKr57C9gshxW+71eS
 k9YCRmVeiiMcdml+G/0dXbBKhQpDRF4Jb5reMrmO6oBEKdRiXFUaNCeG2SoUS7s1lCC0
 vObNA+f+EtvbzMBjjuEOJkL0chWUualvFuiinduRft/uSF2RD+r78eE7lIG3Vpw6kQnj OA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2y8udkuk25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 00:44:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01M0h54Z146709;
 Sat, 22 Feb 2020 00:44:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2y8udg8m3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 22 Feb 2020 00:44:33 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01M0iWwv149129;
 Sat, 22 Feb 2020 00:44:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2y8udg8m32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Feb 2020 00:44:32 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01M0iRp8021588;
 Sat, 22 Feb 2020 00:44:27 GMT
Received: from localhost (/10.145.179.117)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Feb 2020 16:44:27 -0800
Date: Fri, 21 Feb 2020 16:44:25 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200222004425.GG9506@magnolia>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219210103.32400-22-willy@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9538
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002220001
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5Iuk-003gJE-9L
Subject: Re: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure
 iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> By putting the 'have we reached the end of the page' condition at the end
> of the loop instead of the beginning, we can remove the 'submit the last
> page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> didn't return 0, which would lead to an endless loop.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index cb3511eb152a..31899e6cb0f8 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
>  		void *data, struct iomap *iomap, struct iomap *srcmap)
>  {
>  	struct iomap_readpage_ctx *ctx = data;
> -	loff_t done, ret;
> -
> -	for (done = 0; done < length; done += ret) {
> -		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
> -			if (!ctx->cur_page_in_bio)
> -				unlock_page(ctx->cur_page);
> -			put_page(ctx->cur_page);
> -			ctx->cur_page = NULL;
> -		}
> +	loff_t ret, done = 0;
> +
> +	while (done < length) {
>  		if (!ctx->cur_page) {
>  			ctx->cur_page = iomap_next_page(inode, ctx->pages,
>  					pos, length, &done);
> @@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
>  		}
>  		ret = iomap_readpage_actor(inode, pos + done, length - done,
>  				ctx, iomap, srcmap);
> +		done += ret;
> +
> +		/* Keep working on a partial page */
> +		if (ret && offset_in_page(pos + done))
> +			continue;
> +
> +		if (!ctx->cur_page_in_bio)
> +			unlock_page(ctx->cur_page);
> +		put_page(ctx->cur_page);
> +		ctx->cur_page = NULL;
> +
> +		/* Don't loop forever if we made no progress */
> +		if (WARN_ON(!ret))
> +			break;
>  	}
>  
>  	return done;
> @@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
>  done:
>  	if (ctx.bio)
>  		submit_bio(ctx.bio);
> -	if (ctx.cur_page) {
> -		if (!ctx.cur_page_in_bio)
> -			unlock_page(ctx.cur_page);
> -		put_page(ctx.cur_page);
> -	}
> +	BUG_ON(ctx.cur_page);

Whoah, is the system totally unrecoverably hosed at this point?

I get that this /shouldn't/ happen, but should we somehow end up with a
page here, are we unable either to release it or even just leak it?  I'd
have thought a WARN_ON would be just fine here.

--D

>  
>  	/*
>  	 * Check that we didn't lose a page due to the arcance calling
> -- 
> 2.25.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
