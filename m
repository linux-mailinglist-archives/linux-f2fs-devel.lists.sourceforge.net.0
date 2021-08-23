Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5D3F4CB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Aug 2021 16:54:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIBL7-0005rt-BP; Mon, 23 Aug 2021 14:54:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1mIBL6-0005ra-54
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0QsHpd8Y08t0G7rS7z3Fmn6ZHlTZ32iYo1vLjVGpgg=; b=MVRz7AxcgyXWHGZaG7foPkxacn
 AiZuWiMV86f++cz+dkd/yCao89tBiFFpoaFRSk6SJ6UklOhBDkOPJ4AiygOUV6tN4TbqqK1KTgsxZ
 4jGgiX7WefNCyPKS33vq1eRv9srw1ACU/gKiYinsUdfZ+LrVCNi7sWGaKvo64QByJGSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0QsHpd8Y08t0G7rS7z3Fmn6ZHlTZ32iYo1vLjVGpgg=; b=m5sPugF7DeT628StdfSIgIjytQ
 roH2gsX1hjl3Q4gWOcSNx90chbRt0RQm3R+n6Jgwgl1GtxjojVvr06jGv7Q3TQ+ufIfBIConWrWqk
 UlyQkooQnfpS4OqWZg6RioG2761Xi+C8u9ANZC+x7vNaYZ9OC4P0cmquam8MEVn+/RtI=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIBL2-0001Mq-7I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 14:54:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id C64241F42633
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Christoph Hellwig <hch@lst.de>
Organization: Collabora
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-5-hch@lst.de>
Date: Mon, 23 Aug 2021 10:54:02 -0400
In-Reply-To: <20210818140651.17181-5-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 18 Aug 2021 16:06:44 +0200")
Message-ID: <87y28s1ab9.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1mIBL2-0001Mq-7I
Subject: Re: [f2fs-dev] [PATCH 04/11] unicode: mark the version field in
 struct unicode_map unsigned
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christoph Hellwig <hch@lst.de> writes:

> unicode version tripplets are always unsigned.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Thanks,

> ---
>  include/linux/unicode.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/unicode.h b/include/linux/unicode.h
> index 6a392cd9f076..0744f81c4b5f 100644
> --- a/include/linux/unicode.h
> +++ b/include/linux/unicode.h
> @@ -6,7 +6,7 @@
>  #include <linux/dcache.h>
>  
>  struct unicode_map {
> -	int version;
> +	unsigned int version;
>  };
>  
>  int utf8_validate(const struct unicode_map *um, const struct qstr *str);

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
