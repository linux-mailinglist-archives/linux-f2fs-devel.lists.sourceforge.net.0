Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DACF707725
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzS8c-0007yX-U6;
	Thu, 18 May 2023 01:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pzS8c-0007yR-11
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oT3XfxuElpforDSJpELTClwbb6l9sNpRSDZYmf+XkTY=; b=dIg+RQ7if1OD17JDnh2rgBwx52
 Xx8gPywbF7y8Czxxg7WC9jsAOT44D+LfDGAjfSNXsE5AF3mlY7w0LZJIuLPZ7LZvaSDJw8n+HAMK9
 guyqw+DJ4tY1QJajhVkZBtqBOD4k5TWXqU8uUq92qRKATtMt4tGpykuHAjUylw2/Xz3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oT3XfxuElpforDSJpELTClwbb6l9sNpRSDZYmf+XkTY=; b=L+CGP2efRMuiSg1d964oXAuGtE
 0P0qMdGITsKkKbKzeeAEMHm+IUj4UFbW5Vcezuz3r9Famc113gN7jmSgfD/qES74B/c6JCOjD8AKQ
 UbD1I9kKvr/4YVBhnxi7c/v5jrOyL1eboxts8zQI9elYP37oM4pPLR9IYXDYgLJMKvYI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzS8a-0003dp-9n for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:09:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E561F649C5;
 Thu, 18 May 2023 01:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4323EC433EF;
 Thu, 18 May 2023 01:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684372134;
 bh=94pDdlaI3+FSFe2ibmgZaLW8vX2Bvg0oXWqgtsT40Q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4VM2+/Z3H3WatbiENVYc1TUAiffuZ5o+SebZ1R+V+R3KYtWNkGdjk+kvchYmf7eX
 u1hsLxtsladAz+G6NXehlfXz+50+5V5eS+U6/oSc4yjXUVvWGYo6+aKzG8NgiLFQnE
 j4SXSnWd4QVsMZRFg/eckkqS9BrsScFDlMA/mAWn8QH6J8ZriL9DZp/cgkx7iAs/OQ
 6N9S3Am2KMfyXdgIp47JNmMm6gz/CD2InKb1+wfwuwR1HgAxA++VrDmgUR/U7x4qyi
 E41kjGq7AV41giPjRUt/DoKB5g44uMCMMG7FgdK2bWW36kNQ4ybn6f9mEqqWSAFXw5
 M2tcCIIpZIiow==
Date: Wed, 17 May 2023 18:08:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Richard Tresidder <rtresidd@electromag.com.au>
Message-ID: <ZGV6pOc80ITHlxXG@google.com>
References: <8be01849-02ae-0829-b8f0-c9eb7f3f4065@electromag.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8be01849-02ae-0829-b8f0-c9eb7f3f4065@electromag.com.au>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Could you please consider v6.3.3 which has some fixes?
 Thanks, Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzS8a-0003dp-9n
Subject: Re: [f2fs-dev] Kernel warnings 6.3.1
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

Could you please consider v6.3.3 which has some fixes?

Thanks,

On 05/12, Richard Tresidder via Linux-f2fs-devel wrote:
> Hi
> =A0=A0 We're upgrading our systems from using a 5.1.7 based kernel to a 6=
.3.1
> based kernel.
> I'm experiencing some warnings popping out occasionally from the f2fs dri=
ver
> =

> *************************************************************************=
***************
> [=A0 137.225376] WARNING: CPU: 0 PID: 32 at fs/f2fs/extent_cache.c:755
> __update_extent_tree_range+0x424/0x760
> *************************************************************************=
***************
> =

> and a trace:
> *************************************************************************=
***************
> [=A0 460.206016] ------------[ cut here ]------------
> [=A0 460.208340] WARNING: CPU: 0 PID: 154 at fs/f2fs/extent_cache.c:755
> __update_extent_tree_range+0x424/0x760
> [=A0 460.213183] Modules linked in:
> [=A0 460.213200] CPU: 0 PID: 154 Comm: kworker/u4:5 Tainted: G=A0=A0=A0=
=A0=A0=A0=A0
> W=A0=A0=A0=A0=A0=A0=A0=A0=A0 6.3.1-00256-g60164498d86b-dirty #7
> [=A0 460.213216] Hardware name: Altera SOCFPGA
> [=A0 460.213226] Workqueue: writeback wb_workfn (flush-179:0)
> [=A0 460.213271]=A0 unwind_backtrace from show_stack+0x18/0x1c
> [=A0 460.213306]=A0 show_stack from dump_stack_lvl+0x40/0x4c
> [=A0 460.213335]=A0 dump_stack_lvl from __warn+0x84/0x15c
> [=A0 460.213365]=A0 __warn from warn_slowpath_fmt+0xc4/0x1c0
> [=A0 460.213391]=A0 warn_slowpath_fmt from
> __update_extent_tree_range+0x424/0x760
> [=A0 460.213418]=A0 __update_extent_tree_range from
> __update_extent_cache+0x244/0x444
> [=A0 460.213440]=A0 __update_extent_cache from
> f2fs_outplace_write_data+0x80/0xec
> [=A0 460.213461]=A0 f2fs_outplace_write_data from
> f2fs_do_write_data_page+0x4e4/0x700
> [=A0 460.213487]=A0 f2fs_do_write_data_page from
> f2fs_write_single_data_page+0x524/0x720
> [=A0 460.213513]=A0 f2fs_write_single_data_page from
> f2fs_write_cache_pages+0x24c/0x590
> [=A0 460.213539]=A0 f2fs_write_cache_pages from
> f2fs_write_data_pages+0x238/0x388
> [=A0 460.213563]=A0 f2fs_write_data_pages from do_writepages+0x80/0x1a4
> [=A0 460.213597]=A0 do_writepages from __writeback_single_inode+0x4c/0x4cc
> [=A0 460.213629]=A0 __writeback_single_inode from
> writeback_sb_inodes+0x1f8/0x4cc
> [=A0 460.213658]=A0 writeback_sb_inodes from __writeback_inodes_wb+0x40/0=
xe0
> [=A0 460.213686]=A0 __writeback_inodes_wb from wb_writeback+0x250/0x3ac
> [=A0 460.213713]=A0 wb_writeback from wb_workfn+0x2d4/0x5ac
> [=A0 460.213741]=A0 wb_workfn from process_one_work+0x1e0/0x51c
> [=A0 460.213776]=A0 process_one_work from worker_thread+0x60/0x518
> [=A0 460.213806]=A0 worker_thread from kthread+0xf4/0x124
> [=A0 460.213836]=A0 kthread from ret_from_fork+0x14/0x2c
> [=A0 460.213856] Exception stack(0xf0cc5fb0 to 0xf0cc5ff8)
> [=A0 460.213868] 5fa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 00000000 00000000
> 00000000 00000000
> [=A0 460.213879] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000
> 00000000 00000000
> [=A0 460.213890] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> [=A0 460.213899] ---[ end trace 0000000000000000 ]---
> *************************************************************************=
***************
> =

> This is after performing a format on the device in system to make sure the
> filesystem was up to the same kernel revision.
> How concerned should we be?
> =

> Note prior to the format we were getting a LOT or errors, some like above
> and others with a different signature:
> =

> *************************************************************************=
***************
> [=A0 167.675107] WARNING: CPU: 0 PID: 32 at fs/f2fs/extent_cache.c:248
> __insert_extent_tree+0x15c/0x174
> *************************************************************************=
***************
> =

> That one resulted in the entire system coming to a a halt..
> =

> Cheers
> =A0=A0 Richard T
> =

> =

> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
