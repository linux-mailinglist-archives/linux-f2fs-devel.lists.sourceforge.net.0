Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C57344863ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 12:48:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5RGF-0001yi-OB; Thu, 06 Jan 2022 11:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1n5RGE-0001yR-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 11:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=; b=YkMZD9HcSym5lTSwF5DUR5Dy9c
 WYsabga7RAN0puou5hSXVslqNp2naLzF35x6tzyeZkMegtrnaf4W34gdzF1z5zxLX3cobne6PObk2
 kOAsWINfYuTN/dOnmMMMptTKO49twskeEDh4dteLEvq/HjnW8XB8ZNYl7gSnz8V4gwak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=; b=iPTWa44w9q+wrNeedl7OlyD7l7
 Vcj+ruospr3xaJvJWZr5arvgUdonWefbCFs3JZMuafnIaDz1BZZHawYXUzj9pdCcO8x0S0bppxvxe
 sgfYLWIal0kdH3EKoyPxwR+NHu2vyse0M01LDPQjKHIx8x/eKI75GOEdHlCNlyh95rv0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5RG7-003wX6-V9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 11:48:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7D4DB81E2C;
 Thu,  6 Jan 2022 11:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E054BC36AE5;
 Thu,  6 Jan 2022 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641469716;
 bh=d2gd8KhQPNFfvNfTZv43oZIP/J3daKrSGoAZ8lTnei4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=irIE32E/Dq+wDwTZA7fm1ZvBdCQX/KM0VlvNbvDO8FY79H1stkaPIEYydJOqhmEJ2
 4gtSjZQSAlIQSbZXFXy0MhUFiJM7N1TOyZkuqjdX3RZwuapxQ+gnSxFd0XbFXTc1s2
 gkDNBCWvvOuF7arXwZPnq/Wam4ZBNZuVINHf0k41CbAGe319GhqTcMPKHYWtqbx/06
 QV46BENfWbKMcWrWcWxKITIRPoLmz78ya5k/mW8Gpi1qSVLihQoXg/SaZj+PNDQMCO
 BdG1XKvc7YAEWV9cOVeHx3bb+Mhc1jVCRObyFC5JcA3Z2aH78C6cGO/1nMqqMP6HtJ
 xf+fZoAuVsVbg==
Message-ID: <a6ee8d0b-1d67-0bcb-ba8c-06b0d691bb17@kernel.org>
Date: Thu, 6 Jan 2022 19:48:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Antoine Viallon <antoine@lesviallon.fr>,
 Antoine Viallon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
References: <20211230002942.298407-1-antoine@lesviallon.fr>
 <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/30 8:59,
 Antoine Viallon via Linux-f2fs-devel wrote:
 > Some variable naming mistaskes were made in the last patch, > here is an
 updated version. > > --- > fsck/fsck.c | 9 +++++++++ > fsck/f [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n5RG7-003wX6-V9
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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

On 2021/12/30 8:59, Antoine Viallon via Linux-f2fs-devel wrote:
> Some variable naming mistaskes were made in the last patch,
> here is an updated version.
> 
> ---
>   fsck/fsck.c | 9 +++++++++
>   fsck/fsck.h | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index ecd87af..921db0f 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -546,6 +546,15 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>          node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
>          ASSERT(node_blk != NULL);
>   
> +       /* Progress report */
> +       sbi->fsck->chk.checked_node_cnt++;
> +
> +       if (sbi->fsck->chk.checked_node_cnt % 1000 == 0)
> +               printf("[FSCK] Check node %u / %u (%.2f%%)\n",
> +                          sbi->fsck->chk.checked_node_cnt,
> +                          sbi->total_valid_node_count,
> +                          100 * (float)(sbi->fsck->chk.checked_node_cnt) / sbi->total_valid_node_count);

How about showing this message in debug mode? may be under level one?

Thanks,

> +
>          if (sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni))
>                  goto err;
>   
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 11846e1..535d6d5 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -93,6 +93,7 @@ struct f2fs_fsck {
>          struct chk_result {
>                  u64 valid_blk_cnt;
>                  u32 valid_nat_entry_cnt;
> +               u32 checked_node_cnt;
>                  u32 valid_node_cnt;
>                  u32 valid_inode_cnt;
>                  u32 multi_hard_link_files;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
