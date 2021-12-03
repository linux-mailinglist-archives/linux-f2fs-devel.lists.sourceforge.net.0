Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78446723C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Dec 2021 07:51:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mt2Q4-000574-26; Fri, 03 Dec 2021 06:51:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mt2Pp-00056o-Os
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Dec 2021 06:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Tf+tWudwO04imjjpk1Dj987X+NrUEA6GyWLO3+7iNM=; b=Jk3ur2xI9yBz4ZrV1sHyP1YG3y
 zCqOE5ivBW19zSm1suKBHSlCIc6GfMKmVBTNakhzZZFQRrn3DZXxD1g19Pblcq3XOq5NJevloCy3V
 qMIQKgxaRNgjDlpPLv12Pt+kz9/F11wTkJC0T1F5XwqaIpvPuVyS6FisWx1rDv3HJ4es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Tf+tWudwO04imjjpk1Dj987X+NrUEA6GyWLO3+7iNM=; b=OVBpfjkQVbtLsKM80rD91DyqPR
 X3sMk+DbEe/G2pJdAe03uWHZHIy5AVx0m6ENl0dCIJXaeIfZtl/JwUAXftbTsrSDPe3Bp5VLWdgIc
 aLcNF0SDvPtN/hwUkj1yB3+0m/dPHydF7NCwA3iDYux372EAYexR2XYbUday7Dsp9dzk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mt2Po-002OvS-TQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Dec 2021 06:51:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81C89B81DCB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Dec 2021 06:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF4DC53FAD;
 Fri,  3 Dec 2021 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638514281;
 bh=34SFPgg3ArvbMFrw5JC591DMTXjD/TO+MiQWb5X3ym8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QBhHl6RWBlamf3vNxCoGNKiLxekNfYSbEqncAKb/7+EwY2XQf3e/9iy1wheuldXCu
 Sx5qvAOSMf1CClb8ISSEkPDREEfOAAJy1Qa9cZLEo7ruf/PM5w5h/wxTdveTJHMUK5
 PfMzjphMwcKMXFsZojqKPHuSd9fusZiR6hczBkH95656wPdPEe5yeFu/kSm+Qtgg7n
 JY7I80xTjqa9Y42kHOfXE2T0nClAUAFtQTkwxwLDXs0XRBbs1cZ8Bko4x9zU4wQjCR
 L+XWcTe2qYEqrAGeBAFZ8HXDCuRlpgSYYh1+61VVf6m21JVxhMQkOsPySxUS3rV/jv
 irT7LbGG4D/Cw==
Message-ID: <a0c55b6d-a325-d40d-e030-bc936ef592fe@kernel.org>
Date: Fri, 3 Dec 2021 14:51:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain> <YakXMV0UvBV7TVwe@google.com>
 <YakX38onzsW5Ef8B@google.com> <YakzVAkHAVMueJwe@sol.localdomain>
 <Yak4cxU6htgQk7ck@google.com> <Yak6gtXthBRK3eeM@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yak6gtXthBRK3eeM@google.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/3 5:28, Jaegeuk Kim wrote: > On 12/02, Jaegeuk
 Kim wrote: >> On 12/02, Eric Biggers wrote: >>> On Thu, Dec 02,
 2021 at 11:00:47AM
 -0800, Jaegeuk Kim wrote: >>>> On 12/02, Jaegeuk Kim wrote: [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mt2Po-002OvS-TQ
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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

On 2021/12/3 5:28, Jaegeuk Kim wrote:
> On 12/02, Jaegeuk Kim wrote:
>> On 12/02, Eric Biggers wrote:
>>> On Thu, Dec 02, 2021 at 11:00:47AM -0800, Jaegeuk Kim wrote:
>>>> On 12/02, Jaegeuk Kim wrote:
>>>>> On 12/02, Eric Biggers wrote:
>>>>>> On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
>>>>>>> On 2021/12/2 12:15, Eric Biggers wrote:
>>>>>>>> On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
>>>>>>>>> Why not relocating this check before f2fs_map_blocks()?
>>>>>>>
>>>>>>> Wait, it supports DIO in multi-device image after commit 	71f2c8206202
>>>>>>> ("f2fs: multidevice: support direct IO"), how about
>>>>>>> checking with f2fs_allow_multi_device_dio()?
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>
>>>>>> Okay, that was not the case when I sent this patch originally.  We'll need to
>>>>>> update this to support multiple devices.
>>>>>
>>>>> Chao/Eric, does this make sense?
>>>>>
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>>>>                  }
>>>>>                  if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
>>>>>                          return -EINVAL;
>>>>> -               iomap->addr = blks_to_bytes(inode, map.m_pblk);
>>>>>
>>>>> -               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
>>>>> -                       return -EINVAL;
>>>>> -               iomap->bdev = inode->i_sb->s_bdev;
>>>>> +               iomap->bdev = map->m_multidev_dio ? map.m_bdev :
>>>>
>>>> correction:			map.m_multidev_dio
>>>>
>>>
>>> I guess so, but why doesn't f2fs_map_blocks() just always set m_bdev to the
>>> correct block device?  What is the point of m_multidev_dio?
>>
>> It seems we can simply assign iomap->bdev = map.m_bdev, and remove
>> map->m_multidev_dio.
> 
> Ok, it was used in previous get_block flow, but I think it'd be worth to keep it
> to show by f2fs_map_blocks tracepoint.

Yes, it was added for that.

Thanks,

> 
>>
>>>
>>> - Eric
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
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
