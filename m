Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5409A2CF89D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 02:29:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klMOB-0003Ay-Pm; Sat, 05 Dec 2020 01:29:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1klMOA-0003Ar-Gk
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 01:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ncnRFFhAf2bkE/qMO1vLebh3cSt8f3hDpPboPlQpgPg=; b=MY5zirbuAJHz5HzcJRXE7uEE+p
 ZtCn8u8q+s3o/LjUNGdBFcCbZ4TacoXkzsO0Ecn+jwAOOo+hiY4u4lpB31qJhLlIQuDtflW6hraTH
 /qnT62PDhpNeBdM5rMlbGZSDQOhv9hSjbQ8q6Fg7Ce5MgkZv+AQT2q3W2yntsLCW7T6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ncnRFFhAf2bkE/qMO1vLebh3cSt8f3hDpPboPlQpgPg=; b=XLkiC25NV/uLEuejxqad3NAk3Z
 54pxb+doYP3WMoAc+E6mtDdP12LsRC93UwoDxhAZTwGd8/kmNRdCoTsFA6d25Xelg31TfH2BgDcYG
 Duww60/vWHPjidLCle01oxEMYevySip7VzSURx276h9ENuxCZmhakwr6U/kwbx9DHJb8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klMO1-002XUA-7C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 01:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607131748;
 bh=JV56CdjyUv1Rv5BMk7QaP3IuCqfsvKze12smgZ438Ts=;
 h=To:Cc:References:From:Date:In-Reply-To:From;
 b=RdgFsX88favfTDnLR2lWWvSDPoZsx9GiPHI9L6IrnBb/hzecsHGF45dgbAhkpFn9X
 n3BlXB1hr5kB/nt+p9U6pknhjPZCGbZ7c48AtfToUyX95NnA5HjL7AtRcouvZ7lYXH
 8jbtP83aZlexQV+i5KUDbnydSWe4y+vkrKfx2QuQs+skPfoIWGtWKvXUfkZTkeSJrs
 N8l2N0UXrVJneK9yatR4cm+YP59epbcNGGbp0nw54GSEXMc1jDOS1GhgtWc8FQB6SI
 /SFRRJmtbco5qObChvuhq1pxdKvZZGkjNRT21vxy9dwUGlvdMtEdHuXhPvm/YCp9OZ
 9viTYkTYv3jvg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20201127090118.84235-1-yuchao0@huawei.com>
 <af26ca56-1dbf-e59b-b7b0-63ce817fd94d@huawei.com>
 <X8p+rK6wQsXdcG33@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e35d3dde-db71-27dc-88fd-fd6e2cd2b02f@kernel.org>
Date: Sat, 5 Dec 2020 09:29:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X8p+rK6wQsXdcG33@google.com>
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1klMO1-002XUA-7C
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce a new per-sb directory in
 sysfs
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

On 2020/12/5 2:23, Jaegeuk Kim wrote:
> On 12/03, Chao Yu wrote:
>> Jaegeuk,
>>
>> Can you comment on this patch?
> 
> Waiting for use-case? :)

How do you think of duplicating below stats into /sys/fs/f2fs/<devname>/stat/

F2FS_GENERAL_RO_ATTR(dirty_segments);
F2FS_GENERAL_RO_ATTR(free_segments);
F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
F2FS_GENERAL_RO_ATTR(features);
F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
F2FS_GENERAL_RO_ATTR(unusable);
F2FS_GENERAL_RO_ATTR(encoding);
F2FS_GENERAL_RO_ATTR(mounted_time_sec);
F2FS_GENERAL_RO_ATTR(main_blkaddr);
#ifdef CONFIG_F2FS_STAT_FS
F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
F2FS_GENERAL_RO_ATTR(moved_blocks_background);
F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
F2FS_GENERAL_RO_ATTR(avg_vblocks);
#endif

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
