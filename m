Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E738A9D1D06
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2024 02:12:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tDCmp-00018w-Qo;
	Tue, 19 Nov 2024 01:12:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tDCmo-00018o-IX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 01:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cBK93FRl3yYKVka2aGvwy2ujg24AzuQ3TROvp8guv+c=; b=VC+UXIa5x8bGh+MO4S7wRYVBe9
 4+NPd9p0BkWw1l9GYfr1+0E5pCqaABbdwqu5jElyKzTVOFpwQPU1EkgVLcP3Ibu3ztUU+D0OMFb7Z
 T9UY3O3u/ijQFU+niMrY9zmYL7Bavc/al2dNP52LFPHOQfhkuZIdty9g8SL3FclAtNNs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cBK93FRl3yYKVka2aGvwy2ujg24AzuQ3TROvp8guv+c=; b=IQc9QuvD5GvQcHDkZxfdBcwkac
 lMsAAGacirEtOOZu8HlanfW5PgKu5IJF1BpV56JiJ8Z7DowF19i97sCduHNheQTGLgkkmBsXiBKzl
 6viVcxRzCk07nqya05cJ0LvBZjpGmvqu+gHEOS7BpqV4wbzXVSNGsS6+fE2VZd99fGNs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tDCmo-0006HA-Hl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Nov 2024 01:12:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4F4B6A42009
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Nov 2024 01:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883E0C4CECC;
 Tue, 19 Nov 2024 01:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731978719;
 bh=5GqFx1fD8zSbopaJaZOgppfLuxZcO4ZGnmyqWC0RSpY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Bs/H4vG/RwefsIScLr4GSF/IMbJpm0uqiiDgkOUALs+4Viulqd8AqsOPIOixYlbJx
 8a8yoYOQy2ozHP+anAZuRauaXMiiYb9wBxz7/1+3tmy5cB+3xhWE0rO3+cdEVuiVhe
 vn4QgDshX1M1JKuK173YAzWcISWVhkTKNERoGZC5j2Mbi6ekiGJMllS1QCm6qlc0LF
 VaT0T7rcrhnyg9TRxpSHbTnx2wNyCOhtF7CLnWhjDjHYpd692W/fovvdH46xEc6kNa
 HnEAy7MDFqaoW6xR1fnEi8bKenyBFbZwmjB27LtT87uxYxX9K8v8cNZHPNvgZfjwlz
 0RKCubA4VsX4w==
Message-ID: <6b58469c-2a93-4839-9fb9-4e6ec901c308@kernel.org>
Date: Tue, 19 Nov 2024 09:11:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241108012557.572782-1-chao@kernel.org>
 <ZzuCfgTp9m1eqIGa@google.com>
Content-Language: en-US
In-Reply-To: <ZzuCfgTp9m1eqIGa@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/19 2:07, Jaegeuk Kim wrote: > I applied this with
 the below change to avoid build failure. Thank you! Thanks,
 > > --- a/fs/f2fs/super.c
 > +++ b/fs/f2fs/super.c > @@ -3336, 7 +3336, 7 @@ loff_t max_file_blocks(struct
 inode *inode) > * fit within U32_MAX + 1 data units. > */ > > - result =
 min(result, F2F [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tDCmo-0006HA-Hl
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix to do cast in
 F2FS_{BLK_TO_BYTES, BTYES_TO_BLK} to avoid overflow
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/19 2:07, Jaegeuk Kim wrote:
> I applied this with the below change to avoid build failure.

Thank you!

Thanks,
> 
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3336,7 +3336,7 @@ loff_t max_file_blocks(struct inode *inode)
>           * fit within U32_MAX + 1 data units.
>           */
> 
> -       result = min(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));
> +       result = umin(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));
> 
>          return result;
>   }
> 
> On 11/08, Chao Yu wrote:
>> It missed to cast variable to unsigned long long type before
>> bit shift, which will cause overflow, fix it.
>>
>> Fixes: f7ef9b83b583 ("f2fs: introduce macros to convert bytes and blocks in f2fs")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   include/linux/f2fs_fs.h | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>> index b0b821edfd97..3b2ad444c002 100644
>> --- a/include/linux/f2fs_fs.h
>> +++ b/include/linux/f2fs_fs.h
>> @@ -24,10 +24,10 @@
>>   #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
>>   #define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
>>   
>> -#define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
>> -#define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
>> +#define F2FS_BYTES_TO_BLK(bytes)	((unsigned long long)(bytes) >> F2FS_BLKSIZE_BITS)
>> +#define F2FS_BLK_TO_BYTES(blk)		((unsigned long long)(blk) << F2FS_BLKSIZE_BITS)
>>   #define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
>> -#define F2FS_BLK_ALIGN(x)			(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
>> +#define F2FS_BLK_ALIGN(x)		(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
>>   
>>   /* 0, 1(node nid), 2(meta nid) are reserved node id */
>>   #define F2FS_RESERVED_NODE_NUM		3
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
