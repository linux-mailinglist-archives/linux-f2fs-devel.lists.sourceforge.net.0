Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BC70EADE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 03:36:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1dQl-0004sZ-Si;
	Wed, 24 May 2023 01:36:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q1dQc-0004sO-2k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n5Oa9MiauHu7AScrPKWzHE9Q5wIC8ZpuckL10uXHkOk=; b=P9J1vUW+qtTnrXdPoYWk0pqFUE
 C0iXDPLR5ppLviRW9btusCKNEoR9y6cdBd/uCkJIm2dPuvX4E7FBC2Q4Jos4TvmjcqUmcTqM0M3g0
 UibgBudDiFzVZkWlk6rUtGwOwiLB9WDlS9YBOIDZSqyobIavTvLNrk5z1ZWzplYVmCwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n5Oa9MiauHu7AScrPKWzHE9Q5wIC8ZpuckL10uXHkOk=; b=LgtlkRwIrAfZQ0/tYAisNAHT3q
 6dO2RzJe2/F9h2id4OIPcdFhnUiU/roR8yRmcg2WTr9TK58719u21NtsOj3/SNt5N6eqgB1H2egK+
 kgnullehaIkWpxhbHS60BhLRwrToznXwc4x4FwbrVpzjdpMmupMJJeVAO8o6fJaFgmG4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1dQX-0005nd-En for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 01:36:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17971637C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 May 2023 01:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0FCC433D2;
 Wed, 24 May 2023 01:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684892187;
 bh=I2ozqFvCTggoEgIg06Ztdcvnq1LV8wq5Ff07A01+XXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgKFPbZOWSAEz+494/nPXUSZu8CWsD1wHOF+o2vQqQae6t+T6eSxLqJ9iF9KtWIXu
 DY1fHY0JMKQp9Jh8SQysGCpacoQZucwVjJ6RwSNDz/yUf4iyJzO6/5RoZ3iW4DjD1B
 XpsLKZu9LKoUqI4FoQvEn+Avs/JeA5hLfSrA1O2Ui/v+Gi4JH9b6BeCFJlHARxX8ru
 /iBV2FdlrdPp71PZQ79e2gimzwctJ9+q+BfCKsR07739oYLe7HkMgrFKeuwV+ZEFow
 VTqjmpwipNocDjLRqbCcnfrfUNqTlsoDXRp3Qjvubfv8SU8bO0ENoyBh9MeOwbOt49
 x2tnlnV/R7n3w==
Date: Tue, 23 May 2023 18:36:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZG1qGd6smyKAmpdd@google.com>
References: <20230518092931.2280835-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518092931.2280835-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/18, Chao Yu wrote: > __le32 type variable should be
 converted w/ le32_to_cpu() before access. > > Signed-off-by: Chao Yu
 <chao@kernel.org>
 > --- > fs/f2fs/f2fs.h | 6 +++++- > 1 file changed, 5 i [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1dQX-0005nd-En
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use le32_to_cpu() in
 RAW_IS_INODE()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/18, Chao Yu wrote:
> __le32 type variable should be converted w/ le32_to_cpu() before access.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7f6c51a6b930..a4bff3b5b887 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2840,7 +2840,11 @@ static inline void f2fs_radix_tree_insert(struct radix_tree_root *root,
>  		cond_resched();
>  }
>  
> -#define RAW_IS_INODE(p)	((p)->footer.nid == (p)->footer.ino)

Does this compare the same __le32 types?

> +static inline bool RAW_IS_INODE(struct f2fs_node *node)
> +{
> +	return le32_to_cpu(node->footer.ino) ==
> +			le32_to_cpu(node->footer.nid);
> +}
>  
>  static inline bool IS_INODE(struct page *page)
>  {
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
