Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 890B6E0008
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 10:53:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMpvB-0003T0-Co; Tue, 22 Oct 2019 08:53:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMpvA-0003Sf-6N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIYR9TPn15pLPoAjSSCJ3QMcpESn4Bg8EMXHot7gMzI=; b=MF+Mph0odTdO07oA/dBcTOPGYb
 3Eu6VwWP94jyrTcDMhknJTLzNyZTZQcMCc6bQNgSscegOWQqUjIQ+tHsyQ1YI+YaZf0NIbD7ayF21
 DcGWE2plM8ltQhglSjXUDZLlPv3cqWM2XhzwR76unMAuc6X/Gcs/XrI57XZVpLTvtz8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pIYR9TPn15pLPoAjSSCJ3QMcpESn4Bg8EMXHot7gMzI=; b=HnECsBVxtCNEPE+znSkwFLFEtc
 Zt62xE8wldjdaAHlcUZDoorBkgfzZ4FXrPNMHgaF/J44TC60GZsEAxNFApNcvD4UQKktBUrDaNFIo
 FZDIUKYDdU7DjgIRMnQKKBFsco0W6d88rTDBUodWmSfxlxDQ56ZdcACl9Y9g5zycRbpE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMpv4-00Gca4-IR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:53:40 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8F217B063EA452559309;
 Tue, 22 Oct 2019 16:53:27 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 16:53:25 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-2-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7022abde-620f-c906-2dc0-b67353f250b1@huawei.com>
Date: Tue, 22 Oct 2019 16:53:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191018063740.2746-2-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iMpv4-00Gca4-IR
Subject: Re: [f2fs-dev] [PATCH v5 1/8] libf2fs_zoned: Introduce
 f2fs_report_zones() helper function
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
> To prepare for write pointer consistency check by fsck, add
> f2fs_report_zones() helper function which calls REPORT ZONE command to
> get write pointer status. The function is added to lib/libf2fs_zoned
> which gathers zoned block device related functions.
> 
> To check write pointer consistency with f2fs meta data, fsck needs to
> refer both of reported zone information and f2fs super block structure
> "f2fs_sb_info". However, libf2fs_zoned does not import f2fs_sb_info. To
> keep f2fs_sb_info structure out of libf2fs_zoned, provide a callback
> function in fsck to f2fs_report_zones() and call it for each zone.
> 
> Add SECTOR_SHIFT definition in include/f2fs_fs.h to avoid a magic number
> to convert bytes into 512B sectors.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
