Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD36DA6E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 03:22:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkaoE-0007MK-MN;
	Fri, 07 Apr 2023 01:22:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pkaoC-0007ME-OH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 01:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vIPOZeXRovcQVkHP2ECMQz007LBeK4nvWFfQ+MgN4bw=; b=iwTc2+/X2K61y2+R+PXvx1v12I
 DEscEN3GFy/a4Z8pMD+h5Y7oUM+8i/FvDO3x+SGSk6PbHeYPFOTujDiF5sNwKM4tVSB3nMcuU7F/w
 U6fftVHJKwyVgk8X5jAhg+dslMLH0sB3IOtguRBQttuzGeBNmVHHcPbKJj3JRCNqCWn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vIPOZeXRovcQVkHP2ECMQz007LBeK4nvWFfQ+MgN4bw=; b=MftIpAjar75xTiLqXqShYv5wib
 ibO59GSqVGMaIZdQJXNG3I+vJBvxMXvGx+AS6+5axAPcGOHPc/0yjoz4fiptO7fwzjLPZV4AWSfC4
 Oz7WqIHHwr4cxMOr2ENEW9HpJvWdXRvcB0UdNNpIGr5SJQVBypdwfPU855Brg9Y3LblI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkaoB-00HJpF-8N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 01:22:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB66463E34;
 Fri,  7 Apr 2023 01:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CCCC433D2;
 Fri,  7 Apr 2023 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680830545;
 bh=YAEuWYm9lK18MqiZgFjU2fpTN2+518FfqL/Eo+yVUY4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KhBSoofFLD9bp1DKr+0j3g2IeG+Z+0XB++sZioLL6m6Wj2BZ6eXDflwG5O2gJZXIa
 25GGvf4+APi8azyL5B46z3itwHtxi6F1tAeoMD5MvRtbrfAuPRDydycA1McQJ/Lg37
 zmfUnZJwoIzSGbJHEGXugUBzFD5Fivy8OJkaaBdpqn8kRKazjGHBpyRfD9o3HXUh6b
 1DaZTAkkAaS3tf5VoVbPWZIx/kyi6VpKGVATE0l4FeOilcIamFV1CYEvIJqGqOVohS
 YGTFw7bA1WaUfiSQWDGMfUWqlUb7DBsm2rZ3t+zERql+CVusz+l0Gf7hrUG0524Vcn
 alaVaOWPPodQA==
Message-ID: <ea5102a1-eb91-6799-4353-aefd877e0864@kernel.org>
Date: Fri, 7 Apr 2023 09:22:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230330164948.29644-1-frank.li@vivo.com>
 <a6d9887f-1ff0-fd43-85ff-e6fee87bbe84@kernel.org>
 <ZC2eFqN+UdhM6Qu9@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZC2eFqN+UdhM6Qu9@google.com>
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/6 0:13, Jaegeuk Kim wrote: > On 04/05,
 Chao Yu wrote:
 >> On 2023/3/31 0:49, Yangtao Li wrote: >>> +#ifdef CONFIG_F2FS_FS_LZ4HC
 >>> + unsigned char level = F2FS_I(cc->inode)->i_compress_level [...] 
 Content analysis details:   (-7.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkaoB-00HJpF-8N
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: merge lz4hc_compress_pages() to
 lz4_compress_pages()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/6 0:13, Jaegeuk Kim wrote:
> On 04/05, Chao Yu wrote:
>> On 2023/3/31 0:49, Yangtao Li wrote:
>>> +#ifdef CONFIG_F2FS_FS_LZ4HC
>>> +	unsigned char level = F2FS_I(cc->inode)->i_compress_level;
>>>    	if (level)
>>>    		len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>>>    					cc->clen, level, cc->private);
>>>    	else
>>
>> [snip]
>>
>>>    #endif
>>
>> [snip]
>>
>>> +		len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>>
>> It's weired that whole else xxx; statement is split by #endif.
>>
>> What about?
>>
>> 	unsigned char level = 0;
>>
>> #if
>> ...
>> #endif
>> 	if (!level)
>> 		len = LZ4_compress_default()
> 
> I modified like this.
> 
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -266,17 +266,19 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
> 
>   static int lz4_compress_pages(struct compress_ctx *cc)
>   {
> -       int len;
> -#ifdef CONFIG_F2FS_FS_LZ4HC
> +       int len = -EINVAL;
>          unsigned char level = F2FS_I(cc->inode)->i_compress_level;
> 
> -       if (level)
> +       if (!level)
> +               len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> +                                               cc->clen, cc->private);
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +       else
>                  len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>                                          cc->clen, level, cc->private);
> -       else
>   #endif
> -               len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> -                                               cc->clen, cc->private);
> +       if (len < 0)
> +               return len;
>          if (!len)
>                  return -EAGAIN;
> 

Better.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
