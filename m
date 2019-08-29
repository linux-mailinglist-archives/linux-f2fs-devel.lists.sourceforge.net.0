Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09644A1CDC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 16:33:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3LUY-0006Rt-2E; Thu, 29 Aug 2019 14:33:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i3LUW-0006Rl-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ykciOHf/J8ddgP9FFysz2RWAoZTTF5fti0n0LZ5nU+o=; b=dTQs777CN8l55YhQMF2xDvr7Te
 VFRXnw+x/eTKbQzM9O9SgOuxSBxjnuo3JEMxWGUpc/bMvfPurDzpkrTwclBiPZpOfnQMKtMROYAix
 fJ6q62ijS77h3Qx5brFoss8hVJspPaU4/0yNba0wH16y4YGN+cZyodHbfV+aJbB2H85U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ykciOHf/J8ddgP9FFysz2RWAoZTTF5fti0n0LZ5nU+o=; b=ZqMKYcP8DgEjO/Ikxr+j6Fx4nD
 NPu33443thiHWzOv+ZwQVFZBhfITM9e3XGpWt4wVQGNiS+7kIdBwbO5ac6IS3Dd9jhzTYrDpgYnEB
 9Rcmno1f7sY51GQoLJB8kDP2PdGrw4/M0SOd0T6oT37Gv+GwZwqJYgZ2SQOhOVATX9CU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3LUU-0083zs-Sn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:33:36 +0000
Received: from [192.168.0.110] (unknown [180.111.100.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B96572077B;
 Thu, 29 Aug 2019 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567089207;
 bh=3RtX+IvjnXImvZjioHyVWMG3a/T9ZVSOQnG3Mqd2NTA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XE0rox0mLb1WNUu7yFYck1epNc+1S4vTDiRq1nasvl5gbfMlukoxmbG6MW0oJE4oF
 4Bj2DVTcQeMIYnbjdJGszONqk6l6n3VMA/1Qg3iIQkYoNQbYhwRvB6tMLJj9+wOndM
 nbayhb258tOcRNMKDTSQW18eC0boe2YidAQ/SmLA=
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
 <20190829063531.658-2-shinichiro.kawasaki@wdc.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <eba6dd98-a7b1-f141-0745-de9488606680@kernel.org>
Date: Thu, 29 Aug 2019 22:32:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190829063531.658-2-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i3LUU-0083zs-Sn
Subject: Re: [f2fs-dev] [PATCH v3 1/2] libf2fs_zoned: Introduce
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

On 2019-8-29 14:35, Shin'ichiro Kawasaki wrote:
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
