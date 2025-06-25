Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD6AE7DE1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 11:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neAVe/cFOX3iel215fltVKGjE8Dfy/2gWKtXgsl490w=; b=T3T31UmelRqecGWkvmg8qfRzJB
	lkf+8mZhqymxfaU8N0Co/eqDXqzddn2Mj8vMLDjLKOZCzsiogHlY83SquFk7DWGtMb2FCoIhuR+6z
	VHAO6jl+RcyhBkA9/5r0z9YeZg7hKKDDgzge7AwmMJbt0pCuDzY+MdvDpsdZXGD5rO7g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUMk6-0005eZ-AH;
	Wed, 25 Jun 2025 09:48:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1uUMk5-0005eT-Hk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 09:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n+XBI2Ab6dlqEa0ug9pegk0k056t138HDkGT61V1MBw=; b=R1dOOULXJIY8Tp2OgX5eo4aXfV
 nMVPc1r3bmCbRSQcZNDxanHT+Zs3sEALnm7bxWxrEpyI0lVVqmCqQcoHKnP1iYoArCWxvLaxl+lpo
 5cqSY31pwBRlWYd9Ae8NiDMfmZPjVoYohxW8iivWcry86fbZmM8LOv1IIePXnwfzou6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n+XBI2Ab6dlqEa0ug9pegk0k056t138HDkGT61V1MBw=; b=jEv92YGaXhogbGrKnLAZtgQryk
 ghGPyGJZ4i6n0Tl0RJfVLLriv6GNwfItPmNn6oF5GcRzZ0rLla2IRkzM2Kgw/APJKKTi7a1KiIqOc
 BrP+u6VS3xO1JypXCPJmn63vIoFo1varmA7nSScVM19Ek2docUO65ZXGDSYiMBYfJklw=;
Received: from [207.226.244.123] (helo=outboundhk.mxmail.xiaomi.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uUMk4-0003R8-RF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 09:48:33 +0000
X-CSE-ConnectionGUID: QB0u5cqvRnyQ1XWXvZ5wUQ==
X-CSE-MsgGUID: ePpIfG8+TBybtD7zYj78jg==
X-IronPort-AV: E=Sophos;i="6.16,264,1744041600"; d="scan'208";a="144227785"
To: Chao Yu <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [External Mail]Re: [PATCH v3] f2fs: avoid splitting bio when
 reading multiple pages
Thread-Index: AQHb5Z1MQCqP3gvX0E2hj7eo3PmF6LQTCY8AgAARqwA=
Date: Wed, 25 Jun 2025 09:48:19 +0000
Message-ID: <e58344ef-0544-41f3-be07-1f1478912469@xiaomi.com>
References: <20250625064927.516586-1-huangjianan@xiaomi.com>
 <d2ac0da9-3d47-4269-a7b0-a18719c64346@kernel.org>
In-Reply-To: <d2ac0da9-3d47-4269-a7b0-a18719c64346@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.88.13]
Content-ID: <9013EE3F2EA98A4EB20C6CC4351BE9A9@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/25 16:45, Chao Yu wrote: > > On 6/25/25 14:49,
 Jianan Huang wrote: >> When fewer pages are read,
 nr_pages may be smaller than nr_cpages.
 Due >> to the nr_vecs limit, the compressed pages wil [...] 
 Content analysis details:   (1.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.226.244.123 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1uUMk4-0003R8-RF
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH v3] f2fs: avoid splitting
 bio when reading multiple pages
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@xiaomi.com>
Cc: =?utf-8?B?55ub5YuH?= <shengyong1@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/25 16:45, Chao Yu wrote:
> 
> On 6/25/25 14:49, Jianan Huang wrote:
>> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
>> to the nr_vecs limit, the compressed pages will be split into multiple
>> bios and then merged at the block level. In this case, nr_cpages should
>> be used to pre-allocate bvecs.
>> To handle this case, align max_nr_pages to cluster_size, which should be
>> enough for all compressed pages.
>>
>> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>> ---
>> Changes since v2:
>> - Initialize index only for compressed files.
>> Changes since v1:
>> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
>>
>>   fs/f2fs/data.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 31e892842625..d071d9f6a811 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>>                }
>>
>>                if (!bio) {
>> -                     bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
>> +                     bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
> 
> Jianan,
> 
> Another case:
> 
> read page #0,1,2,3 from block #1000,1001,1002, cluster_size=4.
> 
> nr_pages=4
> max_nr_pages=round_up(0+4,4)-round_down(0,4)=4
> 
> f2fs_mpage_readpages() calls f2fs_read_multi_pages() when nr_pages=1, at
> that time, max_nr_pages equals to 1 as well.
> 
> f2fs_grab_read_bio(..., 1 - 0,...) allocate bio w/ 1 vec capacity, however,
> we need at least 3 vecs to merge all cpages, right?
> 

Hi, chao,

If we don't align nr_pages, then when entering f2fs_read_multi_pages,
we have nr_pages pages left, which belong to other clusters.
If this is the last page, we can simply pass nr_pages = 0.

When allocating bio, we need:
1. The cpages remaining in the current cluster, which should be 
(nr_capges - i).
2. The maximum cpages remaining in other clusters, which should be 
max(nr_pages, cc->nr_cpages).

So (nr_capges - i) + max(nr_pages, nr_cpages), should be enough for all 
vecs?

Thanks,


> Thanks,
> 
>>                                        f2fs_ra_op_flags(rac),
>>                                        folio->index, for_write);
>>                        if (IS_ERR(bio)) {
>> @@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>        unsigned max_nr_pages = nr_pages;
>>        int ret = 0;
>>
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>> +     if (f2fs_compressed_file(inode)) {
>> +             index = rac ? readahead_index(rac) : folio->index;
>> +             max_nr_pages = round_up(index + nr_pages, cc.cluster_size) -
>> +                             round_down(index, cc.cluster_size);
>> +     }
>> +#endif
>> +
>>        map.m_pblk = 0;
>>        map.m_lblk = 0;
>>        map.m_len = 0;
>> @@ -2385,7 +2393,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>        map.m_seg_type = NO_CHECK_TYPE;
>>        map.m_may_create = false;
>>
>> -     for (; nr_pages; nr_pages--) {
>> +     for (; nr_pages; nr_pages--, max_nr_pages--) {
>>                if (rac) {
>>                        folio = readahead_folio(rac);
>>                        prefetchw(&folio->flags);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
