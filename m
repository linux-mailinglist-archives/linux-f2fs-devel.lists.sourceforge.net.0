Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D71F6C2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 18:27:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjQ3G-0004Nh-4e; Thu, 11 Jun 2020 16:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjQ3E-0004Na-KU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 16:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WkwqhkBpyTGlJbizq83r0K/xb1w2pMHHyTxGcWlyq7M=; b=SFL7Q3pQb61a5zxj7ql/KyDeSb
 LUl73o+G4emAhzIwAabz8SH0vAaiYbDBmUCkCZqazb89TuWAO22gbpA5j/vkj+RPPsswia/KqgoDH
 N7FvRNLdqMRzedu1+MudBcvkP9OQVUqJhCbVE1xXTHrOouIFSw4lvG9k+YTzn2CpP2D8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WkwqhkBpyTGlJbizq83r0K/xb1w2pMHHyTxGcWlyq7M=; b=iI+6v4oq3mGlrCpHfyEvaMnXQ6
 xYgju6Csc6QmREppWHVuEi0woOJkz767BjPVd1+1GcAiy8prt9mNZ+H+gPlSwWYr1WYOQP6bIDPVI
 UpnFvPRfKN2FD43UONyg69609s6a6DhxFcJz6cy6HGIlNq3wUT2TdosbJk9pRGvahy78=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjQ3D-00GoTf-BO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 16:27:36 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BA5D20792;
 Thu, 11 Jun 2020 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591892842;
 bh=7Vh2eMKAqsqarBEFvSteTBIrjnkfpF7p21JR7SHTWnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=loimR59ESifvGt9gJ/k3lNBbw2wz/KxaR8VRsFjmkzEE2gwVAEKMbUxbZxwC0zh8G
 IHOznBOCpQyR83dvEhg/xor9v5dDFIEziXXV9DM7mHWM//FUw1Y351w+jlomXLLxYm
 1IB2eJK6fZTtEHbyFEQ79PmS6+uggD2KfvnuDJnA=
Date: Thu, 11 Jun 2020 09:27:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200611162721.GB1152@sol.localdomain>
References: <20200611031652.200401-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611031652.200401-1-daeho43@gmail.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjQ3D-00GoTf-BO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 11, 2020 at 12:16:52PM +0900, Daeho Jeong wrote:
> +	for (index = pg_start; index < pg_end;) {
> +		struct dnode_of_data dn;
> +		unsigned int end_offset;
> +
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +		if (ret)
> +			goto out;
> +
> +		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> +		if (pg_end < end_offset + index)
> +			end_offset = pg_end - index;
> +
> +		for (; dn.ofs_in_node < end_offset;
> +				dn.ofs_in_node++, index++) {
> +			struct block_device *cur_bdev;
> +			block_t blkaddr = f2fs_data_blkaddr(&dn);
> +
> +			if (__is_valid_data_blkaddr(blkaddr)) {
> +				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
> +					blkaddr, DATA_GENERIC_ENHANCE)) {
> +					ret = -EFSCORRUPTED;
> +					goto out;
> +				}
> +			} else
> +				continue;
> +
> +			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
> +			if (f2fs_is_multi_device(sbi)) {
> +				int i = f2fs_target_device_index(sbi, blkaddr);
> +
> +				blkaddr -= FDEV(i).start_blk;
> +			}
> +
> +			if (len) {
> +				if (prev_bdev == cur_bdev &&
> +					blkaddr == prev_block + len) {
> +					len++;
> +				} else {
> +					ret = f2fs_secure_erase(prev_bdev,
> +							prev_block, len, flags);
> +					if (ret)
> +						goto out;
> +
> +					len = 0;
> +				}
> +			}
> +
> +			if (!len) {
> +				prev_bdev = cur_bdev;
> +				prev_block = blkaddr;
> +				len = 1;
> +			}
> +		}
> +
> +		f2fs_put_dnode(&dn);
> +	}

This loop processes the entire file, which may be very large.  So it could take
a very long time to execute.

It should at least use the following to make the task killable and preemptible:

		if (fatal_signal_pending(current)) {
			err = -EINTR;
			goto out;
		}
		cond_resched();

Also, perhaps this ioctl should be made incremental, i.e. take in an
(offset, length) like pwrite()?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
