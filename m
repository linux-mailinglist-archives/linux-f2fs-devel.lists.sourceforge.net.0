Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429FA9BDDE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Apr 2025 07:31:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8BeH-0002kT-8L;
	Fri, 25 Apr 2025 05:30:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8BeG-0002kM-25
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 05:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fd7KmVfOfgnbNloYp6gRGSWS1yDfF4QQUCZnAccuPp4=; b=DrqKcsKNPx0Hzwo6lYq2HSAdp7
 c+TSKfgJxaxvLWkdtaMxXmKzy7FUh1U9gTPD5ACzqryMUtbC7iS6gSgf1dV+FErKAK7d1UKjoMmLS
 G070KS7duZ2xeix5PyNYo16F2spOHaYDXyvMRBL0S6ja5XDgC4+JqvxPsBhIKIcDjMfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fd7KmVfOfgnbNloYp6gRGSWS1yDfF4QQUCZnAccuPp4=; b=lyj1twJpAOHkzvOZ71MY+UMGqq
 QBqlhiZe6nT+WWfH1Hc44/MSQhy0pcgk/Oxr0axUfUm3trCpSJeGhrtqkKu4kYL9F0+VRzLC/9bmb
 3lioEpHxPZDK0m/J6JN7U+xouKqY5tYD4iTQ7+3ocXySaqf/PNwq3khO+jXqcB6qFj18=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u8Bdy-0001sh-Cw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Apr 2025 05:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 768BF68464;
 Fri, 25 Apr 2025 05:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993D8C4CEE4;
 Fri, 25 Apr 2025 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745559023;
 bh=q02gApNadhi8D1tFUCCGcREvAjK1/0bz91C5PBVts2E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Zy/CsipgD24Y5EnFlz6bZg5palYb9sIcZSf8yXpbeMy7iSuZ/gHXRStIjvbav6Yoi
 grMIeS40V3+WRi6KQbOdELbM6FWLXLIJTVOjCpNRo4tI8YSoCMwxXS9A1SEeTUd0xu
 wOPTTzWFmstDFpO4Ls3krqUS7lPTeI1LfZC3/QqQ51MnejLl9444ppUGuBJCuPOjD5
 zdzH9lIRbxm+ZNQaMRyNpv/KcJlcsHHJ7YasnOppFzTVkMabjrwqLXMyKj9czN5csH
 VxH2csAkRcXnrKYLXyekvlKBUFh+nDvCUZKP72b1troZTCIRAmHNItkc4rZ5hFnTYN
 QXdnfOil5PiIw==
Message-ID: <ab8d88cb-bfb8-44eb-9cd8-89cf7216e728@kernel.org>
Date: Fri, 25 Apr 2025 13:30:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3KgngtQdZP-fCOM-X5-16-JgRLYJeNFc2h4zNQu6uPS9g@mail.gmail.com>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Zhiguo, On 4/25/25 13:11, Zhiguo Niu wrote: > Hi Chao and
 Jaegeuk, > > I encountered a problem with node footer data being corrupted
 on an > Android device.(kernel version 6.6 and android version:15) > after
 [...] Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u8Bdy-0001sh-Cw
Subject: Re: [f2fs-dev] f2fs node footer data corruption in Android device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Zhiguo,

On 4/25/25 13:11, Zhiguo Niu wrote:
> Hi Chao and Jaegeuk,
> 
> I encountered a problem with node footer data being corrupted on an
> Android device.(kernel version 6.6 and android version:15)
> after I merged the following patches, the problem still exists.
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=eba08414c585f90760c4312f57dea78ea45cb5cb
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?h=dev-test&id=19426c4988aa85298c1b4caf2889d37ec5c80fea
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?h=dev-test&id=c2ecba026586cda6c7dc0fe9e6e60e7e9386c3bd
> and there is no nat_bits in mount option.
> 
> I am still debugging, and would like to ask do you have any other
> hints or suggestions?
> The issue seem to be closely related to adb remount.
> 
> test steps:
> ping 127.0.0.1 -n 20 > nul
> adb.exe -s mydevice  wait-for-device
> adb.exe  -s mydevice reboot bootloader
> fastboot -s mydevice  erase userdata
> fastboot -s mydevice  erase cache
> fastboot -s mydevice  reboot
> ping 127.0.0.1 -n 30 > nul
> adb.exe -s mydevice wait-for-device
> adb.exe -s mydevice root
> adb.exe -s mydevice remount

Any change for mount option? Can you provide mount option before/after
remount?

> adb.exe -s mydevice shell   rm -rf /data/somefile/*

How about enabling all f2fs tracepoints to catch how target node was
updated?

Thanks,

> 
> dmesg:
> dm-59: userdata partition, dm-7: scratch image partition is for adb remount
> [    3.893630] F2FS-fs (dm-59): Using encoding defined by superblock:
> utf8-12.1.0 with flags 0x0
> [    3.930213] F2FS-fs (dm-59): Mounted with checkpoint version = 38485b2d
> [   20.584169] F2FS-fs (dm-7): Mounted with checkpoint version = 42130ef
> [   38.039122] F2FS-fs (dm-59): inconsistent node block, nid:1426,
> node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
> [   38.048310] F2FS-fs (dm-59): inconsistent node block, nid:1426,
> node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
> [   38.051725] F2FS-fs (dm-59): inconsistent node block, nid:1426,
> node_footer[nid:129565021,ino:2756062298,ofs:26782845,cpver:6421703165179826912,blkaddr:3577851147]
> thanks



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
