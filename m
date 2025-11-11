Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CCC4B39F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 03:35:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek5fwDCjpq3ZmTa2l9dzseouwBnziG0CqU8teip5JRk=; b=ZLi+G/ThVU+jG9L/sgfpjRTL+g
	j0Qves57e7r6/c1lV0FXPnJVgfJmWj5Ov83nZ5qQxkMhhB7QhWwhDReZizlsa+4xPvUgbAFqmZVUb
	shaVNgZk4pnOwb5F/xxQ1SsEKg5qi3NGHkKEW42GSvP8f+BI/yhwXJ2WXB8a/zqp+sL4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIeDt-0002x0-Tc;
	Tue, 11 Nov 2025 02:35:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIeDs-0002wl-NB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 02:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3gqmpFY6mlyuE/RQRB/SrOxibeW/cYtq+90DZH7MIg=; b=KiaW/kcja/hhpgV/uopmLsfoI7
 cs9whB2rzCJNipqCpmaamkeYK76dR05w6oxSzlI5Lr+FmbGVlC4Po9x3RFkOEIRfS5uV6YJp9AvHh
 AOSQwtji9pu49Y095Q3zKF4uQI4+DRpEidOX21Lml39Zyp+7BIQ4HB2602NfkZuNjKLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3gqmpFY6mlyuE/RQRB/SrOxibeW/cYtq+90DZH7MIg=; b=RCzytSqhqpbKzLVqdTVvVc6D71
 sBPPGTHHzT/WfLCKez/FbulZ+sf/mj7YEWNRLFzhIR9S4ZJTLnxfYpeOJPmB6g2ZRsCz5t0phneWa
 jh9j439wwte7ZemvQ+ueUHF7LO3orL9aT2WAmpjzRfSN1FMG/EVXjysyCMItnSrY3prs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIeDt-00075u-2y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 02:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C714437CC;
 Tue, 11 Nov 2025 02:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34876C4CEF5;
 Tue, 11 Nov 2025 02:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762828498;
 bh=BiMHxid1jaG9NDvHJhJEExI1o6/kusuFOPTB96uo4CQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aZKj9v3zYl/YseT3MnYn+Q0VLJip7AWLZGMCfvo6FUzlcvAmXF47No3x4inLDijNm
 cv5T+jdIc7J/6ndWBoCBv7NCR8LVf8SxeZ2em/O4pJX2zLc2bLUUwCathMcrNIvKA9
 X8VHHzS0trO10IkPul0yG8qwNslq8J0zHL5zBzMkQWFB0M5il9RJohtTHwJlWjwc5v
 vqkEpX5Kgh5V4oq4vR98z/qhpDFJxmPOqsu/e2K+1n1rMrrFGO3rXujF05+u4qgTQQ
 mJ4F5hFyb63rnP5nb7GfkSA/aXjkc1btn6nXYEZrKLvaN5e4WiMbauIvQNKX24jQEt
 EY6DKuPJF1ltQ==
Message-ID: <0cc190c7-a069-48da-9847-7ee597616f09@kernel.org>
Date: Tue, 11 Nov 2025 10:34:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20251110153519.2852720-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251110153519.2852720-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Daeho, As Zhiguo's reminder,
 I missed that f2fs_update_meta_page()
 has the same issue as well,
 so we need to use f2fs_grab_meta_folio() in f2fs_update_meta_page()
 as well. Thanks Zhiguo for code review and reminder. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIeDt-00075u-2y
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: revert summary entry count from
 2048 to 512 in 16kb block support
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daeho,

As Zhiguo's reminder, I missed that f2fs_update_meta_page() has the same issue as well,
so we need to use f2fs_grab_meta_folio() in f2fs_update_meta_page() as well.

Thanks Zhiguo for code review and reminder.

Let me know if I missed something.

On 11/10/25 23:35, Daeho Jeong wrote:
>  void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
>  					void *src, block_t blk_addr)
>  {

struct folio *folio;

if (SUMS_PER_BLOCK == 1)
	folio = f2fs_grab_meta_folio(sbi, blk_addr);
else
	folio = f2fs_get_meta_folio_retry(sbi, blk_addr);

> -	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
> +	struct folio *folio = f2fs_get_meta_folio_retry(sbi, blk_addr);
> +
> +	if (IS_ERR(folio))
> +		return;
>  
>  	memcpy(folio_address(folio), src, PAGE_SIZE);
>  	folio_mark_dirty(folio);
> @@ -2720,9 +2723,21 @@ void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
>  }
>  
>  static void write_sum_page(struct f2fs_sb_info *sbi,
> -			struct f2fs_summary_block *sum_blk, block_t blk_addr)
> +		struct f2fs_summary_block *sum_blk, unsigned int segno)
>  {
> -	f2fs_update_meta_page(sbi, (void *)sum_blk, blk_addr);
> +	struct folio *folio;
> +
> +	if (SUMS_PER_BLOCK == 1)
> +		return f2fs_update_meta_page(sbi, (void *)sum_blk,
> +				GET_SUM_BLOCK(sbi, segno));
> +
> +	folio = f2fs_get_sum_folio(sbi, segno);
> +	if (IS_ERR(folio))
> +		return;
> +
> +	memcpy(SUM_BLK_PAGE_ADDR(folio, segno), sum_blk, sizeof(*sum_blk));
> +	folio_mark_dirty(folio);
> +	f2fs_folio_put(folio, true);
>  }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
