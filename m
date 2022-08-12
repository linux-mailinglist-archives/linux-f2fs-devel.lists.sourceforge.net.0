Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 719AE591547
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 20:09:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMZ6P-00046s-UW;
	Fri, 12 Aug 2022 18:09:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oMZ6P-00046m-5z
 for Linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 18:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U/x9K5yUUCUJuKOmradSeWkWToymig/WIw3reqfWKPY=; b=dec1tOLAkPq1NMHpmRPe8xUDbU
 zz6jEBrvVcbt576i8Ru8ATA3k8vSVYL+L9mAGHuvJBTJjAujnIdvFiqpn2RJTtkvwE3nHm4EiyDp5
 +cf0LPmFpQLuXMh05i0u+D4x/k0A43f7h6Bd6YzRjZUELkNdGPF6yE+/dEJ5l9x0GSjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U/x9K5yUUCUJuKOmradSeWkWToymig/WIw3reqfWKPY=; b=ghiViQ63IJHotoPi4lVkMU8N02
 gexrVtmGSLzVsVXDlXNsLbBiuWnWUEgtGa3lB2YQGHq1O5GfamW0fC0kW22f2tsV5Vp4oirW/GQ3q
 2kmpiFoo4dHOe2vtb6MWSOhriqASojVNcFR8BPk9D0Vi/+yLSn0S7xs1z4VQaZQGkF5E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMZ6J-00DeFi-Nv
 for Linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 18:09:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD5E5B82506;
 Fri, 12 Aug 2022 18:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642FAC433D6;
 Fri, 12 Aug 2022 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660327767;
 bh=LmJaVpC/a+OkodgrkbxhYAxUZvNk9jexSPLoxuNWJ7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SoO7udE6gvf6CYPP0HbYMEaoIpMKX4sctFD0tFQJlOZbVM2gXSet4veKuagZpCnU/
 Ds1gRMNSP6mfw3PL/EJqn+Abt9IwoUD3We+M7U9ATYxzX7T5Ua5PUmrZQ9YItJ/RuQ
 fUY/8NGOVPmJF+5eg7/NLCPfUJRdvJMuq9vnkaaJ4bn71DcXZkL5k/h+Hk4DOxnJyD
 dPoGK0lEO1aiUzdkxJGBaj8P9A7xO/hAoLz3RvivK6UnmwD24XfcdzUHb9vrFKFYDu
 0FGHBZ+k21wK+q8fWS1Rj2/U/HajcJ2TYlZWdlsb6Skb1Z+Gj1psjCc/yJnow0VfdN
 Fs31mwcvd3FYw==
Date: Fri, 12 Aug 2022 11:09:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John Kehayias <john.kehayias@protonmail.com>
Message-ID: <YvaXVV17YMDD2MhK@google.com>
References: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <z1RSWUWvfCmbB3L_utbn1krfKRIw9T0dlzsLmT2h9615ny3oIgP80mJBL-L58og28AYHPIZdcAOBU9Ok7ao00tJUN9KNFM2K_owrSflLUWk=@protonmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi John, On 08/12, John Kehayias via Linux-f2fs-devel wrote:
 > Hello, > > Apologies if this is not the correct mailing list, but it was
 the only one I could find. > > I just resized an f2fs partition to the re
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMZ6J-00DeFi-Nv
Subject: Re: [f2fs-dev] How to recover from "Wrong valid_user_blocks"?
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
Cc: "Linux-f2fs-devel@lists.sourceforge.net"
 <Linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi John,

On 08/12, John Kehayias via Linux-f2fs-devel wrote:
> Hello,
> 
> Apologies if this is not the correct mailing list, but it was the only one I could find.
> 
> I just resized an f2fs partition to the remaining free space on the disk. This seemed fine and resize.f2fs also seemed fine. However, the partition will no longer mount, due to this message:
> 
> Aug 12 00:10:09 localhost vmunix: [22056.879920] F2FS-fs (sdb2): invalid crc_offset: 0
> Aug 12 00:10:09 localhost vmunix: [22056.881202] F2FS-fs (sdb2): Wrong valid_user_blocks: 7163307, user_block_count: 5227520
> Aug 12 00:10:09 localhost vmunix: [22056.881206] F2FS-fs (sdb2): Failed to get valid F2FS checkpoint
> 
> Is there any way to fix this error?
> 
> I see this error reported before and supposedly fixed in current versions, though I had use f2fs-tools v1.14. I tried using 1.15 and from git, but resize reports nothing to do and fsck is successful. Here is that output:
> 
> Info: [/dev/sdb2] Disk Model: SD  Transcend   
> Info: MKFS version
>   "Linux version 5.5.2-arch1-1 (linux@archlinux) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue, 04 Feb 2020 18:56:18 +0000"
> Info: FSCK version
>   from "Linux version 5.18.14 (guix@guix) (gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC 1"
>     to "Linux version 5.18.14 (guix@guix) (gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.37) #1 SMP PREEMPT_DYNAMIC 1"
> Info: superblock features = 0 : 
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: total FS sectors = 124528600 (60804 MB)
> 	Invalid CP CRC offset: 0
> Info: CKPT version = 6ea966da
> Info: Checked valid nat_bits in checkpoint
> Info: checkpoint state = 81 :  nat_bits unmount
> [FSCK] Check node 1 / 402988 (0.00%)
> [FSCK] Check node 40299 / 402988 (10.00%)
> [FSCK] Check node 80597 / 402988 (20.00%)
> [FSCK] Check node 120895 / 402988 (30.00%)
> [FSCK] Check node 161193 / 402988 (40.00%)
> [FSCK] Check node 201491 / 402988 (50.00%)
> [FSCK] Check node 241789 / 402988 (60.00%)
> [FSCK] Check node 282087 / 402988 (70.00%)
> [FSCK] Check node 322385 / 402988 (80.00%)
> [FSCK] Check node 362683 / 402988 (90.00%)
> [FSCK] Check node 402981 / 402988 (100.00%)
> 
> [FSCK] Max image size: 30099 MB, Free space: 16769654 MB
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x474]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x6d4dab]
> [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x6262c]
> [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x6262c]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x61367]
> [FSCK] free segment_count matched with CP             [Ok..] [0x3cc0]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Ok..]
> 
> Done: 0.000000 secs
> sudo fsck.f2fs /dev/sdb2  6.20s user 5.41s system 4% cpu 4:24.44 total
> 
> I hope someone can help. It seems to just be a metadata issue? Is there a way to manually fix the misreported block count to resolve this?

Yeah, I guess so. Can I get the full fsck log by "fsck.f2fs -d 3"?

> 
> Thanks,
> John
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
