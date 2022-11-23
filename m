Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5596362FD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 16:13:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxrQt-0002Ia-DA;
	Wed, 23 Nov 2022 15:13:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oxrQs-0002IU-Mk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9c57EzMehG1xRoIRQ5InlFeYOsxIUu5uJJo+twxqi4=; b=etSyInL3QpCFxJUzGewsM3nran
 zupYMoqt9VCvksfmZ8jNNlFD4uZVZIa2UcSFDMZ4gShmu2Hkmj9EXqYgGgKYw+HFh8jBiAWAmZRGx
 xcxHWCFd4TvHPPnbp9D5SVS5O0yvmW+w6Ic6AyKJmL9aCcjFkl4WS+khh1KA6NbLLt/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d9c57EzMehG1xRoIRQ5InlFeYOsxIUu5uJJo+twxqi4=; b=l/cOpVIl7ygzXeqc99cJK1HRGb
 1ADXtFSWUoQqz7acizZcy3zu4MltHiWht5v2cX9lla09WP6PGFe/UmQ1/50xlh2MPtI8CWvyGZow5
 mw2Bx/iL5DXKqdowcTrNZ/+MpBiOHcUobnGnpCaCrUOBmQAPcqKcBilLv6t1/ImY3weI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxrQs-00G5St-2m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:13:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AED2461D4C;
 Wed, 23 Nov 2022 15:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C589AC433D6;
 Wed, 23 Nov 2022 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669216376;
 bh=yOULMtM0+KTy5LieyRbQAWfjtQdPuaw3HboADHL+tcs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sMCqNymJxYM7LJZnkYSsMm0pvmOet0Bly0terUqPs6d/6rwXk4qNjqr5pK0jGWLdh
 rPQRdeGafDEounT3RlYYaor5lL3rC3qERosoVGqQirdwBObE6pVcnLNZlRN1EuEin7
 pbmJ6/fTBtQ7jdGdL0bHNGjqEsN+HkmOGfygM08k367XwdNtdzDwxdGZywBbWxA1c2
 SXtBgmMba3C9aMJkbNBHnsCneixzc2RYbVeK3LS9nbreuqTDd9NlY2tWvZn9yRhd4a
 HNwvja0CbmkL6FX2pbM8PF1dILO0SlryUUhbFf+dlHkPYQ3d3HvG09GaCNzz8c9ORR
 KKG+6y3ClB+VA==
Message-ID: <a73cb0ce-7666-607a-fb00-dde2befb9108@kernel.org>
Date: Wed, 23 Nov 2022 23:12:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221116131035.1056523-1-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221116131035.1056523-1-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/16 21:10, Yuwei Guan wrote: > This 'io_aware_gran'
 is initialized as MAX_PLIST_NUM in > __init_discard_policy(), and use as
 'i < dpolicy->io_aware_gran' > in __issue_discard_cmd(), but 'i < [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxrQs-00G5St-2m
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove useless io_aware_gran variable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/16 21:10, Yuwei Guan wrote:
> This 'io_aware_gran' is initialized as MAX_PLIST_NUM in
> __init_discard_policy(), and use as 'i < dpolicy->io_aware_gran'
> in __issue_discard_cmd(), but 'i < dpolicy->io_aware_gran' is
> true always, so remvoe this variable.

I guess we can export it via sysfs for better configuation?

Thanks,

> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> ---
>   fs/f2fs/f2fs.h    | 1 -
>   fs/f2fs/segment.c | 4 +---
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dedac413bf64..ced8a5b226b5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -388,7 +388,6 @@ struct discard_policy {
>   	unsigned int mid_interval;	/* used for device busy */
>   	unsigned int max_interval;	/* used for candidates not exist */
>   	unsigned int max_requests;	/* # of discards issued per round */
> -	unsigned int io_aware_gran;	/* minimum granularity discard not be aware of I/O */
>   	bool io_aware;			/* issue discard in idle time */
>   	bool sync;			/* submit discard with REQ_SYNC flag */
>   	bool ordered;			/* issue discard by lba order */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b0b76550578..1cc41a65a645 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1059,7 +1059,6 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   	dpolicy->granularity = granularity;
>   
>   	dpolicy->max_requests = dcc->max_discard_request;
> -	dpolicy->io_aware_gran = MAX_PLIST_NUM;
>   	dpolicy->timeout = false;
>   
>   	if (discard_type == DPOLICY_BG) {
> @@ -1483,8 +1482,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
>   				break;
>   
> -			if (dpolicy->io_aware && i < dpolicy->io_aware_gran &&
> -						!is_idle(sbi, DISCARD_TIME)) {
> +			if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
>   				io_interrupted = true;
>   				break;
>   			}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
