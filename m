Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85618649EF4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 13:38:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4i58-0002Gg-BZ;
	Mon, 12 Dec 2022 12:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4i57-0002GU-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 12:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LEWp755Os4/0qi4b30VgoFWsVz2LwWPN7YmA0/U0gi0=; b=jFRC8olFKENr8+NywVI1zOeBM1
 iWvYnYz++3cgJ0ap2ThjqjQ/Dw1h2EMpbFON0UoQAse6GJ/EshGLfdxfA4/S0cmftUjJVqNJumYr0
 +VW0eLI4sfB2DcuXetSlQMmmGuNBHC3Qpu4Uj4FFXgn9xEy4danOvg1SIaP1Cs9exjDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LEWp755Os4/0qi4b30VgoFWsVz2LwWPN7YmA0/U0gi0=; b=M4RKiVWZLMVsa1oaDJp/CnBEa+
 /CZl4GeTgu32O7XbFDXnYsmVb+HOUHND/idsV8EBZexOsR9BN1tNhCn7dhdqivlZn1KTbiIhTYH3X
 1oLgFmHkYh04icSeT8iEdH/YbyhgglQCaD+F1yBhrZhceE9/mVBhWCnAzwAX7QPSOpcE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4i52-00Ekgz-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 12:38:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A01A0B80D0C;
 Mon, 12 Dec 2022 12:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10685C433EF;
 Mon, 12 Dec 2022 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670848721;
 bh=hVzoOsyhwS9evjgtcwkNyUUi5Ga7nvRZ83iWkuubvr4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cjliJuA9RtYf4AvLwNw9qsB8Sbzrx1Q/eDqyJh6qUnVpcBn7rdf5w5kcTBmuRxuzm
 rOf5nlY6Ef8Vr5GioJ2JHqPtqqIrmq+AfB27xAlgol1eNXN6V1m2a5rthDAy5Y4rMo
 p0fXPN7YxcJXzD43KIKFbT6j44whIaU49Etn7pV8f6GkA9thkFkEcMb/j7/6mvcA3W
 6XrzXDjgDNUgAPkYC2t5l9gzTuNhDtwzqp1rpthxhv3ntc/Yc56YvzJ7fZAkydDToA
 /mQAtXLI9KFRxVjI+choL4MrXDulpbzwfC55uGai9jHpXlLNj5WzWPOvid67Ae94/j
 130NHknOVWE4A==
Message-ID: <f1aba391-e694-714e-18d8-116e8db9345d@kernel.org>
Date: Mon, 12 Dec 2022 20:38:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, zhoudan8 <zhuqiandann@gmail.com>
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y5OYYJYx9G2LbRmc@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/10 4:19, Jaegeuk Kim wrote: > On 12/08, zhoudan8
 wrote: >> In compress_mode=user, f2fs_release_compress_blocks() >> does not
 verify whether it has been compressed and >> sets FI_COMPRESS_RE [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4i52-00Ekgz-Tx
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file
 is not compressed
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
Cc: zhoudan8 <zhoudan8@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/10 4:19, Jaegeuk Kim wrote:
> On 12/08, zhoudan8 wrote:
>> In compress_mode=user, f2fs_release_compress_blocks()
>>   does not verify whether it has been compressed and
>>   sets FI_COMPRESS_RELEASED directly. which will lead to
>> return -EINVAL after calling compress.
>> To fix it,let's do not set FI_COMPRESS_RELEASED if file
>> is not compressed.
> 
> Do you mean you want to avoid EINVAL on a file having FI_COMPRESS_RELEASED
> with zero i_compr_blokcs?
> 
> I think the current logic is giving the error on a released file already.

IMO, if i_compr_blocks is zero, it's better to return -EINVAL in
f2fs_release_compress_blocks(), as there will be no benefit after the conversion.

Thanks,

> 
>>
>> Signed-off-by: zhoudan8 <zhoudan8@xiaomi.com>
>> ---
>>   fs/f2fs/file.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 82cda1258227..f32910077df6 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3451,14 +3451,13 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>>   	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>>   	if (ret)
>>   		goto out;
>> -
>> -	set_inode_flag(inode, FI_COMPRESS_RELEASED);
>>   	inode->i_ctime = current_time(inode);
>>   	f2fs_mark_inode_dirty_sync(inode, true);
>>   
>>   	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
>>   		goto out;
>>   
>> +	set_inode_flag(inode, FI_COMPRESS_RELEASED);
>>   	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>   	filemap_invalidate_lock(inode->i_mapping);
>>   
>> -- 
>> 2.38.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
