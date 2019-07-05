Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 680CB60432
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2019 12:12:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hjLC7-0007u7-SW; Fri, 05 Jul 2019 10:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hjLC6-0007tk-B6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 10:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3cyrqHjMrqd84bFttiugCCC/xTc1fP5zusGqemM6l8=; b=BZNLUFzhEqka8+e1nNSUiG9+uz
 bltx46oSk1LElTgcAQjv8ZIUwC8E6OO6sa47x0T6scSZeaLUIrPNoNeFt7ySiDhopZ48emaGD0w29
 7C+biQQHES4z34DA21RaLjjPbkLLRKKvz6tXB4p2uYzC1s9YrXUA10xB1fMoZWUimRvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3cyrqHjMrqd84bFttiugCCC/xTc1fP5zusGqemM6l8=; b=e3I54edmD4BOpiwVrdSu/qdFWV
 7K3Z36yGLFTTgCtcxxFnlfCIkmUlSyuNNcoaFGnamBs3TFPOSSJv9hXsfOPqaOpGahrE8bte5qu+k
 Bz2DRWwrnM1IJCdHJ6sgDhnOsN6DNMOQxdtjPmmNblaUEKAGWH9tY8zp9+xs+DUYbuTU=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjLCF-008PCz-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jul 2019 10:12:05 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3F2498706F99F3CB069E;
 Fri,  5 Jul 2019 18:11:52 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 18:11:48 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1562302863-14418-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <15bb7741-7c2f-8dc2-065f-ba1fcaf22050@huawei.com>
Date: Fri, 5 Jul 2019 18:11:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1562302863-14418-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hjLCF-008PCz-Ar
Subject: Re: [f2fs-dev] [PATCH] fsck: Fix data loss issue observed during SPO
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

Hi Sahitya,

On 2019/7/5 13:01, Sahitya Tummala wrote:
> With the commit <979b25727800> ("fsck.f2fs: check validity of nat journal"),
> there is a serious data loss issue observed during sudden power off tests.

In that patch, since journal's data is untrusty, I just truncated n_nats to last
valid one to fix original reported issue.

Actually, the problem here is we don't know which data is correct and which data
is corrupted in nat or sit journal, so even we skip broken entry without
modifying journal->n_{nats,sits}, latter entry may still contain broken data(but
it may pass validation check), and those entries may cause potential data
loss/corruption...

It looks no matter how we change the codes, we still may face data
loos/corruption issues.

IMO, we need to find out the root cause of data corruption, So my question is
that why sudden power off tests can make nat journal being corrupted? I doubt
that in-place update method on checkpoint area of fsck may cause this... any
other thoughts?

Thanks,

> 
> The reason is due to incorrect update of journal->n_nats in that patch.
> When fsck encounters a nat journal entry with invalid blkaddr/nid, it
> updates journal->n_nats with the index of such first entry and then continues
> the for loop which scans all nats in journal in f2fs_init_nid_bitmap().
> But that loop doesn't continue and doesn't update nm_i->nid_bitmap as well,
> as it fails the for loop condition i < nats_in_cursum(journal).
> 
> There could be several other valid entries in the journal after this
> invalid entry. Due to this invalid journal->n_nats, build_nat_area_bitmap()
> could not be build properly for valid nat journal entries. It further results
> into these fsck asserts/errors and causes data loss due to incorrect fsck fix.
> 
> [ASSERT] (sanity_check_nid: 372)  --> nid[0xfb01] ino is 0\x0a
> [FIX] (__chk_dentries:1438)  --> Unlink [0xfb01] - _JeNcl242yB3Apz2MW,VOh6WmjsVht1W len[0x1c], type[0x1]\x0a
> [ASSERT] (sanity_check_nid: 372)  --> nid[0xfa2d] ino is 0\x0a
> [FIX] (__chk_dentries:1438)  --> Unlink [0xfa2d] - _++vN7axccjjGNI,TQEVmcOemY1EAAAA len[0x14], type[0x1]\x0a
> ...
> NID[0xba5] is unreachable\x0a
> NID[0xfa9] is unreachable\x0a
> ...
> [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xba5] in NAT\x0a
> [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xfa9] in NAT\x0a
> ...
> 
> Fixes: 979b25727800 ("fsck.f2fs: check validity of nat journal")
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>  fsck/mount.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 60e0e4a..1b93f49 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -1160,7 +1160,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
>  		addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
>  		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
>  			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
> -			journal->n_nats = cpu_to_le16(i);
>  			c.fix_on = 1;
>  			continue;
>  		}
> @@ -1168,7 +1167,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
>  		nid = le32_to_cpu(nid_in_journal(journal, i));
>  		if (!IS_VALID_NID(sbi, nid)) {
>  			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
> -			journal->n_nats = cpu_to_le16(i);
>  			c.fix_on = 1;
>  			continue;
>  		}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
