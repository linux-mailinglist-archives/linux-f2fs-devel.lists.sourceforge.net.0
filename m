Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC5773587
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 02:48:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTAto-0000Cf-9B;
	Tue, 08 Aug 2023 00:48:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qTAtm-0000CZ-Vb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 00:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WwpW0FuGEWHvM3Fz5gkuszhEj64QIkVzz82KQXaVyg0=; b=aa1qf24LdKSZQty9tYh5GC5SaC
 Z8W0G45R7X68R4jcO676Of5SEUmb5PnV8h3Bz3o7odl0EVAX0jAinisDOzOPWsFlrNVt+IOzlANEh
 LzZ21MUMcUgZyRSOCUHQL08AYcFuHBITvQ+/4AOQKoCmY26xPyLOVexFsfqfLYVeyJi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WwpW0FuGEWHvM3Fz5gkuszhEj64QIkVzz82KQXaVyg0=; b=cNnIrQstRjnWWpOn4lnPsvgNqx
 xObPRCU/T3dlscbQduazMjZZnHnmcXGY09LyUzLkRc5h+z9y11uWSEjRrg5h4SlCqo6mjtjASvGik
 kZ+POEwFa9OUQnZSiOwWIBLtBIaPRkyIOhqz6hwxNMpNyK90azsByz9ej8Mof6wzGsV8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qTAtm-0002Yq-92 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 00:48:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A98FC6232B;
 Tue,  8 Aug 2023 00:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EBEC433C7;
 Tue,  8 Aug 2023 00:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691455708;
 bh=6PjpG/yBmovC2lWrM3FLycfIZttTgbH8fpSd7ReR39U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ub5fxKJRhB9BYv+vYgp/sIPn13iURlxUQS/3XAlSYx+Fzqzb5X89wfRZg6aUWiWgS
 P+YPKIjH1mCILpaTqJqwgbU+TuL29luYo6Esx79wqW8BuLevBPMc10XBAYWeOkqlOl
 o44h3MTnpYhCLwfAiQoVLp48wbJSdBkGhDP5iGySoL/kmu8Fyt9O6i/l20HrDOr8hu
 b+ko4crNwqkio+8FY5nQvsPwDIN5/QyF9K1lIXvFKWNJRApvHVVx9lFPBnIVdKMLYy
 2aQsz0BwzmDwm3Fg5zJFRNsS4RKAUplV4Hg3DafLTgwSbk7Sn4nck8NlkxrE05i2vF
 ztVYlUaGxzTgg==
Message-ID: <eefdd25f-502c-8ab4-c49b-f1cb2c6bfd2a@kernel.org>
Date: Tue, 8 Aug 2023 08:48:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230807195219.371131-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230807195219.371131-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/8 3:52, Jaegeuk Kim wrote: > This reverts commit
 bfd476623999118d9c509cb0fa9380f2912bc225. > > Shinichiro Kawasaki reported:
 > > When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qTAtm-0002Yq-92
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: clean up w/
 sbi->log_sectors_per_block"
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
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/8 3:52, Jaegeuk Kim wrote:
> This reverts commit bfd476623999118d9c509cb0fa9380f2912bc225.
> 
> Shinichiro Kawasaki reported:
> 
> When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
> devices with 4kb logical block size, I observe mount failure as follows. When
> I revert this commit, the failure goes away.
> 
> [  167.781975][ T1555] F2FS-fs (dm-0): IO Block Size:        4 KB
> [  167.890728][ T1555] F2FS-fs (dm-0): Found nat_bits in checkpoint
> [  171.482588][ T1555] F2FS-fs (dm-0): Zone without valid block has non-zero write pointer. Reset the write pointer: wp[0x1300,0x8]
> [  171.496000][ T1555] F2FS-fs (dm-0): (0) : Unaligned zone reset attempted (block 280000 + 80000)
> [  171.505037][ T1555] F2FS-fs (dm-0): Discard zone failed:  (errno=-5)
> 
> The patch replaced "sbi->log_blocksize - SECTOR_SHIFT" with
> "sbi->log_sectors_per_block". However, I think these two are not equal when the
> device has 4k logical block size. The former uses Linux kernel sector size 512
> byte. The latter use 512b sector size or 4kb sector size depending on the
> device. mkfs.f2fs obtains logical block size via BLKSSZGET ioctl from the device
> and reflects it to the value sbi->log_sector_size_per_block. This causes
> unexpected write pointer calculations in check_zone_write_pointer(). This
> resulted in unexpected zone reset and the mount failure.
> 
> [1] https://lkml.kernel.org/linux-f2fs-devel/20230711050101.GA19128@lst.de/
> [2] https://lore.kernel.org/linux-f2fs-devel/20230804091556.2372567-1-shinichiro.kawasaki@wdc.com/
> 
> Cc: stable@vger.kernel.org
> Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: bfd476623999 ("f2fs: clean up w/ sbi->log_sectors_per_block")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
