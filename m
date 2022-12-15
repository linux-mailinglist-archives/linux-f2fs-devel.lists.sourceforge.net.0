Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A35964DCF6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 15:38:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5pNR-0001P1-GH;
	Thu, 15 Dec 2022 14:38:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5pNP-0001Ov-UT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 14:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q9YegBlVn/3boumhgXuoxTVNKAXbDerNwsB3nLx1jMg=; b=SigWwHT/m3kyy5aJU4Oh1SD/Ts
 bgVXmOa1T5+j9AS/PmPXi7p12kkvPxZ6947ftfkmujNZ9KUgpHFIHbCuVLBlz1YdwCW/9m+6nDDq4
 6jRF/QT4OVfTukY6AlT3VCvFM9l6cExFVe/gO8Lxb/eG6SGAZCobgS7Jurm1wTDJtFpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q9YegBlVn/3boumhgXuoxTVNKAXbDerNwsB3nLx1jMg=; b=FZwDVMcsZ95Cewg/hwZKx/0cvP
 8kuaNElqjQTcfReqkGMzb/YR4k7B+POj+7rY6LGlnt7oWviQB4WykgyWoseMpPDl2dMHmBw9D3OmA
 eceegBa7W96AQ4Mew3s2xXorht/btvpWUb4Rwy3YGRAtJLsoUoT3/fcaj9Y5a3s9j8Yk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5pNK-000X7I-Th for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 14:38:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 966EA61DF1;
 Thu, 15 Dec 2022 14:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2746C433EF;
 Thu, 15 Dec 2022 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671115088;
 bh=QRu+xIsFY/9uH7UhtSSOV68HhJrjuEUs3s69HAiHpmo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ELa52evv0WF30IwEMN4T+wKwb52eLJWyYc1ICwwF1sZrRAU7VO5uNWMM2iMdZ9aGs
 eqdOzDDehLlzhNb6aj+l75vag9M3F5H6LBbadbTaWx8HnwOsdGJrXFo7FZf36BC9pH
 wkszOMKjeZ1Wr0DzbaoR/5qNSJoaU9U7xglfxh91/I+p41R9Y3orsg+4RcvYPHah+o
 mQF1YACW2YXKbuzqKb9TjzDVvawKE97krAtWAGj0jWM3bsJaXq+aAAb/NjhNkWzF9e
 YaR1F4Z//he5QlvCThDB33RA5tmIMTJUVjrZL5HLynYhhr1HaAmf59mKdZEodRGUT7
 by0K2lKTayC0w==
Message-ID: <0fb160e1-6948-d805-9262-63d436c01ad4@kernel.org>
Date: Thu, 15 Dec 2022 22:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221215134844.12951-1-chao@kernel.org>
 <20221215141412.66752-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221215141412.66752-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/15 22:14, Yangtao Li wrote: > Hi Chao, > >> -What:
 /sys/fs/f2fs/<disk>/gc_mode >> -Date: October 2022 >> -Contact: "Yangtao
 Li" <frank.li@vivo.com> >> -Description: Show the current gc_mode [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5pNK-000X7I-Th
Subject: Re: [f2fs-dev] [PATCH] f2fs: add missing doc for fault injection
 sysfs
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

On 2022/12/15 22:14, Yangtao Li wrote:
> Hi Chao,
> 
>> -What:		/sys/fs/f2fs/<disk>/gc_mode
>> -Date:		October 2022
>> -Contact:	"Yangtao Li" <frank.li@vivo.com>
>> -Description:	Show the current gc_mode as a string.
>> -		This is a read-only entry.
>   
>> -What:		/sys/fs/f2fs/<disk>/discard_urgent_util
>> -Date:		November 2022
>> -Contact:	"Yangtao Li" <frank.li@vivo.com>
>> -Description:	When space utilization exceeds this, do background DISCARD aggressively.
>> -		Does DISCARD forcibly in a period of given min_discard_issue_time when the number
>> -		of discards is not 0 and set discard granularity to 1.
>> -		Default: 80
>> -
>> -What:		/sys/fs/f2fs/<disk>/hot_data_age_threshold
>> -Date:		November 2022
>> -Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>> -Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
>> -		the data blocks as hot. By default it was initialized as 262144 blocks
>> -		(equals to 1GB).
>> -
>> -What:		/sys/fs/f2fs/<disk>/warm_data_age_threshold
>> -Date:		November 2022
>> -Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
>> -Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
>> -		the data blocks as warm. By default it was initialized as 2621440 blocks
>> -		(equals to 10GB).
> 
> Why delete other node descriptions, mistake?

Oh, my bad, I missed to handle merge confilct correctly, will
fix in v2.

Thanks,

> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
