Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A96828D1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 02:47:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hundn-0006fv-95; Tue, 06 Aug 2019 00:47:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hundl-0006fo-O5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 00:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y6IIQupsmKPIt/+AtfUlcK5B97fQYAbWB426AfrMytY=; b=iLaHGbt62gqojd18UduCnD/k4N
 2YnqM74B6sCztP4JMwpyN6edScMNW7+TA/ZH+tXNCv6hsf7Bv7T1H1IBuE6qrDkHZJVAjIADnmp4z
 h+hiph7062m8Kw7zNiRvEd3i78cfCc2/QySVZNPKhtaxbTgRn2E+WPlMgdKcx0X/EdQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y6IIQupsmKPIt/+AtfUlcK5B97fQYAbWB426AfrMytY=; b=Pq2ukLlor2nLHcXd/4ePgqw1WY
 VNEvJXcdMQyYdMHw4DPqAnBOKdRayfx+pRlvrdVqMC5CkgUDHA1B4s2xVPpcMexcXRGmS001Tq1tW
 EIiZWdFBp9QaJpOUxt3uVxCTIUpoYv+LoRik96hgQEzmqYQ3HEAwzoQZ45IcGygRrWcM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hundk-00CJLC-LE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 00:47:49 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F05ED2147A;
 Tue,  6 Aug 2019 00:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565052463;
 bh=ZD4vORsgnPaIsOHKR8v3GrQbcKOsIaN9uQO0Isv1v4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MitRhXXiQA/Zwk4ocmHFV+5HZS+nPwXbA3VgzGJla/98B0spBgUFJk0YRBP+EhpBy
 9oJl0n/g8Wc/lf6fKC5Sxo9ufYgrHBiCsdNYVIlIondWGMWhZHJ9Z78l46bjQWlx87
 zq2FiCRh3LQ9hBWvu0RpSUPq8dzxMacypW4X0gq8=
Date: Mon, 5 Aug 2019 17:47:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190806004742.GD98101@jaegeuk-macbookpro.roam.corp.google.com>
References: <20181002020223.76087-1-jaegeuk@kernel.org>
 <bece1226-ae59-d9be-a5b0-be836ba04e69@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bece1226-ae59-d9be-a5b0-be836ba04e69@huawei.com>
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
X-Headers-End: 1hundk-00CJLC-LE
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

On 08/05, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2018/10/2 10:02, Jaegeuk Kim wrote:
> > +	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
> > +		c.alloc_failed = 1;
> > +		return -EINVAL;
> > +	}
> 
> When I test por_fsstress case w/ quota feature enabled, I suffer below error
> during repair:
> 
> Info: superblock features = f8 :  extra_attr project_quota inode_checksum
> flexible_inline_xattr quota_ino
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 2097152 (8192 MB)
> Info: CKPT version = 452b7568
> Info: checkpoint state = 846 :  quota_need_fsck crc compacted_summary
> orphan_inodes sudden-power-off
> [fsck_chk_quota_files:1784] Fixing Quota file ([  0] ino [0x4])
> [ERROR] quotaio_tree.c:83:write_blk:: Cannot write block (7188): Inappropriate
> ioctl for device
> [ERROR] quotaio_tree.c:110:get_free_dqblk:: Cannot allocate new quota block (out
> of disk space).
> 
> I found new_data_block() will reject block allocation on an unclean umounted
> image, result in quota file repair failure.
> 
> With current implementation, I think we should mount that image again for
> recovery, then umount and run fsck on it again to repair quota file.

Yes.

> 
> However, user didn't be noticed that how to fix this... I know there is no such
> report tho, I think we'd better fix this case in fsck, any thoughts? let
> allocation skip fsynced datas?

Actually, that was my TODO, but I had no time to fix it, but had to stop it to
avoid further corruption.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
