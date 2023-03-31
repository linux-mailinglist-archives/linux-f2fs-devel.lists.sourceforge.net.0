Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D56D2246
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 16:23:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piFek-0006HY-V6;
	Fri, 31 Mar 2023 14:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tudor.ambarus@linaro.org>) id 1piFei-0006HR-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 14:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DALbSHEn4AqSZILtcopWk6ItUnpljvj/yr+9gMsLC6Q=; b=QOrgkbiH+Zt97NWq9OpHkDyefc
 YHdjua2abh5100EIdZ8aPpFxvCYK9m9t8BEkk3iE6eqqm15Co0ZrOHVr4cBP82UP+SGLTJjHGSey6
 LxqLqK5Fhot2XPUKgvJhxqXcV6ew6XuWY9C+bXlzxk6whTD/JLvDlt/e8K8FCecpD1Us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DALbSHEn4AqSZILtcopWk6ItUnpljvj/yr+9gMsLC6Q=; b=C1H4R9oVNhDk3rIxPlruHxqlQb
 7olTJ4COyoP4BT9jztbhDW1t50KJ4WEta+tPcsKXE3D1XV8DVrAN3uxsv0nayZEYw1Ph0yiI52yD3
 OXb5bqBK+5f9QqBkNVckY7LwkLUk3UqYWMLRgMpuh/9UsVWWyPPMc3lPTYBDQPR1dpEg=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1piFea-00AvoW-O3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 14:23:03 +0000
Received: by mail-ed1-f53.google.com with SMTP id eh3so90171232edb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Mar 2023 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680272570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DALbSHEn4AqSZILtcopWk6ItUnpljvj/yr+9gMsLC6Q=;
 b=OvOCpPtOH+9NxFOTq/R9b14rcLyyaA8lnRaHHFPPuLkxH3F/YDghfWgEVXJmiTYrHM
 vZD8zr08GIT5zuzE9ftaRWWVcDgpOM14VzyUqk0rqKoEfJ5R/NrfDdJ1blJvAB6UK/az
 sNSM9BlCq9ryuwatU6nvTl54xgH+DQkz3unVFRhJvTfJNaJe+1z9IejpuZ/4JSMUHO3/
 TaKuZYVKfYRPMsGlKCrVlolCdgtL/O4EivH5KeMyaIX2+s+FAdCXQRXWXbdgNSzI0vvv
 f+U0eFVETd+0l9v7ittCVzkOSp7R8w+LBCZ0PzhVuV5eaoGQqbZ81yRCZyVj+6D/nZpc
 JSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680272570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DALbSHEn4AqSZILtcopWk6ItUnpljvj/yr+9gMsLC6Q=;
 b=XzstlwaOeuzReRUGqkh/9gZDPBYX/+3xNBed5KrEE+OeiTnoMg6Z2chn6HahHelihx
 dzl/Ulkew54ym3Xe5ahNIK4E0B9vgMRaVkz0LjmRauNCL6bSOs9geXgmU8MflT2121rD
 0vV/D5Q7SKBTKFJrODoTPme8Wp03zwGFH8eNoLk6PbbQSg8bf8NoLP8/Z9ewnwBnnFfj
 OWfD5cNO30MWQpLpWq46auHe1gM+/396aBI3AsFNzk1uG9SPP2de0D3c6G1sZAVbOFAR
 DCfs5bazD29z6TA0XDTgXrNgqdXLMxBi00sXGP2Knetae6YfLPNZ8dHS9lnESnhtmSqD
 uwAQ==
X-Gm-Message-State: AAQBX9exqWlUpZVTF4z5UmkAxv5R0kNoK1m1GGHpgRuqBDHr8P62yPan
 xjejUPK/MX/yh2KrwJqopTIvow==
X-Google-Smtp-Source: AKy350a8XVvZ48xZMQYC78wiy/ZgV53SZYI4rk4oZhyHioBEZ8JOv3u/hLwfN9XG/5wXPj0wZUyDZA==
X-Received: by 2002:a05:6402:10d8:b0:4fb:2296:30b3 with SMTP id
 p24-20020a05640210d800b004fb229630b3mr26057313edu.15.1680272570271; 
 Fri, 31 Mar 2023 07:22:50 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a1709067cc300b0094776b4ef04sm1057862ejp.10.2023.03.31.07.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:22:49 -0700 (PDT)
Message-ID: <280400a1-2dfa-fc8f-92e0-0087b10b37e8@linaro.org>
Date: Fri, 31 Mar 2023 15:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 jaegeuk@kernel.org
References: <20220428181809.2352352-1-daeho43@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20220428181809.2352352-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi! On 4/28/22 19:18, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Current atomic write has three major issues like
 below. > - keeps the updates in non-reclaimable memory space and t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1piFea-00AvoW-O3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: change the current atomic write way
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
Cc: Lee Jones <joneslee@google.com>, Daeho Jeong <daehojeong@google.com>,
 syzbot <syzbot+b9c67110e04430822b08@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi!

On 4/28/22 19:18, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Current atomic write has three major issues like below.
>  - keeps the updates in non-reclaimable memory space and they are even
>    hard to be migrated, which is not good for contiguous memory
>    allocation.
>  - disk spaces used for atomic files cannot be garbage collected, so
>    this makes it difficult for the filesystem to be defragmented.
>  - If atomic write operations hit the threshold of either memory usage
>    or garbage collection failure count, All the atomic write operations
>    will fail immediately.
> 
> To resolve the issues, I will keep a COW inode internally for all the
> updates to be flushed from memory, when we need to flush them out in a
> situation like high memory pressure. These COW inodes will be tagged
> as orphan inodes to be reclaimed in case of sudden power-cut or system
> failure during atomic writes.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: removed inmem tracepoints. changed page flush timing. fixed hole
> handling.
> v3: removed unused atomic related page flag.
> ---
>  fs/f2fs/data.c              | 180 +++++++++++------
>  fs/f2fs/debug.c             |  12 +-
>  fs/f2fs/f2fs.h              |  33 +---
>  fs/f2fs/file.c              |  48 ++---
>  fs/f2fs/gc.c                |  27 +--
>  fs/f2fs/inode.c             |   3 +-
>  fs/f2fs/namei.c             |  28 ++-
>  fs/f2fs/node.c              |   4 -
>  fs/f2fs/node.h              |   1 -
>  fs/f2fs/segment.c           | 380 ++++++++++++------------------------
>  fs/f2fs/segment.h           |   4 +-
>  fs/f2fs/super.c             |   6 +-
>  include/trace/events/f2fs.h |  22 ---
>  13 files changed, 302 insertions(+), 446 deletions(-)

This patch fixes the bug reported at:
LINK:
https://syzkaller.appspot.com/bug?id=50ac8d898487cade14315bf673e8d74fd4716ecf

One may find the strace log at:
LINK: https://syzkaller.appspot.com/text?tag=CrashLog&x=11f5de2ac80000
and the C reproducer at:
LINK: https://syzkaller.appspot.com/text?tag=ReproC&x=111facdcc80000

The patch does not apply cleanly on stable/linux-5.15.y. Backporting the
patch is a bit risky for me as I'm not familiar with f2fs. I'm seeking
for some guidance. Is there a plan to backport this patch to Linux
stable? If not, shall I try to backport it? Would you advise me to try
to find all the prerequisite patches for this patch to apply cleanly on
stable/linux-5.15.y, or just to fix the conflicts?

Thanks,
ta


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
