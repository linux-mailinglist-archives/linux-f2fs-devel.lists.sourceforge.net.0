Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B283F361C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 23:42:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mHCGx-0004ZB-NC; Fri, 20 Aug 2021 21:41:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mHCGw-0004Z3-76
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 21:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f57ZfxUqHV3Q/9Rbgs+TIOZPYVclQWWPt+ChFjdVNxc=; b=BC2085bVViHeSizPoMQiRi8aBi
 diai22lZsiQ9W9V/dWxn8gpzZ5B/5pZ/tLf6mgVhLEp/0d0GC/lJ1fWOR+gdZIE+c0pXd7titPqaC
 3XCqcRhH0jj/W/+ZXEjFIGaNIVjycAkm2XZ+0eenuMqF5fzOhHvDiGgruCFYXch41d10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f57ZfxUqHV3Q/9Rbgs+TIOZPYVclQWWPt+ChFjdVNxc=; b=VcuOiqivzCBiLGLnK8ptyE7HbT
 2cGuyEsGeW8Jg/+HEMVA5EGe20U+jqftJOKrAAWimRljlvEru2cd6RGMSxZcS5iFxBx+t60d1fF74
 I4xHddmizNhjtgnVh6yaFol6w5dq+ijutsIzZ/7qmKhU03lTaknU846qwZA+hmj11R1Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mHCGr-00DBmz-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 21:41:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EFBE6115A;
 Fri, 20 Aug 2021 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629495699;
 bh=Hcyczx0dUv6OOPsK53/cEFLZyL+VYmXz7Ndl9CnAKy0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YKxJxyEKRrHb/B3gpyM+AT6e+2qO6u2bTONGLcP4ZizlmXZ0MqbDuMVEECgT9VD2y
 p7p4d1hu5PZrSB87avSQ2kGofxgkt5vLjs3hjdyCMy5pycJJoj0yLWbdZyqXNaeBtd
 lqVlodVvm/czeHtMrXdyrmQSwGDPiBHcrvwLkkIsJFwt4aUyKwzHVj0QpCgnJKo9XQ
 4Q4wtyjDXvcoPaxxKkQmGRiuLig9OfT6c0eiCasAFaR1yGBthXFe68bF0VHgpFvuFk
 ibHyfPhxMVRFRAnfdn/DNWN2VLeODJ6O3N7wHkWQjIeclfx1PI1fBeiBX6JtpAdBo8
 q5aB9Vd5qELNw==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210820035229.216975-1-daeho43@gmail.com>
 <20210820035229.216975-2-daeho43@gmail.com>
 <48725f58-1a48-73f3-80cf-a0c5efc3b470@kernel.org>
 <CACOAw_xcwZN_H7_zi7iMJh9HpzXnPd67fNAcxhu5UUSmJk7c1Q@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f2ff8fd5-83e0-0c63-ed48-f21a49ab90dc@kernel.org>
Date: Sat, 21 Aug 2021 05:41:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_xcwZN_H7_zi7iMJh9HpzXnPd67fNAcxhu5UUSmJk7c1Q@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/20 23:23, Daeho Jeong wrote: > On Fri, Aug 20, 2021
 at 3:50 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2021/8/20 11:52, Daeho
 Jeong wrote: >>> +void iostat_update_and_unbind_ctx(struct bio [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mHCGr-00DBmz-Pr
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce periodic iostat io
 latency traces
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

On 2021/8/20 23:23, Daeho Jeong wrote:
> On Fri, Aug 20, 2021 at 3:50 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/8/20 11:52, Daeho Jeong wrote:
>>> +void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
>>> +{
>>> +     struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
>>> +     int sync_type = bio->bi_opf & REQ_SYNC ? 0 : 1;
>>
>> int sync_type = bio->bi_opf & REQ_SYNC ? 1 : 0;
>>
>> Right?
> 
> This means just type, not boolean number. So, I set type 0 is sync and
> type 1 is async.

How about changing this to is_sync or similar name of bool type variable?

> 
>>
>>>    int f2fs_init_iostat(struct f2fs_sb_info *sbi)
>>>    {
>>>        /* init iostat info */
>>>        spin_lock_init(&sbi->iostat_lock);
>>> +     spin_lock_init(&sbi->iostat_lat_lock);
>>>        sbi->iostat_enable = false;
>>>        sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
>>> +     sbi->iostat_io_lat = f2fs_kzalloc(sbi, sizeof(struct iostat_lat_info),
>>> +                                     GFP_KERNEL);
>>> +     if (!sbi->iostat_io_lat)
>>> +             return -ENOMEM;
>>
>> What do you think of just embedding iostat_io_lat structure into f2fs_sb_info
>> structure? it's minor thing though.
>>
> 
> I also wanted to do that, but if we embed this type, we need to define
> that structure in f2fs.h file.
> Is it okay with you?

Oh, correct, it will be more appropriate to define the structure in iostat.h.

Is it fine to just use memset(io_lat, 0, sizeof(struct iostat_lat_info)) to
reset all fields in f2fs_reset_iostat()?

Thanks,

> 
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
