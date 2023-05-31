Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6B7172E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 03:12:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4ANl-0003S3-4C;
	Wed, 31 May 2023 01:12:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q4ANj-0003Rx-IE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 01:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGkjEIR3tYxVpvH1fGfkgcKm+HWeov2ORNo1BWuLsvg=; b=Tgw6opjB2TFIZr6pTPQg9GJv9y
 ToW9AL33JDTXvio/vWpipNIELifKrJ1a3TeX2n7wrJ0Q0egT1tKWOImWH53nzTZaXKirZkLfwLPVG
 Tc1k3aPfGGQguX4RjXl8oftw3U+jEWeDcIjhWHhKw+lfGBnPcG39tOwxTrbhLzOqHBG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGkjEIR3tYxVpvH1fGfkgcKm+HWeov2ORNo1BWuLsvg=; b=TNRF7Tq76xGtBIQDrcW43a5voi
 hrnMq9kAz5beFdNJX/RepP2Cgxszi55yimKqNFGRD/29xBN5SO1nIicqrOEREMEd/+GG4eVZiY+TY
 OGRTHuOOtCFjauZqtDiOGlXuhVN8IS8Hq0mXHVAqiHnMjYDcq0BwWFyo7YVziJMFWSaY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4ANj-006zsv-Pm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 01:12:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65C79635C8;
 Wed, 31 May 2023 01:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914ACC433EF;
 Wed, 31 May 2023 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685495517;
 bh=L7vmx3k0L13foFTSG6sEEgottZQqCjEMpZkj1eF386o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jCfFDcy2akosC8dx+YAE2JeEp6yeHUc7Lo0BUN1lTvlkjThF7cqXLN4b4i3zC4M6Q
 MjI1BzbWTnMwgcjheCZdTsaGm+EhRLy0TjTbXcKeNs4UZ9u6mYL8uSW8AO9mgCa6KY
 91Og4Is0D88RLZh1vy7mrNHpn74gPH9JTERMwmoOlDe2/x5tvFjfmIxpuyi0q8bWnl
 ZJSyUPI4/CWSX5AXAdKXYCJf4O5noJ6LwZ/cG2lbSsxUG8X7F6+rkNlSu92I/9KJrj
 lbzsFPuCMOJWZD7SZWjuu+k/X6mYbVyzFLsZiFtD4lVvTHuUGVudBW2w249z/Rt9TT
 xY1YiZ3XJKdsA==
Message-ID: <9f2948cb-a4b0-bced-1d11-cf9fc712ba9b@kernel.org>
Date: Wed, 31 May 2023 09:11:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Wu Bo <bo.wu@vivo.com>
References: <20230530012118.74228-1-bo.wu@vivo.com>
 <ZHaHknKmSQIdQzBC@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZHaHknKmSQIdQzBC@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/31 7:32, Jaegeuk Kim wrote: > On 05/30,
 Wu Bo wrote:
 >> The NULL return of 'd_splice_alias' dosen't mean error. Thus the >>
 successful
 case will also return NULL, which makes the tracepoint [...] 
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
X-Headers-End: 1q4ANj-006zsv-Pm
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix args passed to
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/31 7:32, Jaegeuk Kim wrote:
> On 05/30, Wu Bo wrote:
>> The NULL return of 'd_splice_alias' dosen't mean error. Thus the
>> successful case will also return NULL, which makes the tracepoint always
>> print 'err=-ENOENT'.
>>
>> Signed-off-by: Wu Bo <bo.wu@vivo.com>
>> ---
>>   fs/f2fs/namei.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index 77a71276ecb1..0c5e4c424eab 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -576,8 +576,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>>   	}
>>   #endif
>>   	new = d_splice_alias(inode, dentry);
>> -	err = PTR_ERR_OR_ZERO(new);
>> -	trace_f2fs_lookup_end(dir, dentry, ino, !new ? -ENOENT : err);
>> +	if (IS_ERR(new))
>> +		err = PTR_ERR(new);
>> +	trace_f2fs_lookup_end(dir, new ? new : dentry, ino, err);
> 
> Again, new can be an error pointer, and the previous err was supposed to be
> zero or -ENOENT.
> 
> case 1) dentry exists: err (0) with new (NULL) --> dentry, err=0
> case 2) dentry exists: err (0) with new (VALID) --> new, err=0
> case 3) dentry exists: err (0) with new (ERR) --> dentry, err=ERR
> case 4) no dentry exists: err (-ENOENT) with new (NULL) --> dentry, err=-ENOENT
> case 4) no dentry exists: err (-ENOENT) with new (VALID) --> new, err=-ENOENT
> case 5) no dentry exists: err (-ENOENT) with new (ERR) --> dentry, err=ERR
> 
> 	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> 				ino, IS_ERR(new) ? PTR_ERR(new) : err);

Agreed, could you please add above description in commit message?

Thanks,

> 
> 
>>   	return new;
>>   out_iput:
>>   	iput(inode);
>> -- 
>> 2.35.3


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
