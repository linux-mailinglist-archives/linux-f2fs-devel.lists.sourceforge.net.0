Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA43EABE0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 22:36:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEHRB-0005yH-MO; Thu, 12 Aug 2021 20:36:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mEHRA-0005x5-49
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 20:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m+Kj7IY0HJcpmtbRTOPT4bQwid4k/MFF0Fv7OQxqOaU=; b=DJMEumwpy9OFxFlZAgmjHqno/9
 pgRHUIRuO0IWksF5kDcuhwpQwOcD+ds8HoM0wN6WFYGWblWCCqh4L9Ejg+ucqQR3u37SDitzZIFvs
 isyIcHBn0J8+GDKm/6A7vwEg2zN1rBQ6BC1ejPi0E1XJDchxi3uGPP8F78xQlsxaSN4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+Kj7IY0HJcpmtbRTOPT4bQwid4k/MFF0Fv7OQxqOaU=; b=MKOkPnSku6bPFwG7mO3P8ZdXZc
 zRM+OnO4xrh1ghpCxBU5H08csRzOEEk9LFx9yOJut1/zpiyYxdjz5JFXQmLUWpA5S/cALiSz+oRmB
 poW8nUCHxrOjVfSVUe4Vdchl8M39l9jljXqRe6mkBcbkM/xKH79x62gCLbe5NBNnZGoc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEHR5-0006gm-M9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 20:36:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F65F6103E;
 Thu, 12 Aug 2021 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628800569;
 bh=RmFGxQfXzDz3U9Ov7558Sj1L2+CQkR4vX9DtlN2wACg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uIZe0Ibzub92QxH6g7FhkwsJZfZYJPlHxG56XDlecDAXhnbrZ1ac0t+EpYFUw+6iD
 vaFn5SDJPLd4Vx6rY+TP4I7RGbx/J7NlFJidoBv12M6UR5xGItC2R06QtPmlTPzHqJ
 7unkcZ7eiksTDPiP5C2+abzH84adw7sX6rC2wrJiaaAOlWdkUJnaEN6eQKyKJGUntj
 pjwyJ14U6prpPMfnRH7EYKKQt8BcvvZQan/l0HCdHingfR6KDV1oFDlCGrCBnniUoh
 ONEYN9U7Zu+UDhYRUYMGX0KvhOUFHhJZfOMvS8oj70zPIdb4Jw8bWOmAj39nSyC9Of
 /7LQtajWVAtVg==
Date: Thu, 12 Aug 2021 13:36:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <YRWGN+u09OFHAYOp@google.com>
References: <20210811133733.227456-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811133733.227456-1-frank.li@vivo.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mEHR5-0006gm-M9
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: warn on when fsck flag is set
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/11, Yangtao Li wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
> this flag is set in too many places. For some scenes that are not very
> reproducible, adding stack information will help locate the problem.

Can we add an error history and expose it in sysfs?

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -Remove extra parentheses
> v2:
> -Convert to WARN_ON
> -One more blank
>  fs/f2fs/f2fs.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 67faa43cc141..0d08e31214a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -33,7 +33,7 @@
>  #else
>  #define f2fs_bug_on(sbi, condition)					\
>  	do {								\
> -		if (WARN_ON(condition))					\
> +		if (condition)						\
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
>  	} while (0)
>  #endif
> @@ -1999,6 +1999,8 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>  
>  static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>  {
> +	WARN_ON(type ==  SBI_NEED_FSCK);
> +
>  	set_bit(type, &sbi->s_flag);
>  }
>  
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
