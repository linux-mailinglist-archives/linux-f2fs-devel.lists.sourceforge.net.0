Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF56C6C18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 16:18:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfMhR-000861-4V;
	Thu, 23 Mar 2023 15:17:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pfMhM-00085t-NW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 15:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GEuGO17c6ZOxfDOyHEIDFrFVggeAHgAndlfWuYGrDoA=; b=A7BsYtMgfZGFeLuERQQOH0uTOO
 GY8tpwq4e5dVSYYpWSMmorAD5+pl79sgaQldX30Izeq6/IQi/jbQYnsAWupNRnaFe2+8DUWhA8jq/
 AQa1zpC/kSouOa1ySwWicOe20r1e7DauwShbvTRvIkKbOtDUU+j13ADg0vz4ct5kVm44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GEuGO17c6ZOxfDOyHEIDFrFVggeAHgAndlfWuYGrDoA=; b=cTP0E9cv55Ybq95ehTNnRzolYQ
 KVVhj6xGM1TNBXboyzsmPHo1uo9xbx59a5fDtLrAphWuMgYZogcdU689plq76BtU2z4gWBKKjN9Jn
 yfQY15VHZ80MC9XMMpUxhEizGlVJow8zwxY2Umq6qzjuRww9KFQEsWGRIydE8FcXv/Rg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfMhI-0007I8-Jn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 15:17:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C3A16278F;
 Thu, 23 Mar 2023 15:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A867FC433D2;
 Thu, 23 Mar 2023 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679584662;
 bh=QtIAtDLDIoKln0bsHHFK0vxtR/850kTuSdnFC8ym8bA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=a22tikQRQmcohKDLd6X39kaUMGIbozfwYExk+fQBxjKH/XmL7TPPhlmbbDl1PWygK
 PmF4dPhmvOyX0frC1rs9w11NZ86PWNFkdR9HzxGARg79XxM+0N8CW+oqfffLCM7uz5
 Na2/CNoHUIrUPPkTbB2VFPUSoj7sSJXbINaKuPVNh+/u1Jk0zYOSlBVDVwOgif+a4h
 qmeWDX1bdF/P3TCIi9CDKa/M8d0pUmdkeiV8mbgP/mear1kbLz39SZgXUv9uqEGty4
 3L2fEXLfcYqy0xpXf1Yms0jtWqJMm3somhV5MaY9swUZXvpndUVzYoE36T050fMguB
 xzbfKpvVYVXrQ==
Message-ID: <a24d66ad-4048-fd5c-ae47-2dd17c87bcbe@kernel.org>
Date: Thu, 23 Mar 2023 23:17:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: yonggil.song@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
 <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230313094825epcms2p71e6cb549251dc55e8d202dd64b9913a6@epcms2p7>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/13 17:48, Yonggil Song wrote: > When using f2fs
 on a zoned block device with 2MiB zone size, IO errors > occurs because f2fs
 tries to write data to a zone that has not been reset. > > The ca [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfMhI-0007I8-Jn
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Fix discard bug on zoned block
 devices with 2MiB zone size
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

On 2023/3/13 17:48, Yonggil Song wrote:
> When using f2fs on a zoned block device with 2MiB zone size, IO errors
> occurs because f2fs tries to write data to a zone that has not been reset.
> 
> The cause is that f2fs tries to discard multiple zones at once. This is
> caused by a condition in f2fs_clear_prefree_segments that does not check
> for zoned block devices when setting the discard range. This leads to
> invalid reset commands and write pointer mismatches.
> 
> This patch fixes the zoned block device with 2MiB zone size to reset one
> zone at a time.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>   fs/f2fs/segment.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index acf3d3fa4363..2b6cb6df623b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1953,7 +1953,8 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   					(end - 1) <= cpc->trim_end)
>   				continue;
>   
> -		if (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi)) {
> +		if (!f2fs_sb_has_blkzoned(sbi) &&

Could you please add one line comment here for this change?

Otherwise it looks good to me.

Thanks,

> +		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
>   			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
>   				(end - start) << sbi->log_blocks_per_seg);
>   			continue;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
