Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCC278BE3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 17:02:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLpEu-0001vp-Vn; Fri, 25 Sep 2020 15:02:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kLpEu-0001vZ-0K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 15:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BgRlW7xKt+zZtsbSllbd7U1mSS8m91RnlLQtBOs8JwI=; b=NvsoY5nIL6JTjbhYIZ5ZigbAsp
 8ItlPM7kxRaRQdY40eXAC+YC3Ohfy6CuJYrbfU0Yl1yNFNFOfG45ecnCXcaTP52t11Bw87YckXzJJ
 ZggAxtOcIsEQKd0kzogWdBq3om6sucIjEMF1KxINmz0rr7QP/VpK4iVglLAn6UhvJVNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BgRlW7xKt+zZtsbSllbd7U1mSS8m91RnlLQtBOs8JwI=; b=mTYI6AZ4tNBrECvllVbVkb79mk
 /dK/W7Tk+uzeCycX81C3wmLU8IyiShbPndx80Zg664NHbPdU0uNl+B/AXgUEygWRmXp3MaMomy75K
 HQYKd0xeS3gfCanUw8ycNRbQBNh87a0pZoFe93vMy8FUHZk8R+kM4ydptUiG8zalT9oc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLpEr-005ccB-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 15:02:23 +0000
Received: from [192.168.0.108] (unknown [49.65.245.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3144C20715;
 Fri, 25 Sep 2020 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601046124;
 bh=9WgaLGTAfx9N0SLsi5CS0bjEUFlWHvpW0Sz8nLg7jis=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=mtT/WbyI46MM40nBYZjXtBkn8QJAxuMV+gtHdAFQQ0mM7mKT658kRZcddoD7/8hOf
 vuMPR0Db20xI8R17kxp5/vMXin1+t8fj4OdYg3sevEbq648BwFVCUgX9UUKlZpg7L7
 qDQsxeoYIuyKGih53wpnxxZamdJoImDGjQF7Sum4=
To: Dan Carpenter <dan.carpenter@oracle.com>, Chao Yu <yuchao0@huawei.com>
References: <000000000000f9f80905b01c7185@google.com>
 <eb03a5c9-eb77-eb91-e17f-8a3273aab7da@huawei.com>
 <20200925105758.GN4282@kadam>
From: Chao Yu <chao@kernel.org>
Message-ID: <27500993-7fbd-bbe7-1d6e-83e0e12b4a3e@kernel.org>
Date: Fri, 25 Sep 2020 23:01:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200925105758.GN4282@kadam>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLpEr-005ccB-Nh
Subject: Re: [f2fs-dev] KMSAN: uninit-value in f2fs_lookup
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
Cc: syzbot <syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, glider@google.com, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Dan,

On 2020-9-25 18:57, Dan Carpenter wrote:
> On Fri, Sep 25, 2020 at 05:06:33PM +0800, Chao Yu wrote:
>> Hi,
>>
>> I don't see any problem here, thanks for your report. :)
>>
>
> I bet the uninitialize value is because "max_depth" is zero.

I agree with you, thanks for the hint. :)

Thanks,

>
>
>    352  struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>    353                                           const struct f2fs_filename *fname,
>    354                                           struct page **res_page)
>                                                                ^^^^^^^^
> The stack trace says this isn't initialized.
>
>    355  {
>    356          unsigned long npages = dir_blocks(dir);
>    357          struct f2fs_dir_entry *de = NULL;
>    358          unsigned int max_depth;
>    359          unsigned int level;
>    360
>    361          if (f2fs_has_inline_dentry(dir)) {
>    362                  *res_page = NULL;
>    363                  de = f2fs_find_in_inline_dir(dir, fname, res_page);
>    364                  goto out;
>    365          }
>    366
>    367          if (npages == 0) {
>    368                  *res_page = NULL;
>    369                  goto out;
>    370          }
>    371
>    372          max_depth = F2FS_I(dir)->i_current_depth;
>    373          if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
>    374                  f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
>    375                            dir->i_ino, max_depth);
>    376                  max_depth = MAX_DIR_HASH_DEPTH;
>    377                  f2fs_i_depth_write(dir, max_depth);
>    378          }
>    379
>    380          for (level = 0; level < max_depth; level++) {
>                                 ^^^^^^^^^^^^^^^^^
> If "max_depth" is zero, then we never enter this loop.
>
>    381                  *res_page = NULL;
>    382                  de = find_in_level(dir, level, fname, res_page);
>    383                  if (de || IS_ERR(*res_page))
>    384                          break;
>    385          }
>    386  out:
>    387          /* This is to increase the speed of f2fs_create */
>    388          if (!de)
>    389                  F2FS_I(dir)->task = current;
>    390          return de;
>
> Which means that we return a NULL "de" and "*res_page" is uninitialized
> and that matches what syzbot found throug runtime testing.
>
>    391  }
>
> regards,
> dan carpenter
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
