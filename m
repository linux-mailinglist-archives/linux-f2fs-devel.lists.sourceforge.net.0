Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58A3D4D2B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jul 2021 12:51:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7bix-0004jA-AS; Sun, 25 Jul 2021 10:51:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m7biw-0004j4-GD
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 10:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OV5Ba5LMV+6i6zFX3oSWaoYj75pw0AA1iPldqqmgNK0=; b=KPlZ4Qp6NopCHmc3swloun0eMQ
 8BwY/bXdiSHMj+N8/cbyJm3xEe9UgI/xlmS6u4bYxEVcYhoNdfufd/kyS2HstZHCxNYEhjGi3RWjd
 gtQvEsNPSTAFQ748qFC3v09VyC3VQ+ax6e0qqTuib1NJP2KCGOuF2plUmcrqNXhkCsqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OV5Ba5LMV+6i6zFX3oSWaoYj75pw0AA1iPldqqmgNK0=; b=FVCwyRPvt5Sr7PzbFYFL9ZlJp2
 LKxl9uVaXhdbq6cjBmkMzhlmNH5kQiQR2cFv9tTzFfijM86vH0uaFZ8k31LlMTxibBvxM05UL7Cg6
 qqMJAHET8FhywU7fTcGhm9eWQwLwxeCeFQ/tuzD7uB7snsWRvUiPPRLJHkZ3lmUPG1OY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7bil-00020K-NF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 10:51:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B169260E09;
 Sun, 25 Jul 2021 10:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627210254;
 bh=yQbrkcDM1yJmK+PftQjYegtYQ1gnnfPgYmC1lw0cjwo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pN7HlkVX4xMxq6PYGr86ouHgYPN4BM2tSJa5oUD15kkgc1b+9w8Y2sEy6SEHKzr81
 +uZkRPeeqTE8Z+QH7n9Ty/zswhUrPB46PhIpL0nA+bczwBPF+m62Z9bj+oAscjeUGd
 KY7YQfzXlPBozAkQh6fhM/IP7HhTUJDEpADa3XbKr1hxLdG5cOmimsafF7eQYe+YqY
 VHxvo3u5L0SOsrJjdG0ozEX3uQtxqFG5bAUtHHzgBvCPmXZw7vd2RDUQDfbJYcXtHu
 TzhkWQv8pNLZvbj+xmyFcvqAqMt+eicbMHJPPeFqL+CqOxodBVe7E5MWtRXiJP7HML
 0+9q4Z73B0gWg==
To: Eric Biggers <ebiggers@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
Date: Sun, 25 Jul 2021 18:50:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716143919.44373-4-ebiggers@kernel.org>
Content-Language: en-US
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m7bil-00020K-NF
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/16 22:39, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs_write_begin() assumes that all blocks were preallocated by
> default unless FI_NO_PREALLOC is explicitly set.  This invites data
> corruption, as there are cases in which not all blocks are preallocated.
> Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
> buffered_io") fixed one case, but there are others remaining.

Could you please explain which cases we missed to handle previously?
then I can check those related logic before and after the rework.

> -			/*
> -			 * If force_buffere_io() is true, we have to allocate
> -			 * blocks all the time, since f2fs_direct_IO will fall
> -			 * back to buffered IO.
> -			 */
> -			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> -					f2fs_lfs_mode(F2FS_I_SB(inode)))

We should keep this OPU DIO logic, otherwise, in lfs mode, write dio
will always allocate two block addresses for each 4k append IO.

I jsut test based on codes of last f2fs dev-test branch.

rm /mnt/f2fs/dio
dd if=/dev/zero  of=/mnt/f2fs/dio bs=4k count=4 oflag=direct

           <...>-763176  [001] ...1 177258.793370: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 0, start blkaddr = 0xe1a2e, len = 0x1, flags = 48,seg_type = 1, may_create = 1, err = 0
            <...>-763176  [001] ...1 177258.793462: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 0, start blkaddr = 0xe1a2f, len = 0x1, flags = 16,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793575: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 1, start blkaddr = 0xe1a30, len = 0x1, flags = 48,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793599: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 1, start blkaddr = 0xe1a31, len = 0x1, flags = 16,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793735: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 2, start blkaddr = 0xe1a32, len = 0x1, flags = 48,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793769: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 2, start blkaddr = 0xe1a33, len = 0x1, flags = 16,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793859: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 3, start blkaddr = 0xe1a34, len = 0x1, flags = 48,seg_type = 1, may_create = 1, err = 0
               dd-763176  [001] ...1 177258.793885: f2fs_map_blocks: dev = (259,1), ino = 6, file offset = 3, start blkaddr = 0xe1a35, len = 0x1, flags = 16,seg_type = 1, may_create = 1, err = 0

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
