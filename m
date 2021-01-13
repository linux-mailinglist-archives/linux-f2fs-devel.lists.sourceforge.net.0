Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8E2F52AF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 19:50:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzlDV-0000Yg-Pg; Wed, 13 Jan 2021 18:50:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kzlDU-0000YL-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 18:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CdEBujiUpHGz2WkDpOMUr2yv+bGpugbwYeW/PEujtvI=; b=muYuyhsR5lt+1m0kpfiNIIcGqu
 QVk+2DoLtIXb1LNCrRB1/8qLv4SBIRzSpHn3FdF29lsSWfPo/QBECsvKJVFOpN5uTEc0k/9Se1ee5
 vusabiKbaPTH0EUyxMy5GJkemVoeO+cYRzqE6o3+6yXjzSC/FFRDHulqt7IruMzfEBbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CdEBujiUpHGz2WkDpOMUr2yv+bGpugbwYeW/PEujtvI=; b=g9+dVfVTlNqUOEmK1CAmiSmr6z
 lZUFsl1lkuJJ/xZXPfOTF/n65h/ekjUPHzi+RUjDp0QhMknA62xO2kIeNcPB8xzXo2oOfiBe2veLr
 2lVThlLWHjc/4BVZk5SebHvmxOMmzKBDRhDNLuUTEp9ZPYTYG3++rYl2SjGUevyg0cBQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzlDN-0031Pu-4h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 18:50:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D0DB207A3;
 Wed, 13 Jan 2021 18:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610563782;
 bh=jxqvBKT6pKQlxpXnEcXRV+aAp3XKL18v0jD9gTxQod8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XRBnyiwLdpRSOKPhWinMw36N+TRus/Bi7up7HkQNZcTu2N7ZEE5asNNB3uZspYeQg
 XcCoNUuqI1V2/BmdZLbkPwyHPtPbzjGpWZw4eczh/1yXQQQGrbs8A4z3LiXQRkI5MK
 O4SkOlqoZUA7DfFx5rFh2kHxEveVBymvHDMPzvsr7WQo31jKRyCrV8y82pcbuy7nZG
 dsN2Xo37P+r1DIWl/vx3NhN6Aa9WEwnVax+49O6+LlCfiTiRrH6vhe/2U27DOG+0RX
 sf3TdtlncT9iMYdzLxzujczxx3cNDXyhlEGX4np6afd/3GFHuniQgAjnR64Gy18mt4
 MZJUIPQ0MGpPA==
Date: Wed, 13 Jan 2021 10:49:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/9AxL5Mrt+CiKHx@sol.localdomain>
References: <20210112190253.64307-1-ebiggers@kernel.org>
 <20210113162957.GA26686@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113162957.GA26686@quack2.suse.cz>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kzlDN-0031Pu-4h
Subject: Re: [f2fs-dev] [PATCH v3 00/11] lazytime fix and cleanups
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 13, 2021 at 05:29:58PM +0100, Jan Kara wrote:
> Hello!
> 
> On Tue 12-01-21 11:02:42, Eric Biggers wrote:
> > Patch 1 fixes a bug in how __writeback_single_inode() handles lazytime
> > expirations.  I originally reported this last year
> > (https://lore.kernel.org/r/20200306004555.GB225345@gmail.com) because it
> > causes the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl to not work properly, as
> > the bug causes inodes to remain dirty after a sync.
> > 
> > It also turns out that lazytime on XFS is partially broken because it
> > doesn't actually write timestamps to disk after a sync() or after
> > dirtytime_expire_interval.  This is fixed by the same fix.
> > 
> > This supersedes previously proposed fixes, including
> > https://lore.kernel.org/r/20200307020043.60118-1-tytso@mit.edu and
> > https://lore.kernel.org/r/20200325122825.1086872-3-hch@lst.de from last
> > year (which had some issues and didn't fix the XFS bug), and v1 of this
> > patchset which took a different approach
> > (https://lore.kernel.org/r/20210105005452.92521-1-ebiggers@kernel.org).
> > 
> > Patches 2-11 then clean up various things related to lazytime and
> > writeback, such as clarifying the semantics of ->dirty_inode() and the
> > inode dirty flags, and improving comments.
> > 
> > This patchset applies to v5.11-rc2.
> 
> Thanks for the patches. I've picked the patches to my tree. I plan to push
> patch 1/11 to Linus later this week, the rest of the cleanups will go to
> him during the next merge window.
> 
> 								Honza

Sounds good, thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
