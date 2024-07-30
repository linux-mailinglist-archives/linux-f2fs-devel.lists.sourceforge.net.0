Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 227059403B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 03:29:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYbg5-000090-Dp;
	Tue, 30 Jul 2024 01:29:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sYbg3-00008s-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 01:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MbyaocKb+fn4L6VgcGpqGKaYqZ4xEEoOt0yQsMWRTok=; b=TF+Oz1pbZzwMm38+jir91v34Gs
 1fkwsWd/KzdjGbHJEMduPQbjfK5kE5CnnnmSUdYhxJtSz4pdoxoOiXVrZMDrxL2pe0dlZA2ssimN+
 bFjXbbAt9LJzDqYpbNQWVOiKDeyNkD3qLexUThSHuvEyCC+XcieUPxUhP2uT5aUFbJ7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MbyaocKb+fn4L6VgcGpqGKaYqZ4xEEoOt0yQsMWRTok=; b=CvENS21NccKu+khmGl8Py4klJN
 yrzB6YnbpaK51DOrArzgIQlTbzIHFjEWbRKf55gKpSkhe/hJjD8kkqhgWdR2perMBQXieT6aPthU7
 l+taUBg43TS9FiHY/EpVxaJ9BIhZ2GHYDRRG4T+L0DR6xESQ9ZJg1vyUp/TyFtaOCz1U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYbg2-0007qd-I5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 01:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3FCDCE0B25
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jul 2024 01:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7315BC32786;
 Tue, 30 Jul 2024 01:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722302950;
 bh=SWevj4/qgCUH1+QbmoMRBMPrM/3GHdlPzbTfv0k9mxs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iU8PzlbdFeEhLqVIe6Mviswx8UZKjjL4QQKWafLgIfBMp0+ri9Z7PnVcAXs+fHfnJ
 N8t14OHuR3+KWaVm37O/cyT8GMe3RkRE7PYfMbRRR1TRJv0Xvq8Tj20GgWuLaTdBu0
 Fabh3ODiv4VRdMak3yMTF6xcvfA9cp3udc2P1M5k3hKmRg3qXlCFEbspfAMG/YqPm9
 FbEATWZlWIoIX3DSqqh3YHugGwgYUAqyy+t+29OYbskIQGpN13FXo/VTTC4WTHBxOp
 uM0Cs7hpHTHYJoAGO9+GpNGDiWsRlPC5h64YZus+wTkppkOmmRJPZ3G5YJEtCfjzTf
 EBtTiGjrm2zpA==
Message-ID: <9e6c0e72-a175-4432-bada-564464698c3f@kernel.org>
Date: Tue, 30 Jul 2024 09:29:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240726012204.1306174-1-chao@kernel.org>
 <ZqfCwDcg7nvJPenf@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZqfCwDcg7nvJPenf@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/30 0:26, Jaegeuk Kim wrote: > On 07/26, Chao Yu
 wrote: >> We should always truncate pagecache while truncating on-disk data.
 >> >> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYbg2-0007qd-I5
Subject: Re: [f2fs-dev] [PATCH v2 3/4] f2fs: atomic: fix to truncate
 pagecache before on-disk metadata truncation
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

On 2024/7/30 0:26, Jaegeuk Kim wrote:
> On 07/26, Chao Yu wrote:
>> We should always truncate pagecache while truncating on-disk data.
>>
>> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - fix to use cow_inode instead of inode
>>   fs/f2fs/file.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6c62f76474d1..54886ddcb8ab 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2202,6 +2202,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>   		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>>   	} else {
>>   		/* Reuse the already created COW inode */
>> +		truncate_setsize(fi->cow_inode, 0);
> 
> What if the below truncation failed?

What about just dropping page cache and do not set isize to 0?

Thanks,

> 
>>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>>   		if (ret) {
>>   			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
