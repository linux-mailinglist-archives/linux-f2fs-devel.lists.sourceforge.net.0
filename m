Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F765729D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jul 2022 01:22:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oBPD8-0000c1-CP; Tue, 12 Jul 2022 23:22:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <technoboy85@gmail.com>) id 1oBPD7-0000bv-6P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 23:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X42MLOytS0K6fAjERwIElrrf2Luvcwf2t1d5hR5leo0=; b=Z/fKEQC7amefB1pXHK5kM05LGd
 z+3HFJKmvTD+c0V+2fUecPJ4GsD3+efuOvo/Q05dMTNFBxe/7m8IEKA4/Td8jNOoBJbAkvAH+UcAn
 HR65P312ce7k/tdxdqIsQql7/Ey/ZAw9Ghp5PTKYiNjl13Iw6VhDr4uc/IjJNNxtgcoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X42MLOytS0K6fAjERwIElrrf2Luvcwf2t1d5hR5leo0=; b=eqoENnBMXemp2CEenT5jbznGXU
 Oi6jU74Zq2SG5GczX0TLFMtFkARgcsAlIP/oXdwZBZvkgUoRTAZ742OlxxziI/m8PM1VuGLA5Tgha
 BYEvtWNegxOLhkAMGxLQCd7ijFlalyqrrHcWFUX8cB3PrLD7PfvaLB0Wtcd9cOd6vJw8=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oBPD4-00FARu-Us
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 23:22:32 +0000
Received: by mail-ej1-f45.google.com with SMTP id ez10so16946117ejc.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Jul 2022 16:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=X42MLOytS0K6fAjERwIElrrf2Luvcwf2t1d5hR5leo0=;
 b=5TGRqK9aBKettcYX94jwKCUtsXqlK4sSgEB2Lh/fei/vcoSKwTVkKmpUPMPxdsBbAq
 hLqTZmNsb8IASTHBEBpbkd3G3u5d86XSi31+tC8xDJ46YDBe9b69jKg7ptLg1aCXP+uo
 XditebkjXjO45wAinCm1WQLRjsekwo4CmgZUMdC3vNDdsjywVbo9/nkuKoqSwCDdHEXo
 etPU7Pl4uGPm0oj8NroIApXRc6Djde8QOMHZtLqTdY5c7D+DdRLIj5fqEHlgNuSbphZP
 Ktv5z6+/8jI8cWv1VEeb1LFHeg8G63efxrive1X5FfuyHqvRx2wNGYfuxfJ33cVdL8qU
 cp6Q==
X-Gm-Message-State: AJIora9d3zUh/N+Nn+LL53Dtjx+mhgEZek4kF79b2oF4ypQYDDYzXNWz
 ooJ/qOsYSR2tN9vihMqjfnY=
X-Google-Smtp-Source: AGRyM1suBYMTJW/aeeJK3GnQr+X5ULjX+/2k0sEVmB6OGhacnViKGabFZcYvY/zwevI/uCJkBVVGXw==
X-Received: by 2002:a17:907:7627:b0:72a:9098:e4d3 with SMTP id
 jy7-20020a170907762700b0072a9098e4d3mr492980ejc.389.1657668144248; 
 Tue, 12 Jul 2022 16:22:24 -0700 (PDT)
Received: from t490s (net-93-144-152-177.cust.vodafonedsl.it. [93.144.152.177])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b00722e771007fsm4220920ejk.37.2022.07.12.16.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 16:22:23 -0700 (PDT)
Date: Wed, 13 Jul 2022 01:22:18 +0200
From: Matteo Croce <mcroce@linux.microsoft.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20220713012218.292a3816@t490s>
In-Reply-To: <20220506013306.3563504-1-chao@kernel.org>
References: <20220506013306.3563504-1-chao@kernel.org>
Organization: Microsoft
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 6 May 2022 09:33:06 +0800 Chao Yu <chao@kernel.org>
 wrote: > As Yanming reported in bugzilla: > >
 https://bugzilla.kernel.org/show_bug.cgi?id=215916
 > > The kernel message is shown below: > > kernel BUG at
 fs/f2fs/segment.c:2560! > Call Trace: > allocate_segm [...] 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [technoboy85[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [technoboy85[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1oBPD4-00FARu-Us
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to do sanity check on
 total_data_blocks
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
Cc: jaegeuk@kernel.org, Ming Yan <yanming@tju.edu.cn>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri,  6 May 2022 09:33:06 +0800
Chao Yu <chao@kernel.org> wrote:

> As Yanming reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215916
> 
> The kernel message is shown below:
> 
> kernel BUG at fs/f2fs/segment.c:2560!
> Call Trace:
>  allocate_segment_by_default+0x228/0x440
>  f2fs_allocate_data_block+0x13d1/0x31f0
>  do_write_page+0x18d/0x710
>  f2fs_outplace_write_data+0x151/0x250
>  f2fs_do_write_data_page+0xef9/0x1980
>  move_data_page+0x6af/0xbc0
>  do_garbage_collect+0x312f/0x46f0
>  f2fs_gc+0x6b0/0x3bc0
>  f2fs_balance_fs+0x921/0x2260
>  f2fs_write_single_data_page+0x16be/0x2370
>  f2fs_write_cache_pages+0x428/0xd00
>  f2fs_write_data_pages+0x96e/0xd50
>  do_writepages+0x168/0x550
>  __writeback_single_inode+0x9f/0x870
>  writeback_sb_inodes+0x47d/0xb20
>  __writeback_inodes_wb+0xb2/0x200
>  wb_writeback+0x4bd/0x660
>  wb_workfn+0x5f3/0xab0
>  process_one_work+0x79f/0x13e0
>  worker_thread+0x89/0xf60
>  kthread+0x26a/0x300
>  ret_from_fork+0x22/0x30
> RIP: 0010:new_curseg+0xe8d/0x15f0
> 
> The root cause is: ckpt.valid_block_count is inconsistent with SIT
> table, stat info indicates filesystem has free blocks, but SIT table
> indicates filesystem has no free segment.
> 
> So that during garbage colloection, it triggers panic when LFS
> allocator fails to find free segment.
> 
> This patch tries to fix this issue by checking consistency in between
> ckpt.valid_block_count and block accounted from SIT.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
> v4:
> - fix to set data/node type correctly.
>  fs/f2fs/segment.c | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 3a3e2cec2ac4..4735d477059d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4461,7 +4461,8 @@ static int build_sit_entries(struct
> f2fs_sb_info *sbi) unsigned int i, start, end;
>  	unsigned int readed, start_blk = 0;
>  	int err = 0;
> -	block_t total_node_blocks = 0;
> +	block_t sit_valid_blocks[2] = {0, 0};
> +	int type;
>  
>  	do {
>  		readed = f2fs_ra_meta_pages(sbi, start_blk,
> BIO_MAX_VECS, @@ -4486,8 +4487,9 @@ static int
> build_sit_entries(struct f2fs_sb_info *sbi) if (err)
>  				return err;
>  			seg_info_from_raw_sit(se, &sit);
> -			if (IS_NODESEG(se->type))
> -				total_node_blocks +=
> se->valid_blocks; +
> +			type = IS_NODESEG(se->type) ? NODE : DATA;
> +			sit_valid_blocks[type] += se->valid_blocks;
>  
>  			if (f2fs_block_unit_discard(sbi)) {
>  				/* build discard map only one time */
> @@ -4527,15 +4529,17 @@ static int build_sit_entries(struct
> f2fs_sb_info *sbi) sit = sit_in_journal(journal, i);
>  
>  		old_valid_blocks = se->valid_blocks;
> -		if (IS_NODESEG(se->type))
> -			total_node_blocks -= old_valid_blocks;
> +
> +		type = IS_NODESEG(se->type) ? NODE : DATA;
> +		sit_valid_blocks[type] -= old_valid_blocks;
>  
>  		err = check_block_count(sbi, start, &sit);
>  		if (err)
>  			break;
>  		seg_info_from_raw_sit(se, &sit);
> -		if (IS_NODESEG(se->type))
> -			total_node_blocks += se->valid_blocks;
> +
> +		type = IS_NODESEG(se->type) ? NODE : DATA;
> +		sit_valid_blocks[type] += se->valid_blocks;
>  
>  		if (f2fs_block_unit_discard(sbi)) {
>  			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG))
> { @@ -4557,13 +4561,24 @@ static int build_sit_entries(struct
> f2fs_sb_info *sbi) }
>  	up_read(&curseg->journal_rwsem);
>  
> -	if (!err && total_node_blocks != valid_node_count(sbi)) {
> +	if (err)
> +		return err;
> +
> +	if (sit_valid_blocks[NODE] != valid_node_count(sbi)) {
>  		f2fs_err(sbi, "SIT is corrupted node# %u vs %u",
> -			 total_node_blocks, valid_node_count(sbi));
> -		err = -EFSCORRUPTED;
> +			 sit_valid_blocks[NODE],
> valid_node_count(sbi));
> +		return -EFSCORRUPTED;
>  	}
>  
> -	return err;
> +	if (sit_valid_blocks[DATA] + sit_valid_blocks[NODE] >
> +				valid_user_blocks(sbi)) {
> +		f2fs_err(sbi, "SIT is corrupted data# %u %u vs %u",
> +			 sit_valid_blocks[DATA],
> sit_valid_blocks[NODE],
> +			 valid_user_blocks(sbi));
> +		return -EFSCORRUPTED;
> +	}
> +
> +	return 0;
>  }
>  
>  static void init_free_segmap(struct f2fs_sb_info *sbi)

Hi all,

I'm experiencing this with kernel 5.18.5:

[1774085.200363] rcu: INFO: rcu_sched self-detected stall on CPU
[1774085.206139] rcu:   1-....: (2099 ticks this GP) idle=a7f/1/0x4000000000000000 softirq=6435692/6435692 fqs=977 
[1774085.216272]        (t=2101 jiffies g=30461565 q=289)
[1774085.216276] Task dump for CPU 1:
[1774085.216278] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774085.216285] Call trace:
[1774085.216287]  dump_backtrace.part.0+0xb4/0xc0
[1774085.216299]  show_stack+0x14/0x30
[1774085.216304]  sched_show_task+0x130/0x160
[1774085.216309]  dump_cpu_task+0x40/0x4c
[1774085.216313]  rcu_dump_cpu_stacks+0xec/0x130
[1774085.216317]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774085.216321]  update_process_times+0x98/0x180
[1774085.216324]  tick_sched_timer+0x54/0xd0
[1774085.216329]  __hrtimer_run_queues+0x134/0x2d0
[1774085.216333]  hrtimer_interrupt+0x110/0x2c0
[1774085.216336]  arch_timer_handler_phys+0x28/0x40
[1774085.216342]  handle_percpu_devid_irq+0x84/0x1c0
[1774085.216348]  generic_handle_domain_irq+0x28/0x40
[1774085.216352]  gic_handle_irq+0x58/0x80
[1774085.216357]  call_on_irq_stack+0x2c/0x3c
[1774085.216360]  do_interrupt_handler+0x78/0x84
[1774085.216364]  el1_interrupt+0x30/0x50
[1774085.216368]  el1h_64_irq_handler+0x14/0x20
[1774085.216371]  el1h_64_irq+0x64/0x68
[1774085.216374]  __filemap_get_folio+0xa0/0x3b0
[1774085.216378]  pagecache_get_page+0x18/0x70
[1774085.216383]  grab_cache_page_write_begin+0x20/0x30
[1774085.216388]  f2fs_get_read_data_page+0x3c/0x480
[1774085.216392]  f2fs_get_lock_data_page+0x3c/0x260
[1774085.216395]  move_data_page+0x34/0x530
[1774085.216398]  do_garbage_collect+0xc54/0x12e0
[1774085.216401]  f2fs_gc+0x3b4/0x800
[1774085.216404]  gc_thread_func+0x4c8/0x640
[1774085.216407]  kthread+0xd0/0xe0
[1774085.216411]  ret_from_fork+0x10/0x20
[1774115.558533] rcu: INFO: rcu_sched self-detected stall on CPU
[1774115.564309] rcu:   1-....: (2099 ticks this GP) idle=be7/1/0x4000000000000000 softirq=6435694/6435694 fqs=1016 
[1774115.574528]        (t=2101 jiffies g=30461569 q=847)
[1774115.574532] Task dump for CPU 1:
[1774115.574534] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774115.574541] Call trace:
[1774115.574543]  dump_backtrace.part.0+0xb4/0xc0
[1774115.574555]  show_stack+0x14/0x30
[1774115.574559]  sched_show_task+0x130/0x160
[1774115.574564]  dump_cpu_task+0x40/0x4c
[1774115.574569]  rcu_dump_cpu_stacks+0xec/0x130
[1774115.574572]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774115.574576]  update_process_times+0x98/0x180
[1774115.574580]  tick_sched_timer+0x54/0xd0
[1774115.574584]  __hrtimer_run_queues+0x134/0x2d0
[1774115.574587]  hrtimer_interrupt+0x110/0x2c0
[1774115.574590]  arch_timer_handler_phys+0x28/0x40
[1774115.574596]  handle_percpu_devid_irq+0x84/0x1c0
[1774115.574603]  generic_handle_domain_irq+0x28/0x40
[1774115.574606]  gic_handle_irq+0x58/0x80
[1774115.574611]  call_on_irq_stack+0x2c/0x3c
[1774115.574615]  do_interrupt_handler+0x78/0x84
[1774115.574618]  el1_interrupt+0x30/0x50
[1774115.574623]  el1h_64_irq_handler+0x14/0x20
[1774115.574626]  el1h_64_irq+0x64/0x68
[1774115.574629]  f2fs_is_valid_blkaddr+0x184/0x310
[1774115.574633]  f2fs_get_read_data_page+0x80/0x480
[1774115.574637]  f2fs_get_lock_data_page+0x3c/0x260
[1774115.574640]  move_data_page+0x34/0x530
[1774115.574643]  do_garbage_collect+0xc54/0x12e0
[1774115.574646]  f2fs_gc+0x3b4/0x800
[1774115.574649]  gc_thread_func+0x4c8/0x640
[1774115.574652]  kthread+0xd0/0xe0
[1774115.574655]  ret_from_fork+0x10/0x20
[1774178.604732] rcu: INFO: rcu_sched self-detected stall on CPU
[1774178.610507] rcu:   1-....: (8404 ticks this GP) idle=be7/1/0x4000000000000000 softirq=6435694/6435694 fqs=3918 
[1774178.620727]        (t=8406 jiffies g=30461569 q=2117)
[1774178.620730] Task dump for CPU 1:
[1774178.620732] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774178.620739] Call trace:
[1774178.620741]  dump_backtrace.part.0+0xb4/0xc0
[1774178.620750]  show_stack+0x14/0x30
[1774178.620754]  sched_show_task+0x130/0x160
[1774178.620762]  dump_cpu_task+0x40/0x4c
[1774178.620766]  rcu_dump_cpu_stacks+0xec/0x130
[1774178.620769]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774178.620774]  update_process_times+0x98/0x180
[1774178.620777]  tick_sched_timer+0x54/0xd0
[1774178.620781]  __hrtimer_run_queues+0x134/0x2d0
[1774178.620785]  hrtimer_interrupt+0x110/0x2c0
[1774178.620788]  arch_timer_handler_phys+0x28/0x40
[1774178.620793]  handle_percpu_devid_irq+0x84/0x1c0
[1774178.620798]  generic_handle_domain_irq+0x28/0x40
[1774178.620801]  gic_handle_irq+0x58/0x80
[1774178.620806]  call_on_irq_stack+0x2c/0x3c
[1774178.620810]  do_interrupt_handler+0x78/0x84
[1774178.620813]  el1_interrupt+0x30/0x50
[1774178.620818]  el1h_64_irq_handler+0x14/0x20
[1774178.620821]  el1h_64_irq+0x64/0x68
[1774178.620823]  f2fs_lookup_extent_cache+0x18c/0x310
[1774178.620828]  f2fs_get_read_data_page+0x54/0x480
[1774178.620832]  f2fs_get_lock_data_page+0x3c/0x260
[1774178.620835]  move_data_page+0x34/0x530
[1774178.620838]  do_garbage_collect+0xc54/0x12e0
[1774178.620842]  f2fs_gc+0x3b4/0x800
[1774178.620844]  gc_thread_func+0x4c8/0x640
[1774178.620848]  kthread+0xd0/0xe0
[1774178.620851]  ret_from_fork+0x10/0x20
[1774260.049828] rcu: INFO: rcu_sched self-detected stall on CPU
[1774260.055605] rcu:   0-....: (2099 ticks this GP) idle=915/1/0x4000000000000000 softirq=6031130/6031130 fqs=1015 
[1774260.065826]        (t=2101 jiffies g=30461577 q=931)
[1774260.065830] Task dump for CPU 0:
[1774260.065832] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774260.065839] Call trace:
[1774260.065841]  dump_backtrace.part.0+0xb4/0xc0
[1774260.065854]  show_stack+0x14/0x30
[1774260.065858]  sched_show_task+0x130/0x160
[1774260.065863]  dump_cpu_task+0x40/0x4c
[1774260.065868]  rcu_dump_cpu_stacks+0xec/0x130
[1774260.065871]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774260.065875]  update_process_times+0x98/0x180
[1774260.065879]  tick_sched_timer+0x54/0xd0
[1774260.065883]  __hrtimer_run_queues+0x134/0x2d0
[1774260.065887]  hrtimer_interrupt+0x110/0x2c0
[1774260.065890]  arch_timer_handler_phys+0x28/0x40
[1774260.065896]  handle_percpu_devid_irq+0x84/0x1c0
[1774260.065901]  generic_handle_domain_irq+0x28/0x40
[1774260.065904]  gic_handle_irq+0x58/0x80
[1774260.065909]  call_on_irq_stack+0x2c/0x3c
[1774260.065913]  do_interrupt_handler+0x78/0x84
[1774260.065916]  el1_interrupt+0x30/0x50
[1774260.065922]  el1h_64_irq_handler+0x14/0x20
[1774260.065925]  el1h_64_irq+0x64/0x68
[1774260.065928]  folio_wait_stable+0x8/0x30
[1774260.065933]  pagecache_get_page+0x18/0x70
[1774260.065938]  grab_cache_page_write_begin+0x20/0x30
[1774260.065943]  f2fs_get_read_data_page+0x3c/0x480
[1774260.065947]  f2fs_get_lock_data_page+0x3c/0x260
[1774260.065950]  move_data_page+0x34/0x530
[1774260.065954]  do_garbage_collect+0xc54/0x12e0
[1774260.065957]  f2fs_gc+0x3b4/0x800
[1774260.065960]  gc_thread_func+0x4c8/0x640
[1774260.065963]  kthread+0xd0/0xe0
[1774260.065966]  ret_from_fork+0x10/0x20
[1774323.086033] rcu: INFO: rcu_sched self-detected stall on CPU
[1774323.091808] rcu:   0-....: (8403 ticks this GP) idle=915/1/0x4000000000000000 softirq=6031130/6031130 fqs=4088 
[1774323.102028]        (t=8405 jiffies g=30461577 q=1422)
[1774323.102031] Task dump for CPU 0:
[1774323.102033] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774323.102040] Call trace:
[1774323.102042]  dump_backtrace.part.0+0xb4/0xc0
[1774323.102052]  show_stack+0x14/0x30
[1774323.102055]  sched_show_task+0x130/0x160
[1774323.102060]  dump_cpu_task+0x40/0x4c
[1774323.102065]  rcu_dump_cpu_stacks+0xec/0x130
[1774323.102068]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774323.102073]  update_process_times+0x98/0x180
[1774323.102076]  tick_sched_timer+0x54/0xd0
[1774323.102080]  __hrtimer_run_queues+0x134/0x2d0
[1774323.102084]  hrtimer_interrupt+0x110/0x2c0
[1774323.102087]  arch_timer_handler_phys+0x28/0x40
[1774323.102092]  handle_percpu_devid_irq+0x84/0x1c0
[1774323.102097]  generic_handle_domain_irq+0x28/0x40
[1774323.102100]  gic_handle_irq+0x58/0x80
[1774323.102105]  call_on_irq_stack+0x2c/0x3c
[1774323.102109]  do_interrupt_handler+0x78/0x84
[1774323.102112]  el1_interrupt+0x30/0x50
[1774323.102118]  el1h_64_irq_handler+0x14/0x20
[1774323.102120]  el1h_64_irq+0x64/0x68
[1774323.102123]  folio_unlock+0x8/0x40
[1774323.102127]  f2fs_get_lock_data_page+0xf4/0x260
[1774323.102131]  move_data_page+0x34/0x530
[1774323.102135]  do_garbage_collect+0xc54/0x12e0
[1774323.102138]  f2fs_gc+0x3b4/0x800
[1774323.102141]  gc_thread_func+0x4c8/0x640
[1774323.102144]  kthread+0xd0/0xe0
[1774323.102147]  ret_from_fork+0x10/0x20
[1774386.122242] rcu: INFO: rcu_sched self-detected stall on CPU
[1774386.128015] rcu:   0-....: (14707 ticks this GP) idle=915/1/0x4000000000000000 softirq=6031130/6031130 fqs=7133 
[1774386.138322]        (t=14709 jiffies g=30461577 q=1895)
[1774386.138325] Task dump for CPU 0:
[1774386.138327] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774386.138334] Call trace:
[1774386.138335]  dump_backtrace.part.0+0xb4/0xc0
[1774386.138345]  show_stack+0x14/0x30
[1774386.138349]  sched_show_task+0x130/0x160
[1774386.138354]  dump_cpu_task+0x40/0x4c
[1774386.138358]  rcu_dump_cpu_stacks+0xec/0x130
[1774386.138361]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774386.138365]  update_process_times+0x98/0x180
[1774386.138369]  tick_sched_timer+0x54/0xd0
[1774386.138373]  __hrtimer_run_queues+0x134/0x2d0
[1774386.138376]  hrtimer_interrupt+0x110/0x2c0
[1774386.138380]  arch_timer_handler_phys+0x28/0x40
[1774386.138384]  handle_percpu_devid_irq+0x84/0x1c0
[1774386.138389]  generic_handle_domain_irq+0x28/0x40
[1774386.138393]  gic_handle_irq+0x58/0x80
[1774386.138397]  call_on_irq_stack+0x2c/0x3c
[1774386.138401]  do_interrupt_handler+0x78/0x84
[1774386.138405]  el1_interrupt+0x30/0x50
[1774386.138410]  el1h_64_irq_handler+0x14/0x20
[1774386.138413]  el1h_64_irq+0x64/0x68
[1774386.138416]  f2fs_lookup_extent_cache+0x18c/0x310
[1774386.138420]  f2fs_get_read_data_page+0x54/0x480
[1774386.138424]  f2fs_get_lock_data_page+0x3c/0x260
[1774386.138427]  move_data_page+0x34/0x530
[1774386.138431]  do_garbage_collect+0xc54/0x12e0
[1774386.138434]  f2fs_gc+0x3b4/0x800
[1774386.138437]  gc_thread_func+0x4c8/0x640
[1774386.138440]  kthread+0xd0/0xe0
[1774386.138443]  ret_from_fork+0x10/0x20
[1774449.158452] rcu: INFO: rcu_sched self-detected stall on CPU
[1774449.164226] rcu:   0-....: (21011 ticks this GP) idle=915/1/0x4000000000000000 softirq=6031130/6031130 fqs=10163 
[1774449.174619]        (t=21013 jiffies g=30461577 q=2392)
[1774449.174622] Task dump for CPU 0:
[1774449.174624] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774449.174630] Call trace:
[1774449.174632]  dump_backtrace.part.0+0xb4/0xc0
[1774449.174641]  show_stack+0x14/0x30
[1774449.174645]  sched_show_task+0x130/0x160
[1774449.174650]  dump_cpu_task+0x40/0x4c
[1774449.174654]  rcu_dump_cpu_stacks+0xec/0x130
[1774449.174657]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774449.174661]  update_process_times+0x98/0x180
[1774449.174664]  tick_sched_timer+0x54/0xd0
[1774449.174668]  __hrtimer_run_queues+0x134/0x2d0
[1774449.174672]  hrtimer_interrupt+0x110/0x2c0
[1774449.174675]  arch_timer_handler_phys+0x28/0x40
[1774449.174680]  handle_percpu_devid_irq+0x84/0x1c0
[1774449.174685]  generic_handle_domain_irq+0x28/0x40
[1774449.174688]  gic_handle_irq+0x58/0x80
[1774449.174693]  call_on_irq_stack+0x2c/0x3c
[1774449.174696]  do_interrupt_handler+0x78/0x84
[1774449.174700]  el1_interrupt+0x30/0x50
[1774449.174705]  el1h_64_irq_handler+0x14/0x20
[1774449.174708]  el1h_64_irq+0x64/0x68
[1774449.174711]  __filemap_get_folio+0x20/0x3b0
[1774449.174715]  pagecache_get_page+0x18/0x70
[1774449.174720]  grab_cache_page_write_begin+0x20/0x30
[1774449.174725]  f2fs_get_read_data_page+0x3c/0x480
[1774449.174729]  f2fs_get_lock_data_page+0x3c/0x260
[1774449.174732]  move_data_page+0x34/0x530
[1774449.174735]  do_garbage_collect+0xc54/0x12e0
[1774449.174738]  f2fs_gc+0x3b4/0x800
[1774449.174741]  gc_thread_func+0x4c8/0x640
[1774449.174744]  kthread+0xd0/0xe0
[1774449.174748]  ret_from_fork+0x10/0x20
[1774512.194663] rcu: INFO: rcu_sched self-detected stall on CPU
[1774512.200436] rcu:   0-....: (27315 ticks this GP) idle=915/1/0x4000000000000000 softirq=6031130/6031130 fqs=13122 
[1774512.210828]        (t=27317 jiffies g=30461577 q=2781)
[1774512.210831] Task dump for CPU 0:
[1774512.210834] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774512.210841] Call trace:
[1774512.210842]  dump_backtrace.part.0+0xb4/0xc0
[1774512.210852]  show_stack+0x14/0x30
[1774512.210856]  sched_show_task+0x130/0x160
[1774512.210860]  dump_cpu_task+0x40/0x4c
[1774512.210864]  rcu_dump_cpu_stacks+0xec/0x130
[1774512.210868]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774512.210872]  update_process_times+0x98/0x180
[1774512.210875]  tick_sched_timer+0x54/0xd0
[1774512.210879]  __hrtimer_run_queues+0x134/0x2d0
[1774512.210882]  hrtimer_interrupt+0x110/0x2c0
[1774512.210886]  arch_timer_handler_phys+0x28/0x40
[1774512.210891]  handle_percpu_devid_irq+0x84/0x1c0
[1774512.210896]  generic_handle_domain_irq+0x28/0x40
[1774512.210899]  gic_handle_irq+0x58/0x80
[1774512.210904]  call_on_irq_stack+0x2c/0x3c
[1774512.210907]  do_interrupt_handler+0x78/0x84
[1774512.210911]  el1_interrupt+0x30/0x50
[1774512.210916]  el1h_64_irq_handler+0x14/0x20
[1774512.210918]  el1h_64_irq+0x64/0x68
[1774512.210921]  __filemap_get_folio+0x8c/0x3b0
[1774512.210925]  pagecache_get_page+0x18/0x70
[1774512.210930]  grab_cache_page_write_begin+0x20/0x30
[1774512.210935]  f2fs_get_read_data_page+0x3c/0x480
[1774512.210939]  f2fs_get_lock_data_page+0x3c/0x260
[1774512.210942]  move_data_page+0x34/0x530
[1774512.210945]  do_garbage_collect+0xc54/0x12e0
[1774512.210948]  f2fs_gc+0x3b4/0x800
[1774512.210951]  gc_thread_func+0x4c8/0x640
[1774512.210954]  kthread+0xd0/0xe0
[1774512.210957]  ret_from_fork+0x10/0x20
[1774560.785116] INFO: task f2fs_ckpt-179:1:401 blocked for more than 404 seconds.
[1774560.792572]       Not tainted 5.18.5-matteo #107
[1774560.797401] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[1774560.805445] task:f2fs_ckpt-179:1 state:D stack:    0 pid:  401 ppid:     2 flags:0x00000008
[1774560.805453] Call trace:
[1774560.805456]  __switch_to+0xc0/0x100
[1774560.805465]  __schedule+0x258/0x620
[1774560.805469]  schedule+0x44/0xb0
[1774560.805472]  rwsem_down_write_slowpath+0x314/0x5a0
[1774560.805478]  down_write+0x44/0x50
[1774560.805482]  __checkpoint_and_complete_reqs+0x6c/0x1c0
[1774560.805487]  issue_checkpoint_thread+0x34/0xc0
[1774560.805490]  kthread+0xd0/0xe0
[1774560.805494]  ret_from_fork+0x10/0x20
[1774560.805504] INFO: task NetworkManager:1061 blocked for more than 404 seconds.
[1774560.812854]       Not tainted 5.18.5-matteo #107
[1774560.817667] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[1774560.825708] task:NetworkManager  state:D stack:    0 pid: 1061 ppid:     1 flags:0x00000000
[1774560.825714] Call trace:
[1774560.825716]  __switch_to+0xc0/0x100
[1774560.825720]  __schedule+0x258/0x620
[1774560.825723]  schedule+0x44/0xb0
[1774560.825726]  schedule_timeout+0x114/0x150
[1774560.825730]  __wait_for_common+0xc8/0x200
[1774560.825733]  wait_for_completion+0x1c/0x30
[1774560.825736]  f2fs_issue_checkpoint+0xd0/0x190
[1774560.825740]  f2fs_sync_fs+0x48/0xd0
[1774560.825745]  f2fs_do_sync_file+0x178/0x8a0
[1774560.825749]  f2fs_sync_file+0x28/0x40
[1774560.825753]  vfs_fsync_range+0x30/0x80
[1774560.825758]  do_fsync+0x38/0x80
[1774560.825762]  __arm64_sys_fsync+0x14/0x20
[1774560.825767]  invoke_syscall.constprop.0+0x4c/0xe0
[1774560.825771]  do_el0_svc+0x40/0xd0
[1774560.825775]  el0_svc+0x14/0x50
[1774560.825779]  el0t_64_sync_handler+0xa8/0xb0
[1774560.825782]  el0t_64_sync+0x148/0x14c
[1774560.825803] INFO: task kworker/u8:4:335638 blocked for more than 404 seconds.
[1774560.833149]       Not tainted 5.18.5-matteo #107
[1774560.837962] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[1774560.846002] task:kworker/u8:4    state:D stack:    0 pid:335638 ppid:     2 flags:0x00000008
[1774560.846009] Workqueue: writeback wb_workfn (flush-179:128)
[1774560.846016] Call trace:
[1774560.846017]  __switch_to+0xc0/0x100
[1774560.846021]  __schedule+0x258/0x620
[1774560.846024]  schedule+0x44/0xb0
[1774560.846027]  schedule_timeout+0x114/0x150
[1774560.846031]  __wait_for_common+0xc8/0x200
[1774560.846034]  wait_for_completion+0x1c/0x30
[1774560.846037]  f2fs_issue_checkpoint+0xd0/0x190
[1774560.846040]  f2fs_sync_fs+0x48/0xd0
[1774560.846044]  f2fs_balance_fs_bg+0x114/0x2b0
[1774560.846048]  f2fs_write_node_pages+0x38/0x1f0
[1774560.846053]  do_writepages+0x68/0x1e0
[1774560.846058]  __writeback_single_inode+0x3c/0x3c0
[1774560.846062]  writeback_sb_inodes+0x230/0x520
[1774560.846065]  __writeback_inodes_wb+0x50/0x130
[1774560.846069]  wb_writeback+0x244/0x340
[1774560.846073]  wb_workfn+0x308/0x560
[1774560.846077]  process_one_work+0x1dc/0x420
[1774560.846081]  worker_thread+0x170/0x4c0
[1774560.846084]  kthread+0xd0/0xe0
[1774560.846086]  ret_from_fork+0x10/0x20
[1774623.467979] rcu: INFO: rcu_sched self-detected stall on CPU
[1774623.473755] rcu:   0-....: (2099 ticks this GP) idle=643/1/0x4000000000000000 softirq=6031246/6031247 fqs=1028 
[1774623.483976]        (t=2101 jiffies g=30461613 q=633)
[1774623.483979] Task dump for CPU 0:
[1774623.483982] task:f2fs_gc-179:130 state:R  running task     stack:    0 pid:  400 ppid:     2 flags:0x0000000a
[1774623.483989] Call trace:
[1774623.483991]  dump_backtrace.part.0+0xb4/0xc0
[1774623.484003]  show_stack+0x14/0x30
[1774623.484007]  sched_show_task+0x130/0x160
[1774623.484013]  dump_cpu_task+0x40/0x4c
[1774623.484018]  rcu_dump_cpu_stacks+0xec/0x130
[1774623.484021]  rcu_sched_clock_irq+0x8f8/0xaa0
[1774623.484025]  update_process_times+0x98/0x180
[1774623.484028]  tick_sched_timer+0x54/0xd0
[1774623.484033]  __hrtimer_run_queues+0x134/0x2d0
[1774623.484036]  hrtimer_interrupt+0x110/0x2c0
[1774623.484040]  arch_timer_handler_phys+0x28/0x40
[1774623.484045]  handle_percpu_devid_irq+0x84/0x1c0
[1774623.484050]  generic_handle_domain_irq+0x28/0x40
[1774623.484054]  gic_handle_irq+0x58/0x80
[1774623.484059]  call_on_irq_stack+0x2c/0x3c
[1774623.484062]  do_interrupt_handler+0x78/0x84
[1774623.484066]  el1_interrupt+0x30/0x50
[1774623.484071]  el1h_64_irq_handler+0x14/0x20
[1774623.484074]  el1h_64_irq+0x64/0x68
[1774623.484077]  folio_unlock+0x18/0x40
[1774623.484081]  f2fs_get_lock_data_page+0xf4/0x260
[1774623.484085]  move_data_page+0x34/0x530
[1774623.484089]  do_garbage_collect+0xc54/0x12e0
[1774623.484092]  f2fs_gc+0x3b4/0x800
[1774623.484095]  gc_thread_func+0x4c8/0x640
[1774623.484098]  kthread+0xd0/0xe0
[1774623.484101]  ret_from_fork+0x10/0x20

root@macchiatobin:~# uname -a
Linux macchiatobin 5.18.5-matteo #107 SMP Fri Jun 17 17:58:26 CEST 2022 aarch64 GNU/Linux


-- 
per aspera ad upstream


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
