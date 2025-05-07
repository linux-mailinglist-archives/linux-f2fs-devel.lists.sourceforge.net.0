Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D1AAECC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 22:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLIkzyGoHwn40R4ExnVjevtUIcKV/IywoFq+boRBm8g=; b=JdjmajB3JRTJMzrzMKj3x7gQrf
	pIV1E8j8EsnIctf1b/5P/1qATnKz88qqfI5dBwGW9hTDJHggyb0nYl43cjU6NzRiR3lqfUh9ohOnl
	JUP7a1Ka1RAnPyabb99u94FAVGmA8/AHXL/ORes3RP/OtTYEFGo9fE0ZL/UDgzvxQgQw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uClFM-0002mk-4c;
	Wed, 07 May 2025 20:20:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uClFK-0002md-U9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bo8aK9h6rUqnvOG4WGxf5znAkmeNi5YW75Ok0lpquB4=; b=IPmUPdkBYa9Vj+UrpBVxwt5IHe
 fGKT0Q4N7sOACVq6GcMYw8xLkuCau5s2Uv3eLH6WAbLUZai5w/CNVCZhrKlrdmGw7TowxVMUJIMg3
 Ly15+ajiQs7sKKpZkFihrZgB1FF7AO3VmH4SGh4aNNKutoTzNRz1w+1sL3bPRMFSqEzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bo8aK9h6rUqnvOG4WGxf5znAkmeNi5YW75Ok0lpquB4=; b=a7ikFHBbrA9YEATiwzML274oc8
 Et14uIRf+s0AqPJ+SNYhbI0ye7yUIvCETteP5C6UdhKHg6pEY9d1ghOFAcTVHIJLsu0HjarvsQNWh
 nSyzOs0FhJPr/zK/qt9X2x1nrbGO/6tjJoySv5+k847RSn4y6uUgLxtp4HaUzldEsVW0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uClFK-00058L-85 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 20:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746649195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bo8aK9h6rUqnvOG4WGxf5znAkmeNi5YW75Ok0lpquB4=;
 b=Y/SQs8jB4e/c8Kgl1Jv1ElsjYG+2G7Jgz2a0rZZcWL9nfMybGXRLGOpGAHPx61T18j14vH
 00oeHORy+xOpZoVxmr4ohPhcCSkv0W/i1RxF+flOOBAlJtbyruowG9rpnrZWorhQn7O2Kw
 Lm0DGAO4iI4SmLEN7FfrELAsDlzwgPY=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-JW20x9TzOGKrEzzzrfJqxg-1; Wed, 07 May 2025 16:19:53 -0400
X-MC-Unique: JW20x9TzOGKrEzzzrfJqxg-1
X-Mimecast-MFC-AGG-ID: JW20x9TzOGKrEzzzrfJqxg_1746649192
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d81b9bb1b3so2011775ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 May 2025 13:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649192; x=1747253992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bo8aK9h6rUqnvOG4WGxf5znAkmeNi5YW75Ok0lpquB4=;
 b=qdGsxGq/SC/4mBPhJcnwIa0HsoNUd/RrecY3DCFq/20AKI9UV0QYUNToOFxVM6gO38
 irW6CPAhvaCmYZuxrPUXJaZ+MiExmsu81vhvEl+kFl0utALMA6R3xytt7mso9WYERS5V
 ccpmS2841VGv132PlrlyL3pWO/T4TOP0qhVGsb3w04pnjJV4BRBleAcGp9IQFXv5ZfYv
 yTmx8dlsBo1hZg5C1b7JUyExF9n+Y/xCG+ZlXcC1+OLjCPH8EtapnACkLukfWWSHHHlD
 lAQaM8E7gABLsRcEYNxTRbNzfGpGLYnChcrBlP29O3licXfsztdZKgh6aVHZJ7LjoC+7
 L5IQ==
X-Gm-Message-State: AOJu0YzrgVy3sIZxfMpemycvyrADxlqChAnEiUmoqqYFZ718e2wpYV8X
 nWwMObkO0aCyswTCo5yt4c2CjlVBpOYhJllv+D8d+Wva8B6JM8zBA0PiZj5v421zNTOrhgdKqJt
 Q0I/DRW4TqBOFVDPcPPEfQ3/nv2MoxW+QpdrRUr2loHK51SLF16ULY9PeBeRIodiUfBaxm/c0ff
 dHIGzf/MP2dQ==
X-Gm-Gg: ASbGncs2A5EjWQi6q2jziDnqL1uwOVXQ4Pe/aFBLG9rRBeiseJG5C7sRPFsO4iIFAj7
 MhFzTydS2kitGz6a5KxFBiEqDvgpsCwvi5kyp25igvRlqfKarIYfWTGuvBYo0gnGGBl6ZwotMcy
 29yyHlHH3mQazTiGDwa2gXc/f10UOKHdRtl2hOdcBKPw3xJFPJF+sJDpv0kbh4Dz5ukEQN8UtwK
 ISmecgHKs40wNMQdENMWWlA5V2SvoaPG6pxK509HkVSGwrDPIQYqZ0/1Ubk8Hac9gOniZmAePg4
 KTBaX1Mo0kNjk+uhVn+kIMdTGJI1Mv3FXD+YSkwDJd/FLuXZPw==
X-Received: by 2002:a05:6e02:1707:b0:3d9:6cd9:505b with SMTP id
 e9e14a558f8ab-3da73923292mr48865675ab.16.1746649191977; 
 Wed, 07 May 2025 13:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGirjblSq3VrPg4cSPPtixsZ9RLYr2y/Vqrv6Gu4fgJ719DDeE4NF/GlqgoJ1qnrPOOSrrIWQ==
X-Received: by 2002:a05:6e02:1707:b0:3d9:6cd9:505b with SMTP id
 e9e14a558f8ab-3da73923292mr48865325ab.16.1746649191574; 
 Wed, 07 May 2025 13:19:51 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3da70a57088sm8262035ab.70.2025.05.07.13.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 13:19:50 -0700 (PDT)
Message-ID: <e72e0693-6590-4c1e-8bb8-9d891e1bc5c0@redhat.com>
Date: Wed, 7 May 2025 15:19:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
 <aBq2GrqV9hw5cTyJ@google.com>
 <380f3d52-1e48-4df0-a576-300278d98356@redhat.com>
 <25cb13c8-3123-4ee6-b0bc-b44f3039b6c1@redhat.com>
 <aBtyRFIrDU3IfQhV@google.com>
 <6528bdf7-3f8b-41c0-acfe-a293d68176a7@redhat.com>
 <aBu5CU7k0568RU6E@google.com>
In-Reply-To: <aBu5CU7k0568RU6E@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JXi7rMvrJRldy9WWJW3MfqpdkFgixntDAPjr8Qz73FU_1746649192
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 2:48 PM, Jaegeuk Kim wrote: > On 05/07,
 Eric Sandeen
 wrote: >> On 5/7/25 9:46 AM, Jaegeuk Kim wrote: >> >>> I meant: >>> >>> #
 mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb >>> # mount /dev/v [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [170.10.129.124 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uClFK-00058L-85
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 2:48 PM, Jaegeuk Kim wrote:
> On 05/07, Eric Sandeen wrote:
>> On 5/7/25 9:46 AM, Jaegeuk Kim wrote:
>>
>>> I meant:
>>>
>>> # mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
>>> # mount /dev/vdb mnt
>>>
>>> It's supposed to be successful, since extent_cache is enabled by default.
>>
>> I'm sorry, clearly I was too sleepy last night. This fixes it for me.
>>
>> We have to test the mask to see if the option was explisitly set (either
>> extent_cache or noextent_cache) at mount time.
>>
>> If it was not specified at all, it will be set by the default f'n and
>> remain in the sbi, and it will pass this consistency check.
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index d89b9ede221e..e178796ce9a7 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1412,7 +1414,8 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
>>  	}
>>  
>>  	if (f2fs_sb_has_device_alias(sbi) &&
>> -			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
>> +			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
>> +			 !ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
>>  		f2fs_err(sbi, "device aliasing requires extent cache");
>>  		return -EINVAL;
>>  	}
> 
> I think that will cover the user-given options only, but we'd better check the
> final options as well. Can we apply like this?

I'm sorry, I'm not sure I understand what situation this additional
changes will cover...

It looks like this adds the f2fs_sanity_check_options() to the remount
path to explicitly (re-)check a few things.

But as far as I can tell, at least for the extent cache, remount is handled
properly already (with the hunk above):

# mkfs/mkfs.f2fs -c /dev/vdc@vdc.file /dev/vdb
# mount /dev/vdb mnt
# mount -o remount,noextent_cache mnt
mount: /root/mnt: mount point not mounted or bad option.
       dmesg(1) may have more information after failed mount system call.
# dmesg | tail -n 1
[60012.364941] F2FS-fs (vdb): device aliasing requires extent cache
#

I haven't tested with i.e. blkzoned devices though, is there a testcase
that fails for you?

Thanks,
-Eric

> ---
>  fs/f2fs/super.c | 50 ++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d89b9ede221e..270a9bf9773d 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1412,6 +1412,7 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
>  	}
>  
>  	if (f2fs_sb_has_device_alias(sbi) &&
> +			(ctx->opt_mask & F2FS_MOUNT_READ_EXTENT_CACHE) &&
>  			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
>  		f2fs_err(sbi, "device aliasing requires extent cache");
>  		return -EINVAL;
> @@ -1657,6 +1658,29 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
>  	f2fs_apply_quota_options(fc, sb);
>  }
>  
> +static int f2fs_sanity_check_options(struct f2fs_sb_info *sbi)
> +{
> +	if (f2fs_sb_has_device_alias(sbi) &&
> +	    !test_opt(sbi, READ_EXTENT_CACHE)) {
> +		f2fs_err(sbi, "device aliasing requires extent cache");
> +		return -EINVAL;
> +	}
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (f2fs_sb_has_blkzoned(sbi) &&
> +	    sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +#endif
> +	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> +		f2fs_warn(sbi, "LFS is not compatible with IPU");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  static struct inode *f2fs_alloc_inode(struct super_block *sb)
>  {
>  	struct f2fs_inode_info *fi;
> @@ -2616,21 +2640,15 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>  	default_options(sbi, true);
>  
>  	err = f2fs_check_opt_consistency(fc, sb);
> -	if (err < 0)
> +	if (err)
>  		goto restore_opts;
>  
>  	f2fs_apply_options(fc, sb);
>  
> -#ifdef CONFIG_BLK_DEV_ZONED
> -	if (f2fs_sb_has_blkzoned(sbi) &&
> -		sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> -		f2fs_err(sbi,
> -			"zoned: max open zones %u is too small, need at least %u open zones",
> -				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> -		err = -EINVAL;
> +	err = f2fs_sanity_check_options(sbi);
> +	if (err)
>  		goto restore_opts;
> -	}
> -#endif
> +
>  	/* flush outstanding errors before changing fs state */
>  	flush_work(&sbi->s_error_work);
>  
> @@ -2663,12 +2681,6 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>  		}
>  	}
>  #endif
> -	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> -		err = -EINVAL;
> -		f2fs_warn(sbi, "LFS is not compatible with IPU");
> -		goto restore_opts;
> -	}
> -
>  	/* disallow enable atgc dynamically */
>  	if (no_atgc == !!test_opt(sbi, ATGC)) {
>  		err = -EINVAL;
> @@ -4808,11 +4820,15 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	default_options(sbi, false);
>  
>  	err = f2fs_check_opt_consistency(fc, sb);
> -	if (err < 0)
> +	if (err)
>  		goto free_sb_buf;
>  
>  	f2fs_apply_options(fc, sb);
>  
> +	err = f2fs_sanity_check_options(sbi);
> +	if (err)
> +		goto free_options;
> +
>  	sb->s_maxbytes = max_file_blocks(NULL) <<
>  				le32_to_cpu(raw_super->log_blocksize);
>  	sb->s_max_links = F2FS_LINK_MAX;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
