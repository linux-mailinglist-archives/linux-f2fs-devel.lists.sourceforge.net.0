Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F4256B45
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Aug 2020 05:39:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCEBY-0008Nb-Cg; Sun, 30 Aug 2020 03:39:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kCEBV-0008NM-C0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p6+E5Rgplyh+4EenZLm8z9RP2QYcNZmhH+6dkV7QwiY=; b=cHbONMAVcYcpakZ6nyLGApliQa
 md5KbdTLb8g+GQxNIQrPXmZUqV5DGsWvzvKa/MDMdvYnuELA+mR3/Zt30FGa7+1y3byedzkWrbGjR
 1fwEeE6ThPq6GA5hsbvjamMdVAX3lbGTd/97OEHf0OdCh7r0XUbs066yDNNMlORRnV6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p6+E5Rgplyh+4EenZLm8z9RP2QYcNZmhH+6dkV7QwiY=; b=ERjlz6kIJ2f2n57vmGdcQskQAt
 HBCwZBbP1ET0LRSpl73lsJEn9stqPkNgvKyAczVm+23WIGevoAMbdoZTUfmd10ADdsP3UMRYH8qIs
 0zUYHBMTL9ZMI+ZS8gn1p7dvqJ4O12nXnyg5BoiPlEWwCn1hPsdlkw3NFzb5SE8OrDrw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCEBR-006rg5-Je
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:39:13 +0000
Received: from [192.168.0.108] (unknown [49.65.245.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9FE42076D;
 Sun, 30 Aug 2020 03:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598758739;
 bh=VoFnVVBnxOmrHSF0ZFJOuI6EDaq7YfBi429QZ1DCyoQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=rf9iXhyUQjLLq2wJ2bBrXyhf7HproNxYx7ck7eCnKLycPwFcHIUpVmKuoOXPaPVqB
 tnqxgD7Uoymea8/NMbamhpmI4/3jzqQqVHeQxfCcNfDJpAkmntnnCWVCvIUk8VSeTl
 YW6N25Hu/xQ9cGCw3yJDgps1Az59WACX2YLBhMuU=
To: Jack Qiu <jack.qiu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20200829100552.29043-1-jack.qiu@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3eeb2066-cf73-1b96-2e0c-cfad33df5987@kernel.org>
Date: Sun, 30 Aug 2020 11:38:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200829100552.29043-1-jack.qiu@huawei.com>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCEBR-006rg5-Je
Subject: Re: [f2fs-dev] [PATCH] f2fs: correct statistic of APP_DIRECT_IO
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

On 2020-8-29 18:05, Jack Qiu wrote:
> Miss to update APP_DIRECT_IO when receiving async DIO. For example:
> fio -filename=/data/test.0 -bs=1m -ioengine=libaio -direct=1
> 	-name=fill -size=10m -numjobs=1 -iodepth=32 -rw=write
>
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>  fs/f2fs/data.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a19e2a7891f3..f9f25bc52487 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3671,12 +3671,18 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>  									err);
>  			if (!do_opu)
>  				set_inode_flag(inode, FI_UPDATE_WRITE);
> +		} else if (err == -EIOCBQUEUED) {
> +			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
> +						count - iov_iter_count(iter));
>  		} else if (err < 0) {
>  			f2fs_write_failed(mapping, offset + count);
>  		}
>  	} else {
>  		if (err > 0)
>  			f2fs_update_iostat(sbi, APP_DIRECT_READ_IO, err);
> +		else if (err == -EIOCBQUEUED)
> +			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,

APP_DIRECT_READ_IO

Thanks,

> +						count - iov_iter_count(iter));
>  	}
>
>  out:
> --
> 2.17.1
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
