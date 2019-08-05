Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E781B49
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 15:13:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hucnv-00026d-UC; Mon, 05 Aug 2019 13:13:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hucnu-00026W-1t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 13:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c77+M4ZfrkxBnla28mhTfq8/HqasjdrS3ipEXCQEJAw=; b=AVP8ZdaS4vJehgszMhFj4P272Z
 6TjZVMj8cqBeWTdYdHD9neElmYH/zeVsC4p7JESdcqGWpe+BhQMIJ/F/CxRg6XPgDHV07tgyNeIxf
 YOc/MQH647+uKDMhiXBOR+3/EWAD1usfBxYTbcAGszLerU55A9ZSXvS10DCY+yoQxipI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c77+M4ZfrkxBnla28mhTfq8/HqasjdrS3ipEXCQEJAw=; b=BCtH1n9HeudptgpnXQnhGQRaMr
 NiIyOeXZ7S0jbmkQfVVxxavbHY9WxpwXUsemkSSkdaHkh8Z//eNl/ytTbH9FWRCoQ1HJcGTG243Gk
 1gTd8QLsyXaoAayAyqYl7cbbRqejkPXleSffSgJ4YXD66LGGlXaXRWS2ZHT2jVdynuzc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hucnr-00BClO-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 13:13:33 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 391732075B;
 Mon,  5 Aug 2019 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565010805;
 bh=LTRsxYOPK9boOsPL66WtkKRklA/LN8sc3TCoGIEsBok=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OYMIXGORSNofcJWEjw8n5bn8gs6jqLQUgv8dTd1fAOEv2EarcVp1404rX89V05U4Q
 jHWeohZ6WZcGQlNFItbc8uID/XmqNnnLc9WenDUHKEe1xhd1hoXaE5fW8Uof75OlgI
 1rCVUM4pyHsKfCxDil3CV+Vd94YPgx8q3bKGNvyo=
To: Lihong Kou <koulihong@huawei.com>, yuchao0@huawei.com, jaegeuk@kernel.org
References: <1565003632-124792-1-git-send-email-koulihong@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <632c947b-2c44-b48d-e80e-0f6c43ac2f6d@kernel.org>
Date: Mon, 5 Aug 2019 21:13:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1565003632-124792-1-git-send-email-koulihong@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hucnr-00BClO-KQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: cleanup the code in build_sit_entries.
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 fangwei1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-8-5 19:13, Lihong Kou wrote:
> We do not need to set the SBI_NEED_FSCK flag in the error paths, if we
> return error here, we will not update the checkpoint flag, so the code
> is useless, just remove it.
> 
> Signed-off-by: Lihong Kou <koulihong@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
