Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCC6D820D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 17:37:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5C1-0003tG-6a;
	Wed, 05 Apr 2023 15:37:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@sandeen.net>) id 1pk5Bx-0003sf-2n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8NaZLhL1XO35isAd2Vdppw/4pg0AYW6Ab6cbo/9Zbc=; b=Owv4LFTtHXxjA054NlKwdTcCS6
 mT0r76jC6gYB2mWhTiEjv0X1HXKETaW8EflIA5335VbcxBZH4nHk+j7RGOh/Wxu9j/kXRPjqsc9QJ
 BGLhN+eeMvv8mC9He9dv9aTVXLZj+jWGv3ssXe6ThhOPHyi41oQwLPP9vGmcWQrbelWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8NaZLhL1XO35isAd2Vdppw/4pg0AYW6Ab6cbo/9Zbc=; b=Znn8N9WApPjJn+u2CpvejYLMHr
 TtZsG2DyRPAA8BsMgbfoLGuBktMuBdPs5FNSBNaacufcKpltNUpgHsyzJxuz/WBAqBfJWMbQBE0B6
 1nr+809iVUB+Vb5pCN/Hoc6waOD7yKUeQOYD5J4VyjoVcGHaxbGMZnjTvOmkGtcyOnGA=;
Received: from sandeen.net ([63.231.237.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1pk5Br-00G6km-It for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:36:56 +0000
Received: from [10.0.0.146] (liberator.sandeen.net [10.0.0.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by sandeen.net (Postfix) with ESMTPSA id D4AD84DCA1C;
 Wed,  5 Apr 2023 10:18:17 -0500 (CDT)
Message-ID: <fb3c14f3-00b7-2a5e-3c76-bd90705224b8@sandeen.net>
Date: Wed, 5 Apr 2023 10:18:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: en-US
To: "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-21-aalbersh@redhat.com>
 <20230404162730.GB109974@frogsfrogsfrogs>
From: Eric Sandeen <sandeen@sandeen.net>
In-Reply-To: <20230404162730.GB109974@frogsfrogsfrogs>
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/4/23 11:27 AM,
 Darrick J. Wong wrote: > diff --git a/fs/xfs/xfs_super.c
 b/fs/xfs/xfs_super.c > index d40de32362b1..b6e99ed3b187 100644 > ---
 a/fs/xfs/xfs_super.c > +++ b/fs/xfs/xfs_super.c > @@ - [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pk5Br-00G6km-It
Subject: Re: [f2fs-dev] [PATCH v2 20/23] xfs: add fs-verity support
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/4/23 11:27 AM, Darrick J. Wong wrote:
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index d40de32362b1..b6e99ed3b187 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -30,6 +30,7 @@
>  #include "xfs_filestream.h"
>  #include "xfs_quota.h"
>  #include "xfs_sysfs.h"
> +#include "xfs_verity.h"
>  #include "xfs_ondisk.h"
>  #include "xfs_rmap_item.h"
>  #include "xfs_refcount_item.h"
> @@ -1489,6 +1490,9 @@ xfs_fs_fill_super(
>  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
>  #endif
>  	sb->s_op = &xfs_super_operations;
> +#ifdef CONFIG_FS_VERITY
> +	sb->s_vop = &xfs_verity_ops;
> +#endif
>  

Hi Andrey - it might be nicer to just do:

        fsverity_set_ops(sb, &xfs_verity_ops);

here and use the (existing) helper to avoid the #ifdef.  (the #ifdef is handled by the helper)

(ext4 & btrfs could use this too ...)

Thanks!

-Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
