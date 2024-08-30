Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B096966AE1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 22:51:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk8b5-00013g-TX;
	Fri, 30 Aug 2024 20:51:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sk8b3-00013W-Sh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIZXIINff56qb4zCYdsf9WG53Wf7TXlLSI/2wbgmNUg=; b=AIrZnDl9D0zt6jId5kZn382pR6
 N+DZjhIxor8TBmIZDBKqbWrN47hSU63+CDbJ+brbyvO/MqnSTN8cTX++OcmpwbhG9qgqZnIuQXHLb
 odXeRX6sq0J+sn0va4FgsaeJqPv8y+T/92bu3s/SRtNuOupZm8DiqnPwF9hYe06ZyZcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIZXIINff56qb4zCYdsf9WG53Wf7TXlLSI/2wbgmNUg=; b=HLM3DLuzxX4inXjF+Xsx68+bnI
 1/bWeSOeeIqvSKmk0wuYt+iKh6f0MRF9BJuzYD/+zHWqys2T2ilOE1dEPeAn5emA32P4A1VjMInoC
 FP8Hp13JH23gGQjCIgMx4T7ZAPqcASal4AMW9gaMrv24mAJWHewQ1xiTb3pw+hdgR3+Q=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk8b3-0005mx-7S for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 20:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 83DCCA41AD4;
 Fri, 30 Aug 2024 20:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401FFC4CEC2;
 Fri, 30 Aug 2024 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725051102;
 bh=Qch9L6aepwg9HHdR6rD1CcwmmNNUmm8PHEmpjGDF7JQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Pic5yn1zaJj/nKjnzXSwwa7t2f/n5uIpVdf25w6TTN2oaXLONE2Y2XJ8frzuQGabK
 n1FOmX6SYcQxIw7EoH1djHyzKLVg5YuqPUaVVE4kWDrc792qbY31iyHDcS4b7eP6WX
 QBIP9VUT4G5jlCUD79mbVfn3wbtKgIMbzwYUdn1HyyabQVJlAoma9kQ6ZHsmQmcJS5
 1xANNlzikR1F17fRkXG0+AFAQI0IlwYERY7K6HZh54YhYloQzCAicItH4tdsDTRxJs
 LtltZYXXpgcF1ONXvvEEriiJzB2Zggv4n0hHtsUTH9r8ivESPVqlzjnhUC3QrqK3m3
 oqOYyZwxw+3DA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE583809A80; Fri, 30 Aug 2024 20:51:43 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <172505110250.2712133.5954239958085668419.git-patchwork-notify@kernel.org>
Date: Fri, 30 Aug 2024 20:51:42 +0000
References: <20240820145507.1372905-1-chao@kernel.org>
In-Reply-To: <20240820145507.1372905-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 20 Aug 2024 22:54:59 +0800 you
 wrote: > Convert to use folio, so that we can get rid of 'page->index' to
 > prepare for removal of 'index' field in structure page [1]. > > [1]
 https://lore.kern [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sk8b3-0005mx-7S
Subject: Re: [f2fs-dev] [PATCH v3 1/9] f2fs: convert f2fs_submit_page_read()
 to use folio
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 20 Aug 2024 22:54:59 +0800 you wrote:
> Convert to use folio, so that we can get rid of 'page->index' to
> prepare for removal of 'index' field in structure page [1].
> 
> [1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/9] f2fs: convert f2fs_submit_page_read() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/f5e3739942b5
  - [f2fs-dev,v3,2/9] f2fs: convert f2fs_write_begin() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/f13c7184e62e
  - [f2fs-dev,v3,3/9] f2fs: convert f2fs_write_end() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/357dd8479f8b
  - [f2fs-dev,v3,4/9] f2fs: convert f2fs_set_compressed_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/4713b14f107a
  - [f2fs-dev,v3,5/9] f2fs: convert f2fs_do_write_data_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/609c7375350a
  - [f2fs-dev,v3,6/9] f2fs: convert f2fs_write_data_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/75428dcd4d2e
  - [f2fs-dev,v3,7/9] f2fs: convert __write_node_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/62b691af1a66
  - [f2fs-dev,v3,8/9] f2fs: convert read_node_page() to use folio
    https://git.kernel.org/jaegeuk/f2fs/c/e381d92a035a
  - [f2fs-dev,v3,9/9] f2fs: get rid of page->index
    https://git.kernel.org/jaegeuk/f2fs/c/c6f1758f7a68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
