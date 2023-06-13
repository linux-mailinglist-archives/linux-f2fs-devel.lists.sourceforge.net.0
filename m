Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EED872D6BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 03:12:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8sZl-0003HG-68;
	Tue, 13 Jun 2023 01:12:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8sZh-0003H1-6x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xy0ctBYJTtXwOrmtcxv7XPW9TjPXVHbSRDwGtuj31GY=; b=f28ctExCRflvkCuQtogD+ZwLRE
 WzjkogI17XXZ9u8/b4LDzOtxDXyBLj61cpz517QL0A97DNzJiVbqhmRZnVBPbz0M2hRic71jcsbeX
 w8rIrFgvjMep4asQYgviZj5/6RKaDIxeG9Y3dK/qiKIOOXRatmkDpS8flaNy2CM6ZE6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xy0ctBYJTtXwOrmtcxv7XPW9TjPXVHbSRDwGtuj31GY=; b=kGUvRoEVI1Bo1MnW5TMc167k6J
 SHeYoG1nlv5rN14Oj1JF3os8JZlwrPccwnFsC/ql5uViDr5Yh/uGTxISxmcqMMQM2Vi7cP/BuPKZx
 8XQlUu2CTppr/EDtD3KzdlYoywQqDTiFXSzI1v96GDSykEGsfrR+KeovAFRhziZ6g3BI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8sZZ-0006z5-Gt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2286462B57
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jun 2023 01:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C74C433EF;
 Tue, 13 Jun 2023 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686618703;
 bh=/QyNTNkR1g5xPACODqWCX3YvTN7GVZ+c9Rjb8u5R1EE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=Ev7DlpHHbCu0TXYdYiE5Au8/olQgVOP/YhEef6N8Sj5uOzYefzwc5znBfS5O7UXCh
 YGV5GHDuNjmkbBw8jLRnEpRZbZdATD6tJ2pcf/0rDgLG9lBkY4CKYvBLXOxvgomYAE
 o7l5tordexCtCheRWVzexef1GufnWA2dwy5JZPUBlz+oOclJgIN+E9WnuUtmjQnnbF
 UHYJRiHpscM72Kt4KBhjAVPsoTdm396kphmFJ0Dr2zBaCvBNB5qFNU/2HIpz1wM5FM
 eluvMh2/Ax9H4+F/uJsm+6/C+Ko2MTSOOIPIQNcVCjGk7fAElz8iOmit7jBDUPpgNm
 FeJeFXRhO6XBw==
Message-ID: <cdeb92fd-11c1-2e3d-662d-08022dfe7e7f@kernel.org>
Date: Tue, 13 Jun 2023 09:11:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
 <7af0f599-2314-56af-2813-5e63754134e1@kernel.org>
 <ZIc7ek4UWwjB41a5@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZIc7ek4UWwjB41a5@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/12 23:36, Jaegeuk Kim wrote: > On 06/12, Chao Yu
 wrote: >> On 2023/6/7 4:36, Jaegeuk Kim wrote: >>> Let's compress tmp files
 for the given extension list. >> >> Could you please check below [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8sZZ-0006z5-Gt
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress tmp files given extension
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

On 2023/6/12 23:36, Jaegeuk Kim wrote:
> On 06/12, Chao Yu wrote:
>> On 2023/6/7 4:36, Jaegeuk Kim wrote:
>>> Let's compress tmp files for the given extension list.
>>
>> Could you please check below commit? IIRC, it was introduce to avoid compressing
>> file which has unpredictable tmp file, e.g. foo.sox.
>>
>> Could you please describe the case you encounter?
> 
> I don't know what I need to describe more tho, looking at how to compress

Oh, I just like to know which case you want to cover: foo.so.tmp or foo.sotmp.

> abc.so.tmp and abc.so, given compress_extension=so.

Copied.

> 
> So, your concern is somehow abc.soa? If so, we need to fix is_extension_exist.

Yes, is_extension_exist(, true) accepts optional '.' while parsing file extension.

[filename + '.' + extension + (optional: '.' + temp extension)]

It is used to support parsing common prefix for cold file's extension, we can add
a parameter for is_extension_exist() to disable prefix parsing for compress file
extension?

const char *media_ext_lists[] = {
	/* common prefix */
	"mp", // Covers mp3, mp4, mpeg, mpg
	"wm", // Covers wma, wmb, wmv
	"og", // Covers oga, ogg, ogm, ogv
	"jp", // Covers jpg, jpeg, jp2
...
}

Thanks,

> Will check what's going on here.
> 
>>
>> commit 4a67d9b07ac8dce7f1034e0d887f2f4ee00fe118
>> Author: Chao Yu <chao@kernel.org>
>> Date:   Tue May 18 17:54:58 2021 +0800
>>
>>      f2fs: compress: fix to disallow temp extension
>>
>>      This patch restricts to configure compress extension as format of:
>>
>>       [filename + '.' + extension]
>>
>>      rather than:
>>
>>       [filename + '.' + extension + (optional: '.' + temp extension)]
>>
>>      in order to avoid to enable compression incorrectly:
>>
>>      1. compress_extension=so
>>      2. touch file.soa
>>      3. touch file.so.tmp
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/namei.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>> index 3e35eb7dbb8f..cdc94c8e60f7 100644
>>> --- a/fs/f2fs/namei.c
>>> +++ b/fs/f2fs/namei.c
>>> @@ -161,7 +161,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>>>    	/* Compress wanting extension. */
>>>    	for (i = 0; i < ext_cnt; i++) {
>>> -		if (is_extension_exist(name, ext[i], false)) {
>>> +		if (is_extension_exist(name, ext[i], true)) {
>>>    			set_compress_context(inode);
>>>    			return;
>>>    		}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
