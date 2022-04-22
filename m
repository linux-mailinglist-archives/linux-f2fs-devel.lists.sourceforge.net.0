Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03D50BF1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 19:58:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhxYS-0000fe-I3; Fri, 22 Apr 2022 17:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dossche.niels@gmail.com>) id 1nhxYR-0000fY-B5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 17:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tm1pBPsN1m0qXb0Xmth/G+Tuxhb6bJH0XSb/YXjxOYw=; b=LEfhkvr57Yxmv64JGJWQT88ii0
 44uH0KkwEv/dPZBohPotkE1ZLGtaV76MIHCYsvoi5cpg7rpFDEs+78xQzqE1amqHB7poLQrWRrjgO
 q9p7UMRbOMnLgdKiRwfSqiwQKn/kQe3+GrXs80hGjK064vohhkDzA+LNxappTuphqJyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tm1pBPsN1m0qXb0Xmth/G+Tuxhb6bJH0XSb/YXjxOYw=; b=Xkp3rHnVHmgbhVEexTDBHmgJ2m
 j3fDYQgDkFWUcEa76xUg1oTvFKpunr9zedE3wKVhfRMHo0u4w0gXwUpXrS9zJ/8jlgICBcsgf18Q+
 4/qz/XDDoz/K9+tc6oEOqwOIDFQFEloCtLoZt8BFF8dPLjnewTcP8GTZee+16R2Z3AyA=;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhxYL-006kyI-BF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 17:58:49 +0000
Received: by mail-ej1-f41.google.com with SMTP id y10so17812845ejw.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Apr 2022 10:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tm1pBPsN1m0qXb0Xmth/G+Tuxhb6bJH0XSb/YXjxOYw=;
 b=K27S1k7yVMSGkC0N0FqlmbD0/CGOaV/VgqEnUZzwn2rzTjvov8Zi7fkO1JTAYf8B8g
 gc4202N0u3C3Pr6WL2F3CUGVFjLgMSqKJc/d8rUsi61g/16LY2b49H3D0OXk//XSRp3K
 LsPvL5Zmzypt/u97XhNQrMawhXrF+A2EtdMblFVq+LAMf6X1L3Ld1eO0whC9dBDy7Rp+
 4iTamNHdg2sLXSVzx82ugK++hfBK3OUTMBN1a8z7TDKY90LAvHX+APBGC6bWDay7fLKk
 M+v0Yhp5jXNjqCvTIyoJ+bArx1ar+vFgnHsc5kcUISwtqQ+H/DBHb4CTjouv+XXIvqiT
 xWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tm1pBPsN1m0qXb0Xmth/G+Tuxhb6bJH0XSb/YXjxOYw=;
 b=V2ucMlLXBOZ1sNuTF2N6iTawEirOxkMsMtwLoG56C8mla3qDswyB2hK4ok6QWTdPNC
 76RZI13OOaVP89ds7Z5eRxOn5wcpYTw/J5f/4ZNEfzNKgeRCiYlpeN6dgYqV2tO1iVHI
 4ooxmMUchJW/7X8ZTLYUqq0kSwfvha/GI/7zKqiO04vR3Wpp1z/BwR+4h/qtDP2Sxchu
 1VKr8McEDYF2KSBSrAO4QxPm08uzpSJ+Yo0G1atZxq/uIo7qPp+3io9G6dgC+M3pZnSr
 7G0Oq7TzNGcdktnc91GqW+5wvS7aBynYYRZ/8C1QGEcqZjbM9SYCHxJlKX+cFnB8zxEw
 5eXA==
X-Gm-Message-State: AOAM532gCdOvgJMtKZkGljqkQjvPLHmoCgpMhImxg/YSkALo1iI021sn
 5aISlmtdnYKTyvElNNq9sek=
X-Google-Smtp-Source: ABdhPJxyMAVIAVrcFmZ6RQa2n7oBF/iMsZJjOpkxxbRAmWlE+beMtNUhOHOUphmARY8mrSkMmVYN7A==
X-Received: by 2002:a17:907:6e19:b0:6f0:1e4c:b4d3 with SMTP id
 sd25-20020a1709076e1900b006f01e4cb4d3mr5302825ejc.583.1650650318628; 
 Fri, 22 Apr 2022 10:58:38 -0700 (PDT)
Received: from [192.168.0.59] (178-117-137-225.access.telenet.be.
 [178.117.137.225]) by smtp.gmail.com with ESMTPSA id
 lg4-20020a170906f88400b006e869103240sm954285ejb.131.2022.04.22.10.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 10:58:38 -0700 (PDT)
Message-ID: <79efa63b-25f8-f675-91ae-c5b109ee3f17@gmail.com>
Date: Fri, 22 Apr 2022 19:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220421210948.73198-1-dossche.niels@gmail.com>
 <YmLgrm72eU7ttjdY@google.com>
From: Niels Dossche <dossche.niels@gmail.com>
In-Reply-To: <YmLgrm72eU7ttjdY@google.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/22/22 19:06, Jaegeuk Kim wrote: > On 04/21,
 Niels Dossche
 wrote: >> The calculation for f_bfree performs a calculation involving >>
 current_reserved_blocks and total_valid_user_blocks. Both can b [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [dossche.niels[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nhxYL-006kyI-BF
Subject: Re: [f2fs-dev] [PATCH] f2fs: extend stat_lock to avoid potential
 race in statfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/22/22 19:06, Jaegeuk Kim wrote:
> On 04/21, Niels Dossche wrote:
>> The calculation for f_bfree performs a calculation involving
>> current_reserved_blocks and total_valid_user_blocks. Both can be
>> modified under stat_lock. As stat_lock is not used to read both these
>> values in statfs, this can lead to inconsistent results. Extend the
>> locking to prevent this issue.
>> Commit c9c8ed50d94c ("f2fs: fix to avoid potential race on sbi->unusable_block_count access/update")
>> already added the use of sbi->stat_lock in statfs in
>> order to make the calculation of multiple, different fields atomic so
>> that results are consistent. This is similar to that patch regarding the
>> change in statfs.
> 
> Is this enough? It seems we also need to cover sbi->user_block_count and
> sbi->total_node_count by stat_lock.

You're right, that seems to need locking for atomicity too. I'll send a v2.
Thanks!

> 
>>
>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>> ---
>>
>> Note:
>> I am currently working on a static analyser to detect missing locks
>> using type-based static analysis as my master's thesis
>> in order to obtain my master's degree.
>> If you would like to have more details, please let me know.
>> This was a reported case. I manually verified the report by looking
>> at the code, so that I do not send wrong information or patches.
>> After concluding that this seems to be a true positive, I created
>> this patch. This was compile-tested and runtime-tested on x86_64.
>> This issue was found on Linux v5.17.4.
>>
>>  fs/f2fs/super.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index ea939db18f88..ece768869187 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1739,10 +1739,12 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
>>  	buf->f_bsize = sbi->blocksize;
>>  
>>  	buf->f_blocks = total_count - start_count;
>> +
>> +	spin_lock(&sbi->stat_lock);
>> +
>>  	buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
>>  						sbi->current_reserved_blocks;
>>  
>> -	spin_lock(&sbi->stat_lock);
>>  	if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
>>  		buf->f_bfree = 0;
>>  	else
>> -- 
>> 2.35.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
