Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C3527678
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 May 2022 10:57:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqA4D-0004I8-KL; Sun, 15 May 2022 08:57:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nqA4C-0004I1-0B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 May 2022 08:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hewMJ/5zLYg2Gsx29rzFCEyLMYiP2qf92vFha0f4gQQ=; b=gIWqeINumvIUNgH6XTemNRfsBQ
 e5rdCl4hNwhF2uLIq87J2Ogn3el3HuHiSQaiHz7IaWkZSYNrMMbI64/tRMRUZvt2Sbq1urqQof+o0
 rQdODOun3C2SlO9Eh2RBFeiPDtdBLEX7bzs/NfJi4jM1nBGZa4E8tEawyztJenoYg/4I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hewMJ/5zLYg2Gsx29rzFCEyLMYiP2qf92vFha0f4gQQ=; b=gBMl5R8KyleU2NRRuMaMmFT8jA
 5KjWbtko+Wv4jrBFN5tPxC2sDYqJmOdQpn83JRmMeRU6l7VtMVl2iTfi00u41U0ZhXzS20NIlXhQR
 cOkYAdLFFp6pHrBoqYnAKh614q2AeWHiVpBY4duCM5RLtne0ne27ydzZl6yZm0XW5+sQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqA48-0000gU-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 May 2022 08:57:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85F5060EAC;
 Sun, 15 May 2022 08:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89667C385B8;
 Sun, 15 May 2022 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652605042;
 bh=VxFX7xx56JZzOHMNORrQI6bWg6BbNTRrh7GpU1e75ew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g/CZJvOU1p1ZrPXYrVQvy1DW6PuSKfsNt6Hx9SxbNQA3J2ffj1FQqyBsZOnvjHtAc
 yR9a1B18F8UujVdntyEYxjkx5KlnHFeXp9hcudsx+pqZG7tnFFs29u5o1k7urIEZlI
 lo4PfqtaJvVvziEDvfugt44I1pd8H9nymDOLW3oJ+ov37LNufRFT94ZDa2mu0/n3aq
 r3w+bt1E++P01OcXiIjagYV8Z8q879qGmu9NbeOv5Bbnwn2k249Wv55TVUAa3J3H8p
 WrIqcv7othwhF8lkpO9nqKORo4YDU2nXXnKPSQNGqDcwNOLXV7Ega173ZAXiFXk4Gu
 2bGbvqKrUl7gQ==
Message-ID: <6b316ed0-c5af-0157-b04a-4aea1c0b9143@kernel.org>
Date: Sun, 15 May 2022 16:57:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220514080102.2246-1-chao@kernel.org>
 <Yn+dLtxsy6LwVIBQ@debian.me>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yn+dLtxsy6LwVIBQ@debian.me>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/14 20:14, Bagas Sanjaya wrote: > On Sat, May 14,
 2022 at 04:01:02PM +0800, Chao Yu wrote: >> As Yanming reported in bugzilla:
 >> >> https://bugzilla.kernel.org/show_bug.cgi?id=215895 >> >> I [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqA48-0000gU-Tl
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check for inline
 inode
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>,
 jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/14 20:14, Bagas Sanjaya wrote:
> On Sat, May 14, 2022 at 04:01:02PM +0800, Chao Yu wrote:
>> As Yanming reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215895
>>
>> I have encountered a bug in F2FS file system in kernel v5.17.
>>
>> The kernel message is shown below:
>>
>> kernel BUG at fs/inode.c:611!
>> Call Trace:
>>   evict+0x282/0x4e0
>>   __dentry_kill+0x2b2/0x4d0
>>   dput+0x2dd/0x720
>>   do_renameat2+0x596/0x970
>>   __x64_sys_rename+0x78/0x90
>>   do_syscall_64+0x3b/0x90
>>
>> The root cause is: fuzzed inode has both inline_data flag and encrypted
>> flag, so after it was deleted by rename(), during f2fs_evict_inode(),
>> it will cause inline data conversion due to flags confilction, then
>> page cache will be polluted and trigger panic in clear_inode().
>>
>> This patch tries to fix the issue by do more sanity checks for inline
>> data inode in sanity_check_inode().
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> 
> Hi Chao,
> 
> I think the patch message can be reworked , like below:

Hi Bagas,

Thanks a lot for your cleanup. :)

> 
> Yanming reported a kernel bug in Bugzilla kernel, which can be reproduced.
> The bug message is:

I will keep the link for backtrace.

> 
> kernel BUG at fs/inode.c:611!
> Call Trace:
>   evict+0x282/0x4e0
>   __dentry_kill+0x2b2/0x4d0
>   dput+0x2dd/0x720
>   do_renameat2+0x596/0x970
>   __x64_sys_rename+0x78/0x90
>   do_syscall_64+0x3b/0x90
> 
> The bug is due to fuzzed inode has both inline_data and encrypted flags.
> During f2fs_evict_inode(), after the inode was deleted by rename(), it

I prefer "during f2fs_evict_inode(), as inode was deleted by rename()"

> will cause inline data conversion due to conflicting flags. The page
> cache will be polluted and the panic will be triggered in clear_inode().
> 
> Try fixing the bug by doing more sanity checks for inline data inode in
> sanity_check_inode().

Let me revise in v3.

Thanks,

> 
> Thanks.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
