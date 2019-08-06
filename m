Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E615882985
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 04:12:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huoxn-0003qR-VJ; Tue, 06 Aug 2019 02:12:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1huoxm-0003qE-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gmwGsFqFZ7nzpjOWzRwd6IYfbRzy87TFiebrWrphqHI=; b=bUSyfHqJxMoSugV+umNfiZd+jl
 k72L59k4mSKihhkDCJCQJG90AcRCoPQtpXthdFqFXwqCplnLoATRCGF3E6VCm79xB5b0q8IRA2q2x
 PvjdCfIa0Q3FWdQkfGqbClZQh5X5dWz2UsEFcAMlt6c2Bh5JvR4++SdeTovIY+mzFkBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gmwGsFqFZ7nzpjOWzRwd6IYfbRzy87TFiebrWrphqHI=; b=kRP5LnevWPI7BqqKHbsO05OLHV
 wRw4bEgYknL/eaRQC8RnKThG9tAQurIuG2IwFdwRiBmGZD9DpdYydTogbubQ6pf49JORlBbPrMPf3
 xodq0QsiW92TaBfr2RVNoFDZhbcFu/Trw2jE9DKcdl1evFGxEkPuL+abJ/hyET9LFV4k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huoxk-00COE4-HS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 02:12:34 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF32720717;
 Tue,  6 Aug 2019 02:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565057547;
 bh=a90y+EZY+e5lAWMlP4qUmzP8NCq8B5CEmSwEkT+O3/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cjs7CVbaPFifamVuh6cwiUxgTlU5rHF5VappgxC985dZ0kwJbqk4vMEv3ry9bhPgq
 h36Z/ZK2DA5lrhgoM0OmwL7l1IhorTLFB66x1Th1eg2grsZF1zPvniqAyMzVcPUaJq
 LCVzn+INDMZH7ndN4JOLrswytbcm+sKjw60u/gz0=
Date: Mon, 5 Aug 2019 19:12:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190806021226.GC7280@jaegeuk-macbookpro.roam.corp.google.com>
References: <20181002020223.76087-1-jaegeuk@kernel.org>
 <bece1226-ae59-d9be-a5b0-be836ba04e69@huawei.com>
 <20190806004742.GD98101@jaegeuk-macbookpro.roam.corp.google.com>
 <be4ad896-31bd-a6cf-4089-9f3761305c78@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be4ad896-31bd-a6cf-4089-9f3761305c78@huawei.com>
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
X-Headers-End: 1huoxk-00COE4-HS
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't allocate new blocks on
 unclean shutdown
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

On 08/06, Chao Yu wrote:
> On 2019/8/6 8:47, Jaegeuk Kim wrote:
> > On 08/05, Chao Yu wrote:
> >> Hi Jaegeuk,
> >>
> >> On 2018/10/2 10:02, Jaegeuk Kim wrote:
> >>> +	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
> >>> +		c.alloc_failed = 1;
> >>> +		return -EINVAL;
> >>> +	}
> >>
> >> When I test por_fsstress case w/ quota feature enabled, I suffer below error
> >> during repair:
> >>
> >> Info: superblock features = f8 :  extra_attr project_quota inode_checksum
> >> flexible_inline_xattr quota_ino
> >> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> >> Info: total FS sectors = 2097152 (8192 MB)
> >> Info: CKPT version = 452b7568
> >> Info: checkpoint state = 846 :  quota_need_fsck crc compacted_summary
> >> orphan_inodes sudden-power-off
> >> [fsck_chk_quota_files:1784] Fixing Quota file ([  0] ino [0x4])
> >> [ERROR] quotaio_tree.c:83:write_blk:: Cannot write block (7188): Inappropriate
> >> ioctl for device
> >> [ERROR] quotaio_tree.c:110:get_free_dqblk:: Cannot allocate new quota block (out
> >> of disk space).
> >>
> >> I found new_data_block() will reject block allocation on an unclean umounted
> >> image, result in quota file repair failure.
> >>
> >> With current implementation, I think we should mount that image again for
> >> recovery, then umount and run fsck on it again to repair quota file.
> > 
> > Yes.
> > 
> >>
> >> However, user didn't be noticed that how to fix this... I know there is no such
> >> report tho, I think we'd better fix this case in fsck, any thoughts? let
> >> allocation skip fsynced datas?
> > 
> > Actually, that was my TODO, but I had no time to fix it, but had to stop it to
> > avoid further corruption.
> 
> Copied, maybe I can help to fix it. It looks it will be easy to skip fsyned
> datas during block allocation than porting recovery flow from kernel to tools.

Cool, thanks. :)

> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
