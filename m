Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7F3E92CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 15:37:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDoPp-00077m-Tj; Wed, 11 Aug 2021 13:37:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mDoPo-00077e-UL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D19ljADkJ8ev0qoDZtI2QK8uxxX3eNcodPEsiSRYVJ4=; b=ceZPoEaTljKvmeUAqlr8r6jOhZ
 g/VSO2l9E9cDlfMiW2k7SANs39q71OlwKVT58oWuNIOs+wZGvN8nZvGocT61w8qTQeqwm+r/usfiN
 m9IeI1q/Rm0AGvlfMFiJSsvPnXEapSkJ/AYaXf0Q8Yn2DBj21Mruxw3tIxSvGj9zGbFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D19ljADkJ8ev0qoDZtI2QK8uxxX3eNcodPEsiSRYVJ4=; b=nQJfGp4fTfIcYSC4vV+riMhFJ5
 sFh2Yzq8jMicYL9UYwyxIvC9RXUOZvHWvnGVtDP3pM3k79RdO+FoDVueWM27oURK8JLa5Jt7yGuA3
 xOKSC1wdOuLyP1WMkNkZ2UQdYNwlBo0pXbj2UrsznUSCqNhosIxHRfyVlw19JyTZ7bBM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDoPl-0007Va-IX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 13:37:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42858604D7;
 Wed, 11 Aug 2021 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628689016;
 bh=uPiiNoU7abmvTh+81t3BZey2nxgh29+Zkt88SCl39gI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ndb2Q2zAV7a3YGW4i2KHergGhyxjWQPadWdk9t8hyR0EqwRK0pnFPI+3MPUvQzxMC
 PSpsaShqeGL4PrLAMuVt+FLA8TNS0zpsw6rAu2cZe1pTo5xcNVrebL1U+1NHK/NWd1
 zmnF+K46r6Vx/QzofIIaw0WCu02HUOxlGkJPkvej1OYWWvvqS5ZbFeTMgJns+OR0FM
 2QX1y95yottw/cCgMKhqrL5iFoPg6Xn0wzbqwjomBaVso2X4/qy1PqNFCh5jtOYZP5
 oCRK2/Y5M27iYiXiGf6HCBC7ijdMK1UVUW8pyZmtztTS195I5FOg2O9xqqdI4HIPCg
 Zc+X2tWnZ4Tbw==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210811131826.223141-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <90182f6a-9582-f1a6-e6b6-8f4088e80ce0@kernel.org>
Date: Wed, 11 Aug 2021 21:36:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811131826.223141-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDoPl-0007Va-IX
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix potential memory leaks in
 create_discard_cmd_control
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

On 2021/8/11 21:18, Yangtao Li wrote:
> Release f2fs_issue_discard every time it is destroyed,
> otherwise it will cause memory leaks when remounting.

I didn't get the problem here, could you please explain a bit more about
details?

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index afe20c5c3c08..363779a4402d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1741,6 +1741,7 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
>   
>   		dcc->f2fs_issue_discard = NULL;
>   		kthread_stop(discard_thread);
> +		put_task_struct(discard_thread);
>   	}
>   }
>   
> @@ -2168,6 +2169,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   		SM_I(sbi)->dcc_info = NULL;
>   		return err;
>   	}
> +	get_task_struct(dcc->f2fs_issue_discard);
>   
>   	return err;
>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
