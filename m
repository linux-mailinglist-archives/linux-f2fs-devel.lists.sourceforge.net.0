Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CC61AB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2019 08:31:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkNAu-0001JS-ME; Mon, 08 Jul 2019 06:30:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hkNAu-0001JJ-5W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 06:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jO5I0yG81LZE3/jgF8NiqpitFmj/ZPVmP+NAjL0MGK8=; b=OuLaf0YDGsem6B8JWXPoIK1sN4
 6E4cnsxExQo8h8+WWzItagnlbZtWXfjVRmMw9E6kmt1tRpGV0orG04kF3Zx1jaCyuywVem+UO1kSM
 4XTwaWuadj3+5zkv4L/l7AvL4EokN5VuIMagBRMWEW2Zuh1tOSW9zM09lZIJ+VSioxiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jO5I0yG81LZE3/jgF8NiqpitFmj/ZPVmP+NAjL0MGK8=; b=MD0DP8wt3nV3WThXKkCtOZRedl
 QnfSnRkokMZj9zvTF//qjbrcMzBUEattNHBwohDcf3pXN8V4wWq/SEFVLLHioWMfeGuGnT00bnTkI
 FxMOk00oZAdu7TmAb38lTlIjrJT74DYco7VHW/ctsieLNA6y5RLOJx3vHzcKTy3Vj0JY=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkNB5-00BPtO-4R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 06:31:09 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6AFEBC7DA0216E3C015F;
 Mon,  8 Jul 2019 14:30:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 8 Jul 2019
 14:30:55 +0800
To: Ocean Chen <oceanchen@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20190708043456.24935-1-oceanchen@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ebf31e70-b87b-ea26-c3e9-99775cea69af@huawei.com>
Date: Mon, 8 Jul 2019 14:30:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190708043456.24935-1-oceanchen@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hkNB5-00BPtO-4R
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: avoid out-of-range memory access
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/8 12:34, Ocean Chen wrote:
> blkoff_off might over 512 due to fs corrupt or security
> vulnerability. That should be checked before being using.
> 
> Use ENTRIES_IN_SUM to protect invalid value in cur_data_blkoff.
> 
> Signed-off-by: Ocean Chen <oceanchen@google.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
