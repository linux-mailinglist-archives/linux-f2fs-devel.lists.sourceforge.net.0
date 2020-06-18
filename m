Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1B1FEBE9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 09:08:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jloee-0002FS-Vb; Thu, 18 Jun 2020 07:08:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jloed-0002FK-BI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5vf+Cfp7KQy+RFdB+RXpnhiFeJn767pyq5LG7St9+U=; b=IQVPT9qh1k+npJS4bcBg+ox9Pc
 nuIXSlVLRY0H1VVI0c/rR6QMdJt/mFPL6kXmSGhGx3Muw9oHjl9hxpmMEbnAhoLodCt8eR9vkuGbU
 47uFxMp/L6ydQVEyc1hWGFgzRm3kUTmFuJnFCQB16Ru28jNlfEZszgsrLuPDMAgOqAks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H5vf+Cfp7KQy+RFdB+RXpnhiFeJn767pyq5LG7St9+U=; b=OK1336RN8wjkgxuV8fLhZh1YSu
 TsK3Q1yvFVCmGEEuOy4YgDmwNxmNHyVQ0Yd6EQN801H++AW2kpH87x6O8G2LVyutTcQT5iT0fW/FT
 hF/Eavl3we4LPXhIcOak2z2UyresHpbUluXYtw82HBp9fHOptDLkzU5WRrcKw0Qcl2oU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jloeb-007zkS-7Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:08:07 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0C771A4BE1794B993500
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 15:07:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 15:07:46 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200618043710.35938-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <54c3c554-25c1-d848-193d-cfc5a2c5d63a@huawei.com>
Date: Thu, 18 Jun 2020 15:07:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200618043710.35938-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jloeb-007zkS-7Z
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: get the right gc victim section
 when section has several segments
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

On 2020/6/18 12:37, Jack Qiu wrote:
> Assume each section has 4 segment:
>      .___________________________.
>      |_Segment0_|_..._|_Segment3_|
>      .                          .
>      .                  .
>      .__________.
>      |_section0_|
> 
> Segment 0~2 has 0 valid block, segment 3 has 512 valid blocks.
> It will fail if we want to gc section0 in this scenes,
> because all 4 segments in section0 is not dirty.
> So we should use dirty section bitmap instead of dirty segment bitmap
> to get right victim section.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
