Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB96E398D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Apr 2023 17:02:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1po3tS-0003N8-Vo;
	Sun, 16 Apr 2023 15:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1po3tR-0003Mv-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Apr 2023 15:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YL1pTwSqLadM8eY+5FjJGOI8cGYShEkH/Bx/IlpnhRo=; b=HPvZWhrLY47r7Dh1/X+QY5droH
 2/i2fHM/VhptIdcDa0p1vM1RaIEbHy60N8eZyqFgvoIbJqpdSOsGT7dguqb/c2c1T23lNUZxs4ae7
 b/P0BC0w+z4p3ZdGnEf6zLLngOPmFu/LXwE9By+oaweqkKznyYOfnbq7Pnn2RvTWafa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YL1pTwSqLadM8eY+5FjJGOI8cGYShEkH/Bx/IlpnhRo=; b=GN6OQC9mUDRuKCXXC+Jybp1dxV
 7F7KJsl2CyMeeLznyWUuvz3S9o2J97Q7w4dOIrUvXN+C/MiSi1l1IrG+GG2Hlv8dP4o+zMz1ZgB/0
 ghvmovbhjQRU/vdXTKB8KaopjtYm1V2luBToJeaiRv2dgodaAcuDQkdJd+yeYrcd9NSk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1po3tK-0001s8-F3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Apr 2023 15:02:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E69F60C8F;
 Sun, 16 Apr 2023 15:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D409C433D2;
 Sun, 16 Apr 2023 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681657322;
 bh=MRLPHEMwkW7WtKO6pZWkp15qzWsjqubLCzvGyJsu/gw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hCVuB8yr+cjKfsx9+UMEaxFNnhPLJ4Ud+BU1t/wrEJlnVGGe4X1ZMyoCsYXChhKJ9
 O2Ku+sR6dgueUk8pA4rjo9Xajjy7navCG5+Skt1KmeEV9PBj0TYcQWC+Rx9pOvHXaP
 u+WNUu5NFs4KzgRmv4qB72R7qnWvIlGYX5g+5czJWCdbMxp/WTPpf8rBJ92dddviPj
 LpzjQehLx2tHpbDm7rTt4A045YVD0kREAkaKBImSesYNhJllqzUaCQJDQbMRfj0E04
 DxdFFDisoPV/uVQvoEKx/qenqN7i8h7ryJxi7+zKcDxw3/PwdXnWg4A86Yu2wjJ04O
 G7CFTY714L7Og==
Message-ID: <ea22efd7-3b46-e71c-c64f-0b593691e7e7@kernel.org>
Date: Sun, 16 Apr 2023 23:02:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230406191629.63024-1-frank.li@vivo.com>
 <2e41d6e0-13bb-fa5d-00aa-75865b8e7c34@kernel.org>
 <ZDglzIoEp3dH3eOS@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDglzIoEp3dH3eOS@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/13 23:54, Jaegeuk Kim wrote: > On 04/13, Chao Yu
 wrote: >> On 2023/4/7 3:16,
 Yangtao Li wrote: >>> Convert to use remove_proc_subtree()
 and kill kobject_del() directly. >>> kobject_put() act [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1po3tK-0001s8-F3
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove bulk remove_proc_entry() and
 unnecessary kobject_del()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/13 23:54, Jaegeuk Kim wrote:
> On 04/13, Chao Yu wrote:
>> On 2023/4/7 3:16, Yangtao Li wrote:
>>> Convert to use remove_proc_subtree() and kill kobject_del() directly.
>>> kobject_put() actually covers kobject removal automatically, which is
>>> single stage removal.
>>>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>> ---
>>>    fs/f2fs/sysfs.c | 15 ++-------------
>>>    1 file changed, 2 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>>> index dfbd17802549..3aad3500a701 100644
>>> --- a/fs/f2fs/sysfs.c
>>> +++ b/fs/f2fs/sysfs.c
>>> @@ -1461,25 +1461,14 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>>>    void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
>>>    {
>>> -	if (sbi->s_proc) {
>>> -#ifdef CONFIG_F2FS_IOSTAT
>>> -		remove_proc_entry("iostat_info", sbi->s_proc);
>>> -#endif
>>> -		remove_proc_entry("segment_info", sbi->s_proc);
>>> -		remove_proc_entry("segment_bits", sbi->s_proc);
>>> -		remove_proc_entry("victim_bits", sbi->s_proc);
>>> -		remove_proc_entry("discard_plist_info", sbi->s_proc);
>>> -		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
>>> -	}
>>> +	if (sbi->s_proc)
>>> +		remove_proc_subtree(sbi->sb->s_id, f2fs_proc_root);
>>> -	kobject_del(&sbi->s_stat_kobj);
>>
>> - f2fs_register_sysfs
>>   - kobject_init_and_add(&sbi->s_stat_kobj, ..)
>>
>> /**
>>   * kobject_init_and_add() - Initialize a kobject structure and add it to
>>   *                          the kobject hierarchy.
>> ...
>>   *
>>   * This function combines the call to kobject_init() and kobject_add().
>> ...
>>   */
>>
>> /**
>>   * kobject_del() - Unlink kobject from hierarchy.
>>   * @kobj: object.
>>   *
>>   * This is the function that should be called to delete an object
>>   * successfully added via kobject_add().
>>   */
>>
>> Am I missing something?
> 
> kobject_put -> kobject_cleanup was supposed to do it?

Yes, it seems so.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>>    	kobject_put(&sbi->s_stat_kobj);
>>>    	wait_for_completion(&sbi->s_stat_kobj_unregister);
>>> -	kobject_del(&sbi->s_feature_list_kobj);
>>>    	kobject_put(&sbi->s_feature_list_kobj);
>>>    	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
>>> -	kobject_del(&sbi->s_kobj);
>>>    	kobject_put(&sbi->s_kobj);
>>>    	wait_for_completion(&sbi->s_kobj_unregister);
>>>    }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
