Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B27156491E0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:27:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4C41-00030Z-Qj;
	Sun, 11 Dec 2022 02:27:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4C40-00030S-Ca
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vzCTNF+5PjbonOCzTA3F2MzmMXc5aE+GWoS3H1N1s+Q=; b=UKXZ99N/bQKaeWm9D8RfhMjP6Q
 T1WKG/NYcMUvGT3h0kNUCwClSERD4gzrMmKCZfagB6D+9Wi7l/MBHmkXp3oQ9+nxJIcDZnVQU4FuI
 Sn7ZQOJZI+DBL7G8DLt2FnE1OdEw6Yq26+fLKf5D0V6PBGF357j/7xRlKk7God8LXFGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vzCTNF+5PjbonOCzTA3F2MzmMXc5aE+GWoS3H1N1s+Q=; b=jX08591Imf1MmpMdUt0cSI6o9a
 KfTIoO3D0iNKpHReB8vTuzyqZTq3vzCdUVs78Sq0sgjKGrVUbrCEUYoOdX7mF+Nc6JL7fJpoO5Id1
 6pcfOMUE0esECChHXyYhkc1RWPK8ILKttVP9HUrcbXzg5EzrdDrVXCj7PUz/ib9gOwR4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4C3t-0005u5-CM for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:27:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12E31B8095D;
 Sun, 11 Dec 2022 02:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9B4C433EF;
 Sun, 11 Dec 2022 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670725641;
 bh=Kz4hLtbGrjd7gtG9dlPx4Fp0vpjG79m3yjTtXj56pBw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gr8MD30huWtiIQpUoOpTNyOlPWzTeYL9uu7K8Exaavzkq84e/0ZVuTnbP5KcUdqPZ
 yXnRLpv3Z0kYruFOrC5gk6Ig29x9s9kvyyo6QsbqKoAGkqQOlCugCHgTJltFTggXyZ
 PDvuBzBQ/ZTUgxYG5FwVMzojwxnT58YJl3rebEikFROFRKgpwoLoUYrJrAAni8qurb
 F3FgVGkYr9TSqaCzYbTpMUqsETGAdqoZ6YgsVQEakaVVw0yiAyF7FFTcaxsOWMQs6n
 Z5wXSVfjQ2p2gYHSMuLjf3Xq9VkCLXtkSW3pkWKPTGBgGn//n7It+Cie9lBuw4iIzV
 eRTOGQarRIGCQ==
Message-ID: <3f2c81f8-7946-d2e0-8768-6f0b03282944@kernel.org>
Date: Sun, 11 Dec 2022 10:27:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221202045841.9888-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221202045841.9888-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/2 12:58,
 Yangtao Li wrote: > No need to call f2fs_issue_discard_timeout()
 in f2fs_put_super, > when no discard command requires issue. Since the caller
 of > f2fs_issue_discard_timeout() usu [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4C3t-0005u5-CM
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't call
 f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/2 12:58, Yangtao Li wrote:
> No need to call f2fs_issue_discard_timeout() in f2fs_put_super,
> when no discard command requires issue. Since the caller of
> f2fs_issue_discard_timeout() usually judges the number of discard
> commands before using it. Let's move this logic to
> f2fs_issue_discard_timeout().
> 
> By the way, use f2fs_realtime_discard_enable to simplify the code.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 6 ++++--
>   fs/f2fs/super.c   | 8 ++------
>   2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9486ca49ecb1..d5f150a08285 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1655,6 +1655,9 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
>   	struct discard_policy dpolicy;
>   	bool dropped;
>   
> +	if (!atomic_read(&dcc->discard_cmd_cnt))
> +		return false;
> +
>   	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
>   					dcc->discard_granularity);
>   	__issue_discard_cmd(sbi, &dpolicy);
> @@ -2110,8 +2113,7 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
>   	 * Recovery can cache discard commands, so in error path of
>   	 * fill_super(), it needs to give a chance to handle them.
>   	 */
> -	if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
> -		f2fs_issue_discard_timeout(sbi);
> +	f2fs_issue_discard_timeout(sbi);
>   
>   	kfree(dcc);
>   	SM_I(sbi)->dcc_info = NULL;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 79bf1faf4161..aa1cadfd34a5 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1576,8 +1576,7 @@ static void f2fs_put_super(struct super_block *sb)
>   	/* be sure to wait for any on-going discard commands */
>   	dropped = f2fs_issue_discard_timeout(sbi);
>   
> -	if ((f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi)) &&
> -					!sbi->discard_blks && !dropped) {
> +	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && !dropped) {

static inline bool f2fs_realtime_discard_enable(struct f2fs_sb_info *sbi)
{
	return (test_opt(sbi, DISCARD) && f2fs_hw_support_discard(sbi)) ||
					f2fs_hw_should_discard(sbi);
}

It looks the logic is changed?

Thanks,


>   		struct cp_control cpc = {
>   			.reason = CP_UMOUNT | CP_TRIMMED,
>   		};
> @@ -2225,7 +2224,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	bool no_discard = !test_opt(sbi, DISCARD);
>   	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
>   	bool block_unit_discard = f2fs_block_unit_discard(sbi);
> -	struct discard_cmd_control *dcc;
>   #ifdef CONFIG_QUOTA
>   	int i, j;
>   #endif
> @@ -2406,10 +2404,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   				goto restore_flush;
>   			need_stop_discard = true;
>   		} else {
> -			dcc = SM_I(sbi)->dcc_info;
>   			f2fs_stop_discard_thread(sbi);
> -			if (atomic_read(&dcc->discard_cmd_cnt))
> -				f2fs_issue_discard_timeout(sbi);
> +			f2fs_issue_discard_timeout(sbi);
>   			need_restart_discard = true;
>   		}
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
