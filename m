Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9221B2F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 12:08:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtpx5-0004lq-MX; Fri, 10 Jul 2020 10:08:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jtpx4-0004lZ-4i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 10:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B1efhJPqV2wt2ETbLuqzXO81J35Y40kwab7RCudS/Jg=; b=bnFYc8jFZItKqkCBNNHWfCqgEB
 Np05J6q4nxaE4ZG5Cn90jGD5mRpJGGoIQHr1HWe+3rCOwPk16tkjy572Xe1tVNRAbUFC4tW1yXqU6
 PxzkXkLOZl/njAddeIPEk/c4jiot0WNN6RFHt1PANK46ZS8uc+/0eNb9S6bsbA8VQDOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B1efhJPqV2wt2ETbLuqzXO81J35Y40kwab7RCudS/Jg=; b=dlxZiPPotlGTq/eqgAM1Dd3kbe
 p+A2tg0dTgaPsaliaaHo2o4I1IqqXhgXNU867+DIMgneCNJWy66YgbofJlz2L2u1pOsJYvxVG2R5X
 vetRXyJBnNbhAJbfMl7CR1T9oVMR7bkNFTSxQzeH0dADlpKRSvuAbZplsUbgtGFHJKq0=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtpx2-00G4Ef-5t
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 10:08:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594375696; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=B1efhJPqV2wt2ETbLuqzXO81J35Y40kwab7RCudS/Jg=;
 b=ZEe/7H8Eqyr3a1OprWGNpi0Ku07i4wC1sOfh39FgmNudHm7+e96IAHjYZVolBW5IhzHcY6BN
 jxEVPPBukslYgBNQ6nVIXzCsbQDOb/FHrv1yCFSvrYifabAXM8p+dxeEhJebKz9TMRqz0MOu
 CbK2DSpLpzhrYzsy/r3O+LI9alY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f083dff19b27ae9ce5a6fd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 10:07:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 612B6C433C6; Fri, 10 Jul 2020 10:07:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25559C433C8;
 Fri, 10 Jul 2020 10:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25559C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 10 Jul 2020 15:37:52 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200710100752.GF2916@codeaurora.org>
References: <20200710023019.GD2916@codeaurora.org>
 <dcb68985-d621-6ef1-7452-172280148aa1@huawei.com>
 <20200710033905.GE2916@codeaurora.org>
 <1de32d22-caa3-c69c-66c8-e3a8d920ca6c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1de32d22-caa3-c69c-66c8-e3a8d920ca6c@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jtpx2-00G4Ef-5t
Subject: Re: [f2fs-dev] IO hang due to f2fs checkpoint and writeback stuck
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 10, 2020 at 04:40:19PM +0800, Chao Yu wrote:
> On 2020/7/10 11:39, Sahitya Tummala wrote:
> > Hi Chao,
> > 
> > On Fri, Jul 10, 2020 at 10:54:13AM +0800, Chao Yu wrote:
> >> Hi Sahitya,
> >>
> >> It looks block plug has already been removed by Jaegeuk with
> >> below commit:
> >>
> >> commit 1f5f11a3c41e2b23288b2769435a00f74e02496b
> >> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> >> Date:   Fri May 8 12:25:45 2020 -0700
> >>
> >>     f2fs: remove blk_plugging in block_operations
> >>
> >>     blk_plugging doesn't seem to give any benefit.
> >>
> >> How about backporting this patch?
> > 
> > Yes, I have noticed that patch. But we have nested pluglists in
> > the block_operations path. Hence, I was not sure if that patch alone
> > can help.
> > 1. At the start of  block_operations
> > 2. Inside __f2fs_write_data_pages() that gets called from
> > f2fs_sync_dirty_inodes()->filemap_fdatawrite()
> 
> Would be more safe to call io_schedule() in f2fs_sync_dirty_inodes()?
> 
> - io_schedule()
>  - schedule()
>   - sched_submit_work()
>    - blk_schedule_flush_plug()
>     - blk_flush_plug_list()
> 

With Jaegeuk's patch, we will only have the plug list in CP path - inside
__f2fs_write_data_pages(), which can now be flushed as its not nested
anymore.

        blk_start_plug(&plug);
        ret = f2fs_write_cache_pages(mapping, wbc, io_type);
        blk_finish_plug(&plug);

Earlier this blk_finish_plug() will not flush the plug list as the bios
are attached to the outer plug from block_operations. So I think Jaegeuk's
patch alone also can help this issue.

> > 
> > Do you know the possible path for this issue scenario to happen?> Where does in the CP path before even f2fs_sync_node_pages() is done, the
> > node pages cab be submitted for io and get attached to CP plug list?
> 
> Maybe:
> 
> writeback_inodes_wb
>  blk_start_plug                     ---plugged
>   __writeback_inodes_wb
>    writeback_sb_inodes
>     __writeback_single_inode
>      do_writepages
>       f2fs_write_node_pages
>        blk_start_plug               ---plugged
>        f2fs_sync_node_pages
>         __write_node_page(do_balance=true)  --submit node page to plug
>          f2fs_balance_fs
>           f2fs_balance_fs_bg
>            f2fs_sync_fs
>             f2fs_write_checkpoint
>           or
>           f2fs_gc
>            f2fs_write_checkpoint
>        blk_start_plug
>  blk_finish_plug
> 

Hmmm, but from ramdumps the CP thread stack is shown as below.

f2fs_sync_file
f2fs_do_sync_file
f2fs_sync_fs
f2fs_write_checkpoint

Thanks,

> Thanks,
> 
> > 
> > Thanks,
> > 
> >>
> >> On 2020/7/10 10:30, Sahitya Tummala wrote:
> >>> Hi Chao, Jaegeuk,
> >>>
> >>> I have received an issue report that indicates that system is stuck
> >>> on IO due to f2fs checkpoint and writeback stuck waiting on each other
> >>> as explained below.
> >>>
> >>> WB thread -
> >>> ----------
> >>>
> >>> io_schedule
> >>> wait_on_page_bit
> >>> f2fs_wait_on_page_writeback -> It is waiting for node
> >>> 			node page writeback whose bio is in the
> >>> 			plug list of CP thread below.
> >>> f2fs_update_data_blkaddr
> >>> f2fs_outplace_write_data
> >>> f2fs_do_write_data_page
> >>> __write_data_page
> >>> __f2fs_write_data_pages
> >>> f2fs_write_data_pages
> >>> do_writepages
> >>>
> >>> CP thread -
> >>> -----------
> >>>
> >>> __f2fs_write_data_pages -> It is for the same inode above that is under WB (which
> >>> 	is waiting for node page writeback). In this context, there is nothing to
> >>> 	be written as the data is already under WB. 
> >>> filemap_fdatawrite
> >>> f2fs_sync_dirty_inodes -> It just loops here in f2fs_sync_dirty_inodes() until
> >>> 			f2fs_remove_dirty_inode() has been done by the WB thread above.
> >>> block_operations
> >>> f2fs_write_checkpoint
> >>>
> >>> The CP thread somehow has the node page bio in its plug list that cannot be submitted 
> >>> until end of block_operations() and CP thread is blocked on WB of an inode who is again
> >>> waiting for io pending in CP plug list. Both the stacks are stuck on for each other.
> >>>
> >>> The below patch helped to solve the issue, please review and suggest if this seems to 
> >>> be okay. Since anyways we are doing cond_resched(), I thought it will be good to flush
> >>> the plug list as well (in this issue case, it will loop for the same inode again and again).
> >>>
> >>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >>> index e460d90..152df48 100644
> >>> --- a/fs/f2fs/checkpoint.c
> >>> +++ b/fs/f2fs/checkpoint.c
> >>> @@ -1071,10 +1071,12 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
> >>>
> >>>                 iput(inode);
> >>>                 /* We need to give cpu to another writers. */
> >>> -               if (ino == cur_ino)
> >>> +               if (ino == cur_ino) {
> >>> +                       blk_flush_plug(current);
> >>>                         cond_resched();
> >>> -               else
> >>> +                } else {
> >>>                         ino = cur_ino;
> >>> +                }
> >>>         } else {
> >>>                 /*
> >>>                  * We should submit bio, since it exists several
> >>>
> >>> Thanks,
> >>>
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
