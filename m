Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B4509B5B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 10:59:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhSfA-0004cz-H4; Thu, 21 Apr 2022 08:59:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=103e7536f=damien.lemoal@opensource.wdc.com>)
 id 1nhSf8-0004ct-UI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 08:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RQuerNtVyxrVEtN02WJMOQ9+oHgjt5a9KUHZEcJngkg=; b=CDhcK4Dv7iTjoS5biEJlf3G8oh
 rfU/lXNWdiMTrhJOn6TFuuWZhCgpU6visR2vNc1TIcICfYvQChQZ6SskK3wCHRk3g0f5PoI9Yh7Y3
 mPwB4FmMntzLfN4UPlCK7/Z6eerINnyZucvbudJBJwM5mXbbPaVs9bOyw6KoPKJEjNX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RQuerNtVyxrVEtN02WJMOQ9+oHgjt5a9KUHZEcJngkg=; b=LRjQvoYdxb4L2F+HhM2BhuOSHo
 Vu0uh0vn/mUfw+MtmR8Lj8RJU6j44Z76rpOm/gpeUat2OmGPYx3KebAPOMfrFvW7/425K0yPFTvwD
 5WYI5TzAq3DQWEUQjyN2a0ToKahlpV4Js16f/pGwzrrFiTVuRtChQsjhldNKpsa+szt0=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhSf4-005SLb-JB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 08:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650531578; x=1682067578;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jjxNJwS+YZW/zBq3mAwvmbF1vWlfZ/Y1rEOvGKLC1EI=;
 b=awmUbH2X21OTUdRnML1bIbuGt14lzV1E/3F+nzPcwNOV4vlXGE4Aewhb
 abax6Wby1THf4ORG1/ewayhSPkl8fzb4IH1Stp2CyyYwlb2ERqfdrTODW
 G90ArSFtyeyCZrPjhXY/foL0pUVGE8vF8RacXytoX72WFHl8jtq6l/V6I
 7niu4sbFK+yIdMJJfItSjWn+6/srCVEuTat4Evwt52cBmXaeXKhq20IPN
 yA02GSAG4EPnqK2PwVp1G1MCOZaGveQ6i/fMqOR5cTwRqmOvKGmX0S5O8
 +5oA+5v1BQxczWHcMm4bBVKji6uw9nK50XGYMKiaUa5GqC+rIFcDvzsRd A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302649349"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 16:43:58 +0800
IronPort-SDR: qW00MbV8lyQOBdElOWhFWV4TgheX2oS8vWaey5TN3B7I5e1/lF2g5k/nTWCSgyMITBsprAnk8x
 9QpnNOwDlqjfU7VC6PlqZ33nPJmqexsLx4D8hOHxppDt75hSXYKMXIOSPgECcxEnyRhZYyQ+LQ
 9k1qb6oeckT1zKJY+vXa/VR21cC79KNYzIQNsu+TIOz30oNBMJ4i35Jzfzk6aQwg6cm58EqBiS
 ZDAsZQA+0KBb20QE1NcfJTxBvpn8joJHpdNOazaIrz85qFbGYFgRHRNg89ojtTf3gIUamqVw6A
 idW7CASVvI+M0PpJirBiSYur
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 01:15:01 -0700
IronPort-SDR: VvdEtPMVVM3q31bawl9hylHpdPplXOBIhUZqKl8e1KfG9peHXWxDXeLC4/hpTy5R9yVorekOqv
 BYwDo69GINThyAob2kPGIhuRdGxthDiaoisvAGrZ/A6NMBcdA3HerheTl+Sl8z9kyc6YDPjsqd
 mCc+rLq/+mp248OQuhWVUEeDMtmgF+/lTOYoX6Imrc0BZ+u622IDKF9O639BTMpxpq2kVCmdXT
 HiiuRnbqQ+fUeiXOq9Hu1afa+f/L+R1exyBTbfLE+6ZKdw66DAIiS3TOitCTpUlaVVHXrKNfT4
 ta8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 01:43:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkWKp2jTbz1SHwl
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 01:43:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1650530637; x=1653122638; bh=jjxNJwS+YZW/zBq3mAwvmbF1vWlfZ/Y1rEO
 vGKLC1EI=; b=dxF+AJOuGzC8fLAlKv9YZEwj/yT44phEEZv94QCsADg6IGURHvP
 AhwL0OmixvYHRcFgg8dWcy7x+j8bPNjxX6Q/Lj/959eFfDMY1qw68hZ3pSDh6KUf
 H++Mekc0qIzLn+bksdKCNaJUj951AmQ/98FtXmZSK8mxAXEptMjCPA8rpkFqU8il
 RuUFTljqac8Jgilu/YFkjR18ZhWg6IyNeOfMF7br1tjVTqtjraMz5A0L3Be+wDrI
 jDqWlErgA1G1A1BRGafGN7M01KocAEiDJiYLwl5OH8RcSZGnkL3f4Emj9UWnvO7J
 nclsp5uPetKnq8LXEYJ5E0Ku1s8ufyrplmQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZGuetXirpnxL
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 01:43:57 -0700 (PDT)
Received: from [10.225.163.19] (unknown [10.225.163.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkWKn0h0Wz1Rvlx;
 Thu, 21 Apr 2022 01:43:56 -0700 (PDT)
Message-ID: <42e10758-e50a-7aaa-dfa9-dcf6338ebaff@opensource.wdc.com>
Date: Thu, 21 Apr 2022 17:43:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220419215703.1271395-1-jaegeuk@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20220419215703.1271395-1-jaegeuk@kernel.org>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/22 06:57, Jaegeuk Kim wrote: > The block layer for
 zoned disk can reorder the FUA'ed IOs. Let's use flush > command to keep
 the write order. Stricktly speaking, for a request that has data, the problem
 is triggered by REQ_PREFLUSH since in this case the request does not go
 through
 the scheduler and is processed through the blk-flush machin [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [68.232.143.124 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.143.124 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nhSf4-005SLb-JB
Subject: Re: [f2fs-dev] [PATCH] f2fs: use flush command instead of FUA for
 zoned device
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/20/22 06:57, Jaegeuk Kim wrote:
> The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
> command to keep the write order.

Stricktly speaking, for a request that has data, the problem is triggered
by REQ_PREFLUSH since in this case the request does not go through the
scheduler and is processed through the blk-flush machinery. REQ_FUA on its
own should not matter if the device supports it. If the device does not
support FUA, then the same problem can happen due to POSTFLUSH (again no
scheduler).

Bypassing the scheduler leads to the write not write-locking the zone,
which leads to reordering... Completely overlooked that case when the zone
write locking was implemented.

Ideally, the FS should not have to care about this. blk-flush machinery
should be a little more intelligent and process the write phase of the
request using the scheduler. Need to look into that.

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 4 +++-
>  fs/f2fs/node.c | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f08e6208e183..2aef0632f35b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -372,7 +372,9 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
>  	clear_inode_flag(inode, FI_APPEND_WRITE);
>  flush_out:
> -	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
> +	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
> +			(atomic && !test_opt(sbi, NOBARRIER) &&
> +					f2fs_sb_has_blkzoned(sbi)))

Aligning the conditions and not breaking the second line would make this a
lot easier to read...

>  		ret = f2fs_issue_flush(sbi, inode->i_ino);
>  	if (!ret) {
>  		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index c280f482c741..7224a980056f 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1633,7 +1633,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  		goto redirty_out;
>  	}
>  
> -	if (atomic && !test_opt(sbi, NOBARRIER))
> +	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
>  		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;

Is this really OK to do ? flush + write as different operations may not
lead to the same result as a preflush+fua write.

Until the block layer is fixed to properly handle this, a simpler fix for
f2fs would be to force enable the NOBARRIER option for zoned drives ? That
would avoid these changes no ?

Also, with all the testing we do on SMR disks and f2fs (smaller, older SMR
disks due to the 16TB limit), we never have triggered this problem. How
did you trigger it ?

>  
>  	/* should add to global list before clearing PAGECACHE status */


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
