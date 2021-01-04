Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C552E8F9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jan 2021 04:36:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwGfN-00088E-VW; Mon, 04 Jan 2021 03:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kwGfM-000887-LY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 03:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJsx9VsOshyLeRpLUhW68PmzdpEuEPTuSPwmKrSq4ZQ=; b=FcDeyWaVx7Cmdyt/yqTkgRdabe
 16hUYPzZJ/tODwM3khRclmGtBmAoD3Z0aGIMSpCdwa1w1JKp7e9q9SllEKHw8LaXqhLSQXC6skTv7
 5xmjdWhLw8vXgyhmVcjn8Fcuoh3jOqtrv4WokqmHcO3d3jULp/ym0It7BF60V2XtBlnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XJsx9VsOshyLeRpLUhW68PmzdpEuEPTuSPwmKrSq4ZQ=; b=ELewQzcQ5pT/ldEtMEqMxknhh9
 7Lyn2/Ot2etXZzwztbvAyxsB6KjTqQ3AOlkA60Bayvx6irZmbLk+8493hW0FfmJqasLjZ6XDXOROh
 /SJF6/UkDvaUDFrz6V19oX4mAEberB/m9fzE8cGqPVJDBwlAG95XPbLUjD1tdcGi9ADE=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwGfD-00AaKe-8l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 03:36:20 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D8LqJ70FYz7PxB;
 Mon,  4 Jan 2021 11:35:08 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 4 Jan 2021
 11:35:59 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20201228232612.45538-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a43158eb-114e-7f7f-871a-7bd9c70639d6@huawei.com>
Date: Mon, 4 Jan 2021 11:35:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201228232612.45538-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kwGfD-00AaKe-8l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: clean up post-read processing
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
Cc: linux-fscrypt@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/29 7:26, Eric Biggers wrote:
> +	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
> +		INIT_WORK(&ctx->work, f2fs_post_read_work);
> +		queue_work(ctx->sbi->post_read_wq, &ctx->work);

Could you keep STEP_DECOMPRESS_NOWQ related logic? so that bio only includes
non-compressed pages could be handled in irq context rather than in wq context
which should be unneeded.

Thanks,

> +	} else {
> +		f2fs_verify_and_finish_bio(bio);
> +	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
