Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0022A6C94DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Mar 2023 15:58:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgQst-0004om-Qu;
	Sun, 26 Mar 2023 13:58:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pgQsq-0004og-PY
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmaihNjAtIhhV8P6kRoGG7M5b4oESDJptSEYWaGoLas=; b=cwkAURT1kmykjq2wN/p7njwgWt
 g1ynED+9sgYgbFYl4D7KHUvNzcFq8ACZeRhrNLyPDjEnczWj9o4oRSkdG6DvJxSB0UA2ScwVua5nC
 55B3pfK+An3ZQeNeyNLxGthTL4vfRwJnSvbW5M0awrC9pkiZ4OQrYz8AUkbSMnZaVI2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qmaihNjAtIhhV8P6kRoGG7M5b4oESDJptSEYWaGoLas=; b=Egs7ZrbPEIaLeqyRI0kQN3fJsE
 hr1Fzp1bvMC7VMuOu8ZBq5zeEGo28OtQl+prHrobV2Ph5vQ3YuJttiQZp2JsMHew3u5oSH2hDwx2K
 7YEMT7ZI4RxBIFa2Ty2id+oiI3DVXML9bqZzCSaUXdYi3RtNibwPDLMu1G8DlpW8SwBI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgQsq-004NFN-H1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C17DB80C9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 Mar 2023 13:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F05FC433EF;
 Sun, 26 Mar 2023 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679839080;
 bh=/6z6edxSb80/I6cx38gQBCVrzqiPeU6hxd3Z5IhF9u8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VyCc7QYE8KuCV6WV+f8EVIgn7wm2w3QnFL+2JhJIOw62vshh/LyYlMOGrWUunL9Pp
 +9n6Ej/fMJIJrJzv0Tmz5haXrHL4ip1u2H5irSWCfSzeTwa1NYaej8gpNVH9TUWh+2
 2SEUv41UzDnq49jZGhDJ7oA/K3sXttD5IQhjzWlrh3TKHQUNsyQkX2f90Eu8dbPdH5
 x/5wzPxvD5ImhXxIm0YQH/izh5bN6Vmjan6MyYMmzSIgeARySON5Y/4Ip7EZXzHutL
 XldXc+rMy+cIUnFOmtunCstyXwLQm4tEsRk58XbUB01Q40ficQAaooC7tl6d3yD7Ce
 3dWZ0ffLrQKrQ==
Message-ID: <4e34660e-e3c8-fba7-e5ee-d26d4df83cab@kernel.org>
Date: Sun, 26 Mar 2023 21:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230323224734.2041173-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230323224734.2041173-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/24 6:47, Jaegeuk Kim wrote: > [ 16.945668][ C0]
 Call trace: > [ 16.945678][ C0] dump_backtrace+0x110/0x204 > [ 16.945706][
 C0] dump_stack_lvl+0x84/0xbc > [ 16.945735][ C0] __schedule_bug+0xb [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgQsq-004NFN-H1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix scheduling while atomic in
 decompression path
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

On 2023/3/24 6:47, Jaegeuk Kim wrote:
> [   16.945668][    C0] Call trace:
> [   16.945678][    C0]  dump_backtrace+0x110/0x204
> [   16.945706][    C0]  dump_stack_lvl+0x84/0xbc
> [   16.945735][    C0]  __schedule_bug+0xb8/0x1ac
> [   16.945756][    C0]  __schedule+0x724/0xbdc
> [   16.945778][    C0]  schedule+0x154/0x258
> [   16.945793][    C0]  bit_wait_io+0x48/0xa4
> [   16.945808][    C0]  out_of_line_wait_on_bit+0x114/0x198
> [   16.945824][    C0]  __sync_dirty_buffer+0x1f8/0x2e8
> [   16.945853][    C0]  __f2fs_commit_super+0x140/0x1f4
> [   16.945881][    C0]  f2fs_commit_super+0x110/0x28c
> [   16.945898][    C0]  f2fs_handle_error+0x1f4/0x2f4
> [   16.945917][    C0]  f2fs_decompress_cluster+0xc4/0x450
> [   16.945942][    C0]  f2fs_end_read_compressed_page+0xc0/0xfc
> [   16.945959][    C0]  f2fs_handle_step_decompress+0x118/0x1cc
> [   16.945978][    C0]  f2fs_read_end_io+0x168/0x2b0
> [   16.945993][    C0]  bio_endio+0x25c/0x2c8
> [   16.946015][    C0]  dm_io_dec_pending+0x3e8/0x57c
> [   16.946052][    C0]  clone_endio+0x134/0x254
> [   16.946069][    C0]  bio_endio+0x25c/0x2c8
> [   16.946084][    C0]  blk_update_request+0x1d4/0x478
> [   16.946103][    C0]  scsi_end_request+0x38/0x4cc
> [   16.946129][    C0]  scsi_io_completion+0x94/0x184
> [   16.946147][    C0]  scsi_finish_command+0xe8/0x154
> [   16.946164][    C0]  scsi_complete+0x90/0x1d8
> [   16.946181][    C0]  blk_done_softirq+0xa4/0x11c
> [   16.946198][    C0]  _stext+0x184/0x614
> [   16.946214][    C0]  __irq_exit_rcu+0x78/0x144
> [   16.946234][    C0]  handle_domain_irq+0xd4/0x154
> [   16.946260][    C0]  gic_handle_irq.33881+0x5c/0x27c
> [   16.946281][    C0]  call_on_irq_stack+0x40/0x70
> [   16.946298][    C0]  do_interrupt_handler+0x48/0xa4
> [   16.946313][    C0]  el1_interrupt+0x38/0x68
> [   16.946346][    C0]  el1h_64_irq_handler+0x20/0x30
> [   16.946362][    C0]  el1h_64_irq+0x78/0x7c
> [   16.946377][    C0]  finish_task_switch+0xc8/0x3d8
> [   16.946394][    C0]  __schedule+0x600/0xbdc
> [   16.946408][    C0]  preempt_schedule_common+0x34/0x5c
> [   16.946423][    C0]  preempt_schedule+0x44/0x48
> [   16.946438][    C0]  process_one_work+0x30c/0x550
> [   16.946456][    C0]  worker_thread+0x414/0x8bc
> [   16.946472][    C0]  kthread+0x16c/0x1e0
> [   16.946486][    C0]  ret_from_fork+0x10/0x20
> 
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Fixes: 95fa90c9e5a7 ("f2fs: support recording errors into superblock")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
