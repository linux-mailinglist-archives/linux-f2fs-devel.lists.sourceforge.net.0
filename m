Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2F28F24
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 04:31:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTzzw-0000ko-AR; Fri, 24 May 2019 02:31:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hTzzu-0000kc-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 02:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:CC:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aShFphmsbO96TQ8S5nJe5DouAb6F8B5zt9sErU3jvE0=; b=YRUB4xvUSyIypTMS+I15skVNgs
 D37Vn014P1uBjqdUWzDutyIzdtDj3VWhhsDG9eUiKBsSNweXEVSaHrDhtpq/CTcfm0+mhnEq+pKb1
 FrKiJmwAlqFJ5NshDD8z75lEgkzrTKMIBqgz4zyFigjmbdSExivYDkkatmclTwW+UJVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:CC:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aShFphmsbO96TQ8S5nJe5DouAb6F8B5zt9sErU3jvE0=; b=BogS+uEwGRArEfEEFRsf+uOzKI
 mDMudh84tGeSWFJZFYJ4ccXiX6wht7AUoTX8fPWZojgRQVxWqrLZ46SsSOtMceNeSHpBOc4o9hgNk
 ZggJK8TQbD3QyRF0u4cs76t+Ixvogyms4J8fvYn4Q/zPegSkAneklio1JL4NgQ0+yghg=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTzzs-00BTiA-9c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 02:31:54 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 08CDACD0FCDCB345E1F8;
 Fri, 24 May 2019 10:31:45 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 May 2019 10:31:44 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 May 2019 10:31:43 +0800
To: sunqiuyang <sunqiuyang@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190524015555.12622-1-sunqiuyang@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e7cfed52-0212-834f-aed8-0c5abc07f779@huawei.com>
Date: Fri, 24 May 2019 10:32:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190524015555.12622-1-sunqiuyang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hTzzs-00BTiA-9c
Subject: Re: [f2fs-dev] [PATCH v6 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

+Cc Sahitya,

On 2019/5/24 9:55, sunqiuyang wrote:
> From: Qiuyang Sun <sunqiuyang@huawei.com>
> 
> This ioctl shrinks a given length (aligned to sections) from end of the
> main area. Any cursegs and valid blocks will be moved out before
> invalidating the range.
> 
> This feature can be used for adjusting partition sizes online.
> --
> Changlog v1 ==> v2:
> 
> Sahitya Tummala:
>  - Add this ioctl for f2fs_compat_ioctl() as well.
>  - Fix debugfs status to reflect the online resize changes.
>  - Fix potential race between online resize path and allocate new data
>    block path or gc path.
> 
> Others:
>  - Rename some identifiers.
>  - Add some error handling branches.
>  - Clear sbi->next_victim_seg[BG_GC/FG_GC] in shrinking range.
> --
> Changelog v2 ==> v3:
> Implement this interface as ext4's, and change the parameter from shrunk
> bytes to new block count of F2FS.
> --
> Changelog v3 ==> v4:
>  - During resizing, force to empty sit_journal and forbid adding new
>    entries to it, in order to avoid invalid segno in journal after resize.
>  - Reduce sbi->user_block_count before resize starts.
>  - Commit the updated superblock first, and then update in-memory metadata
>    only when the former succeeds.
>  - Target block count must align to sections.
> --
> Changelog v4 ==> v5:
> Write checkpoint before and after committing the new superblock, w/o
> CP_FSCK_FLAG respectively, so that the FS can be fixed by fsck even if
> resize fails after the new superblock is committed.
> --
> Changelog v5 ==> v6:
>  - In free_segment_range(), reduce granularity of gc_mutex.
>  - Add protection on curseg migration.
> 
> Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Looks good to me now,

Reviewed-by: Chao Yu <yuchao0@huawei.com>

To Sahitya, is it okay to you merging all your fixes and adding Signed-off in
original patch? We can still separate them from this patch if you object this,
let us know.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
