Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052975C90
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 03:37:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqpAP-0001gX-Eb; Fri, 26 Jul 2019 01:37:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqpAO-0001gQ-DR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 01:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zsTfMs1wh1wcNQ9wVS6bKvv+VY9UdesDj2maz03qZ9Y=; b=TjmUmht3/QLki17BA7d3Q/X71S
 8iDjbyYBr/39TQX827ql6WXWfZ8nS2nJ3Nm9tpM/U8WQMZ9205zOIQPWWkTcljMJNj4fII2h5T40Y
 eYFKm0IBrHEUc3tHzssdY0B5U1Bs38ghVfTeFTxItCV+uDy/i2vduKejBjS03PO49+Co=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zsTfMs1wh1wcNQ9wVS6bKvv+VY9UdesDj2maz03qZ9Y=; b=SAu7Yy8hf/x9lG0Ab45P7w2W7K
 Br6UaqPBFFmzKX4v4ncL5feY6C38aLcQ3AHvuc8J85+al0UgRrWAyUusQorU43DFjdpN5g5YrP5ou
 X42kLP4SPpMy+ZciFAV8E8NAKWpTcnWPQk7AXfdbLE1LgggLpashRkfIxHGZH1RC+VwE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqpAK-00GPZy-8s
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 01:37:04 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 60990A8E9BD74EC28191;
 Fri, 26 Jul 2019 09:36:52 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 26 Jul
 2019 09:36:50 +0800
To: Jeff Layton <jlayton@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190725095028.GA3640@shao2-debian>
 <2650d193880ccfa58e03230868f8bff59fa85c06.camel@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d3a63689-deac-a96b-721a-7dd8dafdd275@huawei.com>
Date: Fri, 26 Jul 2019 09:36:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2650d193880ccfa58e03230868f8bff59fa85c06.camel@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqpAK-00GPZy-8s
Subject: Re: [f2fs-dev] [Fwd: [mm] [confidence: ] e49f335ded:
 BUG:sleeping_function_called_from_invalid_context_at_mm/util.c]
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jeff,

I checked the code, found one suspicious place as below:

- f2fs_build_node_manager
 - init_node_manager
  - __get_nat_bitmaps
   - disable_nat_bits(, true)

disable_nat_bits(.., lock)
{
...
	if (lock)
		spin_lock_irqsave(&sbi->cp_lock, flags);
	__clear_ckpt_flags(F2FS_CKPT(sbi), CP_NAT_BITS_FLAG);
	kvfree(NM_I(sbi)->nat_bits);
	NM_I(sbi)->nat_bits = NULL;
	if (lock)
		spin_unlock_irqrestore(&sbi->cp_lock, flags);
}

I don't think we have to call kvfree() under spinlock, so I can simply change it
as below to fix the warning.

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 19e5a5f..e7c99b5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1667,6 +1667,7 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info
*sbi, unsigned int f)
 static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
 {
 	unsigned long flags;
+	unsigned char *nat_bits;

 	/*
 	 * In order to re-enable nat_bits we need to call fsck.f2fs by
@@ -1677,10 +1678,12 @@ static inline void disable_nat_bits(struct f2fs_sb_info
*sbi, bool lock)
 	if (lock)
 		spin_lock_irqsave(&sbi->cp_lock, flags);
 	__clear_ckpt_flags(F2FS_CKPT(sbi), CP_NAT_BITS_FLAG);
-	kvfree(NM_I(sbi)->nat_bits);
+	nat_bits = NM_I(sbi)->nat_bits;
 	NM_I(sbi)->nat_bits = NULL;
 	if (lock)
 		spin_unlock_irqrestore(&sbi->cp_lock, flags);
+
+	kvfree(nat_bits);
 }

BTW, in f2fs, it's possible to hit kvfree()->vfree() in the case of we face
memory pressure, due to f2fs_kmalloc() will fallback to call kvmalloc() once
failed in kmalloc().

Thanks,

On 2019/7/25 20:37, Jeff Layton wrote:
> I was playing with a patch to add a might_sleep_if(!in_interrupt()); to
> the top of kvfree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?h=mm-5.4&id=e49f335dedc18a2ee0ac7791134b282abd9c857f
> 
> The kernel test robot picked it up and saw a new warning pop in a f2fs
> call stack. I took a quick look but didn't see the bug, but one of you
> guys may want to play with that patch and try to hunt it down.
> 
> Cheers,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
