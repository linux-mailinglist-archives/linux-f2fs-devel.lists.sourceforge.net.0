Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B439D3C2BF7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 02:18:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m20hl-0001UI-Br; Sat, 10 Jul 2021 00:18:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m20hj-0001UB-AD
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V6VRjjw0L+KXtPU6uc7+q8Zc/iYabOvsKR7zg3xtGeI=; b=LYR4cpSWEN4LL3q+0j7HBVRNFt
 Fr9InGd2iyhfU6lni41Zmzelwpty/IodKRusrNpWFL9JuerH4p0CR60Wpvnbfju8k1SNghXc/JCkl
 TI7HSuHKeefobPdLHeAKFYzmNrixnoJw/6HHwPEgQNBJxoBNchFMwUxwMeXOMRhI2KPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V6VRjjw0L+KXtPU6uc7+q8Zc/iYabOvsKR7zg3xtGeI=; b=K2eCXVfJd4a6f+BUBXa/NxW3av
 k2h/EmniialJhakd7efjUQNI2qTDhdbDZSl2p6HyEA4ERRLqM1o7ZV7H2j+iDtBCtZxL8+hDUdsOg
 XUng5DMlUWpIxN+RV6iiPB0a01OiwXzupmLPS9QIvrzzYSSduMJfz/X9LIX+FR6Rnjek=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m20hc-0004g9-HR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 00:18:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF7E2613C5;
 Sat, 10 Jul 2021 00:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625876313;
 bh=ud/YYjWxJ/+/iO6A0FqSRb4r8ELakhnprcsHQL8QbaU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=p6M9nZJkS0DqhBVlXMq3mW3PGCaH49aF4a04cxUV61h3UrdlZ7dZzHcRydAsVGxsN
 3I562IkVbbycp9MmC7JIdCksI5JKEphqfMiH4sLt7/kAuBUuUN393uf9aMr2C4rjEU
 XNQWQ0Dn8pkhRpYjTs+B8H5uBYnaLN9tgX0yw8IQkd+/+T7itsDZcbBNg7cbeOgiYZ
 zMC9K3cEqnbVGdCF3PpZlPOM+VKkhE1Ew7bmH6AjS0Ceq/B2B64eUcn3ixDc6DdV5F
 dqwR1vPrBLKseGNsZu7Th0MO+BMnj/uKQqutkrrYJHazCCi+rd7oTiRafmjdcKx/nC
 PdFqLjSheXUPQ==
To: Wang Xiaojun <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20210709083453.3914788-1-wangxiaojun11@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <65456d47-3a03-6901-95ca-4b93de84aba9@kernel.org>
Date: Sat, 10 Jul 2021 08:18:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709083453.3914788-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m20hc-0004g9-HR
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid to create an empty string as
 the extension_list
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

On 2021/7/9 16:34, Wang Xiaojun wrote:
> When creating a file, we need to set the temperature based on
> extension_list. If the empty string is a valid extension_list,
> the is_extension_exist will always returns true,
> which affects the separation of hot and cold.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
