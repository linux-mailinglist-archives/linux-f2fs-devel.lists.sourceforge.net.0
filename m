Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B21EA0E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 11:21:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfgdS-0008Vz-5c; Mon, 01 Jun 2020 09:21:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jfgdR-0008Vr-4E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 09:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3RAKjlGcuDdlgY3UdyIvXzPvzbwdPRgP11x9khawDuw=; b=RB6Ti6pHoDQutbxgVfhx2DPdnx
 caPbTottVKTZUdEemnHCmQBzdZK59JvmwgJWxd8QXpQINioxf/x8nfZk9N3DjPhdepDvXItxOUPae
 2AfsmnKFFoNxmyA59k4NEEBt4e8mGNxc30x1BL8ZfrK6bplSkN6Oe5B8db9BQoCsqr1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3RAKjlGcuDdlgY3UdyIvXzPvzbwdPRgP11x9khawDuw=; b=REySW5PRju/1my2ak713kiSN3k
 VuAjZ6YlddBr7L0evfHT7ZNCYjvf1iljsqnEHyrefnZaw34syfZO/FgrI0l48z2ZMEbjBExjbNuJm
 qPs522+ciUmR6VNooh7XqwuczmFKroVjFVmUi8DbgBj/rcdjALREYxExc8pewBeSMYE8=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfgdK-00GpXJ-9b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 09:21:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591003286; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3RAKjlGcuDdlgY3UdyIvXzPvzbwdPRgP11x9khawDuw=;
 b=QUkihOr+URUX6pxCDAosJV+yOkR8WTw0e5rsoSSiHJqcK1lb8UTVz6P6bu6Goyn8x1/y+6DA
 xIkfrZMYCsuZUJpexWAwgbCzRS18xg5B+ZRNNRabKHT88gjkeJrpAczYeXkpZGBKeZUju8Ba
 w5LpIMomZDhME6t7a5L2ewGJlSk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ed4c88dc6d4683243da4d8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 09:21:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2ACB0C433B2; Mon,  1 Jun 2020 09:21:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F1F3C433CB;
 Mon,  1 Jun 2020 09:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F1F3C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 1 Jun 2020 14:50:35 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200601092035.GA19831@codeaurora.org>
References: <1590546056-17871-1-git-send-email-stummala@codeaurora.org>
 <1d54379e-35c7-76e0-0c8a-d89bfcecb935@huawei.com>
 <78d2f29b-3ec0-39bc-46cf-88e82f1970c9@huawei.com>
 <20200528191839.GA180586@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528191839.GA180586@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [104.130.122.27 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfgdK-00GpXJ-9b
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix retry logic in
 f2fs_write_cache_pages()
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

Hi Chao,

Can you please help review the diff given by Jaegeuk below?
If it looks good, I can post a v2.

Thanks,

On Thu, May 28, 2020 at 12:18:39PM -0700, Jaegeuk Kim wrote:
> On 05/28, Chao Yu wrote:
> > On 2020/5/28 10:45, Chao Yu wrote:
> > > On 2020/5/27 10:20, Sahitya Tummala wrote:
> > >> In case a compressed file is getting overwritten, the current retry
> > >> logic doesn't include the current page to be retried now as it sets
> > >> the new start index as 0 and new end index as writeback_index - 1.
> > >> This causes the corresponding cluster to be uncompressed and written
> > >> as normal pages without compression. Fix this by allowing writeback to
> > >> be retried for the current page as well (in case of compressed page
> > >> getting retried due to index mismatch with cluster index). So that
> > >> this cluster can be written compressed in case of overwrite.
> > >>
> > >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > >> ---
> > >>  fs/f2fs/data.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > >> index 4af5fcd..bfd1df4 100644
> > >> --- a/fs/f2fs/data.c
> > >> +++ b/fs/f2fs/data.c
> > >> @@ -3024,7 +3024,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
> > >>  	if ((!cycled && !done) || retry) {
> > > 
> > > IMO, we add retry logic in wrong place, you can see that cycled value is
> > > zero only if wbc->range_cyclic is true, in that case writeback_index is valid.
> > > 
> > > However if retry is true and wbc->range_cyclic is false, then writeback_index
> > > would be uninitialized variable.
> > > 
> > > Thoughts?
> > > 
> > > Thanks,
> > > 
> > >>  		cycled = 1;
> > >>  		index = 0;
> > >> -		end = writeback_index - 1;
> > 
> > BTW, I notice that range_cyclic writeback flow was refactored in below commit,
> > and skeleton of f2fs.writepages was copied from mm/page-writeback.c::write_cache_pages(),
> > I guess we need follow that change.
> > 
> > 64081362e8ff ("mm/page-writeback.c: fix range_cyclic writeback vs writepages deadlock")
> 
> Is that something like this?
> 
> ---
>  fs/f2fs/data.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 48a622b95b76e..28fcdf0d4dcb9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2861,7 +2861,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	pgoff_t index;
>  	pgoff_t end;		/* Inclusive */
>  	pgoff_t done_index;
> -	int cycled;
>  	int range_whole = 0;
>  	xa_mark_t tag;
>  	int nwritten = 0;
> @@ -2879,17 +2878,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	if (wbc->range_cyclic) {
>  		writeback_index = mapping->writeback_index; /* prev offset */
>  		index = writeback_index;
> -		if (index == 0)
> -			cycled = 1;
> -		else
> -			cycled = 0;
>  		end = -1;
>  	} else {
>  		index = wbc->range_start >> PAGE_SHIFT;
>  		end = wbc->range_end >> PAGE_SHIFT;
>  		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
>  			range_whole = 1;
> -		cycled = 1; /* ignore range_cyclic tests */
>  	}
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>  		tag = PAGECACHE_TAG_TOWRITE;
> @@ -3054,10 +3048,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  		}
>  	}
>  #endif
> -	if ((!cycled && !done) || retry) {
> -		cycled = 1;
> +	if (retry) {
>  		index = 0;
> -		end = writeback_index - 1;
> +		end = -1;
>  		goto retry;
>  	}
>  	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog
> 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
