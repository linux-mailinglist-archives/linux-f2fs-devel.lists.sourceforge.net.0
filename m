Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F06DD5AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 10:34:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pm9SB-0005P1-Ew;
	Tue, 11 Apr 2023 08:34:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pm9SA-0005Ov-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHn9Eh6lalkW9vp9xVUsOmwR2nhtJNphD3AaGBeffUI=; b=cRrMhnVxidzFW3zS7VgICn1168
 90aWP+LQyzNbHoD5f+gnjclBZrsd+1Z2D304oSDAYNEDp1fhc9ITh7D9ONPSm5p1vJstj9GFANwdo
 VLEG9vfoUi8lMlM0l7Lo3kLsb7HBeKte9kcw+0W5Em9g7OzNc+13wp0V1/4PujgMqgYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IHn9Eh6lalkW9vp9xVUsOmwR2nhtJNphD3AaGBeffUI=; b=C5s7ezyCt6K0VHlbsLYUWmngxL
 3dTktwxtFNhyq8Ev3p79z60EJEf/Jku4FynDV88aND5O+OdjWb8K6S7CHSdC67zkEsHN6lN7Cln9N
 FpSJk80BgVzP0NPVF3LrTCEHOeC4yNFZ/ffEOiFga/NnSnkXrV4P88nB1x9soLGU2yy8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pm9SA-0002UA-Lo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 08:34:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4818E61DE1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Apr 2023 08:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86D2C433EF;
 Tue, 11 Apr 2023 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681202048;
 bh=vWRd0M+XDT89DUaEUaER2lgBgrSKrR9GWjWJ1XatS1w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=igmrbDkV7dy8imzW3rW9lvMJZtVqvlk/y2DUky4jxHWm1mbDe+Ddt/1OnbHeFEmbQ
 Eu1t4Do/9FznM383edvHbCxoRfcha8jKCVJitNm2ohnWBfwid0v2KbBDQwb7UQ2kJb
 x2PH9F8hSurDKwSdVvEBRc6fNJIshKUz+4MahxCZf6KqAL3uoyivcW306YXuw79V5K
 qu3KfhgqjldXU4+PvMxa5/i3sdM+kWUzoTnXYmsJA3l62zxN/va34plc9VImY+fCAM
 cz0csbXi0FXsra5Ku3vvmHRFY64L8lHYZ8vYieRWwIKmGh8t9J8O+MBNam81o9i4VX
 VoDZW0AlMC1fw==
Message-ID: <b05d7ce8-ef98-a7ef-9873-4403ec0858c1@kernel.org>
Date: Tue, 11 Apr 2023 16:34:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230410022418.1843178-1-chao@kernel.org>
 <ZDRWdJxP6QzcIU7G@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDRWdJxP6QzcIU7G@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/11 2:33, Jaegeuk Kim wrote: > On 04/10, Chao Yu
 wrote: >> We have maintain PagePrivate and page_private and page reference
 >> w/ {set,clear}_page_private_*, it doesn't need to call >> folio_ [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pm9SA-0002UA-Lo
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: remove folio_detach_private() in
 .invalidate_folio and .release_folio
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

On 2023/4/11 2:33, Jaegeuk Kim wrote:
> On 04/10, Chao Yu wrote:
>> We have maintain PagePrivate and page_private and page reference
>> w/ {set,clear}_page_private_*, it doesn't need to call
>> folio_detach_private() in the end of .invalidate_folio and
>> .release_folio, remove it and use f2fs_bug_on instead.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 4946df6dd253..8b179b4bdc03 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3737,7 +3737,8 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
>>   			inode->i_ino == F2FS_COMPRESS_INO(sbi))
>>   		clear_page_private_data(&folio->page);
>>   
>> -	folio_detach_private(folio);
>> +	f2fs_bug_on(sbi, PagePrivate(&folio->page));
>> +	f2fs_bug_on(sbi, page_private(&folio->page));
> 
> I think we can just check page_private() only.

Why? how about the case PagePrivate was set, but page_private was't? It must
be a bug as well?

Thanks,

> 
>>   }
>>   
>>   bool f2fs_release_folio(struct folio *folio, gfp_t wait)
>> @@ -3759,7 +3760,9 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
>>   	clear_page_private_reference(&folio->page);
>>   	clear_page_private_gcing(&folio->page);
>>   
>> -	folio_detach_private(folio);
>> +	f2fs_bug_on(sbi, PagePrivate(&folio->page));
>> +	f2fs_bug_on(sbi, page_private(&folio->page));
>> +
>>   	return true;
>>   }
>>   
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
