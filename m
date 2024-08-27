Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791496093E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2024 13:48:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1siugL-00007C-IY;
	Tue, 27 Aug 2024 11:48:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1siugK-000073-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 11:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AhE2pk/SIR+dsy6bgfDEgdFS9Rj5nKvRUaISyzg9y1c=; b=PNzbQoR5MQ/4PoqQCT0jTgd6K1
 4C9nZL6byGeLcc0VKnpeItzlvGGkGGwMQnqb0sDDM9cgA2IBLOOeW+QRgJ21wnURUGc4XC6FEScXG
 QlD5KrjB9av0gz4peJDhaHDgaj9k54Z8fYuC+mqjFRjMVkjvzlfTCwY/6dvYO5tMjbDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AhE2pk/SIR+dsy6bgfDEgdFS9Rj5nKvRUaISyzg9y1c=; b=kXdJQVNRO/d4K9+D4Pm3iWyaZ+
 K9RZ07m+q+u7kNDjoLlNvraMGp/orr09qvjsjhYBP73RWTGTauzC6UCdFmFnCy3kLu/4QCw4gdaRJ
 2q6EKSxR2amhpyxPnGDoBn5oU0OWIi+noc9veyTW/IXe7BE16/sxQxJeY7o4e3xgajL4=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1siugI-00015k-2r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 11:48:15 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtQjH6nG5zfbdw;
 Tue, 27 Aug 2024 19:45:55 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 64A4E140202;
 Tue, 27 Aug 2024 19:47:59 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 19:47:59 +0800
Message-ID: <6c1baa6e-5f71-418f-a7fc-27c798e51498@huawei.com>
Date: Tue, 27 Aug 2024 19:47:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
Content-Language: en-US
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Does there exist CI test for f2fs? I can only write the mount
 test for f2fs refer to tests/ext4/053. And I have tested this in local. Thanks,
 Hongbo On 2024/8/14 10:39, Hongbo Li wrote: > Since many filesystems have
 done the new mount API conversion, > we introduce the new mount API conversion
 in f2fs. > > The series can be applied on top of the c [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1siugI-00015k-2r
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Does there exist CI test for f2fs? I can only write the mount test for 
f2fs refer to tests/ext4/053. And I have tested this in local.

Thanks,
Hongbo

On 2024/8/14 10:39, Hongbo Li wrote:
> Since many filesystems have done the new mount API conversion,
> we introduce the new mount API conversion in f2fs.
> 
> The series can be applied on top of the current mainline tree
> and the work is based on the patches from Lukas Czerner (has
> done this in ext4[1]). His patch give me a lot of ideas.
> 
> Here is a high level description of the patchset:
> 
> 1. Prepare the f2fs mount parameters required by the new mount
> API and use it for parsing, while still using the old API to
> get mount options string. Split the parameter parsing and
> validation of the parse_options helper into two separate
> helpers.
> 
>    f2fs: Add fs parameter specifications for mount options
>    f2fs: move the option parser into handle_mount_opt
>    f2fs: move option validation into a separate helper
> 
> 2. Remove the use of sb/sbi structure of f2fs from all the
> parsing code, because with the new mount API the parsing is
> going to be done before we even get the super block. In this
> part, we introduce f2fs_fs_context to hold the temporary
> options when parsing. For the simple options check, it has
> to be done during parsing by using f2fs_fs_context structure.
> For the check which needs sb/sbi, we do this during super
> block filling.
> 
>    f2fs: Allow sbi to be NULL in f2fs_printk
>    f2fs: Add f2fs_fs_context to record the mount options
>    f2fs: separate the options parsing and options checking
> 
> 3. Switch the f2fs to use the new mount API for mount and
> remount.
> 
>    f2fs: introduce fs_context_operation structure
>    f2fs: switch to the new mount api
> 
> 4. Cleanup the old unused structures and helpers.
> 
>    f2fs: remove unused structure and functions
> 
> There is still a potential to do some cleanups and perhaps
> refactoring. However that can be done later after the conversion
> to the new mount API which is the main purpose of the patchset.
> 
> [1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/
> 
> Hongbo Li (9):
>    f2fs: Add fs parameter specifications for mount options
>    f2fs: move the option parser into handle_mount_opt
>    f2fs: move option validation into a separate helper
>    f2fs: Allow sbi to be NULL in f2fs_printk
>    f2fs: Add f2fs_fs_context to record the mount options
>    f2fs: separate the options parsing and options checking
>    f2fs: introduce fs_context_operation structure
>    f2fs: switch to the new mount api
>    f2fs: remove unused structure and functions
> 
>   fs/f2fs/super.c | 2211 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 1341 insertions(+), 870 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
