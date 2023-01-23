Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00A678462
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Jan 2023 19:19:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pK1Pw-0003dT-Po;
	Mon, 23 Jan 2023 18:19:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pK1Pr-0003Qf-8S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 18:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oXCaWVDnlza+dwCnUEbA0BHkFWy5SCqK5uTSxTHpYgg=; b=mYsHlarXjcPZUwWDPAG4CZjOgl
 6Z1BJsuhypOOtrfSWTCkoCDxKv9HRSR+rc0VJN3l9KemepahDiFs7fWNP/LuGhi9dI5NdPMTbTC4o
 nAI9C3+5ffplJvvQkkLkyy2ZjnELKDoBpDgVZZln1xODxnBZjBVXoI0K6Pn0lik+4azg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oXCaWVDnlza+dwCnUEbA0BHkFWy5SCqK5uTSxTHpYgg=; b=KzqmokY0mx5ovxZc+G7SZBm4Lv
 GP8gPbca0Auf64/5vK7lTsM9dBgaehfOcngUQGTnHS6UV0DCEE8m9cp7sziude4hZWrjJKRz4UhGq
 JNY7JpQMq4e/RGKb/xgYMAO9ydU3WwuvSAS0ZCM1mU+YA7BUO6BK30qfabf0VLILGQYU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pK1Pl-00Dapf-MH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jan 2023 18:19:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AB1AB80E69;
 Mon, 23 Jan 2023 18:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B36C433D2;
 Mon, 23 Jan 2023 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674497962;
 bh=BiY+94W/UA2ynCZttnaitmIe+1NUuICPK8erHklsvrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SS7mH2m+jFdYT29f+ugatIp0s4o2xES95QYx4dULaqt5ngD2AEAiPMPWfxeLrIg00
 0P53p1KTrkVlW61dom7c6Tzq/stVlZ7FAZbd03PpEJw8Tx77ZIfE/SrL9sxl5JUX4Y
 IRnFZ7boJRA2LZ8Cmf4tbtoZJY4IK+1fPOq3ndY/ku94GYns4yHyz662AFS9IYigR9
 vUiZTjvFJy1MvGUsNFd410L4OGuBo9uGffEevrWZITeQcgE848HZerPMfN3VImjg3O
 3H1VmFhTtY5ENmXujibtZFjzojFhWQjVKvNBtBLahRLETIGH6czKzo5UYdMveHpLs/
 3SWE4cIyNbxUA==
Date: Mon, 23 Jan 2023 18:19:20 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Potapenko <glider@google.com>
Message-ID: <Y87PqGgw1uJVlnrP@gmail.com>
References: <20230123070414.138052-1-ebiggers@kernel.org>
 <CAG_fn=VNjkRMozdcQUSMTHvMQ26SG45oisxamJbEVrg2m41ngg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG_fn=VNjkRMozdcQUSMTHvMQ26SG45oisxamJbEVrg2m41ngg@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 23, 2023 at 09:58:22AM +0100, Alexander Potapenko
 wrote: > On Mon, Jan 23, 2023 at 8:05 AM Eric Biggers <ebiggers@kernel.org>
 wrote: > > > > From: Eric Biggers <ebiggers@google.com> > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pK1Pl-00Dapf-MH
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix information leak in
 f2fs_move_inline_dirents()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 23, 2023 at 09:58:22AM +0100, Alexander Potapenko wrote:
> On Mon, Jan 23, 2023 at 8:05 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > When converting an inline directory to a regular one, f2fs is leaking
> > uninitialized memory to disk because it doesn't initialize the entire
> > directory block.  Fix this by zero-initializing the block.
> >
> > This bug was introduced by commit 4ec17d688d74 ("f2fs: avoid unneeded
> > initializing when converting inline dentry"), which didn't consider the
> > security implications of leaking uninitialized memory to disk.
> >
> > This was found by running xfstest generic/435 on a KMSAN-enabled kernel.
> 
> Out of curiosity, did you add any extra annotations to detect uninit
> writes to the disk?

No.  This is the report I got:

[  145.280969] =====================================================
[  145.285368] BUG: KMSAN: uninit-value in virtqueue_add+0x1ba5/0x6ac0
[  145.289123]  virtqueue_add+0x1ba5/0x6ac0
[  145.291539]  virtqueue_add_sgs+0x2ae/0x2c0
[  145.294036]  virtio_queue_rqs+0xa59/0x1270
[  145.296566]  blk_mq_flush_plug_list+0x34a/0x9e0
[  145.299389]  __blk_flush_plug+0x6b5/0x760
[  145.301801]  blk_finish_plug+0x92/0xd0
[  145.304084]  __f2fs_write_data_pages+0x3953/0x4140
[  145.307011]  f2fs_write_data_pages+0xf1/0x120
[  145.309665]  do_writepages+0x45c/0x980
[  145.312017]  filemap_fdatawrite+0x1d2/0x260
[  145.314533]  f2fs_sync_dirty_inodes+0x3a3/0xa40
[  145.317272]  f2fs_write_checkpoint+0xecc/0x2890
[  145.320013]  __checkpoint_and_complete_reqs+0x12e/0x660
[  145.323126]  issue_checkpoint_thread+0x10a/0x420
[  145.325900]  kthread+0x35c/0x490
[  145.327995]  ret_from_fork+0x1f/0x30
[  145.330208]
[  145.331242] Uninit was created at:
[  145.333399]  __alloc_pages+0x6f9/0xc90
[  145.335716]  alloc_pages+0x8aa/0xa20
[  145.337921]  folio_alloc+0x34/0x40
[  145.340069]  __filemap_get_folio+0xa9f/0x11a0
[  145.342719]  pagecache_get_page+0x5b/0x1b0
[  145.345209]  grab_cache_page_write_begin+0xa5/0xc0
[  145.348096]  do_convert_inline_dir+0x8dc/0x3680
[  145.350812]  f2fs_add_inline_entry+0x76a/0x11a0
[  145.353532]  f2fs_do_add_link+0x59b/0x970
[  145.356009]  f2fs_create+0x5b6/0x8c0
[  145.358213]  path_openat+0x25a5/0x46e0
[  145.360547]  do_filp_open+0x2ab/0x700
[  145.362785]  do_sys_openat2+0x20e/0x780
[  145.365138]  __x64_sys_openat+0x259/0x360
[  145.367562]  do_syscall_64+0x41/0x90
[  145.369819]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  145.372895]
[  145.373900] Bytes 2043-2050 of 4096 are uninitialized
[  145.376857] Memory access of size 4096 starts at ffff888076818000
[  145.380391]
[  145.381429] CPU: 1 PID: 1907 Comm: f2fs_ckpt-254:3 Not tainted 6.2.0-rc5-next-20230123 #1
[  145.386152] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
[  145.392541] =====================================================
[  145.396096] Disabling lock debugging due to kernel taint
[  145.399241] =====================================================


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
