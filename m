Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48396737016
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 17:15:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBd4G-0000y7-S7;
	Tue, 20 Jun 2023 15:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBd3y-0000xk-VW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 15:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOVXvtNAcD5PLY0CKl8aakxRRteKV8yTl9Qs7T1Rqu0=; b=SUIXAWIaYtankVwNA7Q6o85Ays
 x4EhxjdJyHbouVdmUgiwunGLK4JWwQLi/Om5vmzP6/XicUjVJ9TTqiZXWGKneTDzChNi+SZBrjncJ
 d7MlN6PmHd3y2Mxea1Otei9z+g+flq26IWyxowF2ELVm1dyoEgaWRRcyD+sBGIdp8eEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOVXvtNAcD5PLY0CKl8aakxRRteKV8yTl9Qs7T1Rqu0=; b=SNq4KM5p2U+B0k0VDlT83XZJ0y
 bj7fW2WCwb8i1CrtNJUDWbzySnql1IYZdLp1SsSqYIdKgV0sjtXh+pyxFcRtUiN7BZ1k6M65/SkG8
 ElmkGa3EG8Oujeg1PQbeHmimLX+013x65OcqlkQN51gE2SWUh9XfzSGVbhkYS7eAL6Ek=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBd3y-0004XV-8v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 15:14:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC037612B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jun 2023 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A98CC433C9;
 Tue, 20 Jun 2023 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687274068;
 bh=xpcefpiU++C3oDlU0Wn9zWuqnqGHuvxn4dXB9f/77gc=;
 h=Date:To:References:From:Subject:In-Reply-To:From;
 b=XVd6YKmm8EBcElAd/EJEKG/h9U6xpexYpoor74O3uNCtx2gkzActiCDE6QrDXA9J3
 5BBGVdLtf4f0OQ0dF8KgMWEW+i+a8m1NG8OyhKG85WbFr+wXK9VGNmZDzQR0rb5WSf
 xzK+BF7Fe3n9NHC6slatcOk0z1OA82vICaKfkj/lrDb6NaE8eoQYA6CJYKCXG4Din/
 z3L5pvwT44BcSTU5ld3QWFCZ5A80DeCAvpG5OTI355ctSsShPriLKz3cwkTU7ulBdQ
 R3PHLKeufyGiId8yYSKzI7EZ/32CaDSjfXU76Y7PrKQfJ/Iknn4JhJjFLP+pp/fLET
 IIU4bxmySWwXg==
Message-ID: <a1a84df4-aa7a-d684-8694-fa8489baa9c2@kernel.org>
Date: Tue, 20 Jun 2023 23:14:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
 <ZIjqKHDUmN6u9pXa@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZIjqKHDUmN6u9pXa@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/14 6:14, Jaegeuk Kim wrote: > Let's compress tmp
 files for the given extension list. > > This patch does not change the
 previous
 behavior, but allow the cases as below. > > Extention example [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBd3y-0004XV-8v
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress tmp files given extension
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

On 2023/6/14 6:14, Jaegeuk Kim wrote:
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
> 
>   Change log from v1:
>    - refactor to allow abc.ext.dontcare only
> 
>   fs/f2fs/namei.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 3e35eb7dbb8f..49573ef4115d 100644
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

Do you mean?

if (i == slen - sublen - 1 && s[i + 1 + sublen] == '.')

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
> +		if (is_extension_exist(name, extlist[i], false, false))

Parameters should be consistent w/ the one in set_file_temperature()?

if (is_extension_exist(name, extlist[i], true, false))

>   			break;
>   	f2fs_up_read(&sbi->sb_lock);
>   	if (i < (cold_count + hot_count))
> @@ -156,12 +160,12 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   
>   	/* Don't compress unallowed extension. */
>   	for (i = 0; i < noext_cnt; i++)
> -		if (is_extension_exist(name, noext[i], false))
> +		if (is_extension_exist(name, noext[i], false, false))

is_extension_exist(name, noext[i], true, true) ?

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
