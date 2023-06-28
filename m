Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2A740BCF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jun 2023 10:47:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEQpZ-0007pA-Go;
	Wed, 28 Jun 2023 08:47:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qEQpY-0007p4-9D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 08:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UDGG8UiEBybJtF4ujDmAsCI5wTV4Qjf/SDxiF/dirLc=; b=YZaZXkGEUZJ+VV/cKasydVy6vP
 rZYinO7anOtbDX7yZMv5EbA2J9QeTM5seF7bjJDaKwIyCXuifcmpwVKT4cAD3ziyh6eBsW3rAGO/Q
 3+Mf91qAZLqGhrQKRgM0wZPr0pquRAphfSHsF/aKNixD2tfIgYqsBR8IsMWk/K368eCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UDGG8UiEBybJtF4ujDmAsCI5wTV4Qjf/SDxiF/dirLc=; b=MNpYRy+wVXYT36+IQOM5C4yvdx
 /Qwcv5LSYZTa0BmuQgLQ9p4ig3GcpkTbbMhaY5F98uZQtsIuL2AAqtCtda8LC6OuzKgEguItiRJm3
 gSzUn4zlfEWpUHt0ylnNhCkjN41CqrrEC5O0eJF9hzN7fBkKofh42PdfRvGlM8+QsR8E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEQpJ-0000gf-51 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jun 2023 08:47:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B668161217;
 Wed, 28 Jun 2023 08:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA6FC433C8;
 Wed, 28 Jun 2023 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687942014;
 bh=a7qYYMfvhrkx8GjWo17aDb5hBm4by7dQQM443cV8Zng=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=BLeDWM/ynvXrBgTAarLsb/JRDmY8GGAr9/YtCTnzMOVELGRQ7ebxSs05lhERYNOr0
 NrUpPUw6MkZJQ2NVW4Gizlury5z21Z+aTBZeplCjB6k3e3sZxZYBba/adjmSHCW7La
 5XaWs6vFI2MxatVH7QTAj1BTI7Mu9jVO5XlNJ7Am5scGvlYcCR27MD4POBmx4lt0RB
 dVR4O8WEvaerJbHtobCC+gFc7ecLAL+kZaV5JIOmtioxMuXNqh8Ek+e389UtlnEpzI
 QfRa62rA6DPoI6DFwwF1ijn039snDraz5u3tYbWMzorixSukg7Z8mjpjrZSbKfeCmf
 3Gi5GncuKI2dQ==
Message-ID: <55a80df7-0725-d36c-566b-24cdf2dfd6da@kernel.org>
Date: Wed, 28 Jun 2023 16:46:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: syzbot <syzbot+dd6352699b8027673b35@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000ded70105fef7cd35@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <000000000000ded70105fef7cd35@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/26 1:45, syzbot wrote: > Hello, > > syzbot found
 the following issue on: > > HEAD commit: 15e71592dbae Add linux-next specific
 files for 20230621 > git tree: linux-next > console output: htt [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEQpJ-0000gf-51
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_fiemap
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
Cc: Eric Biggers <ebiggers@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/26 1:45, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    15e71592dbae Add linux-next specific files for 20230621
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=101c827b280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b4e51841f618f374
> dashboard link: https://syzkaller.appspot.com/bug?extid=dd6352699b8027673b35
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/6b6464ef4887/disk-15e71592.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/81eba5775318/vmlinux-15e71592.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/bc7983587629/bzImage-15e71592.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+dd6352699b8027673b35@syzkaller.appspotmail.com
> 
> loop4: detected capacity change from 0 to 40427
> F2FS-fs (loop4): Found nat_bits in checkpoint
> F2FS-fs (loop4): Mounted with checkpoint version = 48b305e5
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.4.0-rc7-next-20230621-syzkaller #0 Not tainted
> ------------------------------------------------------
> syz-executor.4/7658 is trying to acquire lock:
> ffff888012869e20 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0xb2/0x190 mm/memory.c:5716
> 
> but task is already holding lock:
> ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:771 [inline]
> ffff8880865b1a10 (&sb->s_type->i_mutex_key#23){+.+.}-{3:3}, at: f2fs_fiemap+0x1e3/0x1670 fs/f2fs/data.c:1998

This was caused by the patch
"f2fs: fix to avoid mmap vs set_compress_option case"
(https://lore.kernel.org/linux-f2fs-devel/20230529104709.2560779-1-chao@kernel.org/)
which has been dropped.

#syz set subsystems: f2fs
#syz invalid


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
