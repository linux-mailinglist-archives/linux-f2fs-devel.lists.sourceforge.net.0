Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF893D2490
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 15:27:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6YjV-0006r7-3j; Thu, 22 Jul 2021 13:27:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6YjT-0006ov-FS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bg6oEeu5uCuvhWaDwW7ObAzzgu22fPtdrOukJevX+sE=; b=R9UuuV4YgFudkNSdFLydRjW1o4
 VCwQ5bD+HTkoOQU2/70iRHboNw0dprVnu7cSAvNvBFcK6kIk45ishPMUmfy8VrbIKrGGTdeero97X
 H/yt0rGb0xrymp4wS/SdLWYb6ppIj9Xomj9iRIsTj+g53tJDlNBNNjWiLSBqKoAll8Wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bg6oEeu5uCuvhWaDwW7ObAzzgu22fPtdrOukJevX+sE=; b=L23Hpgf3Tr4yY/ib74XWpJOJPE
 XYWDuSYITW0DXqJTbA5vH5aTONrSUtCool9f/WQhIXpCqUqzL1+7ERWqLk2p6eAgG/+Gef8K8WPL+
 4jHFBBnBBw6CxCT5Zq0iVNhmezFEmN6g//Glxlf4Q61OBqdMq8tChESUvxilSN7ecEp4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6YjH-0000nP-SX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 13:27:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF8DD60FE7;
 Thu, 22 Jul 2021 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626960421;
 bh=agxBv5vcdVLiVH5NoBC2fkhxqPk9IMaMKaxWllrFzpY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=FKe3T6OoO7JwoefI5NVGtotcuqSbAPrsbJPAgdXOJtK8vmC38DJqYK5Lbx7sYBi7v
 /nU9IZv9CiPzMcB3o2UxoD0TRM3IjkrPxKWj1VooiN48jWf3QQlFNnSf/W0+fTROsO
 N0QNcZWKKiT2llVRLkLkqmj14iSqUGYa5Ntkdna9OS5nf9b5pD1pZHE4D14tFFlsrb
 6nBB0JUtHhSjGthe+C9qzoQd4cq9lA6VOYRtThzd16qI+2uGm+qMUbWBwh3iWJkH6S
 HE5KrIVGar5ZhDsHwFcZQJcSXyxjw4wwZndFE+j+Kj7BwamWrpubuweIeVaZiObmy1
 fPFxLyY76bBuw==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210702031138.156851-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <2cc3c3c7-5c52-9b6e-5bb6-29a701351c04@kernel.org>
Date: Thu, 22 Jul 2021 21:26:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210702031138.156851-1-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6YjH-0000nP-SX
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: allow write compress
 released file after truncate to zero
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/2 11:11, Fengnan Chang wrote:
> We should allow write compress released file after truncate to zero.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/file.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..684fc2e8d8a4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -740,6 +740,13 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>   		return err;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/*
> +	 * We should allow write compress released file
> +	 * after truncate to zero.
> +	 */

Please document the behavior.

> +	if (f2fs_compressed_file(inode) && !free_from)

&& is_inode_flag_set(inode, FI_COMPRESS_RELEASED)

Thanks,

> +		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> +
>   	if (from != free_from) {
>   		err = f2fs_truncate_partial_cluster(inode, from, lock);
>   		if (err)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
