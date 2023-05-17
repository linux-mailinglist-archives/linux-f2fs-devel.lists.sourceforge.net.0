Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68D705CC5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 04:02:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz6V9-000882-Ra;
	Wed, 17 May 2023 02:02:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz6V8-00087w-EE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J2i860tLQLeVsbnPAQed6YnJPOyM7XEzPNTBOaECD2M=; b=F8hCcUjRSQaHtWOL/aUUbYtLwf
 YcIHzrMLDIeu0dNCrcC5IP8q/EQOZ8BPIybZCmwi679pTHJHO7euhfJ0q2PpcLlbI9ujvgRbRq3lP
 VGNk9IKXdoI6i6UQPqleOQBEQ5pxeQmRenA25PfkuachBBRSbBCRg4hFBzqrM0YouPwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J2i860tLQLeVsbnPAQed6YnJPOyM7XEzPNTBOaECD2M=; b=Kf0hhQBV7U660A7Vw53pbrQ8CO
 prgbpOMYV5KyEmRGiz6uwnwRyFTjpGY7dLjlPRh3rYA7Y7AWxLoMyungx2si17LFf5jgTlhWCxX2X
 0PYBOL1/oWCvRcLWd1pPVy3La++fylFpf/SXstjxVT+ss7sro2AXmIXKIaDe/XHkQxcc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz6V7-00008v-SM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:02:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78D1361253
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 02:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D55BC433EF;
 Wed, 17 May 2023 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684288963;
 bh=X3/tQnIYCqBzehMVDwTZlPr0yhayMhgorwDhACGUN4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kbGL+SqDb7dp7zDc9WgIb4Wh7xTu2BMFlmzuberLJ8RspfpGb9BrEKEfQQ+uFQxU/
 fVB99cDIBYiAm6AkvRdHxzWaSMd+xuc7BEy1aulj/6sgOu9NrmYLphloCXfiPv4lpl
 6UjvWOPgxCzULAqfCFWINjxDchq3czUVHC+0PS13ajNSh5HuBHj4VLx3hpeGbxwrg1
 oFlmwOwPKr6U+eXvGcML8apQJ7D+ie1eUz99ha9pCia19sfjy6Il54lDCmOslz7gjj
 2bXLaZMPBRu+7MRyhm+Jkk1FbBc4uPN9wuzT/9j4arT7WZVhPDPQa/l4dEmBkVKz/W
 PJwKYqo+TnHWQ==
Message-ID: <0332822f-4798-40d0-71c6-cab4580f8400@kernel.org>
Date: Wed, 17 May 2023 10:02:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230505100205.1921708-1-chao@kernel.org>
 <20230505100205.1921708-6-chao@kernel.org> <ZFlQjq/nLX16rZYB@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZFlQjq/nLX16rZYB@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/9 3:42, Jaegeuk Kim wrote: > Added this to avoid
 android build failure. > > --- a/include/f2fs_fs.h > +++ b/include/f2fs_fs.h
 > @@ -23,6 +23,7 @@ > > #include <stdio.h> > #include <stdlib.h> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz6V7-00008v-SM
Subject: Re: [f2fs-dev] [PATCH 6/6] f2fs-tools: use f2fs_init_inode() to
 clean up codes
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

On 2023/5/9 3:42, Jaegeuk Kim wrote:
> Added this to avoid android build failure.
> 
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -23,6 +23,7 @@
> 
>   #include <stdio.h>
>   #include <stdlib.h>
> +#include <sys/stat.h>
>   #include <stddef.h>
>   #include <string.h>
>   #include <time.h>

Thank you for the fix, :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
