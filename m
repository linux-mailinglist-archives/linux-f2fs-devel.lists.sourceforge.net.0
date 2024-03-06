Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3C872E8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 07:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhkLq-0006Kn-Mn;
	Wed, 06 Mar 2024 06:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhkLp-0006KY-Io
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 06:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lx/hV+VgWmmeo+4O3aGs0aTHPpJYAIEeokp/YFsbIj8=; b=QOB8TVwKndY1G+Fz+fHFaoovTO
 NZN5/HSV02/+TqSCAlw8UUdInmaufCnnvAiYSj1wr+4vSBLBFtMjh8lAOKyj9r0GWOqsXNZ6kxBMa
 kPQ2RoRFIwc93FDqNOWESq9fJf9p5tB1T81u1MCmbWK1AZnH7Y6RdRbR0RKPNakWYENI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lx/hV+VgWmmeo+4O3aGs0aTHPpJYAIEeokp/YFsbIj8=; b=CANYKeokPGbrXks5cTUPE2ViEG
 e4W+D9z/D2q0srz+DbVH9hZxxNeUwcyBbP3PToeojHJZx+WUmbmPNwqr6kyyqR8AfKRpDFeJvTxWi
 w0bd7Lb1XnmMEZOUl7hBSAUXCMu88AX5STYkXeUvGhNxBZTwgzSE1Y28CiKcYHa6QPiA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhkLe-0001T4-WF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 06:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE65661938;
 Wed,  6 Mar 2024 06:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69601C433C7;
 Wed,  6 Mar 2024 06:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709704906;
 bh=N+SgGvSCwByLSnQR1Rh3deKeagcMHHdrJ7YxgUIVkd4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qhYOG1XZWFyNBL2vtFMaIu2qy+cTMl79RAJ1/+UlpH3XizkL5N6v4SAVKTm+Dps++
 Jb9eeTBH0aPJFDbRTHeY1qpq2JCCGbBAAna5W7AorR1NfS8/93tWfmjCFvWPpfHBSv
 fQGdSLingiJ/8ApsiB1sEPxzr3FJlAqsdCxKDbuZJzHfceYLltgKOS34jcB8tXPUoz
 nf3vTJXyPetEa7Kb7AyrLvgPblL1wgCG6Ij1xoIBpCkW97BGy2H8FTQjv3UJHZ3O8t
 chzKWBj6zUoLrGWQZj1qpjnZe5yxMSYjbsE5ZOVlDToG+F2Wz/2pMUAy2LbdFuXeGT
 xOQUark0HeHdQ==
Message-ID: <7cd469b2-ce64-4799-90db-c08df7ab6174@kernel.org>
Date: Wed, 6 Mar 2024 14:01:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
 <20240306034746.3722986-2-xiuhong.wang@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240306034746.3722986-2-xiuhong.wang@unisoc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/6 11:47, Xiuhong Wang wrote: > When a file only
 needs one direct_node, performing the following > operations will cause the
 file to be unrepairable: > > unisoc # ./f2fs_io compress test.apk [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhkLe-0001T4-WF
Subject: Re: [f2fs-dev] [PATCH V2 2/2] f2fs: compress: fix reserve_cblocks
 counting error when out of space
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/6 11:47, Xiuhong Wang wrote:
> When a file only needs one direct_node, performing the following
> operations will cause the file to be unrepairable:
> 
> unisoc # ./f2fs_io compress test.apk
> unisoc #df -h | grep dm-48
> /dev/block/dm-48 112G 112G 1.2M 100% /data
> 
> unisoc # ./f2fs_io release_cblocks test.apk
> 924
> unisoc # df -h | grep dm-48
> /dev/block/dm-48 112G 112G 4.8M 100% /data
> 
> unisoc # dd if=/dev/random of=file4 bs=1M count=3
> 3145728 bytes (3.0 M) copied, 0.025 s, 120 M/s
> unisoc # df -h | grep dm-48
> /dev/block/dm-48 112G 112G 1.8M 100% /data
> 
> unisoc # ./f2fs_io reserve_cblocks test.apk
> F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device
> 
> adb reboot
> unisoc # df -h  | grep dm-48
> /dev/block/dm-48             112G 112G   11M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> 0
> 
> This is because the file has only one direct_node. After returning
> to -ENOSPC, reserved_blocks += ret will not be executed. As a result,
> the reserved_blocks at this time is still 0, which is not the real
> number of reserved blocks. Therefore, fsck cannot be set to repair
> the file.
> 
> After this patch, the fsck flag will be set to fix this problem.
> 
> unisoc # df -h | grep dm-48
> /dev/block/dm-48             112G 112G  1.8M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device
> 
> adb reboot then fsck will be executed
> unisoc # df -h  | grep dm-48
> /dev/block/dm-48             112G 112G   11M 100% /data
> unisoc # ./f2fs_io reserve_cblocks test.apk
> 924
> 
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
