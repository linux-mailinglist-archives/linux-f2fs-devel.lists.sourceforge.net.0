Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64115A63CE1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 04:19:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu10j-0006Ig-9K;
	Mon, 17 Mar 2025 03:19:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tu10h-0006Ia-RQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hdq4ttCWz1rxCXOwzzQJ4uCL2pGRywI8bq8GztVfiPw=; b=Or3qirRY1p4oe67MwxatvJxhUD
 dEPIpZH1jY0tnDRXPTbFhQ0JoW6J51p8V6XF7NT/UJ+r6qKIO/W1SMVSeKiVqgMaCdAginubaG93K
 gxewiVNTJatfwl8z+KYo5dgYezLSS/lvkJGHO17FP97F6TxMS/PFphhe/G9NDtfT5xGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hdq4ttCWz1rxCXOwzzQJ4uCL2pGRywI8bq8GztVfiPw=; b=OvDV7KY/cB6foiOqdjHaA7utGJ
 tqktf0D8fM6COEA+iVu8rRI8A6W+SttINCwKznvFqz6FjipbVwaw9GfGnCElZ7L6XIgsrhQqB8NDF
 OiCFsj5HvEFCBwyl+cTlC3xcnjTEWOL3jaQGFc/snI7XeD1TRkt0H2BAmLoUwsE+7y6Q=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu10b-0002bp-JR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 03:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 53032A45A3A;
 Mon, 17 Mar 2025 03:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B83BC4CEDD;
 Mon, 17 Mar 2025 03:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742181550;
 bh=L0PJqC1PTugn//RGlYwlepsaqcqfuN2HtfJiHb56oCY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YKsdNyHoTbLlziSdq7r15mjUuCHat9pwbBycRj32chjsn88NnG0g64cO+h5Q272BH
 GZ5TUjN/OX3b+go5RQFqTanGJgK6xufWk+SJtIidHCzs5C6lv7xOXwcMorFuDfKQ0a
 cZr9sAOOXdnzZWi7hyML30zzD8j0/gyHoDKL1/OwaVaFTTk9hCUiiYo0pl6r7haffl
 VnQWIl7KkfLMBrpYl2Ot20oITQXdSSFiYT+yeVLMJpLyY+3iWyioSlIb5Waj4g8ZIA
 i8282XgHJ6qHlZeCMI8v0DeK/yJGaY37U3eW6XF82Eu/Pwx2GqRYqMUYRvRNfDG9u+
 +64Fqb7mR2wVw==
Message-ID: <a6137820-5dde-4b81-a330-ad0ff42bc607@kernel.org>
Date: Mon, 17 Mar 2025 11:19:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yeongjin Gil <youngjin.gil@samsung.com>, jaegeuk@kernel.org,
 daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <CGME20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27@epcas1p2.samsung.com>
 <20250314120651.443184-1-youngjin.gil@samsung.com>
Content-Language: en-US
In-Reply-To: <20250314120651.443184-1-youngjin.gil@samsung.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/14/25 20:06, Yeongjin Gil wrote: > In the case of the
 following call stack for an atomic file, > FI_DIRTY_INODE is set,
 but FI_ATOMIC_DIRTIED
 is not subsequently set. > > f2fs_file_write_iter > f [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tu10b-0002bp-JR
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid atomicity corruption of
 atomic file
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
Cc: sj1557.seo@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/14/25 20:06, Yeongjin Gil wrote:
> In the case of the following call stack for an atomic file,
> FI_DIRTY_INODE is set, but FI_ATOMIC_DIRTIED is not subsequently set.
> 
> f2fs_file_write_iter
>   f2fs_map_blocks
>     f2fs_reserve_new_blocks
>       inc_valid_block_count
>         __mark_inode_dirty(dquot)
>           f2fs_dirty_inode
> 
> If FI_ATOMIC_DIRTIED is not set, atomic file can encounter corruption
> due to a mismatch between old file size and new data.
> 
> To resolve this issue, I changed to set FI_ATOMIC_DIRTIED when
> FI_DIRTY_INODE is set. This ensures that FI_DIRTY_INODE, which was
> previously cleared by the Writeback thread during the commit atomic, is
> set and i_size is updated.

I guess we need to add a regression testcase to cover this issue.

> 
> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
