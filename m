Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA3665C7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:26:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFb7K-00087j-QA;
	Wed, 11 Jan 2023 13:26:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFb7C-00087J-7E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i379AXdDm0SC0Ki5HyZ6B4Wsuui+F5Ds563f6oUNynU=; b=iN3GgKCDG+SxOhA+PP1CV4/nHi
 XOCodFS5T7gClccxMUWYWZU0SOrBtmxTctnCK/b5TRnVtYtBhPLi+A+b+Riw1vTpR+7dYuSHMq2zX
 M21wq0huUtXwiYrBiggsNn8sf6Sv9eRrer8RRnzFA6qJZOx9GDMYAEqjWymHK7pUkFsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i379AXdDm0SC0Ki5HyZ6B4Wsuui+F5Ds563f6oUNynU=; b=Hak12DxHAl6JpOeQ5nUNz7T498
 5hu32dOiQHUU7krd2NnfUsjTC6nzMS2mD9Ed83Qtn+R8LnsWM8JuKxekFUmrJkdri1YY1iE20dmS5
 8UFnZcrB+YsT9XZ4cGbJKV9y3EZdQBLK5xVS5nQsCyHs614w0DJuabrFgM2LnWUbBVNo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFb7A-0003jJ-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:26:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9233E61D11;
 Wed, 11 Jan 2023 13:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9192BC433EF;
 Wed, 11 Jan 2023 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673443555;
 bh=M20/WHbbHylbZdX8Uu54Y8EoLEkklBuaRyDGzuWSCeU=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=C/ZQrkW+J8kGwmGWfLtDA3bHIdDLV93wXJfBHcYAzlr9mEn7ExI+UZDnMExUuDAfy
 RE83+xaAEvcywLWDF2AABnrZ0XTuiluYrXuwV+QPE1hOrsryTGBGji1SVKSyTLesJe
 rNtLxSI9VYgFEESnpT/krOwIydmljrcThTfb5tFcMjEdRHAPGeONOGozElRmgIlSrz
 Zt2LJmzFxqawEZXauZ4khaVnxnjKjx1nNdxV7WUlUgIC69Q1v18gBEkbKioV6f9lcn
 CzQeBG3ZhGepP/EUavmaO3Qq0/Joy9r/O4IOanARr6p9Q/wA6NoudxBKby2Y41/MGI
 pUMgPREBhQOTQ==
Message-ID: <59f19f5f-dcde-6042-cbc1-eee4b3d2469b@kernel.org>
Date: Wed, 11 Jan 2023 21:25:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221222081855.81553-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221222081855.81553-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/22 16:18,
 Yangtao Li wrote: > No need to initialize
 idx twice. BTW, remove the unnecessary cnt variable. > > Signed-off-by: Yangtao
 Li <frank.li@vivo.com> > --- > fs/f2fs/iostat.c | 10 ++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFb7A-0003jJ-VQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop useless initializer and unneeded
 local variable
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

On 2022/12/22 16:18, Yangtao Li wrote:
> No need to initialize idx twice. BTW, remove the unnecessary cnt variable.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/iostat.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> index 3166a8939ed4..335b055ffe7d 100644
> --- a/fs/f2fs/iostat.c
> +++ b/fs/f2fs/iostat.c
> @@ -97,8 +97,7 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>   
>   static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>   {
> -	int io, idx = 0;
> -	unsigned int cnt;
> +	int io, idx;
>   	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
>   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>   	unsigned long flags;
> @@ -106,12 +105,11 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>   	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>   	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
>   		for (io = 0; io < NR_PAGE_TYPE; io++) {
> -			cnt = io_lat->bio_cnt[idx][io];
>   			iostat_lat[idx][io].peak_lat =
>   			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
> -			iostat_lat[idx][io].cnt = cnt;
> -			iostat_lat[idx][io].avg_lat = cnt ?
> -			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / cnt : 0;
> +			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
> +			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
> +			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;

exceed 80 column?

Thanks,

>   			io_lat->sum_lat[idx][io] = 0;
>   			io_lat->peak_lat[idx][io] = 0;
>   			io_lat->bio_cnt[idx][io] = 0;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
