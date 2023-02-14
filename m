Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F38695612
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:47:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRkPP-0004y5-8C;
	Tue, 14 Feb 2023 01:47:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRkPN-0004xx-Pk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z/AWFKn+ye+JRc5p2EQDhkyJhm1dx9oxgRHnD/NCG/E=; b=ASL5ocEa4LVQbUS0HvOsUDGKP9
 X9T7m1zm+MAUHevE2YdDW2gV5M2URZQZNGpDKntwyRboPqqGYY15vnrorG/TJYNEA0fo/pTy8CwK8
 S4CtWrNSqVD61beX5T7gTy1Y0Hsb3Y6pjjlecjU4ffrgnmpWTiUVDpGvItOKrGKxgITc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z/AWFKn+ye+JRc5p2EQDhkyJhm1dx9oxgRHnD/NCG/E=; b=S2QMW7BDvAZIR8lTk6b/m+CH/X
 x0YvksYDYn29XFUJwJdKgggltGrP7gIuIMWGhDn+3zr3lhSheSrolhqKgELRhCKGGD2U2MD1+t8V0
 6mg5G0TWaAD9Noae4AsHtvTCDjd2zcVjnZ/9Vgg31V4Vm8HZ60It5tN8Cpu+5JZrq/xg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRkPK-0005Al-Bv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:46:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5B9461372;
 Tue, 14 Feb 2023 01:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253CBC4339B;
 Tue, 14 Feb 2023 01:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676339213;
 bh=+0BJys0OpkHX3oV/BPdHXI+zldnOERXmDqR0P9RpspE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dBHUmqKkkQYUMGwN2daTFvHHXIf0WEA/iUz8y2sfkXN+O7WxIT6UjFwCFAuZeXKus
 ArNFD1M10ZtrGJ5bZD7a2rzWPtJ5EoqV85m+I0G44h1tU6FfKUlbs15be7oWhawOOu
 qy1Mgk9Sb4ztJjLsGbYPGjw4yOcoCmBKK/eFlDiaUrjd7XvRE26JGZxo8ZJKuLLyMv
 OgPIscKmxUrD5jPeEibLDqFFQXGw/EMVZFikHOKcC+4awXtQaAtsjJDAxTSrouqMDR
 6awrjgPzt8PN4Cq/xQLo0W068pjFp8VePeGmHdIstf/M6XTiJP+a8zcxY8IqzQ3QM9
 O3XKveaBoWWoQ==
Message-ID: <6160a9a2-16b9-e37c-eabc-57f71a1932af@kernel.org>
Date: Tue, 14 Feb 2023 09:46:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20230209181819.2333522-1-daeho43@gmail.com>
 <18916dd5-67cc-fe21-f78b-8a6dfbcb1c97@kernel.org>
 <CACOAw_w5Mc3aqS_RD_W7MdLGFQV3O_Jq1WSAVKAxJkEk5uUgeQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_w5Mc3aqS_RD_W7MdLGFQV3O_Jq1WSAVKAxJkEk5uUgeQ@mail.gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/14 4:14,
 Daeho Jeong wrote: >>> diff --git a/fs/f2fs/inode.c
 b/fs/f2fs/inode.c >>> index 28c9c72dda2a..7bf660d4cad9 100644 >>> ---
 a/fs/f2fs/inode.c
 >>> +++ b/fs/f2fs/inode.c >>> @@ -777,11 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRkPK-0005Al-Bv
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/14 4:14, Daeho Jeong wrote:
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index 28c9c72dda2a..7bf660d4cad9 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -777,11 +777,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
>>>    void f2fs_evict_inode(struct inode *inode)
>>>    {
>>>        struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>> -     nid_t xnid = F2FS_I(inode)->i_xattr_nid;
>>> +     struct f2fs_inode_info *fi = F2FS_I(inode);
>>> +     nid_t xnid = fi->i_xattr_nid;
>>>        int err = 0;
>>>
>>>        f2fs_abort_atomic_write(inode, true);
>>>
>>> +     if (fi->cow_inode) {
>>> +             clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>>> +             iput(fi->cow_inode);
>>> +             fi->cow_inode = NULL;
>>> +     }
>>
>> It looks "fi->cow_inode = NULL" here may race w/ cow_inode allocation in
>> f2fs_ioc_start_atomic_write due to f2fs_write_inode() has not been covered
>> by inode_lock()? IIUC.
> 
> Sorry, I couldn't understand it, since I couldn't find any relation
> between f2fs_ioc_start_atomic_write and f2fs_write_inode. Could you
> elaborate more on this? I thought the code might be safe, since it
> happens in the inode eviction phase.

int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
void f2fs_evict_inode(struct inode *inode)

Oops, it looks I was misled by f2fs_write_inode() above f2fs_evict_inode(),
please ignore my comments, sorry. :(

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
