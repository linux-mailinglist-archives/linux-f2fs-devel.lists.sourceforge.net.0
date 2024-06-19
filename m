Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C35790E127
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2024 03:09:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJjpS-0007Ix-5r;
	Wed, 19 Jun 2024 01:09:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJjpP-0007Ig-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 01:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KC2C9DONCpR45Fkcotk7rZOPQMdiR+TaGdy8zQiR0DQ=; b=ZnCgYek0HREgiMJwN/oATN0TI9
 0AVKOMhWmBPzB/bBhjtypLCX0nG8vAtV/7dkW3WbXON1lsouIHzc52+QjAPvlo3WCf6g9iP11yJLv
 tU9PVh15qhSiVHwZBRDzDOxBAUSq80Uf94nHDvXT12LSrjKke2euetOfwCLmIHVClgKs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KC2C9DONCpR45Fkcotk7rZOPQMdiR+TaGdy8zQiR0DQ=; b=FNVXggd2Rb9YgBfwIEt52bVTIH
 YexTO6DcH1CUHNyf76cmejBVxJWzwimm4oQGVaPPQhc8p1HG+sausKie8VovH7rsNtcNRjTjmqTSN
 pQTZdWKvtms2xMBvyCOfeih20eOHZzFiQcitfZGF4BXIe6ggaZvC6MFsAsJzLw0qG3GM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJjpP-0003Fp-Km for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 01:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8490361A14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jun 2024 01:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366EFC4AF1D;
 Wed, 19 Jun 2024 01:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718759364;
 bh=UErUBcvcliu7jOK7EUKySL1PIUbLZdkkiwHCRkyKEtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a6XIrLAytiipmZgBjd0hDf9HXN+gj6NYp3buoJ2TKDyqTIdX6sTOuIgB5hYdvSEek
 l85k2RpB2x+MRks9lMnMQfbkqe02gOHmVc6z82FOJTjfEJq0OkutnV9loLP/AyEp/9
 IZNXq505l0gHv11JFDrONKGyX6nmQy2v1lAPo7Kfnf8cou9+cn8h/t5sfoXSTGih+L
 T54jgND4al4HLMiuXnaJP+M5o6/SNInsakUSPLxcjRvb+HaT//TrZXHsz9SObDEKb4
 SmAgA8ISR8cFvBIkKhZETk5svxtLYEpMxpQx47LkxDo8fEM7KWjloN+jz+aqaH+7LY
 Os1YdKBlS/dCA==
Message-ID: <2cb67503-d974-4db2-942d-b68b69de9447@kernel.org>
Date: Wed, 19 Jun 2024 09:09:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240618022334.1576056-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240618022334.1576056-1-jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/18 10:23, Jaegeuk Kim wrote: > mkdir /mnt/test/comp
 > f2fs_io setflags compression /mnt/test/comp > dd if=/dev/zero
 of=/mnt/test/comp/testfile
 bs=16k count=1 > truncate --size 13 /mnt/test/c [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJjpP-0003Fp-Km
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr
 is valid
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/18 10:23, Jaegeuk Kim wrote:
> mkdir /mnt/test/comp
> f2fs_io setflags compression /mnt/test/comp
> dd if=/dev/zero of=/mnt/test/comp/testfile bs=16k count=1
> truncate --size 13 /mnt/test/comp/testfile
> 
> In the above scenario, we can get a BUG_ON.
>   kernel BUG at fs/f2fs/segment.c:3589!
>   Call Trace:
>    do_write_page+0x78/0x390 [f2fs]
>    f2fs_outplace_write_data+0x62/0xb0 [f2fs]
>    f2fs_do_write_data_page+0x275/0x740 [f2fs]
>    f2fs_write_single_data_page+0x1dc/0x8f0 [f2fs]
>    f2fs_write_multi_pages+0x1e5/0xae0 [f2fs]
>    f2fs_write_cache_pages+0xab1/0xc60 [f2fs]
>    f2fs_write_data_pages+0x2d8/0x330 [f2fs]
>    do_writepages+0xcf/0x270
>    __writeback_single_inode+0x44/0x350
>    writeback_sb_inodes+0x242/0x530
>    __writeback_inodes_wb+0x54/0xf0
>    wb_writeback+0x192/0x310
>    wb_workfn+0x30d/0x400
> 
> The reason is we gave CURSEG_ALL_DATA_ATGC to COMPR_ADDR where the
> page was set the gcing flag by set_cluster_dirty().
> 
> Cc: stable@vger.kernel.org
> Fixes: 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block migration")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
