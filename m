Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDgDEoXZ3GmcWQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:54:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1D3EB98B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLUkvNyUZD5GA1kRG7GYXv1rZi+RlaXGp42ppL+OujU=; b=Z9CbVWLWHJGuB1e3WZZhFXpFOJ
	UMoWGhdyVrRBHmyksbJYjj5vTZK6kzhsIhFo9CdXsx4EYAQtBo5e6H0kS/I8FtactH1pRRyNhzjL+
	SJ3g+16X6R8sJwAqa7Vzfat89HE/jJkuZ1m9wp8eQCx3X6i97cGBortInWUDMJcnSElI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCFsA-0007Nv-Vf;
	Mon, 13 Apr 2026 11:54:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCFs9-0007Np-D4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fl6r2Px2FE57kecv4pilGff2O5FFtZl7aLNqsSpgVa4=; b=HdVW3U27B4i2kQo7uX8M+1cyaZ
 CDyJpEbh0Ott1r66G8f1zsIKLYKeHjiZk47QrKShowX2GYTIV4eIrymeKsof1LSspxcDToQ3SzVfl
 2RgLyZNeHvtUHCFVroC6WLRhBzsUwimkosGPu/KajANJNbbtVczVfVcErQVkxB8w5lHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fl6r2Px2FE57kecv4pilGff2O5FFtZl7aLNqsSpgVa4=; b=ZcWkK/BW2UP5cKb3m8Uu/XS7IG
 gJzs5/QANvJKfZDC/U4ujvIaexBPfm+0EQ9exefoOq0xlkRm7sPFavJ5ozkNRpWTUbkdKDvpZhldl
 x5di/stqHwwtwRtccqLxkVqm1lpFPv6OYJ3ew+IcQl96q7lhqKYSrAjX6uw88opGgYkU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCFs8-0004rn-G1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DAFF660180;
 Mon, 13 Apr 2026 11:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DFAC116C6;
 Mon, 13 Apr 2026 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776081266;
 bh=7rzEirGAaiibBl9sqteOnX5vt/DO959nElOqrV0o52M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=C7Qan1bb6H8XAQqzqQxh59DuBfJ5XozKp94RVvu+WY5jIIi4Grkgh8Zbbz0H+vh6R
 CUypwbkRCX9JwsiR8WdsNfJsYFW3tWT4F5MuNtwDh4ZHDJ3zxawoRay29PQ5DgvihM
 tQ/LcwO1bOHau3Ze7nnL6sldQVZmb4IkAYJfdpCErky8f8vnjQlEQGB3Dm78h00aZl
 qskWixZU9ztdqzCSyafQuqtHsEGPGPwG4e7gUjUigqUffkrGsoLA0nf45QyNlTm/yS
 d7pmkNwCVPER//wxGexZLqv1K0mYtrqGtO7SrIYfObrCO6xVVYzxYWn8bAp2G8o1mc
 l6c5p+F2OarsQ==
Message-ID: <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
Date: Mon, 13 Apr 2026 19:54:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaosen He <xiaosen.he@oss.qualcomm.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/10/2026 6:53 PM, Xiaosen He wrote: > kworker/u32:7(f2fs
 writeback thread) was trying to acquire > sbi->writepages, the mutex was
 already acquired by emulated;0. > kworker/u32:7 tried to flush plu [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCFs8-0004rn-G1
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix deadlock in serializing io
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
Cc: can.guo@oss.qualcomm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaosen.he@oss.qualcomm.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 8CA1D3EB98B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/2026 6:53 PM, Xiaosen He wrote:
> kworker/u32:7(f2fs writeback thread) was trying to acquire
> sbi->writepages, the mutex was already acquired by emulated;0.
> kworker/u32:7 tried to flush plugged IO before sleep, during
> flushing plug list, kworker/u32:7 got preempted in RCU read-side
> critical section and got scheduled out waiting to be woken up by
> the release of mutex. emulated;0 was blocked on blk_mq_get_tag
> as there was no available tag and expected the previous IO
> requests to be handled by UFS host to release tags, but UFS host
> was blocked on synchronize_rcu waiting for ending of RCU grace
> period. the deadlock was caused by writeback thread was stuck in
> RCU critical section waiting for mutex. call blk_flush_plug() if
> mutex_trylock(&sbi->writepages) failed, so that the plug list is
> empty when blk_flush_plug() is called in sched_submit_work to
> fix the deadlock.

IMO, look more like a common bug? otherwise, sounds like we can not
grab mutex lock w/ mutex_lock directly during writeback in .writepages?

> 
>      Task name: kworker/u32:7    [affinity: 0xff] pid:    233 tgid:    233 cpu: 6 prio: 98 start: 0xffffff8099390040
>      state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc083c48000
>      Last_enqueued_ts:     390.169395877 Last_sleep_ts:     389.756639574
>      Stack:
>      [<ffffffd3a0b1d254>] __switch_to+0x214
>      [<ffffffd3a0b1deb8>] __schedule+0xa30
>      [<ffffffd3a0b1e754>] preempt_schedule_notrace+0x68
>      [<ffffffd39f9ddf38>] rcu_is_watching[jt]+0x5c
>      [<ffffffd39f9995b8>] lock_acquire+0x68
>      [<ffffffd39ffe870c>] rcu_lock_acquire+0x34
>      [<ffffffd39ffe8764>] percpu_ref_put_many+0x20
>      [<ffffffd39ffe3a64>] blk_mq_dispatch_list+0x570
>      [<ffffffd39ffe3264>] blk_mq_flush_plug_list+0x13c
>      [<ffffffd39ffd43a8>] __blk_flush_plug+0x11c

It tries to flush plug list inside mutex_lock() and then be blocked. Will it cause
the same issue w/ your below implementation:

if (!mutex_trylock(&sbi->writepages))
	blk_flush_plug(((struct task_struct *)current)->plug, true); <--- here
...
mutex_lock(&sbi->writepages);

Let me know if I'm missing anything.

Thanks,

>      [<ffffffd39f93e6c4>] sched_submit_work+0x78
>      [<ffffffd3a0b1e4d8>] schedule+0x38
>      [<ffffffd3a0b1e5c4>] schedule_preempt_disabled+0x18
>      [<ffffffd3a0b20c7c>] __mutex_lock_common+0xab8
>      [<ffffffd3a0b20084>] mutex_lock_nested+0x2c
>      [<ffffffd39feea72c>] f2fs_write_data_pages+0xd64
>      [<ffffffd39fbb3958>] do_writepages+0xd4
>      [<ffffffd39fd09fd8>] __writeback_single_inode+0x78
>      [<ffffffd39fd09958>] writeback_sb_inodes+0x2b8
>      [<ffffffd39fd09cc0>] __writeback_inodes_wb+0xa0
>      [<ffffffd39fd09054>] wb_writeback+0x188
>      [<ffffffd39fd066d0>] wb_workfn[jt]+0x438
>      [<ffffffd39f9198e0>] process_one_work+0x27c
>      [<ffffffd39f91baf8>] worker_thread+0x358
>      [<ffffffd39f924534>] kthread+0x150
>      [<ffffffd39f830e44>] ret_from_fork+0x10
> 
>      Task name: kworker/u32:2    [affinity: 0xff] pid:     90 tgid:     90 cpu: 1 prio: 120 start: 0xffffff80adae8040
>      state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc080a18000
>      Last_enqueued_ts:     389.899608637 Last_sleep_ts:     389.899665303
>      Stack:
>      [<ffffffd3a0b1d254>] __switch_to+0x214
>      [<ffffffd3a0b1deb8>] __schedule+0xa30
>      [<ffffffd3a0b1e4e8>] schedule+0x48
>      [<ffffffd39f9dfa64>] synchronize_rcu_expedited+0x928
>      [<ffffffd39f9deeb0>] synchronize_rcu[jt]+0x234
>      [<ffffffd39ffde5d4>] blk_mq_quiesce_tagset[jt]+0xa8
>      [<ffffffd3a061cd90>] ufshcd_devfreq_scale+0x90
>      [<ffffffd3a061ca6c>] ufshcd_devfreq_target+0x204
>      [<ffffffd3a06de244>] devfreq_set_target+0xb8
>      [<ffffffd3a06de14c>] devfreq_update_target[jt]+0xd8
>      [<ffffffd3a06de5e8>] devfreq_monitor+0x38
>      [<ffffffd39f9198e0>] process_one_work+0x27c
>      [<ffffffd39f91baf8>] worker_thread+0x358
>      [<ffffffd39f924534>] kthread+0x150
>      [<ffffffd39f830e44>] ret_from_fork+0x10
> 
>      Task name: emulated;0       [affinity: 0xff] pid:   5245 tgid:   4922 cpu: 6 prio: 120 start: 0xffffff89e2e60040
>      state: 0x2[D] exit_state: 0x0 stack base: 0xffffffc0d42f8000
>      Last_enqueued_ts:     390.169395877 Last_sleep_ts:     390.178459731
>      Stack:
>      [<ffffffd3a0b1d254>] __switch_to+0x214
>      [<ffffffd3a0b1deb8>] __schedule+0xa30
>      [<ffffffd3a0b1e4e8>] schedule+0x48
>      [<ffffffd3a0b1e8f4>] io_schedule+0x38
>      [<ffffffd39ffeb110>] blk_mq_get_tag+0x1a4
>      [<ffffffd39ffdedc8>] __blk_mq_alloc_requests+0x358
>      [<ffffffd39ffe409c>] blk_mq_submit_bio+0x50c
>      [<ffffffd39ffd4cb8>] __submit_bio[jt]+0x164
>      [<ffffffd39ffd2e7c>] submit_bio_noacct_nocheck+0x14c
>      [<ffffffd39ffd3394>] submit_bio_noacct+0x330
>      [<ffffffd39ffd3814>] submit_bio+0x1f4
>      [<ffffffd39fee2ba8>] f2fs_submit_write_bio+0x88
>      [<ffffffd39fee413c>] __submit_merged_bio[jt]+0xbc
>      [<ffffffd39fee3c4c>] f2fs_submit_page_write+0x400
>      [<ffffffd39ff04aac>] do_write_page+0x180
>      [<ffffffd39ff04ca0>] f2fs_outplace_write_data+0x78
>      [<ffffffd39fee88d4>] f2fs_do_write_data_page+0x390
>      [<ffffffd39fee8df0>] f2fs_write_single_data_page+0x1e0
>      [<ffffffd39feea288>] f2fs_write_data_pages+0x8c0
>      [<ffffffd39fbb3958>] do_writepages+0xd4
>      [<ffffffd39fba153c>] __filemap_fdatawrite_range+0x94
>      [<ffffffd39fbb0370>] generic_fadvise+0x1d8
>      [<ffffffd39feabaa0>] f2fs_file_fadvise+0x124
>      [<ffffffd39fbb0570>] __arm64_sys_fadvise64_64+0x70
>      [<ffffffd39f847e7c>] invoke_syscall+0x58
>      [<ffffffd39f847da4>] el0_svc_common[jt]+0xb8
>      [<ffffffd39f847d18>] do_el0_svc+0x1c
>      [<ffffffd3a0b14fac>] el0_svc+0x40
>      [<ffffffd3a0b14ef8>] el0t_64_sync_handler[jt]+0xd0
>      [<ffffffd39f8116a0>] ret_to_user[jt]+0x0
> 
> Signed-off-by: Xiaosen He <xiaosen.he@oss.qualcomm.com>
> ---
>   fs/f2fs/data.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 338df7a2aea6..c8e81f63fe73 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3585,7 +3585,13 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>   	}
>   
>   	if (__should_serialize_io(inode, wbc)) {
> +		if (!mutex_trylock(&sbi->writepages))
> +			blk_flush_plug(((struct task_struct *)current)->plug, true);
> +		else
> +			goto set_locked;
> +
>   		mutex_lock(&sbi->writepages);
> +set_locked:
>   		locked = true;
>   	}
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
