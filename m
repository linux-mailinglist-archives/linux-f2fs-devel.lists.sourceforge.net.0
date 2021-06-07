Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B494A39E48E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 18:52:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqIUE-0005Ai-Qd; Mon, 07 Jun 2021 16:52:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lqIU5-0005AN-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n6BSoAsR0ipfOdQdu9zIgwPcwlt0WjxSNJOmnr3xQJ8=; b=iqgAu5L7xTZunUGj5c1A1ptXGL
 /lh/6VzeOX4AZrQ9JsasCChGrgqR/6TMSScXZIuwnxBDgCqz0dAonkvmANFSRWrKhsssFopYLfyqm
 Zl4P28yrUyhaZV7HF7yx+7wK6pdSJIEziDUBcoHKClmf9XWG5ZGmL/4xAf9Pf7tn0LZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n6BSoAsR0ipfOdQdu9zIgwPcwlt0WjxSNJOmnr3xQJ8=; b=W/81fKy3CHMwRSUymuLdzQTs0X
 1iB5nZiL1wIGGHg7tbobZytermc29z8BhjycIA+YTiLF9Ur1qOtL4ZdC5xBimLPVkiU1RrfCA6/nm
 36KoocgezpBa4CmY4LkPJRmX2aRYja7PNklNV0q2bwp6qy5dXLaA8s2+MuTfu8XVsUN8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqIU6-00FVhP-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 16:52:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BBA460FDA;
 Mon,  7 Jun 2021 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623084728;
 bh=8/Ui+ot/kVskKKYqnBg2Od6Sv1XsnD/iaKXFkrcsKb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVhaJSWudb6v5OA3nYe3+784QcC+JeHCiaucv5gsKnNKFLHNx47eTYfpvNwC7tadO
 6CkLPkkqdxuMwJ5NoWl0uqx0XzoUPhZUhq4GwxJxGe/M201ZSQAsKZ1Rv7VIAg2qTh
 J4AF0+gQkJ3pcLN3ijGzVIPCFpoB4ySy41fmNszZARQsV8R0CrYpTaCburu4Rhl8yX
 1h3nX+JjR0HIy6qJXXWAr2lNs+Ul3LZNMXIioLowHac3du2MhBNu9odf10XCCKlJ/S
 7kI0hPBQTDokylhJ6NqGySKuNW/6UKVqOLT/c1VnPzm0EcDD3NvTl8X58OXhkxz1Xy
 IdiGf1Nh4Le1Q==
Date: Mon, 7 Jun 2021 09:52:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YL5Oth8oKnV7h8Pm@google.com>
References: <20210525205138.2512855-1-jaegeuk@kernel.org>
 <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqIU6-00FVhP-Ef
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED
 instead of IMMUTABLE bit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/06, Chao Yu wrote:
> On 2021/5/26 4:51, Jaegeuk Kim wrote:
> > Let's use F2FS_COMPRESS_RELEASED to disallow writes only.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Too late, as I published it in master.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
