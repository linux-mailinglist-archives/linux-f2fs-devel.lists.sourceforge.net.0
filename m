Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB4749276
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 02:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHChW-0008Lb-2Q;
	Thu, 06 Jul 2023 00:18:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qHChS-0008LV-5i
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CTOcqc44eDkoxB9ZUqj81/kfSNxcTO6HjqRvEXkdHb0=; b=mTDNbQJ9OLIlq/Z+dFwSDwhW1p
 DJvVAzUVzoEnkFnFsqRBo1s826TGI2qJNEigBWnOSu8TuUCqajs+abpqvhUbUGeanLv1R1ZiSCocD
 0duQaIH31zyGE4BXjeWu+jiZZb0F/ns5S8YU4z5pbgEH2fijESWzYZcGblJevWU5Jzjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CTOcqc44eDkoxB9ZUqj81/kfSNxcTO6HjqRvEXkdHb0=; b=SZNsblKl1H3Fs+L4CGcjJKzuQM
 ggXwr62bldcQl3rhMwxqqKaxIELg8iWqmoPN/lZPgbIHiBHl/RQdyYYq0cZBIpN66Mdazek4DGzB+
 3xPylQ0cDJqrIfuR1/wGbNCT3HMcoH5wX7n9TfyHMGLzRLm/5pe/amx/8pUW9Z1L/2X4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHChR-0006GB-OA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 00:18:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 721D36178F;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6755C433C9;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688602694;
 bh=AxWXKj6xZqemoSJn5MReVNiSmwIaz00ZUW5JY/dFnnI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N9MqcuYOKPuUBGYHZnYa7a09QGb8sYMhdXqUpXp7esNKBVEkYMuPoq5AVD+3qh2eN
 Em7P8VSRq1nnM3kVorDfGw0CG4Ko3UTg/FZrbFY8bS8mgvIjKy10p/J9Ebx4mgRCtK
 dD0RYCAFPYcxneynHfN3gd+8xRJDPOpQqUDe6/hztjedbHh/3Z/85+Tx9sJWFBYVnH
 SS5PqMV39SozDnJ1l+2kaF62qWIEqZDsjaARtj0dX/d6ldGVyRCKQbtq9zClTM6usR
 IjaMSlNczNg5O4xkv1lWLNzEr7uH0/7dA3QHj+zvFYcigVAePKt3cPcxr4keh0aegy
 ZSDp3qgB+j38w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 91A30C40C5E; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269459.29151.8627542432532930093.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230601145904.1385409-2-hch@lst.de>
In-Reply-To: <20230601145904.1385409-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Thu, 1 Jun 2023 16:58:53 +0200
 you wrote: > The last user of current->backing_dev_info disappeared in commit
 > b9b1335e6403 ("remove bdi_congested() and wb_congested() and related >
 functions"). Re [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHChR-0006GB-OA
Subject: Re: [f2fs-dev] [PATCH 01/12] backing_dev: remove
 current->backing_dev_info
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
Cc: djwong@kernel.org, linux-mm@kvack.org, agruenba@redhat.com,
 miklos@szeredi.hu, willy@infradead.org, cluster-devel@redhat.com,
 idryomov@gmail.com, linux-ext4@vger.kernel.org, brauner@kernel.org,
 linux-block@vger.kernel.org, dlemoal@kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org, xiubli@redhat.com,
 trond.myklebust@hammerspace.com, axboe@kernel.dk, linux-nfs@vger.kernel.org,
 tytso@mit.edu, johannes.thumshirn@wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 anna@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 hare@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu,  1 Jun 2023 16:58:53 +0200 you wrote:
> The last user of current->backing_dev_info disappeared in commit
> b9b1335e6403 ("remove bdi_congested() and wb_congested() and related
> functions").  Remove the field and all assignments to it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Acked-by: Theodore Ts'o <tytso@mit.edu>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/12] backing_dev: remove current->backing_dev_info
    https://git.kernel.org/jaegeuk/f2fs/c/0d625446d0a4
  - [f2fs-dev,02/12] iomap: update ki_pos a little later in iomap_dio_complete
    https://git.kernel.org/jaegeuk/f2fs/c/936e114a245b
  - [f2fs-dev,03/12] filemap: update ki_pos in generic_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/182c25e9c157
  - [f2fs-dev,04/12] filemap: add a kiocb_write_and_wait helper
    https://git.kernel.org/jaegeuk/f2fs/c/3c435a0fe35c
  - [f2fs-dev,05/12] filemap: add a kiocb_invalidate_pages helper
    https://git.kernel.org/jaegeuk/f2fs/c/e003f74afbd2
  - [f2fs-dev,06/12] filemap: add a kiocb_invalidate_post_direct_write helper
    https://git.kernel.org/jaegeuk/f2fs/c/c402a9a9430b
  - [f2fs-dev,07/12] iomap: update ki_pos in iomap_file_buffered_write
    https://git.kernel.org/jaegeuk/f2fs/c/219580eea1ee
  - [f2fs-dev,08/12] iomap: use kiocb_write_and_wait and kiocb_invalidate_pages
    https://git.kernel.org/jaegeuk/f2fs/c/8ee93b4bb626
  - [f2fs-dev,09/12] fs: factor out a direct_write_fallback helper
    https://git.kernel.org/jaegeuk/f2fs/c/44fff0fa08ec
  - [f2fs-dev,10/12] fuse: update ki_pos in fuse_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/70e986c3b4f4
  - [f2fs-dev,11/12] fuse: drop redundant arguments to fuse_perform_write
    https://git.kernel.org/jaegeuk/f2fs/c/596df33d673d
  - [f2fs-dev,12/12] fuse: use direct_write_fallback
    https://git.kernel.org/jaegeuk/f2fs/c/64d1b4dd826d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
