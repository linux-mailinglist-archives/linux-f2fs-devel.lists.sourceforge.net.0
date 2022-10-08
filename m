Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB35F84E2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Oct 2022 13:09:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oh7he-0000GU-4H;
	Sat, 08 Oct 2022 11:09:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oh7hb-0000GJ-D9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Oct 2022 11:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2h4Slq4uIuDyItKPVVyFvpHl01UQ0MSHolyWeb7u824=; b=AB9n1gyGmVwM7qW8JVGYnYUk3v
 QfmTkCavugP3XdHEb0g1AQA+KnqonUtrYCRZbPkVfFmwj3JoRTBt7EJFPm35B57IXl6FSyfQ6i/YA
 76qD/4NAR1vuYnoxE6rEg5QgeuxzumhkrBMbSY3/wECk9Lnbe8yPjasFdEazOhmIG9OE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2h4Slq4uIuDyItKPVVyFvpHl01UQ0MSHolyWeb7u824=; b=dA7OxpLI1u1VAZ4n5DMzQwpE+x
 ug9HT9cBGKGqRmP4Gy8IVIUpEy1bKSxJjxLQBRYfZcDLBC0MXtouuWqgcYDTav07Dkj86aZ7qoyX4
 3B0MbmCHlXjmjTBTvWF6Jgv0y1gtkJOb0IY9ueSIoOmly4hDFQ/G59hXIP9/mT7CE108=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oh7ha-0002yf-LU for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Oct 2022 11:09:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29A32B8070D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  8 Oct 2022 11:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCC5C433D6;
 Sat,  8 Oct 2022 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665227335;
 bh=dh/fo2iw1/H0NUTRsbJLhIHN44MSGBSSWcZtREgATcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Acow74ggaXp3xm5nekh5GFQPItkbgaQiVP0hqgoUOzDYaZc8s+MAoD5Om9Bn+Qce5
 hjftUC3IcomOIKX8ua8wTMgqGKyBbpLng8XWI/UnN2wEnlAQNI7o4IIPmyctgpjB6I
 R8LgENjmsUp2g91sad/K6rP6QsE3vMLcZjJ73ZXUNvYhCj0s2X9eY308qXK9llg3Y5
 k1383UcCI9GYkCnYvRQkd2jtYyk+HfW4lhPrsgF7fkcQlbjF5p4Zee820oq5btdPVz
 mpy9pll3tAwZJh1Y3k/oNxGlLG6UaHj460xHIP5pReW5zBMIdjIN1PexaWU7bvSCM5
 ar25TZbJuT66w==
Message-ID: <6d45ea3a-5a71-b760-b60d-9e3e7dda3be4@kernel.org>
Date: Sat, 8 Oct 2022 19:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221006151428.57561-1-chao@kernel.org>
 <Y0CDoWiaGKHkmnzQ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y0CDoWiaGKHkmnzQ@google.com>
X-Spam-Score: -8.8 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/8 3:53,
 Jaegeuk Kim wrote: > Merged into the original
 patch. Thanks, so it looks it's not too later to update commit id of original
 patch since it's close to the end of merge window. Thanks, 
 Content analysis details:   (-8.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -3.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oh7ha-0002yf-LU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix compile warning
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/8 3:53, Jaegeuk Kim wrote:
> Merged into the original patch.

Thanks, so it looks it's not too later to update commit id of original
patch since it's close to the end of merge window.

Thanks,

> 
> On 10/06, Chao Yu wrote:
>> fs/f2fs/super.c:3886:6: warning: no previous prototype for 'f2fs_record_stop_reason' [-Wmissing-prototypes]
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/super.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index fad333881ea2..2908d41ed462 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -3884,7 +3884,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
>>   	spin_unlock(&sbi->error_lock);
>>   }
>>   
>> -void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>> +static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>>   {
>>   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>>   	int err;
>> -- 
>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
