Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711117B3B0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 02:19:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA1ee-0005nZ-0M; Fri, 06 Mar 2020 01:19:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jA1ec-0005nS-VS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I13llcu/Wrs6zMSmAU8dxK9xRlce4dAdS7DYx5+VY1A=; b=Ma7sRI/W4geWypDUfPs8Jsuu13
 EtsQ55J1gJA5K2t+XAp+IbcglU5ZuvYzYu+fAyYeHrPteK+oOqCEaFsWC0qiz8imC8AEEi9Ks3lY4
 b3tni8L83ZFIuqvMVYegJ+Yj2cHSrGCXEcrKGaUyctCKy6Wm8rAFqez0nZhVTaz19D0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I13llcu/Wrs6zMSmAU8dxK9xRlce4dAdS7DYx5+VY1A=; b=DQosXgt6Cnesu5gH9Stf1c3+l1
 5aIH0PsMenmeWglS/SVmnuzVokDQoHg2eZKpQzYlkdrTNxUYKjX3Kyb9nT7E/mcDKkG+B+vRXevx2
 FUXeWzK98c9A5BbmvQurbnrTZWL8bvSynPdLWBcXjvkuB78arB/2vmfKgPbsQ6Ofdq7Q=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jA1ea-009jyV-77
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 01:19:54 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 77563EC8DC063C1F3480;
 Fri,  6 Mar 2020 09:19:43 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Mar 2020
 09:19:41 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1583245766-3351-1-git-send-email-stummala@codeaurora.org>
 <1583245766-3351-2-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e164f166-5c3f-a2ce-aec6-ff01ecb902e8@huawei.com>
Date: Fri, 6 Mar 2020 09:19:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583245766-3351-2-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jA1ea-009jyV-77
Subject: Re: [f2fs-dev] [PATCH V2 2/2] f2fs: Add a new CP flag to help fsck
 fix resize SPO issues
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
> Add and set a new CP flag CP_RESIZEFS_FLAG during
> online resize FS to help fsck fix the metadata mismatch
> that may happen due to SPO during resize, where SB
> got updated but CP data couldn't be written yet.
> 
> fsck errors -
> Info: CKPT version = 6ed7bccb
>         Wrong user_block_count(2233856)
> [f2fs_do_mount:3365] Checkpoint is polluted

I'm not against this patch, however without this change, could
fsck have any chance to repair old image?

> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
