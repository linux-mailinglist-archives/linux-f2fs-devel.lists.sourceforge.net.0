Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 955228402C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 11:28:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUOrv-00032S-VZ;
	Mon, 29 Jan 2024 10:28:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUOru-00032M-FW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NoBtbWBG+b1qUxuU3QxEjVwcHZileZtHD/xiFangzVk=; b=Ivq0P7vaAHx4RWhzU1ylUT4iD6
 VxwNU84PRZDtsMkO4zoJC2Xb9/JIezyRCgxgsgQuib1G6ZWim4Sznqqs1cwfjhksv2aKQPKp0rD9R
 8tPR2kp2Y0iMK3G38N52uLjUBoTMNxzT36Nyc9AULi+mheuhw6cnQiZC+JEIkscugcbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NoBtbWBG+b1qUxuU3QxEjVwcHZileZtHD/xiFangzVk=; b=GyQG/hXifI/vPdf6l/aMeQGd5a
 c+VwD2kr0oSMtDeF6+cc9k9QDm2B9FCwkS+ilCVMlthqtIFUtWYVuxtqHXYdpYFA1S5MqGGykTcy6
 AcNLj2hVlgQGr9b822c9wwgALIPVgeHl7YysF0kMPwkMj8DBimpo7env5otPKjubWCpA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUOrr-0005Vh-Ho for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA6C362046;
 Mon, 29 Jan 2024 10:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01ABAC43390;
 Mon, 29 Jan 2024 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706524065;
 bh=dJ3bS5oGG9PHms+736cFAZX/JO0z5fQy3JzWxPCMyqc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qJ6H4eTWCM1WSFpRsizOIHNUQefYGhckq73mSh80dT/GCCrPohIBd/BZx+8MvPhsX
 Ue74dpfnWa2meEEYCbKyugyVLUwDszjvrJfgtp4xHfD+aJKlnLvJfoniYMMgtADO73
 xk/810eY/grQ3XUkPY2G9WwTiUUj88VXkgV7eIPIv8jh6xGy7yQ1+M3HutW8fLndsw
 9YymWyTvOywHyNpTmJg8Q4rDBojS0F5cf+Vbci4SgNQ8cX28DwvIMrhTl73M+wjY0C
 u5nU48uBa/pfIs405Q7rL+akEn86Tv3WUQybJ0IGJqff2yPfevc/Ms2eKbzT2Tjslo
 qHoxhRyLbmBkA==
Message-ID: <d379bc01-ca31-41e6-9d85-7fca846af491@kernel.org>
Date: Mon, 29 Jan 2024 18:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20240116141138.1245-1-qwjhust@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240116141138.1245-1-qwjhust@gmail.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/16 22:11,
 Wenjie Qi wrote: > BUG: kernel NULL pointer dereference,
 address: 0000000000000014 > RIP: 0010:f2fs_submit_page_write+0x6cf/0x780
 [f2fs] > Call Trace: > <TASK> > ? show_regs+0x6e/0 [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUOrr-0005Vh-Ho
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix NULL pointer dereference in
 f2fs_submit_page_write()
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
Cc: linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/16 22:11, Wenjie Qi wrote:
> BUG: kernel NULL pointer dereference, address: 0000000000000014
> RIP: 0010:f2fs_submit_page_write+0x6cf/0x780 [f2fs]
> Call Trace:
> <TASK>
> ? show_regs+0x6e/0x80
> ? __die+0x29/0x70
> ? page_fault_oops+0x154/0x4a0
> ? prb_read_valid+0x20/0x30
> ? __irq_work_queue_local+0x39/0xd0
> ? irq_work_queue+0x36/0x70
> ? do_user_addr_fault+0x314/0x6c0
> ? exc_page_fault+0x7d/0x190
> ? asm_exc_page_fault+0x2b/0x30
> ? f2fs_submit_page_write+0x6cf/0x780 [f2fs]
> ? f2fs_submit_page_write+0x736/0x780 [f2fs]
> do_write_page+0x50/0x170 [f2fs]
> f2fs_outplace_write_data+0x61/0xb0 [f2fs]
> f2fs_do_write_data_page+0x3f8/0x660 [f2fs]
> f2fs_write_single_data_page+0x5bb/0x7a0 [f2fs]
> f2fs_write_cache_pages+0x3da/0xbe0 [f2fs]
> ...
> It is possible that other threads have added this fio to io->bio
> and submitted the io->bio before entering f2fs_submit_page_write().
> At this point io->bio = NULL.
> If is_end_zone_blkaddr(sbi, fio->new_blkaddr) of this fio is true,
> then an NULL pointer dereference error occurs at bio_get(io->bio).
> The original code for determining zone end was after "out:",
> which would have missed some fio who is zone end. I've moved
>   this code before "skip:" to make sure it's done for each fio.
> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
