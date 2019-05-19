Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6622714
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 May 2019 17:09:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSNRI-0006k1-ES; Sun, 19 May 2019 15:09:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hSNRH-0006jY-3V
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 15:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDOwbDn0kj29XKa7opYGUMJNATILq8DaeqK6Y/rb5Kk=; b=MVgVPu6zRSp5KllXXzoCkwEnp/
 UtWqOANV6zq8CyVxq/Abrae6/hsxs8N89A9KAA1b0q9TL1otaA9TfQ7rUUg0gCl2oVL/SO4EwQQO+
 snrwczluKnSs3RfK5v6n3K2XWU2weEOQDS/WGBaeNK1+UPzTiBYOrY+jxTo1GgsB35U0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EDOwbDn0kj29XKa7opYGUMJNATILq8DaeqK6Y/rb5Kk=; b=YHY9Pa/uyzChdLsRDLeJwG+3TK
 jxXiSOMwCzNOC6cmy/ZDEqRSj6Zos5Zz803H3WGbZIrfb2qzVkFbMttBWPt6LoQqV81ogdXKKYXd8
 kYbq0vOkvKjo1hcfkadB0kZqFhdng5I44lnQ1JeyvDqzFHIP5ZD28kuhYchhkHs0gtFg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSNRE-008is6-9v
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 May 2019 15:09:27 +0000
Received: from [192.168.0.101] (unknown [49.74.66.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F64B21872;
 Sun, 19 May 2019 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558278557;
 bh=/GBfnyn1CEFpEIn1zVTJiMwmaKrwBTJn0x+pzEI/q20=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yXbDLRC9kKwmhI5kfHow6UWvLOY9MPwHXZwnHdFC8HWwxDXWpJRTYmYpFfOJw98wI
 jNiTb7loaGJEQO7F9j9JGpL/sP+KDDyIO6yYLnvx96q/9PzkGAnGghS+no+OYM1iyb
 fC8IpLIZmEMLGXp/yw0WQ1jDF/7W7nZzZ747Bgf4=
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
Date: Sun, 19 May 2019 23:09:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSNRE-008is6-9v
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

On 2019-5-19 17:19, Ju Hyung Park wrote:
> Hi Chao,
> 
> On Sun, May 19, 2019 at 2:09 PM Chao Yu <chao@kernel.org> wrote:
>> I've found one bug when repairing cp_payload blocks, could you try it?
>>
>> [PATCH] fsck.f2fs: fix to repair cp_loads blocks at correct position
> 
> http://arter97.com/f2fs/v3__cp
> 
> After the patch, 2nd, 3rd and the 4th run all returns the same output.
> I think now fsck only needs to run once :)

Thanks for quick test. :)

> 
> Final question though, is it expected that the first run to print 62MB
> worth of logs?

I think last bug which above patch tries to fix really crashes sit version
bitmap area.. result in wrong sit block use and showing so many error messages
in fsck, that should only happen when the image is badly corrupted, I think it
is worth to show enough information which can be used for better troubleshoot later.

Thanks,

> 
> Thanks.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
