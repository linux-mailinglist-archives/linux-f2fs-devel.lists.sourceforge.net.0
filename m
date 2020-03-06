Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C36E17B39F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 02:16:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA1bC-0005e3-1O; Fri, 06 Mar 2020 01:16:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jA1b9-0005dq-AY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ym2jHGJHglttsRW7FpZ2KYnZ0BfbaVAm46qQ3wMwaM=; b=OLtQ8ZEWZLn7t3wx2AlAAUQdN9
 koRADTikY1vSeJs23k0egPs7/CAhxOlcCa5eAXwZtqiYRs5JXDlOv4M31nwSAtiCGwMRgBj1Ea3gD
 AwktpfOGEbxgB2S5/lnji7Vi68B04H7C4Qk9DcvU/6kTTqye4bnCqVW6eWY4XN69ypWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ym2jHGJHglttsRW7FpZ2KYnZ0BfbaVAm46qQ3wMwaM=; b=DJE6egLg505WLrttra48Og0yYO
 050agIZdgF8kh3VzeD7QE3KpRWcyZ9oYG2R98jXTdqQ4MkRUN6WLFePGb9wurqoF+e/DbseJuIJOk
 cYR6H+OlmEKBC5dqp8sa9i9XtcVtKHt7wK8uvuPdyfdb+a+FwUI4cs0t3ZHN3bwT2A2c=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jA1b7-00HUZr-2g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:16:19 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 701FE4C8BE47CF47207A;
 Fri,  6 Mar 2020 09:16:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Mar 2020
 09:16:07 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1583245766-3351-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9edd90a3-85d4-1a9a-ce34-f05cec7e4da5@huawei.com>
Date: Fri, 6 Mar 2020 09:16:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583245766-3351-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jA1b7-00HUZr-2g
Subject: Re: [f2fs-dev] [PATCH V2 1/2] f2fs: Fix mount failure due to SPO
 after a successful online resize FS
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/3 22:29, Sahitya Tummala wrote:
> Even though online resize is successfully done, a SPO immediately
> after resize, still causes below error in the next mount.
> 
> [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
> [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
> 
> This is because after FS metadata is updated in update_fs_metadata()
> if the SBI_IS_DIRTY is not dirty, then CP will not be done to reflect
> the new user_block_count.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
