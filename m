Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C038EB1125F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byVhi15xcUkyaU5IpG0inDoUyBKkcwlPVwJbphNS+to=; b=H+qyyj4B1bDnhWQ4EKJAmfT8H0
	m/+y80V1U4s+6UlK+sdRI6ePJBwOz8LECLG5PoVf7Cg7uQv/QXL2UxbpCdcL3e9ieBKxDzyvPKoOi
	7vXAQiTDmc38r7jzAhk7NTDiCaezw0iAKEBtG8wWb1bSMiAgmPEogxxYiSkFlBwmvl7Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zs-000268-R2;
	Thu, 24 Jul 2025 20:30:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zr-000261-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oFWGh5eJ1Ds0MpYmLoJiTrRjuK0Tv3/UEzwpyWpO0qE=; b=TmYXW3tMhBsdVDSYSrAuIhS5om
 ARt2bRxVD+uJstofU07KFWo7daXSK/S7ezC9jNsgbRCjU6zK8OhZQgekEheRtT9IkfumWg4N4NzqR
 2IXu4Rpsg4m7xoW5iOS6Y7e3joXUMh02Y8DLZ+XNs8Rhxj/Dp6lNFi/suub332sHw5n4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oFWGh5eJ1Ds0MpYmLoJiTrRjuK0Tv3/UEzwpyWpO0qE=; b=ceE01m06PocFoPR0DDoIw9sbVv
 +yz+D0ckkJVziDfg/Nu9p4aYPAICGJBGWs9seaXuC7G6heOOENdf4qx26otZw6hIDqpHwoUUfR6Xs
 Vj9gWpJejGX0/BGvqrJ67K+5nm74MOAmKpveyme/jRLpLoy4A1BqNHczrC22AKODP5Ks=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zr-00014s-AB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0305B467DA;
 Thu, 24 Jul 2025 20:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FCDC4CEF1;
 Thu, 24 Jul 2025 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388996;
 bh=yUA0VWIyeHlYZOjb7vM/j98AYzNvhPEn+9fx/2KTsoc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KevnvUtX5M3vEuUgXUMFOB6wdBE2Cl4dD87KoJAfI2S01De7sTGzSI8LnAeDg/zX5
 TB6RrHoSyAJstZ47NiKG1HXcyxwy/WQz6+kQWzY3oJL2DUE+hWXSpSanCnyIbMqevI
 7klEuEP8npU44j8zrJnGajTL2lX/Ah/LnGjew1IGXe/LThFsZENfXrEzSsQVu5Hp7G
 PJBJqO+IJ0Y+ue5YfmQHxHJymN77sARvGvSCXKOJMR7tbnXnZktCEb51+Uvqy66E7A
 RfH8e3mev60G61s9jrkYcxULvNfMDO3PiEdYjmeqLIV79HDE3I+tEsygj3ZJBlHBKY
 ftW+ZEWpHbJAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF0C383BF4E; Thu, 24 Jul 2025 20:30:15 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338901449.2519964.11721744043840464584.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:14 +0000
References: <20250724153115.125311-1-jprusakowski@google.com>
In-Reply-To: <20250724153115.125311-1-jprusakowski@google.com>
To: Jan Prusakowski <jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 24 Jul 2025 17:31:15 +0200 you
 wrote: > When testing F2FS with xfstests using UFS backed virtual disks the
 > kernel complains sometimes that f2fs_release_decomp_mem() calls >
 vm_unmap_ram() fr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zr-00014s-AB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: vm_unmap_ram() may be called from
 an invalid context
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 24 Jul 2025 17:31:15 +0200 you wrote:
> When testing F2FS with xfstests using UFS backed virtual disks the
> kernel complains sometimes that f2fs_release_decomp_mem() calls
> vm_unmap_ram() from an invalid context. Example trace from
> f2fs/007 test:
> 
> f2fs/007 5s ...  [12:59:38][    8.902525] run fstests f2fs/007
> [   11.468026] BUG: sleeping function called from invalid context at mm/vmalloc.c:2978
> [   11.471849] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 68, name: irq/22-ufshcd
> [   11.475357] preempt_count: 1, expected: 0
> [   11.476970] RCU nest depth: 0, expected: 0
> [   11.478531] CPU: 0 UID: 0 PID: 68 Comm: irq/22-ufshcd Tainted: G        W           6.16.0-rc5-xfstests-ufs-g40f92e79b0aa #9 PREEMPT(none)
> [   11.478535] Tainted: [W]=WARN
> [   11.478536] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   11.478537] Call Trace:
> [   11.478543]  <TASK>
> [   11.478545]  dump_stack_lvl+0x4e/0x70
> [   11.478554]  __might_resched.cold+0xaf/0xbe
> [   11.478557]  vm_unmap_ram+0x21/0xb0
> [   11.478560]  f2fs_release_decomp_mem+0x59/0x80
> [   11.478563]  f2fs_free_dic+0x18/0x1a0
> [   11.478565]  f2fs_finish_read_bio+0xd7/0x290
> [   11.478570]  blk_update_request+0xec/0x3b0
> [   11.478574]  ? sbitmap_queue_clear+0x3b/0x60
> [   11.478576]  scsi_end_request+0x27/0x1a0
> [   11.478582]  scsi_io_completion+0x40/0x300
> [   11.478583]  ufshcd_mcq_poll_cqe_lock+0xa3/0xe0
> [   11.478588]  ufshcd_sl_intr+0x194/0x1f0
> [   11.478592]  ufshcd_threaded_intr+0x68/0xb0
> [   11.478594]  ? __pfx_irq_thread_fn+0x10/0x10
> [   11.478599]  irq_thread_fn+0x20/0x60
> [   11.478602]  ? __pfx_irq_thread_fn+0x10/0x10
> [   11.478603]  irq_thread+0xb9/0x180
> [   11.478605]  ? __pfx_irq_thread_dtor+0x10/0x10
> [   11.478607]  ? __pfx_irq_thread+0x10/0x10
> [   11.478609]  kthread+0x10a/0x230
> [   11.478614]  ? __pfx_kthread+0x10/0x10
> [   11.478615]  ret_from_fork+0x7e/0xd0
> [   11.478619]  ? __pfx_kthread+0x10/0x10
> [   11.478621]  ret_from_fork_asm+0x1a/0x30
> [   11.478623]  </TASK>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: vm_unmap_ram() may be called from an invalid context
    https://git.kernel.org/jaegeuk/f2fs/c/08a7efc5b02a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
