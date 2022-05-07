Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF551E3D8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 05:38:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnBGv-0005NN-B6; Sat, 07 May 2022 03:38:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nnBGt-0005NC-Ez
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 03:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyR5dKAKZznps+CYnNE5Kd34a0FQ2K1muKa08EoRUBE=; b=BYmM3zXWLzAWFxh5ahIUifL69w
 x7bpWIkMcksel6WdEwylx1uOBgb4ZIquPkKAkcuzjleCSnjRrOlPzQ5m4fe2w1Hnug87P6tCm0Ayh
 vqN7FneDpHTcm0xl4UHprA55fXSscjk3TNu/6tyWLXuthqW/KAZ4XDz6w6uuG+7iEtXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyR5dKAKZznps+CYnNE5Kd34a0FQ2K1muKa08EoRUBE=; b=WwBZjled1RPGzXKeRynQpI6bNW
 ftdeFW6/9gSaLjndZMsOdhgTa8svD64pEK85yxcyNR8EdqxLEM3N2SUmi8eb15M1qPXrQsFnv5fcW
 gne1h6yVAyZ0Kf1fyUcgbZLa2LE/w/n8nZvmynQn6RgQJAdpgPdgiy6rGVJAGwuov1ZM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnBGq-0000QW-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 03:38:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10754B838E8;
 Sat,  7 May 2022 03:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668AFC385A9;
 Sat,  7 May 2022 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651894688;
 bh=pNaBKUVWaTiM1LOs+4UULLBEnofJsYSuZRIS/1Zbj5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mSdQqrG/mp5oSCOPSbVlFUS6nHMBug+yvJgZIh1LLNlnp/FIBAvCcBx9HCpfhOTlq
 Rxt82Dvoo9atZxiU9xiqFpsubC4hAfkWsE2GE7UMRo3FijGltlICkjJv2yJv9ptXfR
 CE8XRGIlguNFRtbt1WA1eIacec/RiTB6EqXPe0azWoSthoru8lK6OO59mpujGHFKxW
 jl/I2Gk3EQ4ME39+pXMuGc7KGArVAad9I2bAolZRAhp5Fh1JA8r/gANrbHDo+TvMvx
 p2fu9N3uBluwQdTVVMEyrDY5U7ninEI48uJxS7mDsHYjUS3KFUTbrjUg/q4b9N/IFc
 F/v9gRwEp0Y+A==
Message-ID: <f14f31b8-450c-e9e1-6e20-11c0c0ece1fd@kernel.org>
Date: Sat, 7 May 2022 11:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Weichao Guo <guoweichao@msn.com>
References: <DM5PR17MB0953D6D7C81E3F4B54DF1006C6C59@DM5PR17MB0953.namprd17.prod.outlook.com>
 <YnWxb8LXlsRNN3GK@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnWxb8LXlsRNN3GK@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 7:38, Jaegeuk Kim wrote: > On 05/07, Weichao Guo
 wrote: >> From: Weichao Guo <guoweichao@oppo.com> >> >> If the number of
 unusable blocks is not larger than >> unusable capacity, we can sk [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nnBGq-0000QW-Aq
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip GC if possible when checkpoint
 disabling
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 7:38, Jaegeuk Kim wrote:
> On 05/07, Weichao Guo wrote:
>> From: Weichao Guo <guoweichao@oppo.com>
>>
>> If the number of unusable blocks is not larger than
>> unusable capacity, we can skip GC when checkpoint
>> disabling.
> 
> I modified to fix restoring gc_mode back by the below.
> 
> -       unsigned int gc_mode;
> +       unsigned int gc_mode = sbi->gc_mode;
> 
> 
>>
>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
