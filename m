Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771486D076
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:23:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfk7k-0006pz-GB;
	Thu, 29 Feb 2024 17:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <colin.i.king@gmail.com>) id 1rfk7j-0006pt-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OklTFrhYXGCqleMpBHtH1y+bu7HTN31ZIOzM6nBjKdg=; b=T7LHxotg0Hq3oVbMVI5EOclnq1
 rlb93OU+/w9H5YXb1zyxCvu0hn9AFq4knGtyq5h3eO6KmE7lleD4B/9pSYWx8rRX9dRpf/CwLjNE1
 cdpblGAkeO/hybiOZuYknKH3tTBIVtxOhh3vqjUAEm52VcP4xV3oERacfiSUt2JPN358=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OklTFrhYXGCqleMpBHtH1y+bu7HTN31ZIOzM6nBjKdg=; b=YvSgu0Bi6MVDrkv0SNnK2vYP3U
 vIUW7iXteg2HLTONwMoW47cDUsgackOXifGC0oBVuQZAoqcWN6ldlmCcuzKKP9sSpRFcEmG+ZS5fp
 oRue81gD6b8BlfP6KE95hlmWN8qkpla48DvMQUhYEzZxMRQtcP8Wzd55ySIYiCwyd+3g=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfk7f-000194-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:23:11 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso712857f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709227375; x=1709832175; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OklTFrhYXGCqleMpBHtH1y+bu7HTN31ZIOzM6nBjKdg=;
 b=cg64EgB+k9r/2djgjWu+OaHnh/+5EjPoFz5PKix1vy+SczvBkscHjwRlh8thphs2Y8
 k8ZzFbc5SRTuT8t7s8edf0QzzKyBZ8jRmTlERWD3ZBd8DLcfrLt1+gRxt8O7RitoL+tO
 Zn2mZenekx76yFq29FeKMM+Wu1G7j12gsBQ1BronleQ3OhG2d8PQb5e+fPFZLpxQZZg/
 LmKz3C1QRONAwsZPaynsSiaSQ7oRWMmNE+XpD4JvGCnYnFheu6ROs7F+KrAkM5THM4kM
 Wm0nhA5nSv8SdoKCua+g+3YEpqRJIayc3GuCCqsgY37a40hc82w5yYrpiqLq3dLWpQuu
 NqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709227375; x=1709832175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OklTFrhYXGCqleMpBHtH1y+bu7HTN31ZIOzM6nBjKdg=;
 b=IqvL9zMWaVXrwEctnO5TaEcsymw6enadp2bk5wr+DL/v1snQBr1vUD2DyOtHgYjX3x
 cddG51rCO5hZdowCY9GSHaJqU5Ya5+2/qTAcnjdLUjLefAC3yKvvt37ZQYGNTB8qhqAt
 7EYjQwJ/aNlbNKUkkfj5JJPiM4909wMVSCtWh6htRfB+HQjGzbG44On0af15R4m6CRpM
 0ctoXaI5/upceHaDoK0DIs092Oknxf/KgWFL7uh9iRXaQHkKfw2BzlScLZpIjPBL4YcM
 5mQ5B3srddkUNmslAulZ/ZAMO3Utwkqabl4BW7RZ9ZJmg3f0E1KklvMIAyll7nKF/vJI
 IQ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVflMA450FW9DE6+hIsCTI8M/55JXP9r5QERbMa6eHsYpnmqCqdenXcTX24dSii6Tv9V8mFCMPcc7FPhatpPYkPYOSXIeTjRdV+ZwMuZ+ZtVgtXoK6XxA==
X-Gm-Message-State: AOJu0Yx9iZEj9WqRndc2mSJL+SLizZEA51nmLeqL+vKQo9JbWJDBapb8
 wjV2bBa86Usxowf7tiudEqMALddmE9JGJeoyQUjrCanbrF6iCHJyLH6Hsr2w56A=
X-Google-Smtp-Source: AGHT+IHWTt6rjRxOqBV5Im6+I/dsQJ6kYbTSypm3wfepuXBXRGFF9dZ2SpnW45gfNfDja78qG5JKHQ==
X-Received: by 2002:a05:6000:1e81:b0:33d:284a:401 with SMTP id
 dd1-20020a0560001e8100b0033d284a0401mr1674096wrb.68.1709227375232; 
 Thu, 29 Feb 2024 09:22:55 -0800 (PST)
Received: from [192.168.0.101]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 bw1-20020a0560001f8100b0033db0c866f7sm2318693wrb.11.2024.02.29.09.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 09:22:54 -0800 (PST)
Message-ID: <5e705d83-871e-4403-a77f-ec197eefb7c4@gmail.com>
Date: Thu, 29 Feb 2024 17:22:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240229091449.105032-1-colin.i.king@gmail.com>
 <ZeC64dDr-nBGlsli@google.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <ZeC64dDr-nBGlsli@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29/02/2024 17:12, Jaegeuk Kim wrote: > Hi Colin, > > Thank
 you for the fix. If you don't mind,
 can I integrate this fix > into the original
 patch? Sure. No problem. Colin > > Thanks, > > On 02/29, Colin Ian King wrote:
 >> The array f2fs_zone_status contains two spelling mistakes in >> literal
 strings. Fix them. >> >> Signed-off-by: Colin Ian King >> --- >> fs/f [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [colin.i.king[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfk7f-000194-W3
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Fix two spelling mistakes in
 f2fs_zone_status array
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 29/02/2024 17:12, Jaegeuk Kim wrote:
> Hi Colin,
> 
> Thank you for the fix. If you don't mind, can I integrate this fix
> into the original patch?

Sure. No problem.

Colin
> 
> Thanks,
> 
> On 02/29, Colin Ian King wrote:
>> The array f2fs_zone_status contains two spelling mistakes in
>> literal strings. Fix them.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   fs/f2fs/segment.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index bdb27e4a604b..072c4355d3d3 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4921,8 +4921,8 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>>   const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
>>   	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
>>   	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
>> -	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
>> -	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
>> +	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICIT_OPEN",
>> +	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICIT_OPEN",
>>   	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
>>   	[BLK_ZONE_COND_READONLY]	= "READONLY",
>>   	[BLK_ZONE_COND_FULL]		= "FULL",
>> -- 
>> 2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
