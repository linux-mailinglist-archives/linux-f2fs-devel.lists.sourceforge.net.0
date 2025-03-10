Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BC0A5909C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 11:01:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trZwy-0004Iu-Ng;
	Mon, 10 Mar 2025 10:01:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trZww-0004Io-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 10:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iX7/K6PdRqvrGFeaVznTYduh9mrrWUgRHJvoMsqUreE=; b=IAipIpJQoqJX8o3PeeimzYSRXQ
 6OT2BrhpwarPgfY/mDFIy7MXy6N8YKKaQvn2EuyI2ZISZAbVqZZzi07TR1JWG8fayBKGgeGj1TuUx
 CGPz1xMzxXtelmUW2F7txo5qqrz7jxInMNw6F+06ig5+9vLj36GrGxJ9elXvHwtAlZSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iX7/K6PdRqvrGFeaVznTYduh9mrrWUgRHJvoMsqUreE=; b=lrYMSsBQnPHCWyPrLqakhZpySp
 gfhozz1+NCxj0d8KbsKSOUA32EO0cyC/N9HiXHXliwM/bUeVZMJ5Y5VfZr/XZecWQhM19Q9GFtFo3
 oQBr0RbmvoXOIVyGR5Qp+I1qbAw69rFvTTJ4lFwK61uQL/R/pYWgD8cEPXdu6YgaQtak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trZwq-0008AM-GI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 10:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B77E5C5C22;
 Mon, 10 Mar 2025 09:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641ACC4CEE5;
 Mon, 10 Mar 2025 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741600873;
 bh=yxIW1tjBz5YahV83vbyGET/8aw9Zwdt1unebbZkjrW8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uZT0iZLd9XgScO7T2HSG0dSleYB6Nn5rhHPnuSa1uTF1g3w2zKGE9kPq3AQVA9XHE
 cc7kyDH4CBSNBBNC4sWZhOLBPOvZmhi0zuVodYWbyLB7Fk3NeMJNxHReGlAa3O3nSS
 8JpevIDeZltXao4gVcZaQirFDuk6ACxyy2I0sow+oEHtr5Jkivwp89k+Hw/HNBDP0i
 U56u8xeXRZwAQaAvi0xbAjQiB9KxM+43CFEOHDynAABeOBG/PiHHWyC+bl/mce+9rK
 kB1+v527He2Pok7IYj8VFBo5PtWnc+J8f8pQKw60v84IEelc3X1mgYa/uQvALxx2rS
 Hd0ziEpVRZn7Q==
Message-ID: <822791c9-bf0d-425f-84e7-92abac31227b@kernel.org>
Date: Mon, 10 Mar 2025 18:01:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250307145629.2b2c6e99.ddiss@suse.de>
 <20250310071636.gombdbhdfbqxwib5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <20250310080259.6ormkanynd7l2yrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250310080259.6ormkanynd7l2yrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/10/25 16:02, Zorro Lang wrote: > On Mon, Mar 10, 2025
 at 03:16:36PM +0800, Zorro Lang wrote: >> On Fri, Mar 07, 2025 at 02:56:29PM
 +1100, David Disseldorp wrote: >>> On Thu, 6 Mar 2025 16:18:06 + [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trZwq-0008AM-GI
Subject: Re: [f2fs-dev] [PATCH 1/4] common/config: remove redundant export
 of F2FS_IO_PROG
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 David Disseldorp <ddiss@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/10/25 16:02, Zorro Lang wrote:
> On Mon, Mar 10, 2025 at 03:16:36PM +0800, Zorro Lang wrote:
>> On Fri, Mar 07, 2025 at 02:56:29PM +1100, David Disseldorp wrote:
>>> On Thu,  6 Mar 2025 16:18:06 +0800, Chao Yu wrote:
>>>
>>>> F2FS_IO_PROG was been exported twice, remove the redudant one.
>>>>
>>>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>  common/config | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/common/config b/common/config
>>>> index 2afbda14..8d3047a5 100644
>>>> --- a/common/config
>>>> +++ b/common/config
>>>> @@ -191,7 +191,6 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
>>>>  export FSTRIM_PROG="$(type -P fstrim)"
>>>>  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
>>>>  export RESIZE2FS_PROG="$(type -P resize2fs)"
>>>> -export F2FS_IO_PROG="$(type -P f2fs_io)"
>>>>  export FIO_PROG="$(type -P fio)"
>>>>  export FILEFRAG_PROG="$(type -P filefrag)"
>>>>  export E4DEFRAG_PROG="$(type -P e4defrag)"
>>>
>>> Looks good. @Zorro, might as well squash in removal of the duplicate
>>> TIMEOUT_PROG export too.
>>
>> Sure, I roughly tried to find all duplication by:
>>
>>   $ for prog in `sed -n "/export/s/export \(.*_PROG\)=.*/\1/p" common/config `;do n=`grep -E "\b$prog=" common/config|wc -l`;if [ $n -gt 1 ];then grep "\b$prog=" common/config;fi;done
>>
>> Currently only found F2FS_IO_PROG and TIMEOUT_PROG. So I'll change this patch
>> commit to:
>>
>>   common/config: remove redundant export variables
>>
>>   F2FS_IO_PROG and TIMEOUT_PROG are exported twice, remove the
>>   redundant one.
> 
> Hi Chao,
> 
> As you need to change patch 4/4 more. I thought you might change others, so
> please change this patch refer to below:)

Zorro, yes, let me update all in v2, thank you!

Thanks,

> 
> Thanks,
> Zorro
> 
> Author: Chao Yu <chao@kernel.org>
> Date:   Thu Mar 6 16:18:06 2025 +0800
> 
>     common/config: remove redundant export variables
>     
>     F2FS_IO_PROG and TIMEOUT_PROG are exported twice, remove the redudant
>     one.
>     
>     Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>     Signed-off-by: Chao Yu <chao@kernel.org>
>     Reviewed-by: David Disseldorp <ddiss@suse.de>
> 
> 
> diff --git a/common/config b/common/config
> index 2afbda141..aa5258250 100644
> --- a/common/config
> +++ b/common/config
> @@ -191,7 +191,6 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
>  export FSTRIM_PROG="$(type -P fstrim)"
>  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
>  export RESIZE2FS_PROG="$(type -P resize2fs)"
> -export F2FS_IO_PROG="$(type -P f2fs_io)"
>  export FIO_PROG="$(type -P fio)"
>  export FILEFRAG_PROG="$(type -P filefrag)"
>  export E4DEFRAG_PROG="$(type -P e4defrag)"
> @@ -220,7 +219,6 @@ export UBIUPDATEVOL_PROG="$(type -P ubiupdatevol)"
>  export THIN_CHECK_PROG="$(type -P thin_check)"
>  export PYTHON3_PROG="$(type -P python3)"
>  export SQLITE3_PROG="$(type -P sqlite3)"
> -export TIMEOUT_PROG="$(type -P timeout)"
>  export SETCAP_PROG="$(type -P setcap)"
>  export GETCAP_PROG="$(type -P getcap)"
>  export CAPSH_PROG="$(type -P capsh)"
> 
>>
>> Thanks,
>> Zorro
>>
>>>
>>> Reviewed-by: David Disseldorp <ddiss@suse.de>
>>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
