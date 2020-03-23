Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ADB18EE57
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 04:06:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGDPk-0006Ms-Ih; Mon, 23 Mar 2020 03:06:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1jGDPj-0006Mk-4X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vas0MnWj4oybl6l+JxWfKFOBg4TAy61ny4KhPKdVuro=; b=hgZXjUdraYRZQsV4pHYueLzqwT
 8aIr1Al0+ypy+jAlyEqR6uEGH/Lf1E6O2Eaibuako+xBz1tZHbAaW8U7XBd1WVPSGtRWDMAo9c8Sw
 /TudPzaMySlOZRXVdL3LnG1NwxcwtfVt6aCgdYt9P6jcCUV6ebZFJJTiQs0VfGwkXw/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vas0MnWj4oybl6l+JxWfKFOBg4TAy61ny4KhPKdVuro=; b=RBexmmo7d0kH7JqgzwV0/VO7d5
 xzGYN4GaKJtQgS2YwNB3SAeVLD2kMxwNwSmDZPzi94gh7SIy6+ni8+l35TlpNiSAVDAcXQgVnq7rN
 /eieQucoTz6dYspvZ8LQLE3N3eC1lW+lnsU/Kka8B5d5V2g9J6kYGNNvqGinwPhuFC4g=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGDPd-0048Jv-49
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1584932750; bh=dWxO70ZTLWZJ/KAhe6blVdbhTNEFPju6heLfNQ0Z/9U=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=jb0LErdb9VgV2rmrGqNGuWkkc6q8J/yibcY2EIVwy/McVutQzIq9iRJXhWRWsH1OS
 qjXwx0iPNQXjLu/JS1P0bwqR6nZl6tMLE4KHtqLuN5zV5XC0KyFD48G78KWOVUyRuH
 XFne/Mtcbekr6lhg0nZHmRWFForeLeoQurKCxNIk=
Date: Mon, 23 Mar 2020 04:05:49 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200323030549.rwlexq76ng4nq7nt@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, chao@kernel.org
References: <20200323024109.60967-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323024109.60967-1-yuchao0@huawei.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGDPd-0048Jv-49
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix potential .flags overflow on
 32bit architecture
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Mon, Mar 23, 2020 at 10:41:09AM +0800, Chao Yu wrote:
> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
> in 32bit architecture, since we introduced FI_MMAP_FILE flag
> when we support data compression, we may access memory cross
> the border of .flags field, corrupting .i_sem field, result in
> below deadlock.
> 
> To fix this issue, let's expand .flags as an array to grab enough
> space to store new flags.
> 
> Call Trace:
>  __schedule+0x8d0/0x13fc
>  ? mark_held_locks+0xac/0x100
>  schedule+0xcc/0x260
>  rwsem_down_write_slowpath+0x3ab/0x65d
>  down_write+0xc7/0xe0
>  f2fs_drop_nlink+0x3d/0x600 [f2fs]
>  f2fs_delete_inline_entry+0x300/0x440 [f2fs]
>  f2fs_delete_entry+0x3a1/0x7f0 [f2fs]
>  f2fs_unlink+0x500/0x790 [f2fs]
>  vfs_unlink+0x211/0x490
>  do_unlinkat+0x483/0x520
>  sys_unlink+0x4a/0x70
>  do_fast_syscall_32+0x12b/0x683
>  entry_SYSENTER_32+0xaa/0x102
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

Tested-by: Ondrej Jirman <megous@megous.com>

This patch alone also fixes all the other lockups I reported recently,
that were easier to trigger than this one.

thanks,
	o.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
