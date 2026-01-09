Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF720D06C1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 02:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpzkH/MndsTIQ05G++H1ecUwBfabxUmjGy6Ij6B8LpM=; b=UW+n+QkslEhAHHiWVNxDx6yM4s
	2pmn3amcF1e3GPZuQKZz/UguFhFOYNVINpCimesC+Xhjc1wkZRh5+htsVEjIfcWxoEyAksJdjBjuE
	TaoMfPxWB6lc3D5kqtPCgxlvQJQlIsfeNMFQ0nCKypRvWc4U8ne3ggjbavGC0/PhefQg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve1Rt-0006Yt-Uf;
	Fri, 09 Jan 2026 01:37:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ve1Rs-0006Yj-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 01:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ij8ic8o8hevYyQsTxgJy+oOb1ndVmlB8ZkySV01f9A8=; b=Y2d5RYGmwjOdxjycw+VXblEqtu
 T49XVxsoMerypE5bCAp+yZB/Pfj/8L2V+P3jIAoLhS6qAcDouhc/u90qLXAHpHU1f//PQjH83vTo+
 uH/5uXmHuN7xl59xPuS5An9DCOKOB+zZ5dvfcM5k6h8uw50CYoi2QhMjxe8dKs4GLtHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ij8ic8o8hevYyQsTxgJy+oOb1ndVmlB8ZkySV01f9A8=; b=d0TghqjuHbK7xfQPBsdkfDAe8K
 nuu+8tN2astMTDKwTBT3DgW9QEWXd2Ke4q6Y14Xd+T/XDcvXl6J/owQAQwwIUu419Tvnl2fo9JxFh
 26UBtSjQ/n0/e/TPLwcdlc4VTKaPsCPoR8TcNHO4MVgTIEMeQs39y/UHHR2vigVFJ4QE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve1Rr-0003hB-NO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 01:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 17C416014F;
 Fri,  9 Jan 2026 01:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20BEC116C6;
 Fri,  9 Jan 2026 01:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767922664;
 bh=E2uqEyReXn4MFKwBBuEVOyfnljmoHCoIVlZsKSbf5C8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=c2M8sMpC4EdQmE3WHa53+HDOlFTAtxwfX8mAJR5LFNYJX/Ag0w06eSG8auUsw7DTe
 OezVxeiVGoIl7BCIPgWe4/lxpb4IUInx3cy08rEZTz2ea9hb2qDooAFmh+LAV2tNTN
 KMW3q+vA32siCLodQSkIrNPOoFJjKTPnWlGm8UbxCvnCW74dWU8PnvUtYeqLNR3j8A
 R3Gc5Pxpn5gxQFweYj7OCHkepIxxB3wBl5ydLX+PKOus+JV0G/lTldtFOj5QEf8qIt
 TJ/8c1W2HQigW4+6sH+OExuH8LDo/QAKBxt1M9f5wKO+efAqyIzcNbduWoUURPd1zt
 TLVZU9j3hwbpQ==
Message-ID: <2f63622e-9663-491b-b390-71e6e81474ce@kernel.org>
Date: Fri, 9 Jan 2026 09:37:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>
References: <20260107214231.24163-1-chao@kernel.org>
 <20260108224545.3019a411@pumpkin>
Content-Language: en-US
In-Reply-To: <20260108224545.3019a411@pumpkin>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/2026 6:45 AM, David Laight wrote: > On Thu, 8 Jan 2026
 05:42:31 +0800 > Chao Yu <chao@kernel.org> wrote: > >> In error path of
 f2fs_read_data_large_folio(), 
 if bio is valid, it >> may submit bi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ve1Rr-0003hB-NO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path handling in
 f2fs_read_data_large_folio()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/9/2026 6:45 AM, David Laight wrote:
> On Thu,  8 Jan 2026 05:42:31 +0800
> Chao Yu <chao@kernel.org> wrote:
> 
>> In error path of f2fs_read_data_large_folio(), if bio is valid, it
>> may submit bio twice, fix it.
> 
> That isn't the only bug at the bottom of that function.
> I think I've unravelled the strange loops on the copy in linux-next.
> The 'goto got_it' could be a normal conditional.
> 
> The top has:
> 	if (rac)
> 		folio = readahead_folio(rac);
> next_folio:
> 	if (!folio)
> 		goto out:
> which means you can 'goto out' before setting up a pending 'bio'.
> 
> I'm sure that could be made a proper loop - although it would cost an indentation.
> Would certainly be better with only one call to readahead_foilio(), perhaps:
> next_folio:
> 	if (rac) {
> 		folio = readahead_folio(rac);
> 		if (!folio)
> 			goto out:
> 	}
> with just:
> 	if (rac)
> 		goto next_folio;
> at the bottom.

It could be, maybe you can clean up w/ a separated patch?

> 
> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index cabaeeb436bd..386d9adfd4bd 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2568,17 +2568,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>   		folio_unlock(folio);
>>   		return ret;
>>   	}
>> -
>> +out:
>> +	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>>   	if (ret) {
>> -		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>> -
>>   		/* Wait bios and clear uptodate. */
>>   		folio_lock(folio);
> 
> If I've read the code correctly the 'bio' can contain transfers for a
> previous folio(s), and might have transfers for this folio, but might not.
> So relocking the folio may just deadlock.

The bio may contain last folio which has not been committed to device, as you
said the folio has been locked, and after IO completion, we will unlock the
folio in f2fs_finish_read_bio(), so no deadlock?

Thanks,

> (I've not found the unlock at the end of transfer...)
> Quite which 'bio' need the flag changed is another question.
> 
> 	David
> 
>>   		folio_clear_uptodate(folio);
>>   		folio_unlock(folio);
>>   	}
>> -out:
>> -	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
>>   	return ret;
>>   }
>>   
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
