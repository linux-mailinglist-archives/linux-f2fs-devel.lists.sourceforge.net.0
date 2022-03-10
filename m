Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 618E44D3F3F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 03:23:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS8Sn-00026J-QV; Thu, 10 Mar 2022 02:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nS8Sm-00026D-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 02:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZaUzjj6R8SZFFlvdGrElwm3apXB5BJnxXh/P1tYC7Ik=; b=CWzFj5idxP9I71+1vUd5Xe3B4H
 IjCUMx2qxoIFN1BnnU9IU6S+4SQFHBNalCvaHPamVaXKPjFKhWuDEQmvwO1vflVPsMUkZcO8O1TSl
 WA9RCPLur6D7o0kr4ExaFkCNo27hclGeaqDD0LsALAFaROPveTtcOBkFTpX0CZesmbAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZaUzjj6R8SZFFlvdGrElwm3apXB5BJnxXh/P1tYC7Ik=; b=M/BtSNqbji/CV85Ha3U2Y+Mnsr
 j/QFJYr/nZP7Mbla/5k8ujyyCK2IdyL3E9xR6FkyqvCjJJ7YQVQ+sawjzuxqLGRHYJNKMzHWaQD7f
 Upf5oswz7faHfXb97VnK5amhUqmPJxKUOgI9JFo/jFfLUgbepBBYWvd6UyysDlqpsmS0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS8Sk-0001I3-26
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 02:23:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B79C6B8245D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Mar 2022 02:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E47CC340E8;
 Thu, 10 Mar 2022 02:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646879006;
 bh=vsCSujkruwQ7Gfz+lv2eJS9zTA2KT1+6Mo8i2mK76fU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=s7sxN+7u0bpUTbbknOA/0GbPsbkvU9jhhZ32AlvSJru8JUmhTvzO9m2GAEEErYOPa
 a5fyw2xeLNYmn1ZW8v0r5YQpUfnZNJF/Gmeypjj/HvvddQHitmnb4Z4R8F+F7goZod
 1G95VhY42nhxUM/LoeAErnbGI2iJwaysNqs7+Bo9p2iIKNZBBrCNiB/U78kvtLG2Hh
 3iGFWqy7zgmLshajCb/1sxdOjadwhnrFYAm6MSDZxw/KT+19yuHkQr9W0N+Bv9JS6L
 2WZ1Q645um0NlXNVJ1zv/84AUkoxMvz38CWEwtLB7xMw254ZDC6shS2zwsAMuEFNOl
 VZJxXKqcvC0DQ==
Message-ID: <7b12573b-cad4-45b0-9e8a-9cc40a08b856@kernel.org>
Date: Thu, 10 Mar 2022 10:23:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
 <20220309214834.3408741-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220309214834.3408741-2-jaegeuk@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/10 5:48,
 Jaegeuk Kim wrote: > [14696.634553] task:cat
 state:D stack: 0 pid:1613738 ppid:1613735 flags:0x00000004 > [14696.638285]
 Call Trace: > [14696.639038] <TASK> > [14696.640032] __sched [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS8Sk-0001I3-26
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: use spin_lock to avoid hang
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/10 5:48, Jaegeuk Kim wrote:
> [14696.634553] task:cat             state:D stack:    0 pid:1613738 ppid:1613735 flags:0x00000004
> [14696.638285] Call Trace:
> [14696.639038]  <TASK>
> [14696.640032]  __schedule+0x302/0x930
> [14696.640969]  schedule+0x58/0xd0
> [14696.641799]  schedule_preempt_disabled+0x18/0x30
> [14696.642890]  __mutex_lock.constprop.0+0x2fb/0x4f0
> [14696.644035]  ? mod_objcg_state+0x10c/0x310
> [14696.645040]  ? obj_cgroup_charge+0xe1/0x170
> [14696.646067]  __mutex_lock_slowpath+0x13/0x20
> [14696.647126]  mutex_lock+0x34/0x40
> [14696.648070]  stat_show+0x25/0x17c0 [f2fs]
> [14696.649218]  seq_read_iter+0x120/0x4b0
> [14696.650289]  ? aa_file_perm+0x12a/0x500
> [14696.651357]  ? lru_cache_add+0x1c/0x20
> [14696.652470]  seq_read+0xfd/0x140
> [14696.653445]  full_proxy_read+0x5c/0x80
> [14696.654535]  vfs_read+0xa0/0x1a0
> [14696.655497]  ksys_read+0x67/0xe0
> [14696.656502]  __x64_sys_read+0x1a/0x20
> [14696.657580]  do_syscall_64+0x3b/0xc0
> [14696.658671]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [14696.660068] RIP: 0033:0x7efe39df1cb2
> [14696.661133] RSP: 002b:00007ffc8badd948 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [14696.662958] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007efe39df1cb2
> [14696.664757] RDX: 0000000000020000 RSI: 00007efe399df000 RDI: 0000000000000003
> [14696.666542] RBP: 00007efe399df000 R08: 00007efe399de010 R09: 00007efe399de010
> [14696.668363] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000000000
> [14696.670155] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
> [14696.671965]  </TASK>
> [14696.672826] task:umount          state:D stack:    0 pid:1614985 ppid:1614984 flags:0x00004000
> [14696.674930] Call Trace:
> [14696.675903]  <TASK>
> [14696.676780]  __schedule+0x302/0x930
> [14696.677927]  schedule+0x58/0xd0
> [14696.679019]  schedule_preempt_disabled+0x18/0x30
> [14696.680412]  __mutex_lock.constprop.0+0x2fb/0x4f0
> [14696.681783]  ? destroy_inode+0x65/0x80
> [14696.683006]  __mutex_lock_slowpath+0x13/0x20
> [14696.684305]  mutex_lock+0x34/0x40
> [14696.685442]  f2fs_destroy_stats+0x1e/0x60 [f2fs]
> [14696.686803]  f2fs_put_super+0x158/0x390 [f2fs]
> [14696.688238]  generic_shutdown_super+0x7a/0x120
> [14696.689621]  kill_block_super+0x27/0x50
> [14696.690894]  kill_f2fs_super+0x7f/0x100 [f2fs]
> [14696.692311]  deactivate_locked_super+0x35/0xa0
> [14696.693698]  deactivate_super+0x40/0x50
> [14696.694985]  cleanup_mnt+0x139/0x190
> [14696.696209]  __cleanup_mnt+0x12/0x20
> [14696.697390]  task_work_run+0x64/0xa0
> [14696.698587]  exit_to_user_mode_prepare+0x1b7/0x1c0
> [14696.700053]  syscall_exit_to_user_mode+0x27/0x50
> [14696.701418]  do_syscall_64+0x48/0xc0
> [14696.702630]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Any race case here? I didn't catch the root cause here...
Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
