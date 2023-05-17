Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91167705D65
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 04:44:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz79p-0001pq-FS;
	Wed, 17 May 2023 02:44:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz79o-0001pk-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/OsnaMXHBh0eBqDrP7f+L7YTCMeqtymn6XfunynblmE=; b=KnVWM0yDspplN9OK8dAp/MyMQ9
 9La4I0o4hXvoFo7+lJrPX1emAuLVP44ZOj2847AwQQXwuxSeXckn1GNxBn2lhBOJ6v75BDWFAbyh+
 OlDdFoWRcuqj6anjt93o8fyb2xnZmBABe3nsAJYV+95Bd1vlWreGtK2dH5GoWjHU/XN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/OsnaMXHBh0eBqDrP7f+L7YTCMeqtymn6XfunynblmE=; b=ZXwnpFEaNRUwssp2vj7SF3/NqD
 FzTwD8aWrDjp6QzQd2F95ME1yVqi6FdfNE7efm6golog+Z+p5ggQXho/qSC4TEPfxxooOzu+p3ZOc
 0iRtVy2rLKJc8o1/2OA2Z7mIGQ49OdsTjo+ZzSHtiPWMG1DnY9n1gp1K+4imF5am3g2c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz79o-0002LA-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:44:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09AB760FFC;
 Wed, 17 May 2023 02:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44ADC433EF;
 Wed, 17 May 2023 02:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684291486;
 bh=qNDtCoajT3pDCRQM68Y/i7MapdhfLICp5GbRlmJgsYo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cKrDFv3Fqj0jRSbVb5JVYzZZ6aQ2YaEDTDuh33Mx3eSy6p93EUDjLrIEryyNUJ4jq
 YpBZPK71rmQNCGaH5Y8aFgRhseEv4fypMy2NHLT0EWd2V61V5tOkNEqPEBMtbiMmur
 mVLGVziAfjLXNvcZ51S3R2KEV+rkYzvcipIojRDruDckZeDHl2OwJ0erUrT46GS/eC
 NsQbO2uAvy9NuSeI67uvwx61Ll8IRSEz+F5ATL9NlJZTuUYoYcVIOfLhSjX6NTn0Tx
 5q9El8T4cyTf0Ig8fSsDJq7eJHEdGVw9fboKGsguIBcH7g8+1FqtQXOpm1vfIQe+l3
 cDLHLLKomed3g==
Message-ID: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
Date: Wed, 17 May 2023 10:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230516120747.68844-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230516120747.68844-1-bo.wu@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/16 20:07, Wu Bo wrote: > Modify the order between
 'trace_f2fs_iget' & 'unlock_new_inode', so the > I_NEW can pass to the trace
 event when the inode initialised. Why is it needed? And trace_f2fs_iget()
 won't print inode->i_state? 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz79o-0002LA-D2
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/16 20:07, Wu Bo wrote:
> Modify the order between 'trace_f2fs_iget' & 'unlock_new_inode', so the
> I_NEW can pass to the trace event when the inode initialised.

Why is it needed? And trace_f2fs_iget() won't print inode->i_state?

Thanks,

> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fs/f2fs/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index cf4327ad106c..caf959289fe7 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -577,8 +577,8 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>   		file_dont_truncate(inode);
>   	}
>   
> -	unlock_new_inode(inode);
>   	trace_f2fs_iget(inode);
> +	unlock_new_inode(inode);
>   	return inode;
>   
>   bad_inode:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
