Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935ABE7E20
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Oct 2025 11:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axe9y8VCoSLytxO14IHwjAtQI2ICxF+WCzUXHWFxmFQ=; b=EzDWxNugloLLyUZE723UPgiXdL
	u1sAXaHsylCDvLfFgsxvMPq9LgmveKvfwnL9I5Q6lsSI4793f3ne1r2vFyfJ6FpEprPZea7qdEDBO
	0iZovta+ROzTD8brvQPQjrb0JrCAzc9V0ASZv53EOadRdeP3HaDyXUoNn8xXCxVT7OQQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9h43-0008Ue-Dn;
	Fri, 17 Oct 2025 09:47:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v9h41-0008UY-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dDvWTviDYTRtQgNOcNhBlVzc1u9kG68ulSqs2ApEoHE=; b=cLgpOQxSC1jpGBFaM18sg2yQ8w
 U51uSokU2uFaoVdjr+r35v7LZ7W8HHeYlmrXJtq/F4owRjxpVPBNK88RIdaZvV3b0/T+LEE/3Qovs
 SLSrVsOPp7grC8/D9PriiQy9Vr7s4t6E29gwlsV2Hx4QV+HgFbQ3SpfHURYUV4jmKf0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dDvWTviDYTRtQgNOcNhBlVzc1u9kG68ulSqs2ApEoHE=; b=dbW+6sajpJ9Oji2o16kDo1rhRg
 nNsUrSFKG4lCFS3FQmX6CTAUHAk+WtUerK4IiBOdM8otGA9tE3UJ8x3TlZuAVFHkpGF81Fo8ly1Hr
 ga4XnBoNSG7S2bMAN0H2awp+7gRvdWnAJ/qfq52v1DxYmj/0K9OeKSlxWAyvwiX3vDPo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9h41-00044y-4l for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 09:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6C6CE604C9;
 Fri, 17 Oct 2025 09:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00624C4CEE7;
 Fri, 17 Oct 2025 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760694466;
 bh=TgohWvrr8PPcueUdJIB8RPjo736OQrsal4Ke867tpaE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CgzB5jNGATGcNf741gRjhmva5S4P6nntGbmy77yPZX+dr3vBP0NmnuNMcYfVEdZXH
 Qiowd0Y+zH2AWsFNci2ZtP72GBz7qIuaJVw+V0ITGWcCkDtTX56mWwgtIrwcsVNTy/
 AsruebVqs8yGKtGZAqNBMdN/6C8UKzPZEd/jizJScSLNJjD+S8BWnIGIejpxYFP4ti
 ugrK1qX0Yk9sDAePMUd8XzcnyPJSRBRuYDrKaMVw/6dul0LqhuYlwm19vehovyrY1k
 eNqSStlm+lDqhQSIzRQ1lGS36FBPzZm8G41e8Cxs5Z2f5VA80aWYsJdTOXV2GxU3q4
 GRq9SyzjQc/RA==
Message-ID: <b4a0af34-bd8b-4130-a96f-6aacbe0fb576@kernel.org>
Date: Fri, 17 Oct 2025 17:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Jan Prusakowski <jprusakowski@google.com>
References: <20251006084615.2585252-1-jprusakowski@google.com>
 <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
 <aOkuA_Ffq2klE5g6@google.com>
 <ac1bcf67-cc5f-4288-a2f3-c4fb6013c38a@kernel.org>
 <aPEvpeM_cXWcxcZe@google.com>
Content-Language: en-US
In-Reply-To: <aPEvpeM_cXWcxcZe@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/17/2025 1:47 AM, Jaegeuk Kim wrote: > On 10/11, Chao
 Yu wrote: >> On 10/11/25 00:02, Jaegeuk Kim wrote: >>> On 10/09, Chao Yu
 wrote: >>>> On 10/6/2025 4:46 PM, Jan Prusakowski via Linux-f2fs-dev [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9h41-00044y-4l
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure node page reads complete before
 f2fs_put_super() finishes
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

On 10/17/2025 1:47 AM, Jaegeuk Kim wrote:
> On 10/11, Chao Yu wrote:
>> On 10/11/25 00:02, Jaegeuk Kim wrote:
>>> On 10/09, Chao Yu wrote:
>>>> On 10/6/2025 4:46 PM, Jan Prusakowski via Linux-f2fs-devel wrote:
>>>>> Xfstests generic/335, generic/336 sometimes crash with the following message:
>>>>>
>>>>> F2FS-fs (dm-0): detect filesystem reference count leak during umount, type: 9, count: 1
>>>>> ------------[ cut here ]------------
>>>>> kernel BUG at fs/f2fs/super.c:1939!
>>>>> Oops: invalid opcode: 0000 [#1] SMP NOPTI
>>>>> CPU: 1 UID: 0 PID: 609351 Comm: umount Tainted: G        W           6.17.0-rc5-xfstests-g9dd1835ecda5 #1 PREEMPT(none)
>>>>> Tainted: [W]=WARN
>>>>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>>>>> RIP: 0010:f2fs_put_super+0x3b3/0x3c0
>>>>> Call Trace:
>>>>>    <TASK>
>>>>>    generic_shutdown_super+0x7e/0x190
>>>>>    kill_block_super+0x1a/0x40
>>>>>    kill_f2fs_super+0x9d/0x190
>>>>>    deactivate_locked_super+0x30/0xb0
>>>>>    cleanup_mnt+0xba/0x150
>>>>>    task_work_run+0x5c/0xa0
>>>>>    exit_to_user_mode_loop+0xb7/0xc0
>>>>>    do_syscall_64+0x1ae/0x1c0
>>>>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>    </TASK>
>>>>> ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> It appears that sometimes it is possible that f2fs_put_super() is called before
>>>>> all node page reads are completed.
>>>>> Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.
>>>>>
>>>>> Fixes: bf22c3cc8ce7 ("f2fs: fix the panic in do_checkpoint()")
>>>>>
>>>>> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
>>>>> ---
>>>>>    fs/f2fs/super.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>>> index 1e0678e37a30..5c94bc42b8a1 100644
>>>>> --- a/fs/f2fs/super.c
>>>>> +++ b/fs/f2fs/super.c
>>>>> @@ -1976,6 +1976,7 @@ static void f2fs_put_super(struct super_block *sb)
>>>>>    	f2fs_flush_merged_writes(sbi);
>>>>>    	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>>>>> +	f2fs_wait_on_all_pages(sbi, F2FS_RD_NODE);
>>>>
>>>> Jan,
>>>>
>>>> At this stage, GC and checkpoint are both stopped, why there is still read
>>>> IOs on node page? Who is reading node page? Can you please dig more details
>>>> for this issue?
>>>
>>> We don't actually wait for completing read IOs. So, I think it doesn't matter
>>> the threads are stopped?
>>
>> Read on node page should be synchronous? so if the threads are stopped, there
>> should be no node IOs? Oh, Or there is still pending asynchronous readahead IO
>> on node page after all threads are stopped?
> 
> I remember we submit IOs and wait for its completion when we need by lock_page.

We also support readahead on page from meta_inode and common inode, so how about
waiting for all potential inflight read IOs?

In addtion, f2fs_wait_on_all_pages() is used for write path, how about simplifying
as below?

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4c7da160ca27..ea731f8bf19c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1983,6 +1983,12 @@ static void f2fs_put_super(struct super_block *sb)

  	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);

+	/* wait for potential inflight readahead IOs */
+	for (i = F2FS_RD_DATA; i <= F2FS_RD_META; i++) {
+		while (get_pages(sbi, i))
+			io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+	}
+
  	if (err || f2fs_cp_error(sbi)) {
  		truncate_inode_pages_final(NODE_MAPPING(sbi));
  		truncate_inode_pages_final(META_MAPPING(sbi));
-- 
2.40.1

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>    	if (err || f2fs_cp_error(sbi)) {
>>>>>    		truncate_inode_pages_final(NODE_MAPPING(sbi));



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
