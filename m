Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A9A16BC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2025 12:46:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZqEI-0007Vv-VI;
	Mon, 20 Jan 2025 11:46:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tZqEH-0007Vp-HC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 11:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zeRWPw9NCQarh7TuZ01uOR0zxVQk/eU6TQkPNkkl4F0=; b=esGvfH+4m69PQxUXos5JvFmpGN
 yo4Lz4MMcts7A+BX1dGf0e4vTmKbPL2Tg4qDhCT8PrjhPWoBtGQte9ENTXfiJqFC+LDu4YYa9L0ja
 PLJwcbw26m6zZ12qv+YGh1yuKWPfZ5ENuhxfkV+a+9XPzM9cDhE7XHEOeNZYUk1WaNv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zeRWPw9NCQarh7TuZ01uOR0zxVQk/eU6TQkPNkkl4F0=; b=f10HTOlgHlpjrcrYpysf6t9+4D
 FNa9KGwXj2+nEzoJK9NzxKbnWPaMNwyu4bD8sZI2gAqfINekDf9yWIwCS48+tLUyi29MHGbPsrVd+
 H9rQPAGqRZ34icMGWwv1XyfTXnMEM3+XnPkApjBhzFd55GiagMdLgvOnWyj8imYLZuts=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tZqEF-0007u0-EN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Jan 2025 11:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1CE53A40E0C;
 Mon, 20 Jan 2025 11:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89972C4CEDD;
 Mon, 20 Jan 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737373557;
 bh=v5EFNyYmGybl5D6TEXBjTvplmgaf3jTdVmghx0iQKn8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=E0oxIIQIdzn3PfKwmCFtewHpsdJpi2edxPMv0ffGO1INQksQ2q9GSP6YBcGywAT4o
 JxmgdeJFDcOTJZa8ZK5QGsEtMix2G8qC5tu3OZ6apPb2OgoPwzCbMTg7AAaU9Seanr
 UaFLJpMr6hawCj7XoE7kxKZcfLsHHhOIDXVMlWnyGhWUSRs1PP/apmVlWA+zLRe2Aj
 f+ErxkY88mUnBLkOf14hVhTKdSBQ53ABOTb4h05LwenVnUCCg2t7voFqJX+jiDAHEn
 86Us8y8DmXzXco/3OFN3yhbfW7RCHRu00AAOSWvfvLSwq4S4zQdYC+3GvfzmHW80Qx
 wPqWZup+PqqiA==
Message-ID: <77fa4633-f7db-4daa-a9e1-3fdb5bf9dd1d@kernel.org>
Date: Mon, 20 Jan 2025 19:45:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20250119140834.1061145-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250119140834.1061145-1-guochunhai@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/19/25 22:08,
 Chunhai Guo wrote: > fstrim may miss candidates
 that need to be discarded, as shown in the > examples below. > > The root
 cause is that when cpc->reason is set with CP_DISCARD, > add [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tZqEF-0007u0-EN
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard candidates in
 fstrim
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/19/25 22:08, Chunhai Guo wrote:
> fstrim may miss candidates that need to be discarded, as shown in the
> examples below.
> 
> The root cause is that when cpc->reason is set with CP_DISCARD,
> add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have
> been synced by seg_info_to_raw_sit() [1], and it tries to find the
> candidates based on ckpt_valid_map and discard_map. However,
> seg_info_to_raw_sit() does not actually run before
> f2fs_exist_trim_candidates(), resulting in the failure.
> 
> The code logic can be simplified for all cases by finding all the
> discard blocks based only on discard_map. This might result in more
> discard blocks being sent for the segment during the first checkpoint
> after mounting, which were originally expected to be sent only in
> fstrim. Regardless, these discard blocks should eventually be sent, and
> the simplified code makes sense in this context.
> 
> root# cp testfile /f2fs_mountpoint
> 
> root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
> Fiemap: offset = 0 len = 1
>          logical addr.    physical addr.   length           flags
> 0       0000000000000000 0000000406a00000 000000003d800000 00001000
> 
> root# rm /f2fs_mountpoint/testfile
> 
> root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
> /f2fs_mountpoint: 0 B (0 bytes) trimmed
> 
> Relevant code process of the root cause:
> f2fs_trim_fs()
>      f2fs_write_checkpoint()
>          ...
>          if (cpc->reason & CP_DISCARD) {
>                  if (!f2fs_exist_trim_candidates(sbi, cpc)) {
>                      unblock_operations(sbi);
>                      goto out; // No candidates are found here, and it exits.
>                  }
>              ...
>          }
> 
> [1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not
> to issue redundantly") for the relationship between
> seg_info_to_raw_sit() and add_discard_addrs().
> 
> Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v1: https://lore.kernel.org/linux-f2fs-devel/20250102101310.580277-1-guochunhai@vivo.com/
> v1->v2: Find all the discard blocks based only on discard_map in add_discard_addrs().
> ---
>   fs/f2fs/segment.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 13ee73a3c481..25ea892a42dd 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2074,8 +2074,6 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
>   {
>   	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
>   	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
> -	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> -	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
>   	unsigned long *discard_map = (unsigned long *)se->discard_map;
>   	unsigned long *dmap = SIT_I(sbi)->tmp_map;
>   	unsigned int start = 0, end = -1;
> @@ -2100,8 +2098,7 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
>   
>   	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
>   	for (i = 0; i < entries; i++)
> -		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
> -				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
> +		dmap[i] = ~discard_map[i];

discard is critical, we need more sanity check here, maybe:

/* never issue discard to valid data's block address */
f2fs_bug_on(sbi, (cur_map[i] ^ discard_map[i]) & cur_map[i]);

Can you please check this?

Thanks,

>   
>   	while (force || SM_I(sbi)->dcc_info->nr_discards <=
>   				SM_I(sbi)->dcc_info->max_discards) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
