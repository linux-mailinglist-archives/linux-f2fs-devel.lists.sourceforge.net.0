Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A341A9337
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 08:26:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jObUx-0002rn-Qm; Wed, 15 Apr 2020 06:26:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jObUv-0002re-51
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nw6hujR3MdnKl3uIqx+HUzxonsmT/n8kcsBPE/R1pes=; b=eU6N79+gQXkIUENivqXazt65MK
 +SBgGC1nrXv0IV6DV4LKZg6G9EyOruQ4Q7r7lAPBUqKtHzVMuBujvUba7G85EEQUic4I7hfN8/sPq
 +F7/139t0GieXPvSxVDuo3BfQwyNYTOxS9+yPT5FzK98ke17YTrV5lAZ0rY6tyqrlYwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nw6hujR3MdnKl3uIqx+HUzxonsmT/n8kcsBPE/R1pes=; b=DCgEjzRAwUS88DjKNkY1cFFjlK
 LAyDP279hMoxsUb+L7i/XHR6V0O82gMzXkCIcDHQkjH0yu/P6hP6cNNZ+z+Gx9GMNvgaJSRkC59Em
 3sPDlTFdtN0C1N8RBHNrhae0P/bCXlbyDo9LR3ORt9hOoEdKq5fwM4PkU9lJ9VPlzV+E=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jObUs-00H0vA-5G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:26:09 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 80110417E13B5D4CF896;
 Wed, 15 Apr 2020 14:25:56 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 14:25:53 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1586923554-30257-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fde3d252-674d-f2e8-6f26-5e70bab748b3@huawei.com>
Date: Wed, 15 Apr 2020 14:25:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1586923554-30257-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1jObUs-00H0vA-5G
Subject: Re: [f2fs-dev] [PATCH] f2fs: report the discard cmd errors properly
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

On 2020/4/15 12:05, Sahitya Tummala wrote:
> In case a discard_cmd is split into several bios, the dc->error
> must not be overwritten once an error is reported by a bio. Also,
> move it under dc->lock.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
