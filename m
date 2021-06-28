Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A827B3B6AFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jun 2021 00:34:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxzpd-0002fw-RS; Mon, 28 Jun 2021 22:34:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>) id 1lxzpc-0002fo-6A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 22:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uFGojLro2S6zmHilKiDR6iZiCZt8ULH5o4uOpSvCxIw=; b=RZ/T2lm56IlQO8VSmpobSSlrC6
 nvvxRkKgF4nUDEKUBqxxsgILDIvKHV8bhK2OloAo0OxJKk9Y+OoxbJjkjm8Is5C/CT+GnwVUEd7gz
 /z1aWKCFu3k6/bQ97Z8ZYfFljQjhkTdbdCQrsgSu6ZvStdsBIqT963vrIJMnmxIg6v+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uFGojLro2S6zmHilKiDR6iZiCZt8ULH5o4uOpSvCxIw=; b=AHhAF2ZFE76tgQCVHcg7wslK5c
 XmzMwZerzjBCb5Ztp8LDxhf2e8Hzn7U2wWIkvhC76rXO2vrPC3j1lnKf8S/hkO6N44++ldVaSgPAH
 e1SWt5GXpoquVVxAcyhmFh/AKiaA5iiUuha8lAWOlhq6ZIEOT/0E8DNVspeh5va146r4=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1lxzpS-002PBo-Dn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 22:34:20 +0000
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au
 [49.179.138.183])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 74A7F1044A55;
 Tue, 29 Jun 2021 08:34:04 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1lxzpL-000XQU-FI; Tue, 29 Jun 2021 08:34:03 +1000
Date: Tue, 29 Jun 2021 08:34:03 +1000
From: Dave Chinner <david@fromorbit.com>
To: Wang Shilong <wangshilong1991@gmail.com>
Message-ID: <20210628223403.GE664593@dread.disaster.area>
References: <20210628123801.3511-1-wangshilong1991@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628123801.3511-1-wangshilong1991@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
 a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
 a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=lB0dNpNiAAAA:8 a=7-415B0cAAAA:8
 a=7euumQaoeVMSjSfkz0cA:9 a=CjuIK1q_8ugA:10 a=c-ZiYqmG3AbHTdtsH08C:22
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1lxzpS-002PBo-Dn
Subject: Re: [f2fs-dev] [PATCH v2] fs: forbid invalid project ID
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 28, 2021 at 08:38:01AM -0400, Wang Shilong wrote:
> fileattr_set_prepare() should check if project ID
> is valid, otherwise dqget() will return NULL for
> such project ID quota.
> 
> Signed-off-by: Wang Shilong <wshilong@ddn.com>
> ---
> v1->v2: try to fix in the VFS
> ---
>  fs/ioctl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1e2204fa9963..5db5b218637b 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -845,6 +845,9 @@ static int fileattr_set_prepare(struct inode *inode,
>  	if (fa->fsx_cowextsize == 0)
>  		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
>  
> +	if (!projid_valid(KPROJIDT_INIT(fa->fsx_projid)))
> +		return -EINVAL;

This needs to go further up in this function in the section where
project IDs passed into this function are validated. Projids are
only allowed to be changed when current_user_ns() == &init_user_ns,
so this needs to be associated with that verification context.

This check should also use make_kprojid(), please, not open code
KPROJIDT_INIT.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
