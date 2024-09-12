Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C869E975EA6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 03:50:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soYyM-0008AJ-Bg;
	Thu, 12 Sep 2024 01:50:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1soYyL-0008A5-8R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 01:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HrF960LjKEQNI8DWhJZpY+MKk8/XH6IUqGEOqztozEU=; b=gnb+TSrF0wQ7PCn7ff/0wqT9k3
 hqRwiKveopb5mMNU2eVXdj9IGlPppFTqtFYSuJvKRxBnn3zFijKWAsqkvBdeyHdBz2qpHFwyNnOpi
 kg4BPTi0Qgbn+L8x1+0nPO2hwNPSm1SsnlsQ9XkmEoROe3Un3UOEao4KEZRxqWL6Epvw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrF960LjKEQNI8DWhJZpY+MKk8/XH6IUqGEOqztozEU=; b=QbW049u0R5EUWDhErYTrXhTsvF
 scUlzEIC4xMcxjMKPK+NtP2nNygd4leiqL7VaOCbUlp2A7tPJ2I3/qhLVl1pgGUcZIlKUsSehV2xn
 pMmk9U5F0z6kidxRs9O9KwjA++5ZPl1Vdde3DBFo58FtBcEE73OzE5dRizpRRrizgCZg=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soYyJ-0004o5-8p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 01:50:13 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X40jN3dv8zyRrL;
 Thu, 12 Sep 2024 09:49:12 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id E6ACB1800D4;
 Thu, 12 Sep 2024 09:49:58 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 09:49:58 +0800
Message-ID: <f23fffe7-7663-4407-9264-296b630ee7d7@huawei.com>
Date: Thu, 12 Sep 2024 09:49:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
 <adbbf133-08e3-4990-85a3-9dfa9d72c9fa@huawei.com>
 <cedd86de-4749-4880-93dd-373188bbfd47@kernel.org>
Content-Language: en-US
In-Reply-To: <cedd86de-4749-4880-93dd-373188bbfd47@kernel.org>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/12 9:11, Chao Yu wrote: > On 2024/9/11 10:04,
 Hongbo
 Li wrote: >> Is the subject of the email required to be [f2fs-dev][PATCH]?
 > > Hongbo, > > "[f2fs-dev]" prefix is added by f2fs mailing l [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.187 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1soYyJ-0004o5-8p
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/9/12 9:11, Chao Yu wrote:
> On 2024/9/11 10:04, Hongbo Li wrote:
>> Is the subject of the email required to be [f2fs-dev][PATCH]?
> 
> Hongbo,
> 
> "[f2fs-dev]" prefix is added by f2fs mailing list when it forwards
> your patch to someone who subscribes the list, if you receive a patch
> w/o f2fs-dev prefix, it is because you Sent/Cced patch to yourself,
> and the list selected to not send you another email which has prefix
> based on your mailing list option, IIUC.

oh, I got it, thank you!

Thanks,
Hongbo
> 
> So, it doesn't matter. :)
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
