Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F5AAD122
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 00:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA6OhRQSmYTehSoPdp5opk0GsYnzomje6JOEvNtR3mg=; b=GMXqaKkAtzwVE0Y0r/7uVwoZWf
	cWDhhgbC8Lh7bHzhaj4pPrVsKqnyb4/qHaBsDE13UoIR2cQnileVXC1uebdrmsglcv/G7RdyfefhU
	yibIgJy8luuZ1GgD7DsmiuF+gZRFOkQiiIztAHgMmoyYDAYNFu5zpRQw58GvacOAy2lc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCR9y-0007qw-5K;
	Tue, 06 May 2025 22:53:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uCR9x-0007qn-70
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 22:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSbhMzwrXgtq6axW2oDnDnrz312/alFjqdIi9xnRxw8=; b=eLOm+WnapfhZf4wrlj2GFC4/Hc
 S5U6qKbC7zH70eCTEYENOgUUUEXtO3QYoarPUXZ5oZMVSrgswRwRg043t4o5MnoxQpeeyfcZKtVYB
 8YzLBHmq+QVNWN4DY6IAZTxg1vD2iFw4Bk6GngqamcZ/yLLDSm9B1yuGCg1JZj4YP7JQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSbhMzwrXgtq6axW2oDnDnrz312/alFjqdIi9xnRxw8=; b=cJ1VU0t+3TGu0yvW+Za3A4j+S3
 9JWFIPf22ncP5ttz3kqdqHJfC4rC+C62c43EL2t8zUwC40ONaeBglTojyPue0HwZfpC0Oze6rOGmz
 CSkDTu+djdFvF1UYWLlXLzOe5bg0EvcsEGFW6D+xlKFXfywN5U3SovE9vCOcGudLyVwI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCR9h-0006mE-65 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 22:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746571961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSbhMzwrXgtq6axW2oDnDnrz312/alFjqdIi9xnRxw8=;
 b=fcU1HTaplaZonobSkRjj4QwWFPV11UDvaznbxRcvgDR3hxLVyWlMD2mMgdGkHBHxlqAs6O
 mfdOPUsnxshMganBor+I4XL19gtxrvqjiXqqVg19+q6cpn80o+0HwOlnYiToqyJ7eK4IDv
 aNSDyn3CmCHjwem+ELnvu10wFjDreQY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-UwNXsBpvP-6tvterqHcouw-1; Tue, 06 May 2025 18:52:41 -0400
X-MC-Unique: UwNXsBpvP-6tvterqHcouw-1
X-Mimecast-MFC-AGG-ID: UwNXsBpvP-6tvterqHcouw_1746571960
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-862dda418a6so1212349039f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 May 2025 15:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746571960; x=1747176760;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSbhMzwrXgtq6axW2oDnDnrz312/alFjqdIi9xnRxw8=;
 b=LfIwsB7Q3m8wwMU2V4oVh2BaXmxSmufypXbcU6LPBTeNosRuYIsVVzX5wlXobQxCmA
 clrFulFnJ/B8/jodh6ka9oAIjWyX7OD/FLGkH3dqT9TsDMakd6j08qX3R4TKBPX3ExN+
 /GigX3SPh11eozCdx7nXoGhprXQvXFnxVnZ4LJmIBA33GhODhBoRQi4xOC9v4Uu5Wbsz
 kdG4cIB2D9oGN6t4jEO8j727Z11tEko0az/TmwM10XBuJCUsj8Kr8s2Rf+ahrx8d893/
 kislZwK7fX5UwXhFu09qOKHD2BpJbRxT8hFcCFkgXzePW6fKg4Gctwf/KaZ7+DkXGiTO
 Rj1w==
X-Gm-Message-State: AOJu0YwL3fJkfPOPo4klMwtjDwwFM1qaWckfM5LZapxGimwHw7RWY4Qh
 JLja/O2mg5QMniL+Z8TX7ATX1LFGHz95Qd47O+tFS0pgyUJ1hg6OS8ayWXf0hNbyT9Jfw6IuJ4S
 oV1/QwLr86nq83OlmN1BHk9rUJeMMgWpapmHj+li9NARFZV8fk4P0yO0Ktj9b2ox5iyuM8pxIJA
 cHt3rpJ2qtow==
X-Gm-Gg: ASbGncsN5EAOsGo9o8XjDTTjX/9KugRHMoxE9zFr9awHq203DerhmyLRE1lWWMi0ESw
 AlxWTArmVX8/Y5c+Lsh7iWzZTHy72PGKj0+orudBdelkX7r89HTwJAdQccrkuZO+KPqlgG3ZMF2
 t1tQH7hAKbmsjG6N8yKXiUGyIRGnpoRmX1FFv1abyqnGlsIDWBEiCG5LFBRiFyJymAmdC3fKZmt
 BLlBHp/x6kp7CUwcs4PAX0GOnPzKP2RfQJ8Gg3tgmr3CLv+KnVWFZJ/CKkKl8aO5/xxI73iVkZI
 d2mYr11UEU+OVuihEqXCQvMnfas8ZgY4j1jijymlqcHIz2jDZ+qq
X-Received: by 2002:a05:6e02:338f:b0:3d3:f4fc:a291 with SMTP id
 e9e14a558f8ab-3da73935e95mr12731295ab.19.1746571960042; 
 Tue, 06 May 2025 15:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0fxqWLT2ZfgPKpCW1lmti5qzFFiAZoLiS+3Hezb26fGkl98iJVYJZU8f5uhw6Yg6E3x+ftQ==
X-Received: by 2002:a05:6e02:338f:b0:3d3:f4fc:a291 with SMTP id
 e9e14a558f8ab-3da73935e95mr12731165ab.19.1746571959829; 
 Tue, 06 May 2025 15:52:39 -0700 (PDT)
Received: from [10.0.0.82] (75-168-235-180.mpls.qwest.net. [75.168.235.180])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975f58be3sm28293765ab.58.2025.05.06.15.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 15:52:39 -0700 (PDT)
Message-ID: <5eda52cb-995f-4bb7-a896-927bacdd17a2@redhat.com>
Date: Tue, 6 May 2025 17:52:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-6-sandeen@redhat.com> <aBqGw8lUbNtvdziC@google.com>
In-Reply-To: <aBqGw8lUbNtvdziC@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O0wwgrS5_TAr8CLS458WTDXzrTUxRXsPCbdEgNSDTSE_1746571960
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/6/25 5:01 PM, Jaegeuk Kim wrote: <snip> >> +static int
 f2fs_check_opt_consistency(struct fs_context *fc, >> + struct super_block
 *sb) >> +{ >> + struct f2fs_fs_context *ctx = fc->fs_private; >> + struct
 f2fs_sb_info *sbi = F2FS_SB(sb); >> + [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCR9h-0006mE-65
Subject: Re: [f2fs-dev] [PATCH V3 5/7] f2fs: separate the options parsing
 and options checking
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

On 5/6/25 5:01 PM, Jaegeuk Kim wrote:

<snip>

>> +static int f2fs_check_opt_consistency(struct fs_context *fc,
>> +				      struct super_block *sb)
>> +{
>> +	struct f2fs_fs_context *ctx = fc->fs_private;
>> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>> +	int err;
>> +
>> +	if (ctx_test_opt(ctx, F2FS_MOUNT_NORECOVERY) && !f2fs_readonly(sb))
>> +		return -EINVAL;
>> +
>> +	if (f2fs_hw_should_discard(sbi) && (ctx->opt_mask & F2FS_MOUNT_DISCARD)
>> +				&& !ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
> Applied.
> 
>        if (f2fs_hw_should_discard(sbi) &&
>                        (ctx->opt_mask & F2FS_MOUNT_DISCARD) &&
>                        !ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
> 

yes that's nicer

>> +		f2fs_warn(sbi, "discard is required for zoned block devices");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (f2fs_sb_has_device_alias(sbi)) {
> Shouldn't this be?
> 
> 	if (f2fs_sb_has_device_alias(sbi) &&
> 			!ctx_test_opt(ctx, F2FS_MOUNT_READ_EXTENT_CACHE)) {
> 

Whoops, I don't know how I missed that, or how my testing missed it, sorry.
And maybe it should be later in the function so it doesn't interrupt the=
discard cases.
 
>> +		f2fs_err(sbi, "device aliasing requires extent cache");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!f2fs_hw_support_discard(sbi) && (ctx->opt_mask & F2FS_MOUNT_DISCARD)
>> +				&& ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
>        if (!f2fs_hw_support_discard(sbi) &&
>                        (ctx->opt_mask & F2FS_MOUNT_DISCARD) &&
>                        ctx_test_opt(ctx, F2FS_MOUNT_DISCARD)) {
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
