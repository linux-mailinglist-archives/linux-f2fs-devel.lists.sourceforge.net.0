Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79FAD0D16
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Jun 2025 13:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cETXrBIPCJZP1VXbt2y7Sf+WeYc/R2FgTl1UY/PYhRU=; b=HD6wNzaGh5ExmbfWk5GsiXQvM7
	vuKpAEvgiqfdNjrmBpIXrFgP2Wzy85LqvuO1EbGCofpbZDqD8o9WkV+47YPVrj6BkaEMH0EY9nt0J
	CQ9GpQavn1YlHUhTOCaYnkMHGD2dozOn2hD7pibrHCths6nCCwEBQmpjp1pJwVSZF+5M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNrfE-0001t1-0k;
	Sat, 07 Jun 2025 11:24:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uNrfC-0001sv-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BOXW6Ajyk5opQtCtMkh79kFN/f5SBnksR5GZj8zNwpA=; b=aLfIEL8gwTypSicYSgfmsV0A77
 4Si4VGPbq8qqE95O99vmjP0HhQnoTTl4IC0TsUAQFGeNQV/xamW6SoET/UypZhUfI/KFLnGks9lxn
 raSqBr88K4465t/0wL/VpOuG0rWt5MhZaF21zqWWrAPc6bMuW9IUk4jRnu6lIiAnWZbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BOXW6Ajyk5opQtCtMkh79kFN/f5SBnksR5GZj8zNwpA=; b=M5AFBajpoplVAsqQTZ9Kwxg7Hv
 mWfgkyD7ACA8YYcPO3FxhIXu4fa6FoOAJry2L5TRHEysPEh78nAZQ9+Np5Jqcqn663mFQwueORhhz
 V+i4PBTKsqqN5DcyVShbTzk5lxUr+YP2b3JBMC3koC0XFPmUJnBWVScz8IapfyuuShas=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uNrfC-0001oL-FE for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CD4FFA50577;
 Sat,  7 Jun 2025 11:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DB4C4CEE4;
 Sat,  7 Jun 2025 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749295472;
 bh=nuUPsTwBuGQIwTKkqwCC+8mAEXl6kp7AHsVvWhxw5F8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Tb+sNoMun6BAZt2rbPS/Qtg+fz85SmubVh+/sdWJlhV35bOtu47qQnTFXlv41Iahf
 4FozRfiXbF+I4Tnvo4EfO/pqrtWZHpGCapwQej56S8ONsatBoGy/WVDYiNs7a8+rE1
 TD6J7l694AoTkWLnjOCrnSEdTnPkHExI29zSnBN7hojKx4sAZ7/99YUx1ksJ7Y5XyI
 EVwJK/M+RZkQOpTwzyg/mic8v278OOJTtxu1LAp3ElAs0SRQGj2NzA+lAlVdhfQGY9
 ZppYau99Hm/4+/fKoNK5oLN8LPTqrReZJ5kjLu7DanWge26lfkLJA0QL1Y/QX3kTa3
 KB08BJ/LdliPw==
Message-ID: <b5781bc9-ed04-4e3f-bbc1-126e18620ff3@kernel.org>
Date: Sat, 7 Jun 2025 19:24:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250607064116.2993239-1-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250607064116.2993239-1-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/7 14:41,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > When committing new super block, bio is allocated but not freed, and
 > kmemleak complains: > > unreferenced object 0 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uNrfC-0001oL-FE
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix bio memleak when committing super
 block
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/7 14:41, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When committing new super block, bio is allocated but not freed, and
> kmemleak complains:
> 
>    unreferenced object 0xffff88801d185600 (size 192):
>      comm "kworker/3:2", pid 128, jiffies 4298624992
>      hex dump (first 32 bytes):
>        00 00 00 00 00 00 00 00 80 67 c3 00 81 88 ff ff  .........g......
>        01 08 06 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
>      backtrace (crc 650ecdb1):
>        kmem_cache_alloc_noprof+0x3a9/0x460
>        mempool_alloc_noprof+0x12f/0x310
>        bio_alloc_bioset+0x1e2/0x7e0
>        __f2fs_commit_super+0xe0/0x370
>        f2fs_commit_super+0x4ed/0x8c0
>        f2fs_record_error_work+0xc7/0x190
>        process_one_work+0x7db/0x1970
>        worker_thread+0x518/0xea0
>        kthread+0x359/0x690
>        ret_from_fork+0x34/0x70
>        ret_from_fork_asm+0x1a/0x30
> 
> The issue can be reproduced by:
> 
>    mount /dev/vda /mnt
>    i=0
>    while :; do
>        echo '[h]abc' > /sys/fs/f2fs/vda/extension_list
>        echo '[h]!abc' > /sys/fs/f2fs/vda/extension_list
>        echo scan > /sys/kernel/debug/kmemleak
>        dmesg | grep "new suspected memory leaks"
>        [ $? -eq 0 ] && break
>        i=$((i + 1))
>        echo "$i"
>    done
>    umount /mnt
> 
> Fixes: 5bcde4557862 ("f2fs: get rid of buffer_head use")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
