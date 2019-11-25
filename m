Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5521092F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 18:41:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZIMA-0002Gv-7h; Mon, 25 Nov 2019 17:41:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iZIM9-0002Gd-4u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ybGks680lJwNmhXCXZfywn4eAh432nZER0QhUR/7Vog=; b=F3V84+8/IWZ5/a95s3jThLfNjR
 GxIaypwFEMQ2cy9WDrrDobSGJkAh8anMgT2cQdforr/iaP1ezwyP1MKL2ft7uRVA2IvEGk52jRum8
 rs+eIcll+i59of26GKaDbEYHbyvADV7M6arPMd8dNJhg0VOnKGz3jbrIM1cLRkhgyS+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ybGks680lJwNmhXCXZfywn4eAh432nZER0QhUR/7Vog=; b=eYq9295BUqIMg/5XXh+L8TqhGi
 DYRL3ctFFgvcvzp1k8YLXrRWmrc5xIUshq/omDbPw56qBkeRe+ptxCF/INgp5NV0vGPPLTuCC8ypB
 PllAhcLmRa5wpbSLL2zjCSuKsO9x6PdQd2qBiTEAV+uYdN6djY6iCcSz+ieNg7Y79faQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZIM2-0056rZ-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:41:01 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D79A20835;
 Mon, 25 Nov 2019 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574703649;
 bh=O3u3f9+D/RgY/nDvw9cILJ1NckWKDUqe9EarZDQRPqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RnqAvINxwz3qS2ujBOBH5W0XjSEeSu4C4pQj7MwpBblGGglo6kdJlZH/uraTan6FY
 cTWFkpnnzh20ZD6zSIVSfb2R7IxFcBf/ANbEKjs0qvs70VRNiAeU+ZvkqTSxv7eB5e
 fuNbzQZov02k4U0lDDNMtzezFXzFPQSAQ5G/vwSY=
Date: Mon, 25 Nov 2019 09:40:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Stephanos Mallouris <stephanos.mallouris@gmail.com>
Message-ID: <20191125174048.GA71634@jaegeuk-macbookpro.roam.corp.google.com>
References: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZIM2-0056rZ-Mf
Subject: Re: [f2fs-dev] problem with f2fs android partition
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

Hi,

On 11/22, Stephanos Mallouris wrote:
> Dear all,
> 
> I have backup my f2fs android partition via netcat and adb.
> After loosing the original partition, tried to restore it on a local
> drive and access it via linux but i am encountering the following
> issues:
> 
> A. trying the command
> 
>  sudo mount -t f2fs /dev/sdc1 /mnt
> 
> gives the following error
> 
>  F2FS-fs (sdc1): Failed to read root inode
> 
> B1. Tried to fsck the file system , see bellow:
> 
> sudo fsck.f2fs -a  /dev/sdc1
> 
> result:
> 
> Info: Fix the reported corruption.
> Info: sector size = 512
> Info: total sectors = 22310913 (10894 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> Info: No error was reported
> 
> Still unable to mount the partiotion , gives the same error.
> 
> B2. Tried
> sudo fsck.f2fs -f  /dev/sdc1

Could you try: fsck.f2fs -d 3 -f /dev/sdc1?
It seems you didn't back up the entire partition which is missing root inode
block.

Thanks,

> 
> result
> 
> Info: Force to fix corruption
> Info: sector size = 512
> Info: total sectors = 22310913 (10894 MB)
> Info: MKFS version
>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
> 19 17:16:04 PKT 2018"
> Info: FSCK version
>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
> SMP Tue Nov 12 10:34:23 UTC 2019"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 22310912 (10894 MB)
> Info: CKPT version = 1307e4
> Info: checkpoint state = 1 :  unmount
> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
> 
> [FSCK] Unreachable nat entries                        [Ok..] [0x0]
> [FSCK] SIT valid block bitmap checking                [Ok..]
> [FSCK] Hard link checking for regular file            [Ok..] [0x0]
> [FSCK] valid_block_count matching with CP             [Ok..] [0x0]
> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
> [FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
> [FSCK] free segment_count matched with CP             [Ok..] [0x1519]
> [FSCK] next block offset is free                      [Ok..]
> [FSCK] fixing SIT types
> [FSCK] other corrupted bugs                           [Fail]
> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
> 
> Done.
> 
> 
> 
> Trying to mount it , no success, gives
> 
> F2FS-fs (sdc1): Failed to read root inode.
> 
> 
> Any help or advice will be much appreciated.
> Keep up the great work on f2fs.
> 
> Kindest Regards
> 
> Stephanos Mallouris
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
