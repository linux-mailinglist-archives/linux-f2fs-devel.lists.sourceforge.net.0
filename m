Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8F34688C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 20:09:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOmP2-0004wX-VX; Tue, 23 Mar 2021 19:09:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1lOmP1-0004wH-9n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 19:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y39EoDOm9uJTlWhho5oVXLUurYf33yLQsoySFHmkAEQ=; b=EoIjRhT1fmVLuADQvJggIENozG
 /vcfKFHpIjGvbq+FDMqNUZYisjeepPo4QUV8zudSgYcTL67Ewr2r0YwLec2hqgd8dAsJnv9qnnrqw
 Jx0O4uYdmxdCEzOO8rV1fbkmjjkvvHqx3Gs+/2KX612k25NKAfz/YHQmKkDtwfCYXnE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y39EoDOm9uJTlWhho5oVXLUurYf33yLQsoySFHmkAEQ=; b=hyDqtxuMe3+DLFkj0Dg4+sN7ud
 207srOLtAsF6KlWLGkynpeWhq/2baa/+1ProxiE63A1cu6msCg2boVp1waYwQjkbyylG9deAighMn
 18VwzhmjwnnYMrh8OchgGxraM37n2XhubVuxR6yW5oW4aD3J8eeohYEJvg0P1JTsgAbw=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOmOy-002Bun-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 19:09:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 3D4EC1F455B7
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>
Organization: Collabora
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
 <20210323183201.812944-2-shreeya.patel@collabora.com>
Date: Tue, 23 Mar 2021 15:09:05 -0400
In-Reply-To: <20210323183201.812944-2-shreeya.patel@collabora.com> (Shreeya
 Patel's message of "Wed, 24 Mar 2021 00:01:57 +0530")
Message-ID: <87wntxd6we.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lOmOy-002Bun-Ai
Subject: Re: [f2fs-dev] [PATCH v3 1/5] fs: unicode: Use strscpy() instead of
 strncpy()
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
Cc: tytso@mit.edu, kernel test robot <lkp@intel.com>, drosen@google.com,
 ebiggers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 kernel@collabora.com, adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, andre.almeida@collabora.com, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Shreeya Patel <shreeya.patel@collabora.com> writes:

> Following warning was reported by Kernel Test Robot.
>
> In function 'utf8_parse_version',
> inlined from 'utf8_load' at fs/unicode/utf8mod.c:195:7:
>>> fs/unicode/utf8mod.c:175:2: warning: 'strncpy' specified bound 12 equals
> destination size [-Wstringop-truncation]
> 175 |  strncpy(version_string, version, sizeof(version_string));
>     |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The -Wstringop-truncation warning highlights the unintended
> uses of the strncpy function that truncate the terminating NULL
> character from the source string.
> Unlike strncpy(), strscpy() always null-terminates the destination string,
> hence use strscpy() instead of strncpy().
>
> Fixes: 9d53690f0d4e5 (unicode: implement higher level API for string handling)
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>
> Changes in v3
>   - Return error if strscpy() returns value < 0
>
> Changes in v2
>   - Resolve warning of -Wstringop-truncation reported by
>     kernel test robot.
>
>  fs/unicode/utf8-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Hi Shreeya,

Thanks for fixing this.

> diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
> index dc25823bf..706f086bb 100644
> --- a/fs/unicode/utf8-core.c
> +++ b/fs/unicode/utf8-core.c
> @@ -180,7 +180,10 @@ static int utf8_parse_version(const char *version, unsigned int *maj,
>  		{0, NULL}
>  	};
>  
> -	strncpy(version_string, version, sizeof(version_string));
> +	int ret = strscpy(version_string, version, sizeof(version_string));

Usually, no spaces between variable declarations

Other than that,

Acked-by: Gabriel Krisman Bertazi <krisman@collabora.com>

> +
> +	if (ret < 0)
> +		return ret;
>  	if (match_token(version_string, token, args) != 1)
>  		return -EINVAL;

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
