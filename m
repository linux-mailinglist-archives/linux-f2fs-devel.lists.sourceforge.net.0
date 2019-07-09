Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44B62FD6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2019 07:11:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkiPQ-0005ug-Vi; Tue, 09 Jul 2019 05:11:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hkiPQ-0005ua-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jul 2019 05:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3QY9wXch30Wmd8VQcryubmIZgUYWkxlkHyfkd5f+VQ=; b=XjaiAQqVKMxEYpvUB8N9lB1KK5
 /H4/lfceuXqQzKaFHNRPoKDiCVcCDNcGtuNc2w5rvotPlI+ltSHf8INnOCDhqnSuB3FJo+UAgNwav
 GZUhcvA7Cx4GYtYxrQlC/elwqM2emG1nWhzJLVGjkjGbLciLpU8++sH6uAZdji/CbOnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3QY9wXch30Wmd8VQcryubmIZgUYWkxlkHyfkd5f+VQ=; b=l1hwpp+Xqwncx4CrXvYHFGUut5
 NIGANhmubQjU2gdrVGNRcrk7s3UaMNi5jlC/4OkznBDCSGo8hy/XXugwtnUxyGtSpzyFYOsBMTHp1
 7xAQC6kqoozBuv9lC2mmew/DTWRLdbbN+B/6GOy4CR7oZPOmaXrlXhP/egpF61I24akQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkiPP-00CeBD-3v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jul 2019 05:11:20 +0000
Received: from [192.168.0.101] (unknown [49.65.245.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4164E2166E;
 Tue,  9 Jul 2019 05:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562649073;
 bh=9a0/TdkdAwOfuiX8hAnAaCfx0WMSxTnhXh1MNmLUKnM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0boYBNg1LeeIlzWKJ7/LVu975Uykz8MHdNdYWn59kwhOmWM8N2r/jV4lo4skyTe5j
 UWfH7+iCuKgAjD5lDk6X6Mp99bWvmiHHonzrfuy7dKDsWiJ+Psp4CogCPF8OiBwzUx
 aYl0n/8xlwMfDr5klGYA6scd1Ma1f4rMpxayz90g=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20190708062912.104815-1-yuchao0@huawei.com>
 <20190708234743.GC21769@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <2d0f938a-94d2-2c1c-9c80-aa7a1c0dd4bb@kernel.org>
Date: Tue, 9 Jul 2019 13:11:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190708234743.GC21769@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hkiPP-00CeBD-3v
Subject: Re: [f2fs-dev] [PATCH] f2fs: improve print log in
 f2fs_sanity_check_ckpt()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-9 7:47, Jaegeuk Kim wrote:
> On 07/08, Chao Yu wrote:
>> As Park Ju Hyung suggested:
>>
>> "I'd like to suggest to write down an actual version of f2fs-tools
>> here as we've seen older versions of fsck doing even more damage
>> and the users might not have the latest f2fs-tools installed."
>>
>> This patch give a more detailed info of how we fix such corruption
>> to user to avoid damageable repair with low version fsck.
>>
>> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/super.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 019422a0844c..3cd6c8d810f9 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2737,7 +2737,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>>  
>>  	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
>>  		le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
>> -		f2fs_warn(sbi, "layout of large_nat_bitmap is deprecated, run fsck to repair, chksum_offset: %u",
>> +		f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, "
>> +			  "please run fsck v1.13.0 or higher to repair, chksum_offset: %u",
> 
> How about adding the patch name as well?

For end-user, I think they don't care about commit id or patch title...

But anyway, let me send v2 as you suggested, either one is okay to me.

Thanks,

> 
>>  			  le32_to_cpu(ckpt->checksum_offset));
>>  		return 1;
>>  	}
>> -- 
>> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
