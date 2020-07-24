Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3422BC89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 05:38:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyoXw-0004Tq-T0; Fri, 24 Jul 2020 03:38:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jyoXv-0004Tc-5E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JICiS/c4wgHloaD8U0SXpc2firKXAQp4D/r6tJgkPqA=; b=mbCmNgX/XB/4Mn+/tZebI3nUyh
 bypdFVfsnefIAuu7YHzBnskwJJl++p4utmfCKQz0iIrnLbn7zihVCrqfmFpqHl/iB4PnEqGks7/rx
 WMhDxHUfGSDQUeWaOYmhjm4DK0AtyXZZ1ew5tSKJ1MCFOwjYhGK/P1IRxM42CeSieRR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JICiS/c4wgHloaD8U0SXpc2firKXAQp4D/r6tJgkPqA=; b=Zrwc/ZdEYQfJ0RBaCbO8os7HhB
 GD3NXZJeRMJeaSYO5xh3kIcTD4FfP4ftbPar91e7EFF/SLC7Aj8mmF0ijNMSW2L2VT8uIQVLsaOrb
 qyIsMPQiBtyR3MbA6cNKq6E3EZa/ACy5wyrboxOnHNmiWA/QK77lnXiige3r0UC56L/k=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyoXs-00FZo9-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:38:55 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B1140FEF971B813C8BB0;
 Fri, 24 Jul 2020 11:38:45 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 24 Jul
 2020 11:38:44 +0800
To: <bugzilla-daemon@bugzilla.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <bug-208565-202145@https.bugzilla.kernel.org/>
 <bug-208565-202145-aNFOMA3i8y@https.bugzilla.kernel.org/>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e7bac8e2-f3b7-81eb-cd7f-4be726c8065c@huawei.com>
Date: Fri, 24 Jul 2020 11:38:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bug-208565-202145-aNFOMA3i8y@https.bugzilla.kernel.org/>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyoXs-00FZo9-UJ
Subject: Re: [f2fs-dev] [Bug 208565] There may be dead lock for cp_rwsem
 during checkpoint
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/24 11:21, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208565
> 
> --- Comment #8 from Jaegeuk Kim (jaegeuk@kernel.org) ---
> Chao, why do we need to revert that patch?

After applying your new patch, below race condition should no longer
happen, right?

Thread A		Thread B
f2fs_write_checkpoint()
- block_operations(sbi)
  - f2fs_lock_all(sbi);
   - down_write(&sbi->cp_rwsem);

                         - open()
                          - igrab()
                         - write() write inline data
                         - unlink()
- f2fs_sync_node_pages()

+ if (!do_balance)
+	goto write_node;	<---- this avoids running into iput().

  - if (is_inline_node(page))
   - flush_inline_data()
    - ilookup()
      page = f2fs_pagecache_get_page()
      if (!page)
       goto iput_out;
      iput_out:
			-close()
			-iput()
        iput(inode);
        - f2fs_evict_inode()
         - f2fs_truncate_blocks()
          - f2fs_lock_op()
            - down_read(&sbi->cp_rwsem);

> 
> Zhiguo,
> You can see the patch here.
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=b0f3b87fb3abc42c81d76c6c5795f26dbdb2f04b
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
