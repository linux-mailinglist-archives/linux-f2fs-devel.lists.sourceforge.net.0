Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6E4A92AE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Feb 2022 04:20:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFp8x-0001kQ-4V; Fri, 04 Feb 2022 03:20:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFp8p-0001kF-PX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 03:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVcbGmBTmP6fEQxw9BPmPJPQoW+Ws9gPf+S7lPtPqpA=; b=ccBXc2V264IKliEc0+ticeyWPe
 4zpjJQlCI7ocv1jD6j2AMczl1dUe1P/TmRnv+sp5d6N9aYKDEjFZfHBu3PQ/I8pql9+C3JJ6rw0XE
 znqDLaSgrIF4V2bvXU8tMel2TkJ2chW2I4AZ8n64B0QLtnjNKeZn1KU3Uiw8F3Zwsntg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HVcbGmBTmP6fEQxw9BPmPJPQoW+Ws9gPf+S7lPtPqpA=; b=FkI2cNNXyKKVMVoqw1PbHavNYY
 c+aeImgVlg+xS4Uvni8OK3sPNz28GaHnIzG/LOa1lKwkFxbr5LgUGBtndh54GcSbqW+mWGqgVaBvh
 3fg6W5WsmieTdbQbvbmgwuIQYonCsTPgEZ1rpTgEY1FzK2dcMTdEcLbcWaelZzA5vhqM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFp8m-00GDBy-3T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Feb 2022 03:20:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 014FCB834D3;
 Fri,  4 Feb 2022 03:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995B8C340E8;
 Fri,  4 Feb 2022 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643944791;
 bh=ZlIGcuypCyxj9pYmnJrdabP+w4iW8DzvlECu6ZAvYc8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jqOpNuHa9UFJfOYzzBlS61vK2kMADyjb2qAnQDZe1p/KPv107AkasJinDP95LZRqJ
 3QFZ4j4mt0Qvwz4myjzGUzda423myiIxvh/Yjs4BqqmTKlXVQ+8/8Z8R+XasKbz+OO
 RgvqvtaV6Sc+ONZXke77i4xFw3aQDBybj0waXbtZnVLkVihPoCHyFNPxPxRqQk+2t1
 EVPKG2efvy3ic16o/hHQoJ5ZkyuH3o/Inj4aMBHBqcT59fR+iAlmKX896iygRpIuCl
 VCagGdRAgnQ92V1Tz/kwAqYJJuYJmtkgLAytkST5Zp/RGHL6N0WfEqYfsqZ+jneAc4
 wOxmExkLfeQcQ==
Message-ID: <9faddf59-0c09-aa20-981a-65b06c4517ae@kernel.org>
Date: Fri, 4 Feb 2022 11:19:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220203144705.23528-1-chao@kernel.org>
 <Yfw1FnkiO+U+zGS0@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yfw1FnkiO+U+zGS0@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/4 4:03, Jaegeuk Kim wrote: > On 02/03,
 Chao Yu wrote:
 >> As Pavel Machek reported in below link [1]: >> >> After commit 77900c45ee5c
 ("f2fs: fix to do sanity check in is_alive()"), >> node p [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFp8m-00GDBy-3T
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to unlock page correctly in error
 path of is_alive()
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
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/4 4:03, Jaegeuk Kim wrote:
> On 02/03, Chao Yu wrote:
>> As Pavel Machek reported in below link [1]:
>>
>> After commit 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()"),
>> node page should be unlock via calling f2fs_put_page() in the error path
>> of is_alive(), otherwise, f2fs may hang when it tries to lock the node
>> page, fix it.
>>
>> [1] https://lore.kernel.org/stable/20220124203637.GA19321@duo.ucw.cz/
> 
> Need -stable? It seems 4.19+?

It depends on where commit 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()")
be backported to? Anyway, let me Cc stable-kernel mailing list.

Thanks,

> 
>>
>> Fixes: 77900c45ee5c ("f2fs: fix to do sanity check in is_alive()")
>> Reported-by: Pavel Machek <pavel@denx.de>
>> Signed-off-by: Pavel Machek <pavel@denx.de>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/gc.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 0a6b0a8ae97e..2d53ef121e76 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1038,8 +1038,10 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>   	}
>>   
>> -	if (f2fs_check_nid_range(sbi, dni->ino))
>> +	if (f2fs_check_nid_range(sbi, dni->ino)) {
>> +		f2fs_put_page(node_page, 1);
>>   		return false;
>> +	}
>>   
>>   	*nofs = ofs_of_node(node_page);
>>   	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
