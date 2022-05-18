Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 576AD52BDB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 17:24:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrLX4-0008Cl-B0; Wed, 18 May 2022 15:24:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nrLX3-0008Cc-Et
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 15:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pM0VIzY095/DEXR/lJ/Z1Exn1+wo3LAJu+/oJuaP61E=; b=XdXk1FrVOJ4nsEh/FTFpcPEZkV
 J45Tmp237jkxIBuaWKkjDZbWA5nm0YMOaLrvKQc2zLhpC0cuimz5Yu1qycxLTFPyTOx8E4zvF+IqZ
 WFw1y+ZFt0M+xsY5Y6o/1LUNsmUqzcmzkamQJoiIHaXGFGS03sPABrL97l9E5D4KVwIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pM0VIzY095/DEXR/lJ/Z1Exn1+wo3LAJu+/oJuaP61E=; b=DeJh9yHOLuNZLkBbv0ERGQjIuG
 FsygIytgoNlxty2f/nbJIl3PRisudwpIaWak3nLcnVGAixuemDQCak1/ckcl/IpaCW/oD/OVAXbTT
 hliDLa+PY1aw+UegAsZlfVCY0ayf8BhL3FRaFgas/USaKYGJZ0R9j6doTQxBSD2Dc+m8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrLWz-0073Gb-QU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 15:24:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 376FB60BAC;
 Wed, 18 May 2022 15:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B140C385A9;
 Wed, 18 May 2022 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652887436;
 bh=YRg8FOBF474wcLMD9+vFBXzah90HH8wz+sqNu2oCaNU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=te9UTYWfbDP+aEEzSFMVtBWdMhj9JyQInKJmsyPAEoDaJFq9imNhql/v4hiXI3Aid
 GzjBjZYocPzxtCcW15jDPs+3ebJOSFbRxmyKIIJ4hlEKf1+fLSM9/krLSEMMv1ZfKl
 YXFKPshaOa72Yo6fDN2OCnyAKPzPeEkT3dL/Uop2NyElDncWX7uIN3scQeBFQFhpon
 dzH23MiqDNv9P/dH0OBS0QJ/z8rYkHNZFy7E0499RIHmX0OI5OrGGgJK954ii5Rhf+
 +tsPDR8T7sBBalagXIZhWYYlVUiKyKCfkzA2GC06Ixw/w1Phrcd5+dcvB9ktSmnWpz
 a9iO+rgh8sBUg==
Message-ID: <7d1878ef-e1ae-0550-7d6d-2a2ff858586c@kernel.org>
Date: Wed, 18 May 2022 23:23:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Chao Liu <liuchao@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220518023123.2455827-1-liuchao@coolpad.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220518023123.2455827-1-liuchao@coolpad.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/18 10:33,
 Chao Liu wrote: > In f2fs_read_inline_data(), 
 it is confused with checking of > inline_data flag, as we checked it before
 calling. So this > patch add some comments for f2fs_has_in [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrLWz-0073Gb-QU
Subject: Re: [f2fs-dev] [PATCH] f2fs: make f2fs_read_inline_data() more
 readable
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
Cc: Chao Liu <chaoliu719@gmail.com>, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/18 10:33, Chao Liu wrote:
> In f2fs_read_inline_data(), it is confused with checking of
> inline_data flag, as we checked it before calling. So this
> patch add some comments for f2fs_has_inline_data().
> 
> Signed-off-by: Chao Liu

It looks email address is missing, but it shows after I can apply this
patch to my local git repo...

Could you please check your email client configuration?

Thanks,

> ---
> fs/f2fs/f2fs.h | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f579e2ed0f14..5071f6636e41 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3167,6 +3167,10 @@ static inline int inline_xattr_size(struct inode *inode)
> return 0;
> }
> 
> +/*
> + * Notice: check inline_data flag without inode page lock is unsafe.
> + * It could change at any time by f2fs_convert_inline_page().
> + */
> static inline int f2fs_has_inline_data(struct inode *inode)
> {
> return is_inode_flag_set(inode, FI_INLINE_DATA);
> -- 
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
