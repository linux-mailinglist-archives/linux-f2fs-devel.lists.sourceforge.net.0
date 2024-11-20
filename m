Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992C9D3E0F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Nov 2024 15:53:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDm4e-0007U1-UZ;
	Wed, 20 Nov 2024 14:52:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tDm4b-0007Tv-SZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 14:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1qL9st3Em/o0uzp1J/08ioRXilfsvjPzqscn6722CoY=; b=Btft3XL7SOoxXo9JWgVBwVNQsn
 hRW5UOQ89zCJg1Pm1/UE9c0TBxboo1iuU6eGAFU50pQl0g43Dcayah1IF/Bra3fyXWCQS3G1AUxoD
 rhnNiIRJIqryXft/YxAuvL1TSG8cpH3HKUW33Ktn9Ii8UccTVSzJlf5wMVzz7T2XS/NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1qL9st3Em/o0uzp1J/08ioRXilfsvjPzqscn6722CoY=; b=VDmcZlTgNLWyEvklHDTPwym96s
 p6GiOZhZ+wRp4/RsMLFzY8CN1LG2W+PMPndCq5rd5QZCdRxlE7cd18fEe117CrZ0KLgCVxvd8m9XQ
 YSPaQ40DR9gGZ7XEiGNupxuZtaQxiJ0lalarlrSTl29BNPcTMEIVsi508lIA9rrySndw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDm4b-0003xS-08 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Nov 2024 14:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732114361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qL9st3Em/o0uzp1J/08ioRXilfsvjPzqscn6722CoY=;
 b=Nd7FAWhoSdfxukCKpt/Im91o5C9gDRq1PH6nVifepkqeqstMLb5TvjPSvy+MXR+erph48H
 AtBO3FmOSBzyk+0qntcBhjiSEj4SpmNIKaMjbyUmol1xY8DQx4I4dYPVIHNH6UuO/c4Q0n
 7PGrPrxdpHURfctNUY1OxWR9WIf7vck=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-hhEbFGEgOfiCz6xGndj_VQ-1; Wed, 20 Nov 2024 09:52:40 -0500
X-MC-Unique: hhEbFGEgOfiCz6xGndj_VQ-1
X-Mimecast-MFC-AGG-ID: hhEbFGEgOfiCz6xGndj_VQ
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a7191aa79cso60748805ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Nov 2024 06:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732114359; x=1732719159;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qL9st3Em/o0uzp1J/08ioRXilfsvjPzqscn6722CoY=;
 b=jU46KhbsnV8XsIZMrkYNO57VVeannOXYhpt4qYX2d5HYRicfMmju69sqVl3h5VABLA
 8xGPrxk4gMR4ulYLMRgDEx3n0RoY2rPd+4qeEn56z/cbEg66o74XzyoCDhFcdIaDOpEo
 8gfzkXVL69nhwgePWyOhpl53/sddqRa4z/uiHu/4shET4lcO35ZV2bBsN/rywv5/+Hne
 GErfW+nVRDDWs2Pr8gFAEnO17mNxgV4BERCoYtOn9xgXXrOIGFfqOT08oPnb29/NbRVC
 57vZcseTmeTAaLTFgfVtCwNF0hhgsRq6E+Ugq7+oZ+VL+v7VgEaPvJX6+bKMsYxCbK/D
 5B/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNvAZZW1Syo5fIpHQbsGjQ+GWqFV7cLlvFBS5zVbEbGBThRcJZaZLLcbzonCOcdk6aSpgTWsTVzW4cRbWE1h6j@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8w+PnTc6FFB7lmhbVNnv5h18nMzdcfV06NW7OuVr230KwDOSH
 0xWKnqEaDt2xMrKDzoYofIF/2/aRWJy3ReOuc8ITi5SuAc23bwYR/5IaIw6fxrdNXBhcCRzxEAr
 6IwKnYnLvhHDwfOSUF0clRYt+F4KlQED1hLmyD4aCW0E8pAmkN3ow+4Q34buHgrZpCi4QMfI5mA
 E=
X-Received: by 2002:a05:6e02:440f:10b0:3a7:8720:9e9e with SMTP id
 e9e14a558f8ab-3a78720a046mr19299895ab.2.1732114359659; 
 Wed, 20 Nov 2024 06:52:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ52VRVgCzVkuEffiZjEVIizQx6hR1OkKvnv5NNB3HlM4DVmBCxX8KF+jG65WNFTUnYVAQbQ==
X-Received: by 2002:a05:6e02:440f:10b0:3a7:8720:9e9e with SMTP id
 e9e14a558f8ab-3a78720a046mr19299725ab.2.1732114359385; 
 Wed, 20 Nov 2024 06:52:39 -0800 (PST)
Received: from [10.0.0.71] ([65.128.99.169]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a748134d0csm32051885ab.73.2024.11.20.06.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 06:52:39 -0800 (PST)
Message-ID: <ee341ea4-904c-4885-bf8d-8111f9e416b5@redhat.com>
Date: Wed, 20 Nov 2024 08:52:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Eric Sandeen <sandeen@redhat.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20241112010820.2788822-1-jaegeuk@kernel.org>
 <ZzPLELITeOeBsYdi@google.com>
 <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
In-Reply-To: <493ce255-efcd-48af-ad7f-6e421cc04f1c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KU-UykWhGf8Fc_SGx1H30U5QU2pVIFmzP65GmbmmcJ4_1732114360
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/20/24 8:27 AM, Eric Sandeen wrote: > On 11/12/24 3:39
 PM, Jaegeuk Kim wrote: >> Hi Eric, >> >> Could you please check this revert
 as it breaks the mount()? >> It seems F2FS needs to implement ne [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDm4b-0003xS-08
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove unreachable lazytime
 mount option parsing"
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/20/24 8:27 AM, Eric Sandeen wrote:
> On 11/12/24 3:39 PM, Jaegeuk Kim wrote:
>> Hi Eric,
>>
>> Could you please check this revert as it breaks the mount()?
>> It seems F2FS needs to implement new mount support.
>>
>> Thanks,
> 
> I'm sorry, I missed this email. I will look into it more today.

Ok, I see that I had not considered a direct mount call passing
the lazytime option strings. :(

Using mount(8), "lazytime" is never passed as an option all the way to f2fs,
nor is "nolazytime" -

# mount -o loop,nolazytime f2fsfile.img mnt
# mount | grep lazytime
/root/f2fs-test/f2fsfile.img on /root/f2fs-test/mnt type f2fs (rw,relatime,lazytime,seclabel,background_gc=on,nogc_merge,discard,discard_unit=block,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,memory=normal,errors=continue)

(note that lazytime is still set despite -o nolazytime)

when mount(8) is using the new mount API, it does do fsconfig for (no)lazytime:

fsconfig(3, FSCONFIG_SET_FLAG, "nolazytime", NULL, 0) = 0

but that is consumed by the VFS and never sent into f2fs for parsing.

And because default_options() does:

sbi->sb->s_flags |= SB_LAZYTIME;

by default, it overrides the "nolazytime" that the vfs had previously handled.

I'm fairly sure that when mount(8) was using the old mount API (long ago) it also
did not send in the lazytime option string - it sent it as a flag instead.

However - a direct call to mount(2) /will/ pass those options all the way
to f2fs, and parse_options() does need to handle them there or it will be rejected
as an invalid option.

(Note that f2fs is the only filesystem that attempts to handle lazytime within
the filesystem itself):

[linux]# grep -r \"lazytime\" fs/*/
fs/f2fs/super.c:	{Opt_lazytime, "lazytime"},
[linux]#

I'm not entirely sure how to untangle all this, but regressions are not acceptable,
so please revert my commit for now.

Thanks,
-Eric


> As for f2fs new mount API support, I have been struggling with it for a
> long time, f2fs has been uniquely complex. The assumption that the superblock
> and on-disk features are known at option parsing time makes it much more
> difficult than most other filesystems.
> 
> But if there's a problem/regression with this commit, I have no objection to
> reverting the commit for now, and I'm sorry for the error.
> 
> -Eric
> 
>> On 11/12, Jaegeuk Kim wrote:
>>> This reverts commit 54f43a10fa257ad4af02a1d157fefef6ebcfa7dc.
>>>
>>> The above commit broke the lazytime mount, given
>>>
>>> mount("/dev/vdb", "/mnt/test", "f2fs", 0, "lazytime");
>>>
>>> CC: stable@vger.kernel.org # 6.11+
>>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fs/f2fs/super.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 49519439b770..35c4394e4fc6 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -150,6 +150,8 @@ enum {
>>>  	Opt_mode,
>>>  	Opt_fault_injection,
>>>  	Opt_fault_type,
>>> +	Opt_lazytime,
>>> +	Opt_nolazytime,
>>>  	Opt_quota,
>>>  	Opt_noquota,
>>>  	Opt_usrquota,
>>> @@ -226,6 +228,8 @@ static match_table_t f2fs_tokens = {
>>>  	{Opt_mode, "mode=%s"},
>>>  	{Opt_fault_injection, "fault_injection=%u"},
>>>  	{Opt_fault_type, "fault_type=%u"},
>>> +	{Opt_lazytime, "lazytime"},
>>> +	{Opt_nolazytime, "nolazytime"},
>>>  	{Opt_quota, "quota"},
>>>  	{Opt_noquota, "noquota"},
>>>  	{Opt_usrquota, "usrquota"},
>>> @@ -922,6 +926,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>>  			f2fs_info(sbi, "fault_type options not supported");
>>>  			break;
>>>  #endif
>>> +		case Opt_lazytime:
>>> +			sb->s_flags |= SB_LAZYTIME;
>>> +			break;
>>> +		case Opt_nolazytime:
>>> +			sb->s_flags &= ~SB_LAZYTIME;
>>> +			break;
>>>  #ifdef CONFIG_QUOTA
>>>  		case Opt_quota:
>>>  		case Opt_usrquota:
>>> -- 
>>> 2.47.0.277.g8800431eea-goog
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
