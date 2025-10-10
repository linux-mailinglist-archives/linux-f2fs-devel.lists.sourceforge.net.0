Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E3BCDEA7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Oct 2025 18:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ab2Zz5GBMQBaNmnBeRtkZmTO/VjE+3xomhm7QJLZKBM=; b=W3g6jD+x5iFQJ/MSY2OLMzMm8k
	kd6YjdLmkYTS5oDYdvpfOcfcGyQcMCFBwbD+sSHJcCxf2rLv+SoX+V3seTIPg070s4f6iZYNMcj/c
	QfbQAqFE4ppbuYPaVIp+kfrVA6hVkPfkuk89VgVMU9738+b2/zQUIoxdiAGWnTvqiQqE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7FZZ-0000eh-Uz;
	Fri, 10 Oct 2025 16:02:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v7FZX-0000eQ-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 16:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gMVFEbOkT7uEjEci+YSHFnQrOp6/9RH+smkcYNOjqXo=; b=L1AO+Do9Qn7ujiwNkUrtYqAAVF
 B8laQNBOzDy2MFVvGB290wJOklqwOpIDW4zrK3oZr4C4Jteeo/yH164iwW0G1yXtGCejmS6PT9A+r
 SuDINSllasamj9gBACQB5pcz9GtgFjHez13nDkyGZ57Gka4bx57YzVVqEw6GbaqEcyZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gMVFEbOkT7uEjEci+YSHFnQrOp6/9RH+smkcYNOjqXo=; b=CCddULRywYTapIWSTTvGAOQbWa
 ua6rEwEDU6psXg8rAwMcUF/JuKjCmKy3OJDqVfuDGxwAjbyyVujiURMKnGj31CGgIovKWtGrv9bTj
 tZKqNO1Y/OpTa+oVKVf8ziEN9NNo0Sh7jbY0HoxethYknn5QORu7uI1RhDDNYBLh+O+4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7FZX-0001wj-GG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 16:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 15DA048E49;
 Fri, 10 Oct 2025 16:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CA4C4CEF8;
 Fri, 10 Oct 2025 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760112133;
 bh=eoWQ7nY21cD8Wjcz79k3l5le8v7O57flhDTB/bONqaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H5qvV7zUkzFExEhhc8IlfftrVbOp3oA4/Vz+wdC6EAysWPxGg4yfpHpei/HYztExp
 4VcZK5gg0rAYd6fWFYtnQHUNdYJuYeMRVUz/r5fTqql9IFCmYUsvwnQAXFVVNKLjls
 hcJh2Kw1i194GWbi5H91jtAGSmXouBK+mEFVprqfYeb9nrW+068He7oWHNQoKIKVFQ
 TJlUoDRFcX1A/Oteq5/xj5toHnEBYagxNLY7FbUT+nWgTE/WzYhXF948Wl09s0WXIL
 IR2lpESlXCu6AAsHzeTAbPPfgwIoig4y/sO57K18ri6JOJuPgVAqmKp8uxAnirKWwN
 rteYLRhWMMOEQ==
Date: Fri, 10 Oct 2025 16:02:11 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aOkuA_Ffq2klE5g6@google.com>
References: <20251006084615.2585252-1-jprusakowski@google.com>
 <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4643bb6-882a-4229-b938-e94398294905@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/09, Chao Yu wrote: > On 10/6/2025 4:46 PM,
 Jan Prusakowski
 via Linux-f2fs-devel wrote: > > Xfstests generic/335, generic/336 sometimes
 crash with the following message: > > > > F2FS-fs (dm-0): d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7FZX-0001wj-GG
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/09, Chao Yu wrote:
> On 10/6/2025 4:46 PM, Jan Prusakowski via Linux-f2fs-devel wrote:
> > Xfstests generic/335, generic/336 sometimes crash with the following message:
> > 
> > F2FS-fs (dm-0): detect filesystem reference count leak during umount, type: 9, count: 1
> > ------------[ cut here ]------------
> > kernel BUG at fs/f2fs/super.c:1939!
> > Oops: invalid opcode: 0000 [#1] SMP NOPTI
> > CPU: 1 UID: 0 PID: 609351 Comm: umount Tainted: G        W           6.17.0-rc5-xfstests-g9dd1835ecda5 #1 PREEMPT(none)
> > Tainted: [W]=WARN
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > RIP: 0010:f2fs_put_super+0x3b3/0x3c0
> > Call Trace:
> >   <TASK>
> >   generic_shutdown_super+0x7e/0x190
> >   kill_block_super+0x1a/0x40
> >   kill_f2fs_super+0x9d/0x190
> >   deactivate_locked_super+0x30/0xb0
> >   cleanup_mnt+0xba/0x150
> >   task_work_run+0x5c/0xa0
> >   exit_to_user_mode_loop+0xb7/0xc0
> >   do_syscall_64+0x1ae/0x1c0
> >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >   </TASK>
> > ---[ end trace 0000000000000000 ]---
> > 
> > It appears that sometimes it is possible that f2fs_put_super() is called before
> > all node page reads are completed.
> > Adding a call to f2fs_wait_on_all_pages() for F2FS_RD_NODE fixes the problem.
> > 
> > Fixes: bf22c3cc8ce7 ("f2fs: fix the panic in do_checkpoint()")
> > 
> > Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
> > ---
> >   fs/f2fs/super.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 1e0678e37a30..5c94bc42b8a1 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1976,6 +1976,7 @@ static void f2fs_put_super(struct super_block *sb)
> >   	f2fs_flush_merged_writes(sbi);
> >   	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
> > +	f2fs_wait_on_all_pages(sbi, F2FS_RD_NODE);
> 
> Jan,
> 
> At this stage, GC and checkpoint are both stopped, why there is still read
> IOs on node page? Who is reading node page? Can you please dig more details
> for this issue?

We don't actually wait for completing read IOs. So, I think it doesn't matter
the threads are stopped?

> 
> Thanks,
> 
> >   	if (err || f2fs_cp_error(sbi)) {
> >   		truncate_inode_pages_final(NODE_MAPPING(sbi));


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
