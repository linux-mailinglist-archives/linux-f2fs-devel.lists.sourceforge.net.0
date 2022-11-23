Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1386368E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 19:32:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxuY9-00077J-Rn;
	Wed, 23 Nov 2022 18:32:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oxuY6-000778-EC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 18:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AIH1A5u+z6seLqd1JfAfRblb2Kbzo4oXSpalYFJfBs8=; b=f604jtaPYq7tTOjDk7llTOik3K
 rJGJYbrJbSUWz6Pwkt91vl+LrKi5HyLHz+xIOKGeHbrgUfy2FaMHTJnYGrfRkiMIxliQNtTvd0zje
 YZjq5rKTuAZ6YML+Z5Ok45y9CLRZf4kpt9F6/u/8Ah3OPQaBnJ6Hb6evmqDpIZMLKwSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AIH1A5u+z6seLqd1JfAfRblb2Kbzo4oXSpalYFJfBs8=; b=Is0WmC93b1abUSlnuQ7oI2abzv
 9SLoGTTEahAnM4pjzW/UWd9C/U1tE6disKZDFwm4YmC8lJSwxMXV/oavb2/LyD22iF/hzZlFTleWU
 yuADVDb0Jv04hlIjVQzg70zlKI6glRS+i3Y9mZg3F4xO4NlsxCrFm4f9UOxudDuC2A7Y=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxuY5-0001pO-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 18:32:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81CFAB821F1;
 Wed, 23 Nov 2022 18:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0D6C433C1;
 Wed, 23 Nov 2022 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669228354;
 bh=AYGlvKt7YQZqa65l3Od2pD7Mak2sH6QY21MH6d1v69g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4/2ZFeVg8PW9hGT8u5EsP81jLTaArTBB5I3qjZ50OZDoicQcEpQvvgMDEzc35TjK
 Gk/4Yr22sxtpwie2fDWGbmo4AjpODfXvgCxUSZWSNPlp6SY6iTPeRs0uOmARm0o8c+
 ZJLC6n5mr328mQ9MeF9z4KSs4OBwugFFOL+f2dcGvUL0SKcrsAEEsNVCZAb0DxyREy
 ZI3rEHJb6Cb0C4jZIw5TKvSR+DymO+rZhgXVcLdylssIKqa81dQqPBcNnCcHhVdlIU
 bMw+Oek5pqBHhNmpxcyQ4ovwoaNtonWecfUdNWHl1TSBtvHbrERp6nInwquQtwD+Mm
 mG+2cvbTj8pSw==
Date: Wed, 23 Nov 2022 18:32:32 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y35nQMuFRqiln0En@gmail.com>
References: <20221123170153.15888-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123170153.15888-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 24, 2022 at 01:01:53AM +0800,
 Yangtao Li via Linux-f2fs-devel
 wrote: > Introduce f2fs_is_readonly() and use it to simplify code. > >
 Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- > f [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxuY5-0001pO-P9
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce f2fs_is_readonly() for
 readability
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 24, 2022 at 01:01:53AM +0800, Yangtao Li via Linux-f2fs-devel wrote:
> Introduce f2fs_is_readonly() and use it to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/f2fs.h  | 5 +++++
>  fs/f2fs/super.c | 5 ++---
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f0833638f59e..efc9d6d7b506 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4576,6 +4576,11 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
>  	}
>  }
>  
> +static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
> +{
> +	return !!f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
> +}

There is no need for the !! here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
