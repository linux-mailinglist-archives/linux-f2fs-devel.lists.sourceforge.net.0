Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7339444FC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Nov 2021 08:42:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1miXOR-00059f-VI; Thu, 04 Nov 2021 07:42:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1miXOQ-00059Z-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Nov 2021 07:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWUSGfTl3ehybzTpMC2PLs+6m7GjjdzKJ5vfmy+56Qs=; b=Dqm/a2WQmKf+sY+NPGBwxETMQf
 JMJmVdXuCj2O0oEaWWveThm/GyE2bt/Q9mkQgyveq9O/JNaOGrcAKNrxUykE1PQ1g5hWjhyyWJPCm
 w5+KmqZxQibAV2KzS9SveIYAGO+gbPHIToLMaIHJ9dpjd9xClF2BcQL4uN7d3ouiytoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NWUSGfTl3ehybzTpMC2PLs+6m7GjjdzKJ5vfmy+56Qs=; b=YjZlBxm0+C5uDavMNb3qmbhUos
 HN+QHL9n7OnNXV36EQKfA9cLPhzVSPlcZG0g/F5xx5lBTDHYlB/pqupNgBpaetaEE7Row6MUaOR4G
 DkZnxbif0UIahSqtVUtRiFPS3uq3dYcqBNOiDBhNhkexhV1eSXViGBC/8DusmAwuwWe8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1miXOQ-0017XS-7n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Nov 2021 07:42:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB7B760E9C;
 Thu,  4 Nov 2021 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636011752;
 bh=f9b2147ZcHEg3YBYAtLQt1FHe0MReor1ntRmgB/y1F4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XSZ56pUy8PqqHGHqO8nGyi6AscjF07tkYejwXc8sVnsLVrz/9kjiC/rOWXm0awIku
 lADyOnpsRB8GgjiXws7hmBNqEWhCTKMQ/a8ReUHG5e3mbB705vGTsLyfok6/vunxNY
 1ePDfK7BcDFTd8eClnSC42i3wS23v2yMfciwYelW4xkrwBdIiKUnpuC8Q2+zZ1dWnS
 90g74D8reJQ5Vtmg4RiWg/XI0OphPMGiveJzZgPsranRlzmA5/zKyyjm+Ry2XanwMu
 qpy5hhTmEhy8S+hGdd+HWb4fWtbpuJhGUCyRkaG0s8uh0kTT+Z8MVEqhgEWjVLuTUY
 dLTXMCKVfEzQA==
Message-ID: <e2870f1b-14dd-bd8a-b997-0ab1e7110ef8@kernel.org>
Date: Thu, 4 Nov 2021 15:42:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Dongliang Mu <mudongliangabcd@gmail.com>
References: <20211103142228.1235864-1-mudongliangabcd@gmail.com>
 <bff77e5c-7e14-32c5-6ffe-78e35271532b@kernel.org>
 <CAD-N9QVq4Lc3gEe8yZw3bBWo3Yzf=K_+KXDratJp=oyXhS_gPg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAD-N9QVq4Lc3gEe8yZw3bBWo3Yzf=K_+KXDratJp=oyXhS_gPg@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/4 15:35, Dongliang Mu wrote: > On Thu, Nov 4, 2021
 at 3:16 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2021/11/3 22:22, Dongliang
 Mu wrote: >>> f2fs_fill_super >>> -> f2fs_build_segment_ma [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1miXOQ-0017XS-7n
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: fix UAF in
 f2fs_available_free_memory
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/4 15:35, Dongliang Mu wrote:
> On Thu, Nov 4, 2021 at 3:16 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/11/3 22:22, Dongliang Mu wrote:
>>> f2fs_fill_super
>>> -> f2fs_build_segment_manager
>>>      -> create_discard_cmd_control
>>>         -> f2fs_start_discard_thread
>>>
>>> It invokes kthread_run to create a thread and run issue_discard_thread.
>>>
>>> However, if f2fs_build_node_manager fails, the control flow goes to
>>> free_nm and calls f2fs_destroy_node_manager. This function will free
>>> sbi->nm_info. However, if issue_discard_thread accesses sbi->nm_info
>>> after the deallocation, but before the f2fs_stop_discard_thread, it will
>>> cause UAF(Use-after-free).
>>>
>>> -> f2fs_destroy_segment_manager
>>>      -> destroy_discard_cmd_control
>>>         -> f2fs_stop_discard_thread
>>>
>>> Fix this by switching the order of f2fs_build_segment_manager
>>> and f2fs_build_node_manager.
>>>
>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>>> ---
>>>    fs/f2fs/super.c | 16 ++++++++--------
>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 78ebc306ee2b..1a23b64cfb74 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -4135,18 +4135,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>>        }
>>>
>>>        /* setup f2fs internal modules */
>>> -     err = f2fs_build_segment_manager(sbi);
>>> -     if (err) {
>>> -             f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
>>> -                      err);
>>> -             goto free_sm;
>>> -     }
>>>        err = f2fs_build_node_manager(sbi);
>>>        if (err) {
>>>                f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
>>>                         err);
>>>                goto free_nm;
>>>        }
>>> +     err = f2fs_build_segment_manager(sbi);
>>> +     if (err) {
>>> +             f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
>>> +                      err);
>>> +             goto free_sm;
>>> +     }
>>>
>>>        /* For write statistics */
>>>        sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
>>> @@ -4351,10 +4351,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>>        sbi->node_inode = NULL;
>>>    free_stats:
>>>        f2fs_destroy_stats(sbi);
>>> -free_nm:
>>> -     f2fs_destroy_node_manager(sbi);
>>>    free_sm:
>>>        f2fs_destroy_segment_manager(sbi);
>>> +free_nm:
>>> +     f2fs_destroy_node_manager(sbi);
>>
>> IIRC, above two functions shouldn't not be called reversely due to some
>> resource dependency, Jaegeuk, please help to confirm this.
>>
>> So I suggest to call destroy_discard_cmd_control() before
>> f2fs_destroy_node_manager(), is it fine to you?
> 
> Maybe f2fs_stop_discard_thread is better than
> destroy_discard_cmd_control. It only stops the kthread, leading to
> fewer side effects.

Fine to me. :)

Thanks,

> 
> How do you think?
> 
>>
>> Thanks,
>>
>>>        f2fs_destroy_post_read_wq(sbi);
>>>    stop_ckpt_thread:
>>>        f2fs_stop_ckpt_thread(sbi);
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
