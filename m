Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83F9C0FAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:30:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999P-0005aO-0U;
	Thu, 07 Nov 2024 20:30:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999M-0005aE-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ZQHMhAmjek+9btBnJiCTDDU33gFkIsNS+qNDCn/QKg=; b=iJaYyC7hwfS4Itw0x9+nZJzsTf
 3WYGEjvVee++6uCRcJoucvI2GZTHdcD9bhgFNn8Gyl988nEBfRRpYfqv+8NvPyZ2JgfYrvH9pCr13
 z4oWQdm9l/7EkYrOXsVJ1GV+RYKTaI6ZTeyVFTfL+qGXlZJWSN7gfUvdJzVB4m5mHp/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8ZQHMhAmjek+9btBnJiCTDDU33gFkIsNS+qNDCn/QKg=; b=b
 zMVIAl5xtCrTLh/x38J3go3hFSKbRT0J+Vp7vsSyHuWClw+9qqB5rXwBDC96NVOcZq45wQsEFivUR
 g25Vc2acobASc/HvEskaa+PScMpfBAB47kQtSqrPEwvbBcDoet8yLX7MCs+4PQnpQOMv1KRySIE78
 BIo76TVlG412/tvY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999K-0003tk-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9261A44AC8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Nov 2024 20:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634B7C4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Nov 2024 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011427;
 bh=cMePSPMoLRsL9SFcx8mlGalyzPq55HkOd6v3OPjpQ/g=;
 h=Subject:From:Date:To:From;
 b=fubzyUtb72wr9wK0oyWyMuAAWOOzHiOjM6HtHqaYV4FaLWclcdQkFWt4UZH2BWPEZ
 WIPVazzdnyMrxamIVp710LiLDuNHtRLTRoNQFdji/gwqBWKaXT45qHeDS82Eni6LFz
 04Eb9kOZyEC4Xkqbn37rrBcWFUlyfG8aKQ4mzOl3DeOCRaik2IFxarVbBHFDB2NrsW
 hMrxyd6Tz+9ESHd6oSUH6SjgwjNGmSdzEPUvkSHgPcN36ydWN3cYkFMyzuAyfw+A8N
 nNjvejaZidBYJy+VjAzfU9JuGBe1+0KVc5wD/qCclEb1lBA9STr9+k8fPGp4g19LAd
 PV8LMIqtkcsGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B607C3809A80 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  7 Nov 2024 20:30:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101143608.2084993.11091154471269751111.git-patchwork-summary@kernel.org>
Date: Thu, 07 Nov 2024 20:30:36 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2] f2fs: fix
 race in concurrent f2fs_stop_gc_thread Submitter: Long Li
 <leo.lilong@huawei.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/pro [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999K-0003tk-Dd
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev,v2] f2fs: fix race in concurrent f2fs_stop_gc_thread
  Submitter: Long Li <leo.lilong@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=905843
  Lore link: https://lore.kernel.org/r/20241104020542.2603607-1-leo.lilong@huawei.com

Patch: [f2fs-dev,v4] f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable
  Submitter: Qi Han <hanqi@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=903034
  Lore link: https://lore.kernel.org/r/20241025091823.2467074-1-hanqi@vivo.com

Patch: [f2fs-dev] f2fs: Fix not used variable 'index'
  Submitter: Zeng Heng <zengheng4@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=902172
  Lore link: https://lore.kernel.org/r/20241023094850.1680709-1-zengheng4@huawei.com

Patch: [f2fs-dev] f2fs: fix fiemap failure issue when page size is 16KB
  Submitter: Xiuhong Wang <xiuhong.wang@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904079
  Lore link: https://lore.kernel.org/r/20241029061535.2676673-1-xiuhong.wang@unisoc.com

Series: [f2fs-dev,1/2] f2fs: remove redundant atomic file check in defragment
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904905
  Lore link: https://lore.kernel.org/r/1730354393-19672-1-git-send-email-zhiguo.niu@unisoc.com
    Patches: [f2fs-dev,1/2] f2fs: remove redundant atomic file check in defragment

Patch: [f2fs-dev] f2fs: fix typos
  Submitter: Andrew Kreimer <algonell@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=903537
  Lore link: https://lore.kernel.org/r/20241027140623.24802-1-algonell@gmail.com

Patch: [f2fs-dev,v2] f2fs: fix to convert log type to segment data type correctly
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904539
  Lore link: https://lore.kernel.org/r/20241030081701.1853020-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: clean up the unused variable additional_reserved_segments
  Submitter: LongPing Wei <weilongping@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904188
  Lore link: https://lore.kernel.org/r/20241029104907.310781-1-weilongping@oppo.com

Patch: [f2fs-dev,V3] f2fs: fix to avoid use GC_AT when setting gc_mode as GC_URGENT_LOW or GC_URGENT_MID
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904060
  Lore link: https://lore.kernel.org/r/1730171569-10757-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev,v2] f2fs: fix to avoid potential deadlock in f2fs_record_stop_reason()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=901734
  Lore link: https://lore.kernel.org/r/20241022083623.2641434-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: clean up opened code w/ {get,set}_nid()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=904043
  Lore link: https://lore.kernel.org/r/20241029005703.2740230-1-chao@kernel.org

Patch: [f2fs-dev,v3] f2fs: fix to parse temperature correctly in f2fs_get_segment_temp()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=901627
  Lore link: https://lore.kernel.org/r/20241022020149.2302191-1-chao@kernel.org


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
