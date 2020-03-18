Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D482189BC0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2020 13:14:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEXac-0002gT-JI; Wed, 18 Mar 2020 12:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1jEXab-0002gA-D6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Mar 2020 12:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=og0LDHDGJi+jmOmmQp4Rk2H6PUrLgVc6fcIsRCRNLD0=; b=dXIgd8zhvyfBVXhk7pfXq5oScB
 E59ybec6SrQTRWQJ3ntevIzPv0LQA6afAJWS/ufkFZbIwqGtrhB7zv5tqfwkQJlxDIO1DhHKN7TPw
 xi0S1J5HU8HHACjCQnZO35s/WHCQ6x+ck7dArEmZpbDfIaY5l9zkPFBNtGR0Q2Db9ASM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=og0LDHDGJi+jmOmmQp4Rk2H6PUrLgVc6fcIsRCRNLD0=; b=KukNoaSenIFcfhaGLtDtbctudy
 vy8v6Q36Wsjqj5plzr8SBDCgKgUFEYWbCPf19tpNtGfnwTuHmVK0PuWRVXcZLPs6Xgq0u2WxKz3jo
 LkEUOL0f1qfHsTIDvV6UxK6RAfmTVVEZstk24wPP732orMR/nJhPTuQ84kxlMx+LbWLU=;
Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jEXaY-00DBOd-ET
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Mar 2020 12:14:25 +0000
Received: by mail-vk1-f195.google.com with SMTP id e20so6988299vke.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2020 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=og0LDHDGJi+jmOmmQp4Rk2H6PUrLgVc6fcIsRCRNLD0=;
 b=iAeIBdlaaFvGcjmOV9nnbG4Q+ZKQ58q6k1c/nmRUOMcJSdQdGoeupdtrE0kMoc4lpt
 tEZueJQn3kCsdxcxN9odshFTtplAHptMXbyeDvQnnTC6abmb/DbaTG/Gjk/rjKhu34XH
 F2ITAgNyF83lzIz/61qEASXmvPCKRW+M9iJ+PbaFQzhZAIZB3yw8fhmgkCI09aEuas4p
 npdO3N3Ju7my6YLRjznwctZm7KlW4PbyQN6a5kYxyGYntxrnLPxGzzpswV6X9ffChNMZ
 S4QnHDcw9NCHeG0/8rpOn7HeDWK04qk/2DZsOqiKAaNE6IF1N8/U/0XYPUt7g3do7k6m
 eh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=og0LDHDGJi+jmOmmQp4Rk2H6PUrLgVc6fcIsRCRNLD0=;
 b=Wl2NKMbba6VNya5470Ii7omzPsPW3e3GblrjIp0VMZSaG4YXGCR5/DFRMbFSKJpuED
 Lb7d7EP5PvRxRaMK2l5yn4EnjSGWDexkFbYtL8neqiRc3rwErHPejeTBv3hoQ6HVqcGo
 c0MlF0o8NrL9wb7xvFZKlBksqD5I4xPzigendGG1lA+SdwWnNEer4eY3yTy3fLMHV8YT
 /bSbdUNY4ZmIeLW2OylpsLFS8uuHmRF1kL6hDIpwG9Ge4j+tsv75kxmeIHNXz0LwBT56
 yMDE2XsU/SMDGuF6QPt7oQGe4kn6buDIF1JvgB4jCFOP0EZBTZtbXERZ8+gDWJKG0bO5
 yksg==
X-Gm-Message-State: ANhLgQ0oYowJz63jkgIC7JG3Bpd5R9UVQNPZocCmz/U+jC6pdnogKHFB
 o6V2Ir4liSL07Fp5VhIPRjcPUCpuwFMkDgdcIOk=
X-Google-Smtp-Source: ADFU+vtuxafvF6plHBJVfKJ7U23/fBbB1V91FZHEJpgZp+l9v0FqrX8HUV0TNGlgraDKAKeMO6f2LK/g141VKeZjYYs=
X-Received: by 2002:a1f:ee05:: with SMTP id m5mr3020614vkh.9.1584533656113;
 Wed, 18 Mar 2020 05:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200225101710.40123-1-yuchao0@huawei.com>
In-Reply-To: <20200225101710.40123-1-yuchao0@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 18 Mar 2020 21:14:04 +0900
Message-ID: <CAD14+f3pi331-V0gzjtxcMRVaEn3tPacrC20wtRq9+6JY9_HVA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jEXaY-00DBOd-ET
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use kmem_cache pool during inline
 xattr lookups
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao.

I got the time around to test this patch.
The v2 patch seems to work just fine, and the code looks good.

On Tue, Feb 25, 2020 at 7:17 PM Chao Yu <yuchao0@huawei.com> wrote:
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index a3360a97e624..e46a10eb0e42 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -23,6 +23,25 @@
>  #include "xattr.h"
>  #include "segment.h"
>
> +static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
> +{
> +       *is_inline = (size == sbi->inline_xattr_slab_size);

Would it be meaningless to change this to the following code?
if (likely(size == sbi->inline_xattr_slab_size))
    *is_inline = true;
else
    *is_inline = false;

The above statement seems to be only false during the initial mount
and the rest(millions) seems to be always true.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
