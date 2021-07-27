Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F383D7133
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 10:30:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8ITu-0000Zu-JN; Tue, 27 Jul 2021 08:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m8ITr-0000Zk-3P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 08:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KJcTIAOlqbT7wHvBBXGTPibjLrTiFTvgqrm4ldu2htI=; b=BQcPeGJdl7dzmdN2m7u/b1cMy1
 bSLxWD3QJGmKO2AZaBAtlhZtwZpHRJLqz54ynisH1tj3FLwjOf354xJyIHS/wxuwV8A5iNpqXnyQ3
 c5BLkjTmWHZRUddAe1OV/NkufCG7kX4lNCwYI0o/LJOafqH4/ZIsgR4ZmEzVMbmI5Rco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KJcTIAOlqbT7wHvBBXGTPibjLrTiFTvgqrm4ldu2htI=; b=Lek/Eczr+OmhN+e/TnHb6LonLf
 bRwsHlBd8/OmbIYpx30VLyuahvxgpxnWay5ANU0J7UMu4WmjavI/rQVl1GmcYUi/gklI9yWY2t4Wl
 uvc+7MJ4L1jBJ37XH34/zFG5TEZctKZDOXUzNDrD5HKhwTRSK6NWNgYVRys7AUjHisAA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8ITo-003zaN-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 08:30:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF0E9611AD;
 Tue, 27 Jul 2021 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627374619;
 bh=RC6Acl2iuH0vikxc0De/SVQbosapIi4KuvPx7aSVX/E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ENHoxaf1pjgjGoribd/AIOnp0lb7C0kwIJD0P/oAJmBBP1u0cuZ97ejG/GYq2pqUn
 g+GrK0qh/mqMcRKcDsebAnEjcsUZTGy9H2ZtnPKYjlG1Fzif/TCbXjTCSyZ0Tkm5wm
 xkMaZhzARG/O3vaMe3ImgzJDqjVPmSaBvWGZev5pod/VdQQ6tyENezrmgtDJXlbhSu
 JcMCgBWzuOmWQo86CRS4gcaD1KjLTxqZZwM7ZJHwPz1JphFZ7Kt1gwycsv7QD66d3g
 QU9blu8qpG2RN9Yi7Zpr6VHd9y16Co5w9YvkHtIHn9+LdmsCproxP0Q99CMlVM6BhD
 3+dGTikJOeLIw==
To: Eric Biggers <ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
 <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
 <YP+38QzXS6kpLGn0@sol.localdomain>
From: Chao Yu <chao@kernel.org>
Message-ID: <70d9c954-d7f0-bbe2-f078-62273229342f@kernel.org>
Date: Tue, 27 Jul 2021 16:30:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YP+38QzXS6kpLGn0@sol.localdomain>
Content-Language: en-US
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8ITo-003zaN-Sx
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/27 15:38, Eric Biggers wrote:
> That's somewhat helpful, but I've been doing some more investigation and now I'm
> even more confused.  How can f2fs support non-overwrite DIO writes at all
> (meaning DIO writes in LFS mode as well as DIO writes to holes in non-LFS mode),
> given that it has no support for unwritten extents?  AFAICS, as-is users can

I'm trying to pick up DAX support patch created by Qiuyang from huawei, and it
looks it faces the same issue, so it tries to fix this by calling sb_issue_zeroout()
in f2fs_map_blocks() before it returns.

> easily leak uninitialized disk contents on f2fs by issuing a DIO write that
> won't complete fully (or might not complete fully), then reading back the blocks
> that got allocated but not written to.
> 
> I think that f2fs will have to take the ext2 approach of not allowing
> non-overwrite DIO writes at all...
Yes,

Another option is to enhance f2fs metadata's scalability which needs to update layout
of dnode block or SSA block, after that we can record the status of unwritten data block
there... it's a big change though...

Thanks,

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
