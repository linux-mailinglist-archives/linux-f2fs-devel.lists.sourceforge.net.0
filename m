Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCA615C28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 07:18:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq74v-0004Si-E3;
	Wed, 02 Nov 2022 06:18:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oq74u-0004Sc-3V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 06:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nn+ZB23ZZP04afdDMkMaltNgOC8xmyMuVhjh3tJsnVo=; b=I0Vcu/85pHgp3p68hmyXKLgNlC
 Ca7dU/7IxBDsp0SaqvE/3ctGTtPUy3T3JSDzjoN+rbz3KNcIndW/Z9Dex2VcAuWwf+iS2fUAk/uzn
 f4IG9FZO/e4FNLnUpSwJ5O+CWtCixpvoJllN1CKZZa1ZWt5jm7hHdteh9XWKNCPBcZMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nn+ZB23ZZP04afdDMkMaltNgOC8xmyMuVhjh3tJsnVo=; b=M3jUaO1s/Spw6Pe0GhSG/3USZO
 QIX7XywTyde9a/qOyymGWCgjJ2+q1WBLqlyxx7K76HxQQPWp/PXPdPNliJH30UOe/4RiBOv1F1nlP
 DzkVGm9hA2j1EsS4W/XnzRUt2DdY2GV2vYk6Ohh6RRHASdnVJCoeCS9F5ZuGXgg8IfEU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oq74q-0006TP-UY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 06:18:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AD2BDCE1F4F;
 Wed,  2 Nov 2022 06:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF9C433C1;
 Wed,  2 Nov 2022 06:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667369881;
 bh=2OIjHvL54t1DXYOXYxp6qJOT614me6QcO9DL4rk9VrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dU78BYohrAV0o2uZcHI1mnzDPyPziGY2J8TNpdf7qa+Akf5WnUHu5PJmHKL6z558Z
 LWA3SSiessnH5waINDt9RJSa4akWUhCMtqAaiQXXkyfWsnhnTeminjdIZgKTJ5L3FT
 40svmK4tGVUUMyRYktBwooTBoPD/gQccwMd0rmsi1lE2q7HDAnXVk4YVX7nhqjSjrc
 EQQL4aWLVojoXIvNwN4O1R4Fg+bGGakJ7p5iwntdFJSeGiYE3BYRj97GewN1VDXkaQ
 R2AC/KWUiGoHsWO84OPzKWvwG+1IwK1/+V22mMrOzUfWtY/kMEwAcFvRBo3Ha7IVJO
 5n7+wkh0payQQ==
Date: Tue, 1 Nov 2022 23:17:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Y2ILlpqFQVO9fH8B@sol.localdomain>
References: <CAO4mrfc3sbZVj3QOdAVFqrZp+mEuPQTtQCQsQy-07W_BEFqZ2Q@mail.gmail.com>
 <CAO4mrfexzxeYwAkvWGfg=tEiczUWarO6y68KFD9EG9qZtGejng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO4mrfexzxeYwAkvWGfg=tEiczUWarO6y68KFD9EG9qZtGejng@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [+f2fs list and maintainers] [changed subject from "INFO:
 task hung in fscrypt_ioctl_set_policy"] On Mon, Oct 31, 2022 at 10:18:02PM
 +0800, Wei Chen wrote: > Dear Linux developers, > > Here is the link to the
 reproducers. > > C reproducer:
 https://drive.google.com/file/d/1mduYsYuoOKemH3qkvpDQwnAHA
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oq74q-0006TP-UY
Subject: [f2fs-dev] f2fs_empty_dir() can be extremely slow on malicious disk
 images
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
Cc: Wei Chen <harperchen1110@gmail.com>, jaegeuk@kernel.org,
 linux-fscrypt@vger.kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[+f2fs list and maintainers]
[changed subject from "INFO: task hung in fscrypt_ioctl_set_policy"]

On Mon, Oct 31, 2022 at 10:18:02PM +0800, Wei Chen wrote:
> Dear Linux developers,
> 
> Here is the link to the reproducers.
> 
> C reproducer: https://drive.google.com/file/d/1mduYsYuoOKemH3qkvpDQwnAHAaaLUp0Y/view?usp=share_link
> Syz reproducer:
> https://drive.google.com/file/d/1mu-_w7dy_562vWRlQvTRbcBjG4_G7b2L/view?usp=share_link
> 
> The bug persists in the latest commit, v5.15.76 (4f5365f77018). I hope
> it is helpful to you.
> 
> [ 1782.137186][   T30] INFO: task a.out:6910 blocked for more than 143 seconds.
> [ 1782.139217][   T30]       Not tainted 5.15.76 #5
> [ 1782.140388][   T30] "echo 0 >
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 1782.142524][   T30] task:a.out           state:D stack:14296 pid:
> 6910 ppid:  6532 flags:0x00004004
> [ 1782.144799][   T30] Call Trace:
> [ 1782.145623][   T30]  <TASK>
> [ 1782.146316][   T30]  __schedule+0x3e8/0x1850
> [ 1782.152029][   T30]  ? mark_held_locks+0x49/0x70
> [ 1782.153533][   T30]  ? mark_held_locks+0x10/0x70
> [ 1782.154759][   T30]  ? __down_write_common.part.14+0x31f/0x7b0
> [ 1782.156159][   T30]  schedule+0x4e/0xe0
> [ 1782.158314][   T30]  __down_write_common.part.14+0x324/0x7b0
> [ 1782.159704][   T30]  ? fscrypt_ioctl_set_policy+0xe0/0x200
> [ 1782.161050][   T30]  fscrypt_ioctl_set_policy+0xe0/0x200
> [ 1782.162330][   T30]  __f2fs_ioctl+0x9d6/0x45e0
> [ 1782.163417][   T30]  f2fs_ioctl+0x64/0x240
> [ 1782.164404][   T30]  ? __f2fs_ioctl+0x45e0/0x45e0
> [ 1782.165554][   T30]  __x64_sys_ioctl+0xb6/0x100
> [ 1782.166662][   T30]  do_syscall_64+0x34/0xb0
> [ 1782.169947][   T30]  entry_SYSCALL_64_after_hwframe+0x61/0xcb

Well, the quality of this bug report has a lot to be desired (not on upstream
kernel, reproducer is full of totally irrelevant stuff, not sent to the mailing
list of the filesystem whose disk image is being fuzzed, etc.).  But what is
going on is that f2fs_empty_dir() doesn't consider the case of a directory with
an extremely large i_size on a malicious disk image.

Specifically, the reproducer mounts an f2fs image with a directory that has an
i_size of 14814520042850357248, then calls FS_IOC_SET_ENCRYPTION_POLICY on it.
That results in a call to f2fs_empty_dir() to check whether the directory is
empty.  f2fs_empty_dir() then iterates through all 3616826182336513 blocks the
directory allegedly contains to check whether any contain anything.  i_rwsem is
held during this, so anything else that tries to take it will hang.

I'll look into this more if needed, but Jaegeuk and Chao, do you happen to have
any ideas for how f2fs_empty_dir() should be fixed?  Is there an easy way to
just iterate through the blocks that are actually allocated?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
