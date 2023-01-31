Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC32682175
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 02:40:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMfdO-0006ne-K5;
	Tue, 31 Jan 2023 01:40:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMfdM-0006nY-SX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 01:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JPucDJtZuJKl7g3M0WMYTyd+5Ix/fxxMneKWbTZfPw=; b=fXuo4loWTZlgfFD0KtIUx2BGrm
 ukhdR/FA4na18Gu2KSJYhWJWBffa9c7B0BGJFEbBfYyLj8JayG6yOJ5t61sUK4jhEnNtglI0jvdn+
 zdLozA9vN1tj6R98fDE7tySUnMErWdj/hN8zAxX4979/I6UJoTsjG8aT97OF1xrGDC60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JPucDJtZuJKl7g3M0WMYTyd+5Ix/fxxMneKWbTZfPw=; b=K2WqIKpIIW5OrIBGLU1NAmEiCe
 e+dbLqlxJsID8wkkjrGIkvlxYAjQwCNMmgpc91Ygx+oXwMy/mzHQdw+BR8r85UqHmcalCG2KuQ2u0
 5I3WrdPyvvqoyggGxSKfL+f0EBYSJ/gwn7qODY6Rqb2egmKbjBiDva6XoQBU/KKyNaiU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMfdK-00061Z-1N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 01:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B97860F35;
 Tue, 31 Jan 2023 01:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF44C433EF;
 Tue, 31 Jan 2023 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675129220;
 bh=/f9nOeXPzfyTQPKpu9wkj93f1Odhx3N6/5QwwcBRKrU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MSnh4JdLbyJcE9M3yKPSUEd3/Vk0bbmsvE3hdtk/tUVHyzRNCQ89MrxXPafVP/370
 Slhj5ZCB/ii29SgjmcFwtXVhpuaFWxe2fuqiCglTWaVfKZ0UERKoLbnBRn4TRWW3Ih
 miHvEgNh1sTJ0uRznNq7NEz0cOJrJ/ips5rk9e+21TfK/oiB8EYbR8ZlBWRRGcXEAa
 RcApt/6esuFgS5QL1mac8IdVHlT2kO4YSh5h31CfeKedIkg+lYyrLJCb/xEiRaYzIU
 Mudqkf6s12j4AnIu83AFJYmM3pTaONj8qAVNNUT3rE6/zh24EprakzHUm6ss58nRg8
 DOR/O02QgdtUg==
Message-ID: <4e0f4781-06ce-49e2-0bd5-031057e88888@kernel.org>
Date: Tue, 31 Jan 2023 09:40:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230120161656.70308-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230120161656.70308-1-frank.li@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/21 0:16,
 Yangtao Li wrote: > Add iotype sanity check
 to avoid potential memory corruption. > This is to fix the compile error
 below: > > fs/f2fs/iostat.c:231 __update_iostat_latency() error: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMfdK-00061Z-1N
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix to avoid potential memory
 corruption in __update_iostat_latency()
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
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/21 0:16, Yangtao Li wrote:
> Add iotype sanity check to avoid potential memory corruption.
> This is to fix the compile error below:
> 
> fs/f2fs/iostat.c:231 __update_iostat_latency() error: buffer overflow
> 'io_lat->peak_lat[type]' 3 <= 3
> 
> vim +228 fs/f2fs/iostat.c
> 
>    211  static inline void __update_iostat_latency(struct bio_iostat_ctx
> 	*iostat_ctx,
>    212					enum iostat_lat_type type)
>    213  {
>    214		unsigned long ts_diff;
>    215		unsigned int page_type = iostat_ctx->type;
>    216		struct f2fs_sb_info *sbi = iostat_ctx->sbi;
>    217		struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
>    218		unsigned long flags;
>    219
>    220		if (!sbi->iostat_enable)
>    221			return;
>    222
>    223		ts_diff = jiffies - iostat_ctx->submit_ts;
>    224		if (page_type >= META_FLUSH)
>                                   ^^^^^^^^^^
> 
>    225			page_type = META;
>    226
>    227		spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
>   @228		io_lat->sum_lat[type][page_type] += ts_diff;
>                                        ^^^^^^^^^
> Mixup between META_FLUSH and NR_PAGE_TYPE leads to memory corruption.
> 
> Fixes: a4b6817625e7 ("f2fs: introduce periodic iostat io latency traces")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Suggested-by: Chao Yu <chao@kernel.org>
> Suggested-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
