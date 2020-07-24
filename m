Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0622BC78
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 05:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyoQj-00047p-MQ; Fri, 24 Jul 2020 03:31:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyoQi-00047h-Nc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HWnJ7jA1uqtx04I3FXKhzw91p+tv3EcRzn9MxLZW+uI=; b=UX9+JYNGbWJJIotx4BxcyzGG7X
 JDmF6hbGfJO4SBMvD9ObCATdRUakmVHVeOPHE6bveaDrmQsHRpoxhoZmnDBCT4GsP7e9l8oOcM6Pj
 BoS22qIjOCkYD6QoWgz+e59AZIMmM4in2muIUeoMhJNYyAcglRK98egvE3hGK3eqimJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HWnJ7jA1uqtx04I3FXKhzw91p+tv3EcRzn9MxLZW+uI=; b=acYaThEeCJed1irDjwGosJ7hke
 h8E1J3NbJ8ZfdlL6/Tn4+7ecMZBLRdtbP97DDy41uTRyUxN2ulfjryND/MA3hIeub02hzh34E87g8
 Od/bEWd4/eFzieMTGPlLuixadWT+pauH+k2BncQIXX2E18MUQOnxcADCavnEkZlJP5ds=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyoQh-0075ji-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:31:28 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFDBE20709;
 Fri, 24 Jul 2020 03:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595561481;
 bh=ZlwAHRnTENWZ05fqkTXNADy1dR0HVU0istXyIIVjXD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0/5HZwsSmuPHUWeVqFibrdT4CQ5UzDXtlpMm9ym8r/S2x3MJtayFJOfQWnwAzOh4D
 AhT8a6OgIuQhW7QfA4jx9Zf42paB8yLhXeNWY1q3MBsRlwDsaOTksMOydeCjJfJu/P
 dUZGb7e8dEwin3A20gMHd9FPvl8FqoaXE9H+tNHM=
Date: Thu, 23 Jul 2020 20:31:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20200724033120.GA3522766@google.com>
References: <CADYdroO3nv0E8kV=wPgR8JYj-Tpu_CO9eUDTWFSvFb7CsUU4og@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADYdroO3nv0E8kV=wPgR8JYj-Tpu_CO9eUDTWFSvFb7CsUU4og@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyoQh-0075ji-7Q
Subject: Re: [f2fs-dev] fsck.f2fs tool causes endless reboots if used with
 systemd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/23, Norbert Lange wrote:
> Hello,
> 
> I have the problem that a f2fs filesystem together with systemd (and
> an installed fsck.f2fs) will endlessly reboot.
> 
> The fsck.f2fs tool behaves differently to the ext variants, does not
> seem to support the -a switch and fails on a mounted device (by
> default). ie. it would not help calling fsck from the initramfs
> either.
> fsck tools seem wildly different, but systemd assumes some basic uniformity
> 
> systemd version the issue has been seen with
> 
> systemd 245 (245)
> -PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK -SYSVINIT -UTMP
> -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL -XZ +LZ4 -SECCOMP +BLKID -ELFUTILS
> +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=unified
> 
> fsck.f2fs 1.13.0 (2019-09-24)
> 
> The root filesystem is f2fs, mounted read-only from the initrd.
> Systemd will endlessly reboot the system as the fsck attempt fails.
> 
> The systemd-fsck tool will end up calling fsck.f2fs with the parameter below,
> and will fail as this device is mounted (tries to open it in exclusive mode).
> 
> $ fsck.f2fs -a /dev/mmcblk0p5; echo $?
> Info: Fix the reported corruption.
> Info: Mounted device!
> Info: Check FS only on RO mounted device
> Error: Failed to open the device!
> 255
> 
> A workaround would be to force or skip the check
> 
> fsck.f2fs -a -f /dev/mmcblk0p5; echo $?
> Info: Fix the reported corruption.
> .....
> Done: 0.232165 secs
> 0

I think we ended up the discussion here.

https://lore.kernel.org/linux-f2fs-devel/CADoWrG-0GWtwqaW7rsPWLDYcoAsvXhwRa9zVib9bN94g1LLw6Q@mail.gmail.com/

> 
> Norbert
> 
> [1] - https://github.com/systemd/systemd/issues/15106
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
