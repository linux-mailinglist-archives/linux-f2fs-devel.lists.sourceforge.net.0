Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B0AB7019
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 17:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0Mnas43O6T20wyRJghGuAHsQQcUGV9KFDpdRgWk3Zk=; b=h1znc4NbbFVBZdJT9tXHMFad4k
	kkMN5qix63Zc9FtXsMSMtvOb2+ySZMZlhMQoqYsFnEO02/ZWrTcJMLyZRycvIe3w8XPTbPv0CGNrI
	VLMgwcX7pDgt9pEtPbLirk8IjT5TScsB7EGucEZeFt6ahMlvaCGFHlXPDKXh+wLuwmR0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uFEDM-0004mQ-RN;
	Wed, 14 May 2025 15:40:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uFEDK-0004mA-KD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzAu0es6Oao511/+GUqFRNUDRzekYol8zZTTOW/qdh0=; b=CWFAQ8oGxBNBhkDnDL4duth58c
 AqyuLxSgYn3Y/tHaVnfXj/FH98zbrnfxqGyV27+P+i3UaAm8mIqPGgjXxYBMnn1x9iaX8u8PwRVJM
 u6LQVp9l4LcwnvdwEk4pboFVn9RUH8YR3m+yTMIeef1my8ZqZw2ss48uv7pgMFBzIPpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bzAu0es6Oao511/+GUqFRNUDRzekYol8zZTTOW/qdh0=; b=IEnvYDgRxY9wNF7QgFr0YC5V6/
 yU9C/IcU8CNkLz4sRWg6ZDzJzheAqcKF56SoAP/P6XNMroLmj0iHAD6MlH5Lz5dky+MfAhSmDrnyN
 qRwGor6HYV2qjlHiMUcN6Jcze8RrzOMrzrb1YiZ5poo1MAU6f1vR7iIjnuNFBQYD60nM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uFEDK-0002E8-1z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 15:40:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AD3F61360
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 15:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECD4C4CEF6;
 Wed, 14 May 2025 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747237199;
 bh=CXW+8Kkek2ngZPRlgBBnb1RmAch5ngUtLPbJkneb+50=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nzStKIFW7HgaBXbpJo+kw03oJ7BqoIxAiw5AVk8siWT4Q1iI3ZJZRKenRUjyAImpy
 vOUH74NFRlqrz2a4qx13NeT+QjtWTrbUCzeXREshKICW5Qf9IF8LQPQ6T+bzsyi8ct
 HMlkR16M/15hTkJn0qOL24NzJL3mcPdqOggQaCsPtiYxdP2aCV2k9ebM6HMGZcmHXk
 O5p2pfY8BTRVN2rvvF+onqcL7+hyPkvhy543XiuU17rMXJhpLkNoqi2Q2JOjTwiqs3
 4j2P3iyvgjq5RQIJlP1t4kYUnK2AK8nFuzdbgguktR5tH1WQrlwfctnOkyQSKSHAM/
 Xvj5GLk/dN/LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD79380AA66; Wed, 14 May 2025 15:40:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174723723649.2412407.16054768914286290257.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:36 +0000
References: <20250513055721.2918793-1-chao@kernel.org>
In-Reply-To: <20250513055721.2918793-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 May 2025 13:57:20 +0800 you
 wrote: > .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will
 try > to allocate physically continuous page first, it may cause more memory
 > allocati [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uFEDK-0002E8-1z
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use vmalloc instead of kvmalloc in
 .init_{, de}compress_ctx
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 May 2025 13:57:20 +0800 you wrote:
> .init_{,de}compress_ctx uses kvmalloc() to alloc memory, it will try
> to allocate physically continuous page first, it may cause more memory
> allocation pressure, let's use vmalloc instead to mitigate it.
> 
> [Test]
> cd /data/local/tmp
> touch file
> f2fs_io setflags compression file
> f2fs_io getflags file
> for i in $(seq 1 10); do sync; echo 3 > /proc/sys/vm/drop_caches;\
> time f2fs_io write 512 0 4096 zero osync file; truncate -s 0 file;\
> done
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: use vmalloc instead of kvmalloc in .init_{, de}compress_ctx
    https://git.kernel.org/jaegeuk/f2fs/c/10b26e772b10
  - [f2fs-dev,2/2] f2fs: introduce FAULT_VMALLOC
    https://git.kernel.org/jaegeuk/f2fs/c/2c19d65bab04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
