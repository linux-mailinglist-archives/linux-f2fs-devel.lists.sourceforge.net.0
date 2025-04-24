Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFCA9A72D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 10:58:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7sPq-0006bb-5J;
	Thu, 24 Apr 2025 08:58:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u7sPo-0006bU-7o
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 08:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1l/8MBTeGW0CRWvRghdDj60MKdgX5tGQQ+b+ccU9Uak=; b=hnQMG0LtyxDVt0oe41Xn+dyjEw
 y/Lltd0ASslXEVn/ktwyeleMb8Qs5fHjAUZBzc3UsUAH++5AiCmEcIwwopwhuR0o8cZb1IbbeHhoy
 HFLH68SO9d+bHE9TATyO9Y/w9eh44CqVQH8+W8L+2XmQXR+0ZLEa7YWW/9WyG8ChyUlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1l/8MBTeGW0CRWvRghdDj60MKdgX5tGQQ+b+ccU9Uak=; b=cpfgpny85d3rVOTomrglJzFWVV
 JcAfV7GhN6InnBejZAQ5wzJpkPKDH9bJ5kfS+PD+BJMYnBdYlhmoeDavZhvjdePrnswomJkQq3W2x
 RhTri8o9zl8lbourweyu9zAvxDtSydg2XqujAAg7s+JFBWRGX3UTdnHDjoXs9Sls67Vo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u7sPY-0007FF-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 08:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2359A68456;
 Thu, 24 Apr 2025 08:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984E3C4CEE3;
 Thu, 24 Apr 2025 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745485093;
 bh=WRtAJIlD31W/MPCJbqHC+mOWsaKtdlry2yATw1XV86Y=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YLRlM8BwTFRN0Sdx7f7US/aeOrjMwGV6YCJ1g5HuELbymZ3WXxP8XR/CGScuciFwT
 wzOHqrYtjjsVaJ1GGUwOzcSJPlwaxEdmNfxs9TKhcW39a6NM3/jvl98RUdTY64UgDC
 ZVmdoIBH/5APv94vRMzsFX72HO1LQJIWQKOWckwIc1iOsQ2f1ZfdaRypcfmuIDum9W
 oxwoGmA8RDh4iK9jYKZ+CJi88OzYuMTYlQK7LbBsAQgutNa0UF7K5rHXWt4TlI9JdG
 1cWFKGMN+5SwRRNOn1zAvUswjF8E6+vgul02Pubvs173YMKx8+l710IyQksA57N78v
 PNXTdcyrM+GjA==
Message-ID: <cfbe6edc-fcc3-4351-9c3d-5c6c18178835@kernel.org>
Date: Thu, 24 Apr 2025 16:58:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Antipov <dmantipov@yandex.ru>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250423161527.152834-1-dmantipov@yandex.ru>
Content-Language: en-US
In-Reply-To: <20250423161527.152834-1-dmantipov@yandex.ru>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/25 00:15,
 Dmitry Antipov wrote: > In 'f2fs_write_end_io()', 
 end all of the in-progress writes with > -EFSCORRUPTED if the corresponding
 error was detected earlier. I guess we need to figure out why f2fs_bug_on()
 will be tiggerred? 
 Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7sPY-0007FF-Ii
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: end all corrupted fs writes with
 -EFSCORRUPTED
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/25 00:15, Dmitry Antipov wrote:
> In 'f2fs_write_end_io()', end all of the in-progress writes with
> -EFSCORRUPTED if the corresponding error was detected earlier.

I guess we need to figure out why f2fs_bug_on() will be tiggerred?

f2fs_write_end_io()
{
...
		f2fs_bug_on(sbi, folio->mapping == NODE_MAPPING(sbi) &&
				folio->index != nid_of_node(&folio->page));

Thanks,

> 
> Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  fs/f2fs/data.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 54f89f0ee69b..755806868f0e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -320,9 +320,11 @@ static void f2fs_write_end_io(struct bio *bio)
>  {
>  	struct f2fs_sb_info *sbi;
>  	struct folio_iter fi;
> +	bool check;
>  
>  	iostat_update_and_unbind_ctx(bio);
>  	sbi = bio->bi_private;
> +	check = is_sbi_flag_set(sbi, SBI_NEED_FSCK);
>  
>  	if (time_to_inject(sbi, FAULT_WRITE_IO))
>  		bio->bi_status = BLK_STS_IOERR;
> @@ -331,6 +333,11 @@ static void f2fs_write_end_io(struct bio *bio)
>  		struct folio *folio = fi.folio;
>  		enum count_type type;
>  
> +		if (check) {
> +			mapping_set_error(folio->mapping, -EFSCORRUPTED);
> +			continue;
> +		}
> +
>  		if (fscrypt_is_bounce_folio(folio)) {
>  			struct folio *io_folio = folio;
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
