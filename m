Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F5A20227D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2020 09:59:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmYPQ-0006iv-Ab; Sat, 20 Jun 2020 07:59:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jmYPO-0006io-C1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 07:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuqNjJoi+FgtboktkqzX3zh8LqE8DuiDpF7oF59+JG8=; b=ez4d0sWlr09x6YXkGfSuiPUrHo
 mu4vrVec84pES47JAqhZ8kZwncxf5aTOs5MlvT81lhqHMitkyNkdr69UUQtv0NwpXwpogYgN7rnGI
 3JwVrDdOl+byMi5eRH8W6e8YSfKzNYKR9d3OwsE3Bf8kPH4q5TtSqQLBKblvDqPIyXjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cuqNjJoi+FgtboktkqzX3zh8LqE8DuiDpF7oF59+JG8=; b=GNZ8lrwNLeIce+TyoOjIVP0plO
 mg7YM31v0IIZ69Q39EOspe7QlXVWhgFGGbSBUtpj4jtBBABgGkMh1d8uEHGW5dVLMJErfRWFDTmwc
 ryxZk5bc84hP+/gTqJ0qThugHwMlJ9A42QztDrVGvjKpEBomTiz8GZdtgWK4eLWFP1ug=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmYPM-00B9ZE-6e
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 07:59:26 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C7C66E6E934BD125BA5E;
 Sat, 20 Jun 2020 15:59:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 20 Jun
 2020 15:59:09 +0800
To: Yu Changchun <yuchangchun1@huawei.com>, <jaegeuk@kernel.org>
References: <20200620075829.32465-1-yuchangchun1@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <64312c4b-9c87-d891-bee2-ea5b7cebe832@huawei.com>
Date: Sat, 20 Jun 2020 15:59:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200620075829.32465-1-yuchangchun1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jmYPM-00B9ZE-6e
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix an oops in f2fs_is_compressed_page
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/20 15:58, Yu Changchun wrote:
> This patch is to fix a crash:
> 
>  #3 [ffffb6580689f898] oops_end at ffffffffa2835bc2
>  #4 [ffffb6580689f8b8] no_context at ffffffffa28766e7
>  #5 [ffffb6580689f920] async_page_fault at ffffffffa320135e
>     [exception RIP: f2fs_is_compressed_page+34]
>     RIP: ffffffffa2ba83a2  RSP: ffffb6580689f9d8  RFLAGS: 00010213
>     RAX: 0000000000000001  RBX: fffffc0f50b34bc0  RCX: 0000000000002122
>     RDX: 0000000000002123  RSI: 0000000000000c00  RDI: fffffc0f50b34bc0
>     RBP: ffff97e815a40178   R8: 0000000000000000   R9: ffff97e83ffc9000
>     R10: 0000000000032300  R11: 0000000000032380  R12: ffffb6580689fa38
>     R13: fffffc0f50b34bc0  R14: ffff97e825cbd000  R15: 0000000000000c00
>     ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
>  #6 [ffffb6580689f9d8] __is_cp_guaranteed at ffffffffa2b7ea98
>  #7 [ffffb6580689f9f0] f2fs_submit_page_write at ffffffffa2b81a69
>  #8 [ffffb6580689fa30] f2fs_do_write_meta_page at ffffffffa2b99777
>  #9 [ffffb6580689fae0] __f2fs_write_meta_page at ffffffffa2b75f1a
>  #10 [ffffb6580689fb18] f2fs_sync_meta_pages at ffffffffa2b77466
>  #11 [ffffb6580689fc98] do_checkpoint at ffffffffa2b78e46
>  #12 [ffffb6580689fd88] f2fs_write_checkpoint at ffffffffa2b79c29
>  #13 [ffffb6580689fdd0] f2fs_sync_fs at ffffffffa2b69d95
>  #14 [ffffb6580689fe20] sync_filesystem at ffffffffa2ad2574
>  #15 [ffffb6580689fe30] generic_shutdown_super at ffffffffa2a9b582
>  #16 [ffffb6580689fe48] kill_block_super at ffffffffa2a9b6d1
>  #17 [ffffb6580689fe60] kill_f2fs_super at ffffffffa2b6abe1
>  #18 [ffffb6580689fea0] deactivate_locked_super at ffffffffa2a9afb6
>  #19 [ffffb6580689feb8] cleanup_mnt at ffffffffa2abcad4
>  #20 [ffffb6580689fee0] task_work_run at ffffffffa28bca28
>  #21 [ffffb6580689ff00] exit_to_usermode_loop at ffffffffa28050b7
>  #22 [ffffb6580689ff38] do_syscall_64 at ffffffffa280560e
>  #23 [ffffb6580689ff50] entry_SYSCALL_64_after_hwframe at ffffffffa320008c
> 
> This occurred when umount f2fs if enable F2FS_FS_COMPRESSION
> with F2FS_IO_TRACE. Fixes it by adding IS_IO_TRACED_PAGE to check
> validity of pid for page_private.
> 
> Signed-off-by: Yu Changchun <yuchangchun1@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
