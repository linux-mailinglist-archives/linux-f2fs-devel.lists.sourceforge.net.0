Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C349EE5F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 00:01:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDDlW-0005pc-10; Thu, 27 Jan 2022 23:01:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <akpm@linux-foundation.org>) id 1nDDlU-0005pV-EV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 23:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+hNmKfQ+m0W1/dRJe2O7J8Guba0XaVl4e/i4tKvhzL4=; b=b82FJm0310elWBrXSCelG4gtAl
 mef5TvwlwVbXpeKV6uhfVGAH0afRHOYQ5F7L+I1nVOoQPk/0BYBzmPIwERPfd/06sin+49NYP9jVB
 tlaDxgRu3BzOVTXCyrgHr1757mcqme++6gr1i+38dZsOxuzGomRidTluK4enyieEUqPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+hNmKfQ+m0W1/dRJe2O7J8Guba0XaVl4e/i4tKvhzL4=; b=l+i15JlMFtek9ixLs6WUPece8s
 HOjUmX7U4I8wJCtqF/RF8eK6NBXLhG0ebK/iGkjAKiVhj/1DOnA2bPE1dgYJBKc1qZglFNmdMF7pD
 hpu+1JNej6o3KvALm12d3TjvnJW1PDIpPP0nIpFANU5vtgvRPI374BqZSBHYWAIzrF5Q=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDDlQ-0000uJ-SG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 23:01:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99871B8238C;
 Thu, 27 Jan 2022 22:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93342C340E4;
 Thu, 27 Jan 2022 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1643323352;
 bh=ybh+vNa1e2zVCBIHmgIav4rSBCIa4tEXBrjj/Zvd9DM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lD8DNYdSP5VgdUVvLTzLs87NT6X2RUv/tVO0wVWZV57Mo8tiF+Cy9CVqnSr4Mr28N
 /4z/vln9zP3ZnibjoeX42f/bT+EANd4Y6/PvlZ8IiaLj4IayJe8a69r3sno42DD5jQ
 fiofeE7oSvVhmRsxcbaFoTER4oAWLDgl8zvqXutM=
Date: Thu, 27 Jan 2022 14:42:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: NeilBrown <neilb@suse.de>
Message-Id: <20220127144229.a7109a508521db5e8ddda09c@linux-foundation.org>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 27 Jan 2022 13:46:29 +1100 NeilBrown <neilb@suse.de>
 wrote: > Congestion hasn't been reliably tracked for quite some time. > Most
 MM uses of it for guiding writeback decisions were removed in 5.16. > Some
 other uses were removed in 17-rc1. > > This series remo [...] 
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nDDlQ-0000uJ-SG
Subject: Re: [f2fs-dev] [PATCH 0/9] Remove remaining parts of congestions
 tracking code.
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 27 Jan 2022 13:46:29 +1100 NeilBrown <neilb@suse.de> wrote:

> Congestion hasn't been reliably tracked for quite some time.
> Most MM uses of it for guiding writeback decisions were removed in 5.16.
> Some other uses were removed in 17-rc1.
> 
> This series removes the remaining places that test for congestion, and
> the few places which still set it.
> 
> The second patch touches a few filesystems.  I didn't think there was
> much value in splitting this out by filesystems, but if maintainers
> would rather I did that, I will.
> 
> The f2fs, cephfs, fuse, NFS, and block patches can go through the
> respective trees proving the final patch doesn't land until after they
> all do - so maybe it should be held for 5.18-rc2 if all the rest lands
> by 5.18-rc1.

Plan B: I'll just take everything.  While collecting tested-bys and
acked-bys from filesystem maintainers (please).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
