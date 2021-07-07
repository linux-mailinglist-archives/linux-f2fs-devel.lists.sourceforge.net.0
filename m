Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E329A3BE088
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jul 2021 03:17:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0wC0-00060L-Ht; Wed, 07 Jul 2021 01:17:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m0wBy-00060A-KB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 01:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ke5AngDjghe8WiGQ72PKEoyeAiTnSrYyO8+yujFuEog=; b=Jkopo1BolxwHRCzeWFnljhIWle
 MrqCk+OuCGts3lwmNutAj6uaseepS7OuLl5TO+ydt6IR6Gl+q8FDimQMGDVpOCuBXGtRcd/D57PF4
 mUOEQC5Vo64vU6i52LHsyHzKevb/J5KvJyGJx9PzzknYQXGxynoQ95lDuIuCSLWyCrN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ke5AngDjghe8WiGQ72PKEoyeAiTnSrYyO8+yujFuEog=; b=I79IGzcIGm97Uz2uGmEPuO1A5r
 vfpKFSeVMeG9FCYLSlQ+l60hK757zq3ze+6akF63x0qGq/3ov1bHFUMy2u5jiHj/2TRgyPtHqos+L
 rW4YJPnA+lqiWTqYsK+Aj8XSCWBI2HaGbdGWgC/BwUzeSvpxsRVm90D/NogQfMFjygL8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0wBt-0003Zj-IF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 01:17:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 827FA61107;
 Wed,  7 Jul 2021 01:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625620644;
 bh=tbbA16pYRiAn75mbYnyj7BJIyemqqOFcxocfzHvUyt0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RSlXt0OwSGhPut4OopmdlRg+TIf4sPPatje+qum6B2kp3VP9Qiw1MtXPePXTZ6RSg
 Q2MHgC+xF1fQm1mnnUzfsduRfznzZiqP2o1m76aiYnq4ld4EoKVGdCnSEH539hCnjp
 wKeig6/lSZwzPxF5FK0qSsygQMPWi0VmyH0xOsQ2ALt1BNoX8cI7HAjb1oMHJ1SMAs
 lrfpQ82jBUA3na/tWq8JS7eD19xImMd8w8SPHzS0Nih6VAfe999feaRBgAM048/tae
 xwbwpar1wuul20MLVFdG4Cn3KoVvjl1m3EkPZZiAWKgE2B07Xg37/oYnv9+T+lojPE
 7WBkfWiZqTGSQ==
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20210706131008.1299060-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a35e09e4-5a86-b4d0-2c1e-794ea212fb5f@kernel.org>
Date: Wed, 7 Jul 2021 09:17:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706131008.1299060-1-wangxiaojun11@huawei.com>
Content-Language: en-US
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0wBt-0003Zj-IF
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix wrong value of
 reserve_new_block parameter in page_symlink
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/6 21:10, Wang Xiaojun wrote:
> In page_symlink, reserve_new_block applies address for data block,
> not for inodes. Therefore, is_inode is set to 0.

Good catch!

> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
