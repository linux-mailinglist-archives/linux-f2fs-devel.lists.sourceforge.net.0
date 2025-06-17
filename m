Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04241ADCCA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 15:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Yw7Y8dr6t7MRAwX4k6oabsaelUn77g7bWZOF1DcjAE=; b=YpIqFHJ3/bkQWi82Y5hz96HyLu
	hc7P6w07+qd/e1wqmz3lq66l/CgUmYntQWGc9Ocyihbcz0YyI4E0149iYXnH8l5AB5pr6u+UR3z43
	NLh2pBMFF1p0NezTP/qVLGmtyioQURk6VZIRwgshkT6Z8Slg6sv+MqvTDQMOGuIa/JDA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRW83-00009y-US;
	Tue, 17 Jun 2025 13:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uRW7s-00009m-CZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5VhdneHRqlpd2M3PhHVyM7cGZueptfs0MlbRcXOiVjY=; b=fg4T3LXmUAdDoIYar9grx+P9+u
 hjdBYmePMYggapfzkH3go+cRP4bvsGzE4LJXfS0LzvS5agPmfq/bSdY5RThSY6dJPc7/Vge0UBfSW
 C+PPzZpHx/TYZRi37p8uMIkDxeBmRMJ556K/PNasRh+JwiYsMYK277Z/WDjsNiCN3TTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5VhdneHRqlpd2M3PhHVyM7cGZueptfs0MlbRcXOiVjY=; b=akUWEP85NoWhPtqOg3CeRvYoPC
 pCw9SLGAzR+bJIgwPCblVKSsioHIYe/XxEXJ6+jrLqVlYLqPJtiQ5NQGWboFIj/0TogXTyzBqs37O
 5ekwjKF2flJB+5cBMW1F8WDSsrxrEiTXvKUy0iJYk8548AGG8wuzgyY48kPsXol3uqMU=;
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRW7r-0006X2-Te for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 13:13:20 +0000
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so6009770a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jun 2025 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750165994; x=1750770794; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VhdneHRqlpd2M3PhHVyM7cGZueptfs0MlbRcXOiVjY=;
 b=DRgmj/YhZnj8lx7TizheK0t4b71+OQnf4SvU1nMATWccUBu0UCUY1KKQC+GgVs8ufq
 hN9o4hyw0qSXBoVYAc5UXsjYy2EkvAPF1qaxWf7YgEgd9H48FQfETsgWEmVNHfeEpwZo
 2n8nsmrP9NtAh4kKJwb4Dz4TBhX/FsxPlXUE6371V7n0UFIIPa7tXMWAmsyjT9MuALDT
 k8UIJNINHAhUVscUGO8oDGR2oMEWfvETCcTptHmzF6m+7z3UYeF3qluKaxOTczcLwEN/
 oqtiCxVB/gMt21AXG3d3SZw46oeR0RPk1V7VvG6PGlBOeFXT30gHnd+wwPP98BAH2Dle
 Lbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750165994; x=1750770794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VhdneHRqlpd2M3PhHVyM7cGZueptfs0MlbRcXOiVjY=;
 b=jiGdbjvLvGic3T82EE2N942THrIJd2oBgSkZv1402stQtcM7f/6CtZsEkBbeQg9RHd
 OQrlPtUUvUWsjUhZF6Arq58Jd4+TpWWG6XcnbcX/Xg8xKzDuMqV0L9pRLUaZIaQKosFl
 2QQUg21WAAY7QFZHVUjoa1PsSri1Kb0ozSC4nGakgNQEd53WNlEIND61aXPys91hO+Vh
 kkH0FA316UzLt479/btRxZcsZRh6xo1yld2e1Lj4P1snpuTMO2auU/JKXFi9GtepEUs5
 bkpokHmrzFyT6ISuI1BVIrV0QdWPehjNSV35Zo4eOwROD20p9QboYh/MkiQQqHB34vSO
 qoaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfzphxClie9jVvm8FYi5hM/13iQulVvZkGDdkfsVOx63fb47KGnHdopzMNIdrTUPEcTha3tc+8nP/IcBBZlMHG@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyt9t+w4s5vhUJNkkzlbp0NbBsga8MqgK6KCkDBQmBeMfAKAIGN
 ZcbODdi+D9QA+gNm4z/0haamJr4b+HjjL7lz0cEDAdbWMW0UkTuDC/mF
X-Gm-Gg: ASbGnctsCMz3U+8KkiiZbQYXZvb98uRqrtdqnwlS6KQBzJYYtKU5Rx3XviJ39iGuoxZ
 2cw5ARK561IiQy2YBYqtSEC3fytGbHmpjGRD+uNhY2VM5O9DCJ39KbuCxMC3RgZy0PORps8/FBA
 WDprg8eCxjSRwyOuRfUaVXlOwmFfiJNVf7yrhzLbem3+kNIzERyC+MTl/vWDbCvBhblAJAL6m/B
 c3Ek5DOpeaqFndIsX0+Cdddxbmwv9aDMM1ZeaEx6D8ZKHJIyB4t8T2nMVfQKuEme27QIyXTNnum
 /TpQVWvEI9cHETwQPocGMgSgNEgijTatOMDz+w9lQTQlwSyQtbqHZBNFQ4L7xvE5pLHEJmdE1w=
 =
X-Google-Smtp-Source: AGHT+IHODurYV+NDA7SJ050XL9r6JxmBMDdVsW92SAhvMmMWiuct9+6b3akbnZxkzaSLPtkuZnM9fw==
X-Received: by 2002:a05:6a21:158e:b0:21d:3918:3bdf with SMTP id
 adf61e73a8af0-21fbd4656a4mr20110881637.8.1750165994064; 
 Tue, 17 Jun 2025 06:13:14 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d247dsm8752647b3a.166.2025.06.17.06.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 06:13:13 -0700 (PDT)
Message-ID: <5b27466d-4b39-432a-b7c3-b1918a0cc2d8@gmail.com>
Date: Tue, 17 Jun 2025 21:13:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250617055542.218681-1-huangjianan@xiaomi.com>
 <c89b359f-da89-4285-98c2-a98470a5f959@kernel.org>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <c89b359f-da89-4285-98c2-a98470a5f959@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/17/25 19:37, Chao Yu via Linux-f2fs-devel wrote: > On
 6/17/25 13:55, Jianan Huang wrote: >> When fewer pages are read, nr_pages
 may be smaller than nr_cpages. Due >> to the nr_vecs limit, the com [...]
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRW7r-0006X2-Te
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid splitting bio when reading
 multiple pages
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
Cc: shengyong1@xiaomi.com, wanghui33@xiaomi.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/17/25 19:37, Chao Yu via Linux-f2fs-devel wrote:
> On 6/17/25 13:55, Jianan Huang wrote:
>> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
>> to the nr_vecs limit, the compressed pages will be split into multiple
>> bios and then merged at the block level. In this case, nr_cpages should
>> be used to pre-allocate bvecs.
>>
>> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>> ---
>>   fs/f2fs/data.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 31e892842625..c7773b09d83f 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2303,7 +2303,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>>   		}
>>   
>>   		if (!bio) {
>> -			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
>> +			bio = f2fs_grab_read_bio(inode, blkaddr,
>> +					max(nr_pages, cc->nr_cpages) - i,
> 
> Hi Jianan,
> 
> e.g.
> 
> User wants to read page [1, 5],
> page #1,2,3,4 locates in compressed block #1000,1001,1003,
> page #5 locate in compressed block #1004,1005
> 
> It submits first bio w/ block #1000,1001
> It allocates second bio w/ size of max(nr_pages=1, nr_cpages=3) - 2 = 1 ?
> However block #1003 and block #1004,1005 can be readed in one bio, we
> should allocate larger bio for last continuous blocks which cross clusters.

Hi, Chao,

I think `max(nr_pages, cc->nr_cpages) - i` can reserve enough vectors in bio
for later reads. IIUC, the case above is:

read page #1,2,3,4 at blkaddr #1000,1001,1003:
   * nr_pages=5, cpages=3, for the first bio1, vec=max(5,3)-0=5 (2 vecs are used)
                           for the second bio2, vec=max(5,3)-2=3 (1 vec is used)
read page #5 at blkaddr #1004,1005, prev bio2 is still available
   * nr_pages=1, cpages=2, prev bio2, 2 vecs left


For case: page #1,2,3,4 at compressed blkaddr #1000,1001,1003
           page #5,6,7,8 at compressed blkaddr #1004,1005,1006
If we are reading page[1,5], we could do calculation as the following?

     max_nr_pages=align(nr_pages, cluster_size)
     max(max_nr_pages, cc->nr_cpages) - i


thanks,
shengyong
> 
>>   					f2fs_ra_op_flags(rac),
>>   					folio->index, for_write);
>>   			if (IS_ERR(bio)) {
>> @@ -2373,7 +2374,6 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>   	pgoff_t index;
>>   #endif
>>   	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>> -	unsigned max_nr_pages = nr_pages;
> 
> Maybe we can align both start and end of read range w/ cluster_size, and use
> start and end for max_nr_pages calculation, then pass it to
> f2fs_read_{multi,single}_pages(), something like this?
> 
> max_nr_pages = round_up(end_idx, cluster_size) -
> 		round_down(start_idx, cluster_size);
> 
> Its size should always cover size of all cpage and/or rpage.
> 
> Thanks,
> 
>>   	int ret = 0;
>>   
>>   	map.m_pblk = 0;
>> @@ -2400,7 +2400,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>   		/* there are remained compressed pages, submit them */
>>   		if (!f2fs_cluster_can_merge_page(&cc, index)) {
>>   			ret = f2fs_read_multi_pages(&cc, &bio,
>> -						max_nr_pages,
>> +						nr_pages,
>>   						&last_block_in_bio,
>>   						rac, false);
>>   			f2fs_destroy_compress_ctx(&cc, false);
>> @@ -2432,7 +2432,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>   read_single_page:
>>   #endif
>>   
>> -		ret = f2fs_read_single_page(inode, folio, max_nr_pages, &map,
>> +		ret = f2fs_read_single_page(inode, folio, nr_pages, &map,
>>   					&bio, &last_block_in_bio, rac);
>>   		if (ret) {
>>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>> @@ -2450,7 +2450,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>   			/* last page */
>>   			if (nr_pages == 1 && !f2fs_cluster_is_empty(&cc)) {
>>   				ret = f2fs_read_multi_pages(&cc, &bio,
>> -							max_nr_pages,
>> +							nr_pages,
>>   							&last_block_in_bio,
>>   							rac, false);
>>   				f2fs_destroy_compress_ctx(&cc, false);
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
