Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE23F6C3E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Aug 2021 01:30:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIfsW-00079n-A1; Tue, 24 Aug 2021 23:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mIfsU-00079Z-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 23:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTPDB7m7dyZLnD3UIQrubsmhnyaUeTixwUjS6lNG68w=; b=SnmUQta7opwaFOSYnIf6rJB6vm
 jnxlPEDW1fJ8kKc2P164zc/z3N6lz4pKjzTT9OQgfqaWvzPAthTkjnoFPjWLCdITWx1SgJXiSuAzE
 7K7CadM8NjcM7CfJ8eL83uAneqsNSqVRBTJceD0ht+CvmxhSU2PBsxn37qSOLC4WMcn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NTPDB7m7dyZLnD3UIQrubsmhnyaUeTixwUjS6lNG68w=; b=UjunTyzUDVkLhmWaYWFC7n3h7o
 rRkJ9usTW8M21JPDlQCV8Wxt++g8YzjddlAKyMjdyg81jigl+wi+nkOlTd5VWMOmIhKj3Brzwsh5a
 DKvdXa+xKtnGcTqDV2zxStJFfBCakV+lD0zoUiJwbAbvKPATyrQ7EnuSk9gi9xMIqTFQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIfsQ-00HUlt-3k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 23:30:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAF9F610F8;
 Tue, 24 Aug 2021 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629847824;
 bh=aBZ/uH2vbAthAfmTJZ4TTBiPAcZ3NPXOPH71fmoGF0s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PrCA9PxHtwM75+FX3ElELCMEJrgZcZW+2ql/v8rBabw4KvT/cn0jJ6BUU6W0EA96H
 c/qIeJQQs5xS/rER4jK0ThdFWHwxQiPfgvwHKDZAZSJDABAdjrkHB+83HRZE3m1DfS
 its2b9N4AnXxPxKBU6sMneI8oYLhf74Edd2YmszS/vIuNOpIg5uEcUZPk3pDaa1xnl
 N7p19VsGKh6qO64HoSXQfw8BxBNrx7P85uRbrnlAodpio54t4mZ9yfzb+JTqIbwz/x
 TtEBNWS6eZVD0SiTtXr1x1NipzYwsFw746RqloXZH6e0+t//Ug1vbI5wiWhbSO0Fmc
 pfGe9LOFzm+mg==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
 <baa8a361-1a22-76a0-423d-4378178f7073@kernel.org>
 <YSUn1j22s/kc+hWS@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <d0a48947-e4df-9b0f-735e-6b306a64c4fe@kernel.org>
Date: Wed, 25 Aug 2021 07:30:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSUn1j22s/kc+hWS@google.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/25 1:09, Jaegeuk Kim wrote: > On 08/24, Chao Yu
 wrote: >> On 2021/8/24 1:01, Jaegeuk Kim wrote: >>> We must flush dirty pages
 when calling fsync() during checkpoint=disable. >>> Returning ze [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mIfsQ-00HUlt-3k
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/25 1:09, Jaegeuk Kim wrote:
> On 08/24, Chao Yu wrote:
>> On 2021/8/24 1:01, Jaegeuk Kim wrote:
>>> We must flush dirty pages when calling fsync() during checkpoint=disable.
>>> Returning zero makes inode being clear, which fails to flush them when
>>> enabling checkpoint back even by sync_inodes_sb().
>>
>> Without this patch, file can be persisted via checkpoint=enable as well, my
>> testcase:
>>
>> - mount -t f2fs -o checkpoint=disable,checkpoint_nomerge /dev/pmem0 /mnt/f2fs/
>> - cp file /mnt/f2fs/
>> - xfs_io /mnt/f2fs/file -c "fdatasync"
>> - mount -o remount,checkpoint=enable /dev/pmem0 /mnt/f2fs/
>> - umount /mnt/f2fs
>> - mount /dev/pmem0 /mnt/f2fs
>> - md5sum file /mnt/f2fs/file
>> chksum values are the same.
>>
>> Am I missing something?
> 
> I'm trying to address one subtle issue where a file has only NEW_ADDR by the

Oh, I doubt that we may failed to flush data of all inodes due to failures during
sync_inodes_sb(), additionally, how about adding retry logic for sync_inodes_sb()
if there is still any F2FS_DIRTY_DATA reference counts in f2fs_enable_checkpoint()
to mitigate this issue, e.g.:

f2fs_enable_checkpoint()

	do {
		sync_inode_sb();
		congestion_wait();
		cond_resched();
	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry_count--)

	if (get_pages(sbi, F2FS_DIRTY_DATA))
		f2fs_warm("");

Thanks,

> checkpoint=disable test. I don't think this hurts anything but can see
> some mitigation of the issue.
> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
