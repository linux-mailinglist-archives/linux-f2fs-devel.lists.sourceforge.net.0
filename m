Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF273AE67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jun 2023 03:42:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCVoN-0004TD-AE;
	Fri, 23 Jun 2023 01:42:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qCVoK-0004T6-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NSehen4O1lDhj/FQw/7iOUMNbquR7TTAAtXa2NTQEl4=; b=M3WGd3e1pHFRsiP2kuxcJIm6WL
 83GPc8EIuV3zc79yaxLhl/aIDEBustMK75W7PG4XN8vG2HfB/rSUJSRBk8Pg8BftJFOV1kEGoq1Rb
 JMNqTX4qIwvh9Q2qe1iT5OqU0kRvbqUOSJ6nZk0Wjb7+DDDRgll0IHw2P3W5XqxNMIBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NSehen4O1lDhj/FQw/7iOUMNbquR7TTAAtXa2NTQEl4=; b=S/ZADmhoDcmgTNDGFNYpD9A2SK
 q8Gav/lhRustp0rVPNeaBnf7hr87gY6/T83j/a3EREQ5f4TRwqRgKdsbKOFlkxJ29obrJE2l48c7S
 v54hwWCGcYeVk6FL8GM90drrk4NTR/OkBd6yQQrQPboaA4WYcVmURuFX0Pa0RulpnXgo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCVoG-0000eM-D7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05B21611D0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Jun 2023 01:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7AAC433C0;
 Fri, 23 Jun 2023 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687484514;
 bh=I2aZF3V0Z194tldhoqu9fKjJ+bgd1Czgm3Eg3VR8zX8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=rlph2JL+wWLr52ep9ZVnZ0edZ7FFq80p8L3yLNatM0oeTsYwPig61CKK2hWB8BocS
 cTR9vIzo8Oh5xDhxkAzlWo79OyyKna/THtGn4GrYiR4fgOZ/CWMryT/0eynODfEPP/
 eJ3x1ZgLgRPfZ0Tn47D8YGgseG8azaJ5mZac6PIpKJb35Yi5Ld+AK4BgMIDoCxU7/r
 doI5wmjMdB1oa7NKWdpOfvVRgkk6VbQsLvr4XhvlKUbK0KJPsJFhmktvVUTgCosmdE
 2Ls1oteh5t72Ah2VjAvKpzHGLCkK8Ax0aU6YKQ0vm7x+bxAmJZXUv77OmXHEBnLH/J
 H7W1h0A5OuQSQ==
Message-ID: <768b0591-ba30-ba0e-0992-2f312ac76f16@kernel.org>
Date: Fri, 23 Jun 2023 09:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
 <ZIjqKHDUmN6u9pXa@google.com> <ZJP0aoy03Vx2Q2K1@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZJP0aoy03Vx2Q2K1@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/22 15:12, Jaegeuk Kim wrote: > Let's compress tmp
 files for the given extension list. > > This patch does not change the
 previous
 behavior, but allow the cases as below. > > Extention exampl [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCVoG-0000eM-D7
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress tmp files given extension
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/22 15:12, Jaegeuk Kim wrote:
> Let's compress tmp files for the given extension list.
> 
> This patch does not change the previous behavior, but allow the cases as below.
> 
> Extention example: "ext"
> 
> - abc.ext : allow
> - abc.ext.abc : allow
> - abc.extm : not allow
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>    Change log from v2:
>     - fix parameters
> 
>    Change log from v1:
>     - refactor to allow abc.ext.dontcare only
> 
>   fs/f2fs/namei.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 3e35eb7dbb8f..80806ce1289f 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -23,7 +23,7 @@
>   #include <trace/events/f2fs.h>
>   
>   static inline bool is_extension_exist(const unsigned char *s, const char *sub,
> -						bool tmp_ext)
> +						bool tmp_ext, bool tmp_dot)
>   {
>   	size_t slen = strlen(s);
>   	size_t sublen = strlen(sub);
> @@ -49,8 +49,12 @@ static inline bool is_extension_exist(const unsigned char *s, const char *sub,
>   	for (i = 1; i < slen - sublen; i++) {
>   		if (s[i] != '.')
>   			continue;
> -		if (!strncasecmp(s + i + 1, sub, sublen))
> -			return true;
> +		if (!strncasecmp(s + i + 1, sub, sublen)) {
> +			if (!tmp_dot)
> +				return true;
> +			if (i == slen - sublen - 1 || s[i + 1 + sublen] == '.')
> +				return true;
> +		}
>   	}
>   
>   	return false;
> @@ -148,7 +152,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>   	hot_count = sbi->raw_super->hot_ext_count;
>   	for (i = cold_count; i < cold_count + hot_count; i++)
> -		if (is_extension_exist(name, extlist[i], false))
> +		if (is_extension_exist(name, extlist[i], true, false))
>   			break;
>   	f2fs_up_read(&sbi->sb_lock);
>   	if (i < (cold_count + hot_count))
> @@ -156,12 +160,12 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   
>   	/* Don't compress unallowed extension. */
>   	for (i = 0; i < noext_cnt; i++)
> -		if (is_extension_exist(name, noext[i], false))
> +		if (is_extension_exist(name, noext[i], true, false))

is_extension_exist(name, ext[i], true, true) ?

Thanks,

>   			return;
>   
>   	/* Compress wanting extension. */
>   	for (i = 0; i < ext_cnt; i++) {
> -		if (is_extension_exist(name, ext[i], false)) {
> +		if (is_extension_exist(name, ext[i], true, true)) {
>   			set_compress_context(inode);
>   			return;
>   		}
> @@ -189,7 +193,7 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>   	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
>   	hot_count = sbi->raw_super->hot_ext_count;
>   	for (i = 0; i < cold_count + hot_count; i++)
> -		if (is_extension_exist(name, extlist[i], true))
> +		if (is_extension_exist(name, extlist[i], true, false))
>   			break;
>   	f2fs_up_read(&sbi->sb_lock);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
