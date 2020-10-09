Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77002288005
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 03:30:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQhEy-0001MG-3k; Fri, 09 Oct 2020 01:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kQhEx-0001M5-Db
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 01:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgUyrOvSiqRiqDFaXTdTBNiJckRQIsJ3NieITb5HWRk=; b=WpPSGX7gbmrPDakb3WVzUFKeQc
 Q69pcdg8V11mqL14RQ6qBXzP+Y0lzb3A/UKixDTKaYtCK/hCrlg6RLCk9BikiwSSi+gy/f9S+8CRU
 1DHEaBT0dFMKtehXthPBtqiJr+GbUgeM5CRn9GzfOq4e2Abp+ipCHpPlOdQ5Phousukg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kgUyrOvSiqRiqDFaXTdTBNiJckRQIsJ3NieITb5HWRk=; b=TS1i/0BEusKRgWX9aOBSVmnY1u
 Y/5h3gzvWFbc5QWcKJMEUlWLmfiJHqt97j0TPdWUWTkUeu15HGOVUgk/mBXIXBzYdClCx/qEykU2E
 HSIke48jMrhGfcwwXe5cyadO/Il2e8z/0ytat3PDs5fCM/cH8uxfAf5ae/PFIG/79y4M=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQhEs-003e6s-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 01:30:35 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 15DA58DAC5AD0225ECCE;
 Fri,  9 Oct 2020 09:30:18 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 9 Oct 2020
 09:30:15 +0800
To: Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "Chao Yu" <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <00000000000085be6f05b12a1366@google.com>
 <20201008191522.1948889-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cb993e67-b947-81f9-9f0a-10d924710e5c@huawei.com>
Date: Fri, 9 Oct 2020 09:30:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201008191522.1948889-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kQhEs-003e6s-IJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: reject CASEFOLD inode flag without
 casefold feature
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
Cc: Daniel Rosenberg <drosen@google.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/9 3:15, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> syzbot reported:
> 
>      general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
>      KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>      CPU: 0 PID: 6860 Comm: syz-executor835 Not tainted 5.9.0-rc8-syzkaller #0
>      Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>      RIP: 0010:utf8_casefold+0x43/0x1b0 fs/unicode/utf8-core.c:107
>      [...]
>      Call Trace:
>       f2fs_init_casefolded_name fs/f2fs/dir.c:85 [inline]
>       __f2fs_setup_filename fs/f2fs/dir.c:118 [inline]
>       f2fs_prepare_lookup+0x3bf/0x640 fs/f2fs/dir.c:163
>       f2fs_lookup+0x10d/0x920 fs/f2fs/namei.c:494
>       __lookup_hash+0x115/0x240 fs/namei.c:1445
>       filename_create+0x14b/0x630 fs/namei.c:3467
>       user_path_create fs/namei.c:3524 [inline]
>       do_mkdirat+0x56/0x310 fs/namei.c:3664
>       do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
>       entry_SYSCALL_64_after_hwframe+0x44/0xa9
>      [...]
> 
> The problem is that an inode has F2FS_CASEFOLD_FL set, but the
> filesystem doesn't have the casefold feature flag set, and therefore
> super_block::s_encoding is NULL.
> 
> Fix this by making sanity_check_inode() reject inodes that have
> F2FS_CASEFOLD_FL when the filesystem doesn't have the casefold feature.
> 
> Reported-by: syzbot+05139c4039d0679e19ff@syzkaller.appspotmail.com
> Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
