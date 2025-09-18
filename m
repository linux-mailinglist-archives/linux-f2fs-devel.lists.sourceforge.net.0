Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196FB82A11
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 04:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQfwo2bRhaoTJCGbqYlAYzKpI0rgoQ/TGLIBATZYkbw=; b=BxrQxEKsE3Ucb3SP1m4JNVDcv4
	LXJeAs55gvTMw/mmm1JvbjibACC5Hovwm9EbfzQ573juKkPFEf7eDKaDaEOqaRQ5PqkfSXMBoxfY5
	JhOtk/zIsL25xkjY8Mu04LsMkDVc5wii4o1aPzML/0LaQInQK+E8MQDtS0HhgXDNjb94=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz4Bt-0004dX-OU;
	Thu, 18 Sep 2025 02:16:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uz4Bs-0004dG-0R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 02:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Or3iilJzozwZS9lmIg9X569TKrH8bOB+1a5y9wcKKpY=; b=Xz5RveTF/gTjRxBtlVllMtjYiD
 vtACgEzGdz1sr7epKMzbGD/CdKkb4N8mezV751Zfmh86wrnu3oXmGdsLNyz7z8GDmOpfhzlcVqdps
 pRnRO4p6/pqGauM3ShyO0EQ1vdm5ia1smPJu+Y7/sop1VLdqpB3gNPrUEx6btFUUKNtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Or3iilJzozwZS9lmIg9X569TKrH8bOB+1a5y9wcKKpY=; b=LNCwQ87bIti3BCKRJ+bdsUQQ1D
 Fj6Ty6xqBYrqxYBXkwFw2ym7nTWkPQcW5y4qddrb+03dwmIjZJDggiBQ3RGg7XgdMXmxvhlfq9zv8
 v+9/ICKdIT5FS7nWw1HHV0oADXZrLw9IQxx/ylbKULJA8YsZGeYiXenADZWIHbapk5X8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz4Bs-0006Ok-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 02:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CFD6943BF6;
 Thu, 18 Sep 2025 02:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDDEC4CEE7;
 Thu, 18 Sep 2025 02:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758161762;
 bh=l7d4dtAEETZSUstygVX4FRF+R9k53ZclT8NfzTMJ5x0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SS3ZKsfKBXdhznuLLjRWrONmKw5IHrJdEgFo0C+zGUH7vkJSN2hVx/aOmAPOUu3dn
 NFxK2723LW7yk5pheuCT2icTBeV6NeizeLRp90BP2G+A7r6WsF0MwJ2EOYSTMwf8B2
 0gKte8XgHEuR7YWTQw4eu3a/eHOuW1SZ44jmwxcAaNFHhEmSBkhvyV9G3DRZPaoZaC
 gaokYNOXBdN50vDAmWQTwdISS0EOOcDAeu63u9s/YctkDPQzJOQqHxyMhw8+rv1dfj
 MPoMXOyQdOu9AXIS5YP5druj9jow/dQg3oFi43VksFZUYi7cTXFMvBJ8B6PC5XvTTn
 R07izys9tS6iQ==
Message-ID: <b473d03c-79d4-4c49-abe3-b41ff64982c3@kernel.org>
Date: Thu, 18 Sep 2025 10:15:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250916085243.4165099-1-chao@kernel.org>
 <aMrkjSRJ0yyEfvfl@google.com>
Content-Language: en-US
In-Reply-To: <aMrkjSRJ0yyEfvfl@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/18/25 00:40, Jaegeuk Kim wrote: > Do we need this? I
 think so, it can provide a way to dump more information to troubleshoot in
 which function we're trying to update w/ a zero-sized extent. Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz4Bs-0006Ok-9Y
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sanity check on ei.len in
 __update_extent_tree_range()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/18/25 00:40, Jaegeuk Kim wrote:
> Do we need this?

I think so, it can provide a way to dump more information to troubleshoot
in which function we're trying to update w/ a zero-sized extent.

Thanks,

> 
> On 09/16, Chao Yu wrote:
>> Add a sanity check in __update_extent_tree_range() to detect any
>> zero-sized extent update.
>>
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/extent_cache.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index 199c1e7a83ef..3070d1cb0676 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -664,6 +664,15 @@ static void __update_extent_tree_range(struct inode *inode,
>>  	if (!et)
>>  		return;
>>  
>> +	if (unlikely(len == 0)) {
>> +		f2fs_err_ratelimited(sbi, "%s: extent len is zero, type: %d, "
>> +			"extent [%u, %u, %u], age [%llu, %llu]",
>> +			__func__, type, tei->fofs, tei->blk, tei->len,
>> +			tei->age, tei->last_blocks);
>> +		f2fs_bug_on(sbi, 1);
>> +		return;
>> +	}
>> +
>>  	if (type == EX_READ)
>>  		trace_f2fs_update_read_extent_tree_range(inode, fofs, len,
>>  						tei->blk, 0);
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
