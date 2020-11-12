Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 980822B0137
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 09:30:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd80H-0006F2-0n; Thu, 12 Nov 2020 08:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hyeongseok@gmail.com>) id 1kd80F-0006Eu-LT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 08:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLFN/LATVHz0Otz4gum8L+XUbArBA5q5q9A2rFFljIc=; b=DgiDVBqaK7kmrqRiqG0GbqsuAn
 jvuaIvNf1dqtSP21cDWWFK+ks5/ue0pot4/MdyPWfOgZa2URYJMZCnlrE7JMGShPaz9J1IWKTHe2W
 FLL3UWt9/UNyA60JvXvZkOYClAISnC/lbvbpG4Z1BaUmJu3LuA/YhT4eBtTY4q4/RdNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLFN/LATVHz0Otz4gum8L+XUbArBA5q5q9A2rFFljIc=; b=LXpTYk9l/wlqsoKakdhjdTwY9L
 d9FDe5IWR+lxEFXWHD4XpdaOOzL0EaVb3GZadBdw5tDy4n9JCAPNOqENji0DunC9yroSdJ7evWC26
 NYvdanGXp6PtCcNH5TLzQyCMefs5qF1akdsvdS6aAHy+UH9dfdBHUxW0MTFsJzZeinEo=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kd809-000GgF-Il
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 08:30:47 +0000
Received: by mail-pl1-f195.google.com with SMTP id g11so2396735pll.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Nov 2020 00:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TLFN/LATVHz0Otz4gum8L+XUbArBA5q5q9A2rFFljIc=;
 b=oaquZcLqDAsF+rz7+8RuM46hMW+J4ezejO51YSSW+wSDYfj0ayzKCuWUuEMYy0Z7vI
 HCAdHB0rKQYHaaCitTqAWElzyqYOs9yCP3kG7X2wQYShEd4iUqP8J31Cg2wU7z2Wbc9V
 cZb9v6k4A7U4VrGzEiebCyFuYka+EFVRMRWWFNziFXXkP7zxCtAo4KHlQaav/fk4SyuI
 i0qDZn56JZ2rvoxYr/AUOVd1j6eAyVQ6+MU4chF8fkTV2068AT1DLmLiniMJzYzA8vBl
 JiMap8RqFLfCUG2+c8pbx6sxVDxu6JKuh2VZ9QjJ2AOBsSlsW62KMr0VTZUhrASMHmdM
 ui9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TLFN/LATVHz0Otz4gum8L+XUbArBA5q5q9A2rFFljIc=;
 b=lh48gMoRbU7DfXuDIBcFTbkvrk4OwxnoCRa4dQRlL/hocEoKs8CmEtqGh6sS2Qg7PN
 zT5DJregP27MeLGNqjDSzjKF/VYuT2vxOUoHZYKFMCHryCZkpCfSw8Mpcr/ft9npvOXH
 UZu7YbWYaV5b8j01p0z6/5xeflsI42LZ9chaFq1/yN9QoelQ3rIKMZcMj/tls0xRu2Ke
 FjMfLFlo+TgFPAPTCzC5Z1QrUEAyRIBZs5RsIBnNSoHYq21XP/b3Hr15BWImFUdh04ou
 jO1C+iKOPboI8XkDO5RsVDNzqNFLIU/Qzej6o7j1C7raTdTyCM6eFF7QNf7ue9C5IaiE
 AKXA==
X-Gm-Message-State: AOAM533Qv+UVOlps4Tw5rck2GesMl+rTVTGALEsV+UqSCggCoQ+w2a+e
 1IVLSy8rEytA8OAOhpC8LPw=
X-Google-Smtp-Source: ABdhPJzIvGCoCaoEpnMCFNMhuT6+gAIR5opIOPmp1IFU3GqBM+iWYWMqOcn1M3IZ4y9AQ6Us88i2tQ==
X-Received: by 2002:a17:902:a9c7:b029:d6:da66:253c with SMTP id
 b7-20020a170902a9c7b02900d6da66253cmr1550636plr.19.1605169835994; 
 Thu, 12 Nov 2020 00:30:35 -0800 (PST)
Received: from [192.168.0.12] ([125.186.151.199])
 by smtp.googlemail.com with ESMTPSA id n68sm5349463pfn.161.2020.11.12.00.30.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 00:30:35 -0800 (PST)
To: Eric Biggers <ebiggers@kernel.org>
References: <20201112080201.149359-1-hyeongseok@gmail.com>
 <X6zvndTKKQfISlcj@sol.localdomain>
From: hyeongseok <hyeongseok@gmail.com>
Message-ID: <41c4c6ac-ccde-1fb9-28bb-b22f8e1c34cb@gmail.com>
Date: Thu, 12 Nov 2020 17:30:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <X6zvndTKKQfISlcj@sol.localdomain>
Content-Language: ko-KR
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hyeongseok[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kd809-000GgF-Il
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix double free of unicode map
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
Cc: Daniel Rosenberg <drosen@google.com>, hyeongseok.kim@lge.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/12/20 5:17 PM, Eric Biggers wrote:
> On Thu, Nov 12, 2020 at 05:02:01PM +0900, Hyeongseok Kim wrote:
>> In case of retrying fill_super with skip_recovery,
>> s_encoding for casefold would not be loaded again even though it's
>> already been freed because it's not NULL.
>> Set NULL after free to prevent double freeing when unmount.
>>
>> Signed-off-by: Hyeongseok Kim <hyeongseok@gmail.com>
>> ---
>>   fs/f2fs/super.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 00eff2f51807..fef22e476c52 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -3918,6 +3918,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>   
>>   #ifdef CONFIG_UNICODE
>>   	utf8_unload(sb->s_encoding);
>> +	sb->s_encoding = NULL;
>>   #endif
>>   free_options:
>>   #ifdef CONFIG_QUOTA
>> -- 
> This is:
>
> Fixes: eca4873ee1b6 ("f2fs: Use generic casefolding support")
>
> Right?
>
> - Eric
>
Right. Should I add "Fixes" tag and send v2?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
