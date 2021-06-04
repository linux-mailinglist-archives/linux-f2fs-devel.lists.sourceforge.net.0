Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70439C413
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Jun 2021 01:48:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpJXs-0003XB-A3; Fri, 04 Jun 2021 23:48:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lpJXq-0003Wx-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 23:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y7HOUGtC+97hLKdMcyw3NTtKAdbchWzD4fHHhVEEREw=; b=ddDAGRLViOCoLahoxDLZ35W8c0
 fGG/m3sYUFmaZ+VzhzXAEtRMz7QXbD5NC8u+O8DNIVEkOZqvc902CUDm0JYw5+CYPPZQRu2kIFvzI
 E4tXFzX5fdA8QZLwEnMe2dXTnYrD8RdDxTNObQYup84ZtCqsld/TuiIqs9SXKFsVjDyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y7HOUGtC+97hLKdMcyw3NTtKAdbchWzD4fHHhVEEREw=; b=e8WFAWmljnW0RtOQCkhkmhmM0+
 XL7oApm4lndrbCH/HtpYNMtdYwHF/lhOn7uPy4tOcaVL2hQT+SghmEHfpNMjmAPgaQDT43uX7KfbX
 OKMzY6vPiuVQLq8Ei7F1U+NR9sTYfN1pfxdSiSL9I1Yol55N9EKq6N+APJsVmeKl44ng=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lpJXi-00Ayvf-2L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 23:48:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E245E613BF;
 Fri,  4 Jun 2021 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622850472;
 bh=NLvDgBamIlTsoUpyubJK48lcnagyEU52NZCy5eYLioo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=hnxH246GlLi904F4IdS+r6IcKoaZB6Hpcn3tJlLzavyZGdzveTbYwgivS5lcoIrFs
 CS7Z5xbGgfdhE0VQehGBRWNYH35/X0EI8uh57HuuP2P0Q9oENxr+6VJE5VT8TNjlC+
 A+Hw4Bb5Lw/3E0HUjW//cXOb2rZIWHZCS8OdGfnuplSb83bbExwsWI39Pv9Kw/4eUM
 9U/Yud3L7zPSV+5dkqe5JuCwgDkREwFSqR5UYZmYS4Tp89F0n9MCqdGjx+rp/P1B/0
 QrwU1zHCsbEvlb4BUEPOpQl1Hfqj1H3tuMxkOkkqedyGV1P597AyvvdHn7xVUAz2Z+
 0KkRsJVe151Sg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210521190217.2484099-1-jaegeuk@kernel.org>
 <20210521190217.2484099-2-jaegeuk@kernel.org> <YK5UOfzwdZni7c5W@google.com>
 <YK5edM0igwfd47LV@google.com> <YLfV4EPW5Yw6wP+v@google.com>
 <YLj+mQJ6IlADZksB@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a6f00d18-e9a0-42cc-f0af-fe3852b54243@kernel.org>
Date: Sat, 5 Jun 2021 07:47:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLj+mQJ6IlADZksB@google.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
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
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lpJXi-00Ayvf-2L
Subject: Re: [f2fs-dev] [PATCH 2/2 v5] f2fs: support RO feature
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/4 0:08, Jaegeuk Kim wrote:
> Given RO feature in superblock, we don't need to check provisioning/reserve
> spaces and SSA area.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
