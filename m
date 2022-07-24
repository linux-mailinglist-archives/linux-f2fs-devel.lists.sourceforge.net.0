Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2057F54D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 15:49:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFbyg-00037F-26; Sun, 24 Jul 2022 13:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFbyf-000378-1E
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 13:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5slBKTFa7nv6tJg9IVARreNLrU0WLF1W82sOLP2dOQo=; b=iXLNvHbPYP7QleGqQJ7LuACCEp
 PaZy7Htp+zLxdVF2rybabJ3DltjTxga2bsHIDt4MPGC6OtR/V4wurEPuz5lWiismMmXCMFUqudOIA
 KfxGWYxoADZ2jSGqA+nuHr8NoosQ/+UnA4gXrR8THzF+vwVL2plPytZ+5MJr23M35Z0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5slBKTFa7nv6tJg9IVARreNLrU0WLF1W82sOLP2dOQo=; b=Qn7qZTYRKkpctVq6i6JKM1A6tG
 uk/EHhdShpNZgWt9jKtdz7QYSFeZF5GIMtdB8SZzKwbT2lTYUpnN6cvMHVxEM6UQlwgiUm6c6V4Jz
 ZemjEbkTFrltLHAJjt5XRLZhJ01OD/EbXSeV9GIzUgrhFyEX5b5DyqPg4FtnwS1Hu8Gg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFbyf-0007fl-2b
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 13:49:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6196610A0;
 Sun, 24 Jul 2022 13:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A86C3411E;
 Sun, 24 Jul 2022 13:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658670535;
 bh=5pxHMPR8s05J1rYGu4RRV0ENr4UrmzQAQT001Y0grMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t/p9Qb0ja6grAsxE+IhQeg3P9zDOCmHtbChwu7G6pJMf69/mbEfO8xNboPKuImUtZ
 qnL/3jd7GGqVdyow9ydzOS+JoJjba+2vW8wBX7NLzo70Y+oklvbVE1oXmHKCOBplNV
 UqcVsccyeHphK3FLtfRvMUgLST5h3pb+aC+O9HTmVnkjC3NAqnCDcZY3PwG5WsPxTY
 xHL9iDs8GYYoBoSTQgKQXm3w+rtZaTpb1jDZShjWsGAWTGe7+drEKVgEob7H5HG7Q3
 kyQy6BPVD1lO2yVleTp6xvacV/EBGXW2LWutAjyiEaQskayWZauO8LUh4UGSh/vUVk
 UX0B1FRrGHI7A==
Message-ID: <63a06b49-e448-ad82-5e6d-8ae0f07a1038@kernel.org>
Date: Sun, 24 Jul 2022 21:48:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yufen Yu <yuyufen@huawei.com>
References: <20220721045329.2155449-1-yuyufen@huawei.com>
 <YtoRKnBpmxxGkbv2@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YtoRKnBpmxxGkbv2@google.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/22 10:53, Jaegeuk Kim wrote: > On 07/21, Yufen Yu
 wrote: >> If f2fs_iget cannot search inode from inode cache, it will read
 >> the inode from disk. The processing of read from disk and init [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFbyf-0007fl-2b
Subject: Re: [f2fs-dev] [PATCH] f2fs: get rid of f2fs_inode_synced from
 f2fs_iget
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/22 10:53, Jaegeuk Kim wrote:
> On 07/21, Yufen Yu wrote:
>> If f2fs_iget cannot search inode from inode cache, it will read
>> the inode from disk. The processing of read from disk and init inode
>> should not dirty the inode, as the commit 530e07042002 ("f2fs:
>> don't mark compressed inode dirty during f2fs_iget()").
> 
> f2fs_truncate can make this?
> 
> 552         if (file_should_truncate(inode) &&
> 553                         !is_sbi_flag_set(sbi, SBI_POR_DOING)) {
> 554                 ret = f2fs_truncate(inode);
> 555                 if (ret)
> 556                         goto bad_inode;

__recover_inline_status() can also dirty inode?

Thanks,

> 
> 
>>
>> Thus, we can remove the unnecessary f2fs_inode_synced().
>>
>> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
>> ---
>>   fs/f2fs/inode.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>> index fc55f5bd1fcc..ce87b66c6dfe 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -562,7 +562,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>   	return inode;
>>   
>>   bad_inode:
>> -	f2fs_inode_synced(inode);
>>   	iget_failed(inode);
>>   	trace_f2fs_iget_exit(inode, ret);
>>   	return ERR_PTR(ret);
>> -- 
>> 2.31.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
