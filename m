Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F44A430C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Aug 2019 09:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3xjI-0006lc-AS; Sat, 31 Aug 2019 07:23:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i3xjG-0006lC-FQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 07:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZ5rIxwoUrI8g6hb2zYL9BeV/o0so0xZ0h9Vq6n6Yu4=; b=fUQbVIGXXvTSTFG9RK/dvJooNx
 weIpmgZqyiOWx8uvdFNcxsRL40r43K2Jvf+PW6RiXetsCO7Fxi0mSs/9ftDeOP+8zfdjcqt7IMeT9
 QpaSENwBNkakd+daqUwsz7nGNsKouhtBirN19pM84I9b+IB2u72BiyDeNOq+raurqJOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qZ5rIxwoUrI8g6hb2zYL9BeV/o0so0xZ0h9Vq6n6Yu4=; b=NnMxD0HomUxyHV8Ag6UUf/e/Cd
 ZSz6vsO9EJKvuOiY8LNchFIUlQzFIpOgeVhjlTen3F+ijUeBaJ05IY8yP4zvHf/f15W2U3vDFGVyt
 yO3h6o6YumdAKa4l8LM8y+uX1aLxI7bOEZK6pmUWb+6e4c6q+MRzAFnKRbVlhmD/FPUM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3xjE-004h2A-MG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Aug 2019 07:23:22 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 487D385FE885572E61D9;
 Sat, 31 Aug 2019 15:23:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 31 Aug
 2019 15:23:07 +0800
To: <jaegeuk@kernel.org>
References: <20190219081529.5106-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
Date: Sat, 31 Aug 2019 15:23:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190219081529.5106-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i3xjE-004h2A-MG
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add bio cache for IPU
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/2/19 16:15, Chao Yu wrote:
> @@ -1976,10 +2035,13 @@ static int __write_data_page(struct page *page, bool *submitted,
>  	}
>  
>  	unlock_page(page);
> -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
> +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode)) {
> +		f2fs_submit_ipu_bio(sbi, bio, page);
>  		f2fs_balance_fs(sbi, need_balance_fs);
> +	}

Above bio submission was added to avoid below deadlock:

- __write_data_page
 - f2fs_do_write_data_page
  - set_page_writeback        ---- set writeback flag
  - f2fs_inplace_write_data
 - f2fs_balance_fs
  - f2fs_gc
   - do_garbage_collect
    - gc_data_segment
     - move_data_page
      - f2fs_wait_on_page_writeback
       - wait_on_page_writeback  --- wait writeback

However, it breaks the merge of IPU IOs, to solve this issue, it looks we need
to add global bio cache for such IPU merge case, then later
f2fs_wait_on_page_writeback can check whether writebacked page is cached or not,
and do the submission if necessary.

Jaegeuk, any thoughts?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
