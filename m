Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94204073A3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Sep 2021 00:59:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOpU3-0005Ml-Fs; Fri, 10 Sep 2021 22:58:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mOpU2-0005Mf-G2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 22:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVsR/RRT7I3Tnxkv/nTlHz93RR/GMXX4+jeo5eedbJo=; b=CwbKeITBX9jcAkQQllx0ZGW3BQ
 EeZ6ERVLpMTAhnlhV+VeF9hW6mNP8nDTIW6QkMuHfIkrkx2hyzKtjqeCjmD248j86gaonIbmjyfRm
 H1ypgC26/Fm5yZHoXlyhdZGOGC3K88fgbbH/knTCzc5yKecAF6JOJ85OSqReLYe3yHbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xVsR/RRT7I3Tnxkv/nTlHz93RR/GMXX4+jeo5eedbJo=; b=G8gfse8P7se41xbU4VcnELWAwM
 kKhS9V1ermrUGQ23lJIEsX4YGjLUCG4U4T251VMomkYyioTmAlhcvt7x+RiJI7rmgSaxtDk+MdW/6
 3BO3ijTYqyfoPy/FoR8badHbJAh4qhhpHIUVEO/vXAbFGT7WNl3TtbNe4f/lpLsUsLZA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOpU1-006fKU-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 22:58:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11F316113E;
 Fri, 10 Sep 2021 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631314732;
 bh=S4z88pHwH9sVsO53796P1cgVESaByYjJicev6ptKa3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CnR4wX6YS3smqW1Jen6axpgAZjO2snooTKGwJMibFGowaDdlhU4GxG/sLjVgdStNS
 njXxdaW5o+XsrEF3ye4o7jnafHlEEQ75um1TKWlEGWdhVYqch7VCjfCinzftjTH5Cg
 32f3S/c8dqC+1YoVHza68lcopclcARBK43u6feTgyLDYvxeEA9e265iZHyfg0K2OKk
 X0/7krOdbiTzbWyZcpdpZ4jBkMp2JYGWcPRV75uiofDoZJaMVcjNoGCmRVY8tk/SkL
 RdkHgRYVgLanAePnwUVOjNpV+pgrW50FQNmkdFKNyZdjspR0AKigiyb3eH4thLEsm1
 LczNyophRJZ4A==
Date: Fri, 10 Sep 2021 15:58:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "S." <sb56637@gmail.com>
Message-ID: <YTvjKmf/dxzuDemP@google.com>
References: <75f47f9c-4587-9105-81bd-38708df8fab9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75f47f9c-4587-9105-81bd-38708df8fab9@gmail.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/07, S. wrote: > Hi there, I develop Linux spins based
 on openSUSE Tumbleweed. Currently the base system has Linux 5.14.0 and
 f2fs-tools
 1.14.0. There is a bug that I can consistently reproduce w [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOpU1-006fKU-Ls
Subject: Re: [f2fs-dev] mkfs.f2fs -f to reformat Btrfs partition doesn't
 change FS type
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

On 09/07, S. wrote:
> Hi there, I develop Linux spins based on openSUSE Tumbleweed. Currently the base system has Linux 5.14.0 and f2fs-tools 1.14.0. There is a bug that I can consistently reproduce with:
> # mkfs.f2fs -f /dev/sda1
> When the prior filesystem of /dev/sda1 is Btrfs, the `mkfs.f2fs` command is successful, but the filesystem type remains "Btrfs". Then the filesystem can be manually mounted with `mount -t f2fs ####` but only manually, the wrong FS type confuses the Linux boot process and won't allow it to mount in the case of a root partition. This appears to only happen when the previous filesystem is Btrfs. I have tested this bug to *not* occur when the previous filesystem is EXT4 and XFS.

It seems mkfs.f2fs didn't wipe the BTRFS magic since that is unused critical
space in f2fs. Anyway, I think it's worth to fix it.

https://lore.kernel.org/linux-f2fs-devel/20210910225618.501839-1-jaegeuk@kernel.org/T/#u

> Thanks a lot!
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
