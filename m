Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 628653B98B1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 00:52:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz5Xe-00014W-BS; Thu, 01 Jul 2021 22:52:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lz5Xc-000141-6f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 22:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yxu04MJappAHeh8Mf8jouf5zPAI1RPYsr1ZAl/E8j9M=; b=E8kA0GMnC7pAK1bzV6Pr9kWJGA
 8umYOuUFUYlIJxWxUbawCnzJUpTVXPPdMABqusaF4t5PqCTQe3B+ZI1rtx5gE1Of0AH1D95EGJmNQ
 ECcwYMPmJxVvPbPhcSoSx3+hf56jo3Dpig2PWNMh475H4uq7m8/it5CZh98sOcugD67U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yxu04MJappAHeh8Mf8jouf5zPAI1RPYsr1ZAl/E8j9M=; b=VCSSsuQfxFSwsA4YMSY96vDmMZ
 yGC5ri5nt1vChNi7wWaAdCLl5F+R8s4U9SPBl1DD0wGrTmvVw6nP1Pv3m4EKWW2Bd/S1xLE4lUE9X
 n/yynnczs0m9g6unwKbAheWMtvGiT0XwL8NiArstjdsaOW+SyV4+EQy9Uo0hAK6kZb/0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz5XT-006chj-42
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 22:52:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 124E661154;
 Thu,  1 Jul 2021 22:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625179921;
 bh=AjeYj4JYmSsMFnV4khsdyiCBTTGKkmrJEyE7/OYhHWo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IiR9H+tq1o+OtLsgmN3V/9nnJOYFgT0Dvpr2DKvy26u3D00EY7oOQ1n1rZJ8DCU6L
 ZcfEi8sHmUZjKlEv4LixyCiP2Sb6/WKGzA94KgHg9zqyOttK+mglV4Gxef9Jb3SMxN
 T/Hq5dn/suClpfBBfr9V1lUQ802ZTQqlM2HS382WCRkxINd5ahvfl4OQkbXKoFzTIg
 0rAPCiydLRmCT5WnuMTCC7UuwlXWZ3g5BNsuJC9dAfyMw7oO76frmAYw8BprLpnCxB
 mdm2pW4c2cifTo4aG+5F5DybBZ6vf5UVmxoPExv7spLyYBJjJhk1hmeC2+Q8htDwW1
 81fY5g3biyHdQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Fengnan Chang <changfengnan@vivo.com>
References: <20210628130550.39696-1-changfengnan@vivo.com>
 <YN31AyWCu4QhSCaa@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <47b9737f-b0e0-8483-773e-646a8cf3e2ec@kernel.org>
Date: Fri, 2 Jul 2021 06:52:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN31AyWCu4QhSCaa@google.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lz5XT-006chj-42
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: allow write compress
 released file after truncate to zero
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

On 2021/7/2 1:01, Jaegeuk Kim wrote:
> On 06/28, Fengnan Chang wrote:
>> We should allow write compress released file after truncate to zero.
>>
>> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
>> ---
>>   fs/f2fs/file.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6afd4562335f..b91ae8f751c5 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -730,9 +730,13 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>>   	 * for compressed file, only support cluster size
>>   	 * aligned truncation.
>>   	 */
>> -	if (f2fs_compressed_file(inode))
>> +	if (f2fs_compressed_file(inode)) {
>>   		free_from = round_up(from,
>>   				F2FS_I(inode)->i_cluster_size << PAGE_SHIFT);
>> +		if (!free_from)
>> +			clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> 
> We can do after truncating all the blocks successfully?

Agreed, but please document this behavior as well.

Thanks,

> 
>> +	}
>> +
>>   #endif
>>   
>>   	err = f2fs_do_truncate_blocks(inode, free_from, lock);
>> -- 
>> 2.29.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
