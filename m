Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EFB400970
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 05:33:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMMQo-0000Ir-E3; Sat, 04 Sep 2021 03:33:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mMMQm-0000Il-Q1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 03:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cgttt+PmuLXEwn6spezJx6rx3osncPK4AC5hjcfB9MA=; b=YcOYD+/bgD+rEzHyPIk9uH0sIZ
 DUbdrPeZO21Nylz90N/OSPATlsZ/xp3jd8xDtfHf6Q3zJz2RvQcFsdjhUOWszn7Xj61YauBZK/mQ2
 89LqTycTIyPBmbLc3+JvhTcOjPKZpuzKaWgPreGwUzYt0/MwjqEAHil/VLoVx4Q9cVXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cgttt+PmuLXEwn6spezJx6rx3osncPK4AC5hjcfB9MA=; b=fRBvJJdcESaSybTsx9zW+oTDhQ
 GpGLKNux2/fjdxEB1TdFNqlje0hOmECD4/jrphURytT7lFuTfQRT6MXgoDfZwMfDuKiWNakib5u2o
 GIKj02ywMYU6FqRmsg0+7rbYaASNbOOmpVfBG2APHqWEgvR9+z7lRF6H60yVsisupyXI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMMQm-00DwPB-7F
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 03:33:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C813F6069E;
 Sat,  4 Sep 2021 03:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630726398;
 bh=vDInDMJ4sMJnmqblJcXU0QqfdBm47jpBvsDvYyfEXBk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iraM5xTi9QjL341eo2RxFLV1aclSle5NhZTFsRGheHHVdZTduYXKuNdSs93EzOCVq
 6o6+FQAhLcCmT3W0T8wEK22PEIG7H86pLQ40MeFVSBw9J4Z5FGZ4xhz1B96WQPzce3
 5E2vDC0cVURUDAICMhdjbW0HBHLDiTu/f141xsy+q2kBL9cDHr+A8zZ64+gX1BYHye
 IMUPst2ejWYNR+S/B15UyKj/Qa8LhwCHXK9b9gsVfK6+ZpvqhSEMtHzxvusaldthus
 QsP7gybXytaFUFA7Yj42bC2O+uh1Ok9vWcctFh3+R+N2uc0t7i/iL8sfjaRdkPVBc2
 z4ZPFGIU9cNCg==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
 <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <8f8e4695-4062-60c4-0f91-2a1f6a5b0a11@kernel.org>
Date: Sat, 4 Sep 2021 11:33:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_yovM592K3-2fQzA6M29XqWu8s_2f+zXawKo-QpNSXq0w@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/4 4:33,
 Daeho Jeong wrote: >> if (f2fs_need_seq_seg(sbi))
 >> return 0; >> >> static inline bool f2fs_need_seq_seg(struct f2fs_sb_info
 *sbi) >> { >> return F2FS_OPTION(sbi).fs_mode == FS_MODE [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMMQm-00DwPB-7F
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/4 4:33, Daeho Jeong wrote:
>>          if (f2fs_need_seq_seg(sbi))
>>                  return 0;
>>
>> static inline bool f2fs_need_seq_seg(struct f2fs_sb_info *sbi)
>> {
>>          return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_FIXED_BLK;
>> }
>>
> 
> Do you need this in select_policy(), either?

IMO, for this mode, I prefer to disable background GC and just use newly
written userdata to fragment image, so I think it's fine to keep it as it is
here.

> Like,
>          if (f2fs_need_rand_seg(sbi))
>                  p->offset = prandom_u32() % (MAIN_SECS(sbi) *
> sbi->segs_per_sec);
>          else if (f2fs_need_seq_seg(sbi))
>                  p->offset = 0;
> 
>> One more concern... we'd better to save fragment_remained_hole as well
>> as fragment_remained_chunk,  otherwise, if fragment_chunk_size +
>> fragment_hole_size > 512, fragment hole will be truncated to 512 -
>> fragment_chunk_size due to we won't create hole with enough size as
>> seg->next_blkoff has crossed end of current segment.
>>
> 
> Sorry, I don't get it. You mean making fragment_remained_hole as a
> global variable?

As a per curseg field.

> Maybe, we run into the same race condition issue you told before for
> fragment_remained_chunk.
> Could you clarify this more?

e.g.

F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_FIXED_BLK
fragment_chunk_size = 384
fragment_hole_size = 384

When creating hole:

- f2fs_allocate_data_block
  - __refresh_next_blkoff
    chunk locates in [0, 383] of current segment
    seg->next_blkoff = 384
    sbi->fragment_remained_chunk = 0
    then we will reset sbi->fragment_remained_chunk to 384
    and move seg->next_blkoff forward to 768 (384 + 384)
  - __has_curseg_space() returns false
  - allocate_segment() allocates new current segment

So, for such case that hole may cross two segments, hole size may be truncated
to left size of previous segment.

Thanks,

> 
> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
