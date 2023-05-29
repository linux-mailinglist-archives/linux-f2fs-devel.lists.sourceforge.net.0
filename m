Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A07147D3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 12:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3Zxq-0001fJ-Gi;
	Mon, 29 May 2023 10:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q3Zxo-0001f2-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ei7gkhQ8xQsB/1W0iCamTG2atvhy0PytxuE+69p1/Mw=; b=lCq28pc/nC6sSts0ECNhZKR25o
 Q9Z+nH6rZpk/+WrJ9hKNxVADyVlA2/VMpsCqV/ARmSJg4sZzHfXUfXFCcuJBr/BZ6sqzrBp/SUS6q
 xJ3GcYE7jngo5I1Sah1+EAt3moT+FmR4/IwY5Mg+Lfra638LwWOg6ye0CRWv+j3nQFsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ei7gkhQ8xQsB/1W0iCamTG2atvhy0PytxuE+69p1/Mw=; b=Q2Fy7xMaB2V/ilWUtsxiNz32wv
 36+li+H5O3DVVb7sgXbJ7DRxiSrZnmo+j9oBOM6MeHACL8rN32kkk6vD7VsQBbJ9DQ4QBxMM2BQ+S
 LQUPx6MFctTIMTjKzPc/gEASYdN4lSw4C3u3OYJZSvqPHBOLBGInKLYLjGIAPyR7mgP8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3Zxl-005eHT-Ab for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 10:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E64D561336;
 Mon, 29 May 2023 10:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12796C433EF;
 Mon, 29 May 2023 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685355527;
 bh=RkkExfeGgE+dhRU4IGRx6ehNzHPNh6PhoYcLpUyFzMI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EBu2mW4E1yMU8iIDd4Lsgo3CNSYIPG4uTB/mjzlxd2YqoaGca4QM+mdVQ/qTNc/vF
 cWUAaT0p7TiBZkLpAnoXjTeePD16OC1NU32Q2lnnOnrGAU1ZtpGb/vLR4Ic2j/HeBC
 iIjYaeOzE+mj3C69hZB8e+Q2KscKbLuw+XJQUoEP6NUflbUdLXnCuxL+AbQYeDsy4T
 /+9j4eS+H4Kio8/TAVCSwgj9g5K5b4fEN3uTJ2E3ATnThp43OByH8ujoYHRIsYmYep
 10Mle5BiZoD+tFRMmkCqnEnJ2suCWRq01NYGj5NuIfsA/YWMepSyjK5HzGm8rta0GT
 RIC3Va/1Vlnig==
Message-ID: <0c15c662-903c-3504-d502-72f0a3b70cbf@kernel.org>
Date: Mon, 29 May 2023 18:18:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>
References: <2bb05623-9438-3b68-6ac8-4294f9676ff6@kernel.org>
 <20230529041337.36741-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230529041337.36741-1-bo.wu@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/29 12:13, Wu Bo wrote: > On Sat, May 27, 2023 at
 09:01:41AM +0800, Chao Yu wrote: >> On 2023/5/27 1:21, Jaegeuk Kim wrote:
 >>> On 05/24, Wu Bo wrote: >>>> The NULL return of 'd_splice_alias' [...]
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3Zxl-005eHT-Ab
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/29 12:13, Wu Bo wrote:
> On Sat, May 27, 2023 at 09:01:41AM +0800, Chao Yu wrote:
>> On 2023/5/27 1:21, Jaegeuk Kim wrote:
>>> On 05/24, Wu Bo wrote:
>>>> The NULL return of 'd_splice_alias' dosen't mean error.
>>>>
>>>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>>>> ---
>>>>    fs/f2fs/namei.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>>> index 77a71276ecb1..e5a3e39ce90c 100644
>>>> --- a/fs/f2fs/namei.c
>>>> +++ b/fs/f2fs/namei.c
>>>> @@ -577,7 +577,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>>>    #endif
>>>>    	new = c(inode, dentry);
>>>>    	err = PTR_ERR_OR_ZERO(new);
>>>> -	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
>>>> +	trace_f2fs_lookup_end(dir, new ? new : dentry, ino, err);
>>>
>>> Shouldn't give an error pointer to the dentry field.
>>>
>>> How about just giving the err?
>>>
>>> -       err = PTR_ERR_OR_ZERO(new);
>>> -       trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
>>> +       trace_f2fs_lookup_end(dir, dentry, ino, PTR_ERR_OR_ZERO(new));
>>
>> static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
>> {
>> 	if (IS_ERR(ptr))
>> 		return PTR_ERR(ptr);
>> 	else
>> 		return 0;
>> }
>>
>> For below two cases, PTR_ERR_OR_ZERO(new) will return zero:
>> a) f2fs_lookup found existed dentry
>> b) f2fs_lookup didn't find existed dentry (-ENOENT case)
>>
>> So in below commit, I passed -ENOENT to tracepoint for case b), so we can
>> distinguish result of f2fs_lookup in tracepoint, actually, -ENOENT is expected
>> value when we create a new file/directory.
>>
>> Commit 84597b1f9b05 ("f2fs: fix wrong value of tracepoint parameter")
> I can see this commit is try to distinguish the dentry not existed case.
> But a normal case which dentry is exactly found will also go through
> 'd_splice_alias', and its return is also NULL. This makes the tracepoint always
> print 'err:-2' like the following:
>        ls-11676   [004] .... 329281.943118: f2fs_lookup_end: dev = (254,39), pino = 4451, name:Alarms, ino:7093, err:-2
>        ls-11676   [004] .... 329281.943145: f2fs_lookup_end: dev = (254,39), pino = 4451, name:Notifications, ino:7094, err:-2
>        ls-11676   [004] .... 329281.943172: f2fs_lookup_end: dev = (254,39), pino = 4451, name:Pictures, ino:7095, err:-2
> Even these lookup are acctually successful, this is a bit strange.

Ah, I misunderstand return value's meaning of .lookup.

So, how about this? it only update err if d_splice_alias() returns a negative
value?

if (IS_ERR(new))
	err = PTR_ERR(new);
trace_f2fs_lookup_end(dir, new ? new : dentry, ino, err);

Thanks,

>>
>>>
>>>
>>>>    	return new;
>>>>    out_iput:
>>>>    	iput(inode);
>>>> -- 
>>>> 2.35.3
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
