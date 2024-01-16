Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898882F4D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 20:02:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPohk-0005EM-Eu;
	Tue, 16 Jan 2024 19:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rPohi-0005E5-8x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hgro4ShO6AfoEjGIuDUNzyp4EhHJ34Yz7VtiZQtV2d4=; b=eCO+vbkMhES9QLg2U2SEuqHteJ
 KqMlWF5I8ZV+08+8rdSvHwgrjVHpywSctlJwNI5KMx5wCAcTUBRAYY0YrdqJAJVH+f4D+UfrWIQKu
 2GESsrq85P3CVR5U5XL9AaN/pGPXo+JOg4XM/HUq6JO98Iy2ByXaLsBxMxcKdxHwYYaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hgro4ShO6AfoEjGIuDUNzyp4EhHJ34Yz7VtiZQtV2d4=; b=XqNs6w2bdhvsz6ZdQCaZtSaFCU
 XHfdxg9N4NRetjszqWfhYhUuRaCvyDdZcmtcMTUtFogokiPTD+pXoeYkAYun38Yv4IshfTuM9eTx/
 +mroeheey5F73zM9MWy2p2rOFVwBIJAHla6gokxqUlq2cwgqPxUXIdjMdCLN+kNva6WU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPohg-0000an-Jc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FC1961354;
 Tue, 16 Jan 2024 19:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB27C433F1;
 Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705431738;
 bh=oxwRyeIL7M3hBA9vL9BEAgyW9LT9u2t413CGMrrBAAY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BQlmYwfLboHO4veFxacQLWA1eyijOjOtpvGdOcLB0sJS7z9eyKYF2Kv6ylK8KAJzX
 udynA+l1fx/Jxo9NUVI+CNFE1qI3OrGTniJeYVSiJ4reRLREBBQL3xHMvrqwwiw/Gu
 IKzO4vBoMYNROkk2z4d2RP8CjLajJTU237dQ/uqq0sx/B6CYDpjTbzThBUiNq0wnpX
 X8gNWgdAyEN8wYTXEhaE3JMmp6ZzcwihS2XBvNccMc8QH4mfkSIhbeDlc+owz8aiyj
 pGCvOM0Ta4kMlmWsLhLO9yha6U0JHDHRCENEuJlyVpAG6ox/Y412LVgVi4G1swMuoJ
 UFwOnulWFyR1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C2AD0D8C987; Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170543173879.30188.5344312872944674652.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 19:02:18 +0000
References: <20231217165359.604246-2-hch@lst.de>
In-Reply-To: <20231217165359.604246-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jens Axboe <axboe@kernel.dk>: On Sun, 17 Dec 2023 17:53:55 +0100 you wrote:
 > Move reading and checking the zoned model from virtblk_probe_zoned_device
 > into the caller, leaving only the code to perform the actual setup for
 > hos [...] 
 Content analysis details:   (-7.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPohg-0000an-Jc
Subject: Re: [f2fs-dev] [PATCH 1/5] virtio_blk: cleanup zoned device probing
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, virtualization@lists.linux.dev,
 dlemoal@kernel.org, stefanha@redhat.com, pbonzini@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jens Axboe <axboe@kernel.dk>:

On Sun, 17 Dec 2023 17:53:55 +0100 you wrote:
> Move reading and checking the zoned model from virtblk_probe_zoned_device
> into the caller, leaving only the code to perform the actual setup for
> host managed zoned devices in virtblk_probe_zoned_device.
> 
> This allows to share the model reading and sharing between builds with
> and without CONFIG_BLK_DEV_ZONED, and improve it for the
> !CONFIG_BLK_DEV_ZONED case.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/5] virtio_blk: cleanup zoned device probing
    https://git.kernel.org/jaegeuk/f2fs/c/77360cadaae5
  - [f2fs-dev,2/5] virtio_blk: remove the broken zone revalidation support
    https://git.kernel.org/jaegeuk/f2fs/c/a971ed800211
  - [f2fs-dev,3/5] block: remove support for the host aware zone model
    https://git.kernel.org/jaegeuk/f2fs/c/7437bb73f087
  - [f2fs-dev,4/5] block: simplify disk_set_zoned
    https://git.kernel.org/jaegeuk/f2fs/c/d73e93b4dfab
  - [f2fs-dev,5/5] sd: only call disk_clear_zoned when needed
    https://git.kernel.org/jaegeuk/f2fs/c/5cc99b89785c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
