Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC2974806
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 04:04:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCiY-00081v-7W;
	Wed, 11 Sep 2024 02:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1soCiV-00081n-RO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0m2JpGYqNfL+dvo7hFf4xNoVS8bPvv9LcpzqfDQxBOU=; b=GUL3l5h8r2evXMAEJAXMsW2Vto
 uLmiF/y+GCBYVZceBSqZrW2FT9nvOKvvKdLlEGDC/LRtf3JhJBGpfddbPtbaQIZBlWpTdJpet/10C
 P7uDqmTiif6bhE8ujpLp4ztVc1ydXTsWu3I9dVvxUf9LY1CLpYCVKPDECihtyW5k5wQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0m2JpGYqNfL+dvo7hFf4xNoVS8bPvv9LcpzqfDQxBOU=; b=XM8JluR5X2dznWs1NY3dpSLGI/
 wslFbNMLKgaE85mab7/dykH6HwQO0d7lwqamXlwQwUqEh7Mfx45QZ27rSy/4MF99QBYrU5+w04QFc
 ONHnK8pXrALKp0y2ZHzgLrnFz/sP44sYar7WlJ6QSIr47wvST+Ew5LrEIT1wej5j8GJQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCiS-0004Lq-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:04:23 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X3P4C1mRrzyRVG;
 Wed, 11 Sep 2024 10:03:23 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 924C01400DC;
 Wed, 11 Sep 2024 10:04:08 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 10:04:08 +0800
Message-ID: <adbbf133-08e3-4990-85a3-9dfa9d72c9fa@huawei.com>
Date: Wed, 11 Sep 2024 10:04:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
Content-Language: en-US
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Is the subject of the email required to be [f2fs-dev][PATCH]?
 Thanks, Hongbo On 2024/8/14 10:39, Hongbo Li wrote: > Since many filesystems
 have done the new mount API conversion, > we introduce the new mount API
 conversion in f2fs. > > The series can be applied on top of the c [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1soCiS-0004Lq-Ss
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
 Eric Sandeen <sandeen@sandeen.net>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Is the subject of the email required to be [f2fs-dev][PATCH]?

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
