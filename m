Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD29905D76
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 23:11:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHVF8-0000HC-G9;
	Wed, 12 Jun 2024 21:10:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1sHVF6-0000Gz-Ex
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 21:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tk+0evWAJUKV29rlC2BjFdRCanYtMLPO40GvQMFdqPo=; b=enXFfHi8iOzGKg2qECEuRHOr6W
 3vXmpe6U4a02f5GIbKbFQLfObuRNh8WAHGkdWHG/zoyKpOY2pWtMLp3UJpkv+oN+Z0N28LRw/hqGr
 cwfHLCAUPoRYmIzalHMxv+1ERFcTk0A/wDb1kE358g6Q1Q8PqTrfX2Ka81S7SavUA0m4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tk+0evWAJUKV29rlC2BjFdRCanYtMLPO40GvQMFdqPo=; b=CXio9Jn09QQEtDssMJkRF8c8qM
 xETsfZcpiHRnHnMvsaF6HtQCLjul9P1del5l/OC9VF7wz352JTgY9WdrqmGFxeQXEIqmF5uHmz5gu
 mCA9HzMjX6WxB+ipgDeamWquD7gM3KONpjfmVsJB1kqdrTyghwnb+vWxZ8vUYZw+KvLc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHVF6-00016M-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 21:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF75461763;
 Wed, 12 Jun 2024 21:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2F4C116B1;
 Wed, 12 Jun 2024 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718226641;
 bh=dqLO371b1vPErmMYi4CgWyvSUCQn8of4qGwTdEMzEhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DIXhgPtR71kSyV6/epJDyqhWKsEQEX5yhhZda5PPHpZ+0ARYCCiAtnRSNR1FnlC7P
 nPXkJq/SepET7ym8thpR7yujnnQ7ZHn3iRsMoIfGobXMy1OJxAIzKKtD9ftmAGl8KN
 kUltI84OFlF1WwDhedAy43xrdUjP8vTB+P26BCEb3a2HConB/TZUMHytqEARmpH8ln
 QCY5BssR28eFz1T409YzepxwR+K2C6Zp7Uo+S9MDDNObxIJC8bTjFUTi06cTVT7OeC
 lTnaI5hdCh11uuYSK3xj94QxhxrNjmNwqI7uE46+z3EGyJoGClyLogjejeb9r2ihDk
 QMYN4T27nFHOw==
Date: Wed, 12 Jun 2024 14:10:40 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: John Garry <john.g.garry@oracle.com>
Message-ID: <20240612211040.GJ2764752@frogsfrogsfrogs>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
 <20240607143919.2622319-2-john.g.garry@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607143919.2622319-2-john.g.garry@oracle.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 07, 2024 at 02:38:58PM +0000, John Garry wrote:
 > Add a generic helper for FSes to validate that an atomic write is >
 appropriately
 sized (along with the other checks). > > Signed-off-by: [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHVF6-00016M-Ri
Subject: Re: [f2fs-dev] [PATCH v4 01/22] fs: Add
 generic_atomic_write_valid_size()
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
Cc: ritesh.list@gmail.com, gfs2@lists.linux.dev,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, agruenba@redhat.com,
 miklos@szeredi.hu, linux-ext4@vger.kernel.org, catherine.hoang@oracle.com,
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 axboe@kernel.dk, brauner@kernel.org, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, chandan.babu@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 07, 2024 at 02:38:58PM +0000, John Garry wrote:
> Add a generic helper for FSes to validate that an atomic write is
> appropriately sized (along with the other checks).
> 
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> ---
>  include/linux/fs.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 069cbab62700..e13d34f8c24e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3645,4 +3645,16 @@ bool generic_atomic_write_valid(loff_t pos, struct iov_iter *iter)
>  	return true;
>  }
>  
> +static inline
> +bool generic_atomic_write_valid_size(loff_t pos, struct iov_iter *iter,
> +				unsigned int unit_min, unsigned int unit_max)
> +{
> +	size_t len = iov_iter_count(iter);
> +
> +	if (len < unit_min || len > unit_max)
> +		return false;
> +
> +	return generic_atomic_write_valid(pos, iter);
> +}

Now that I look back at "fs: Initial atomic write support" I wonder why
not pass the iocb and the iov_iter instead of pos and the iov_iter?
And can these be collapsed into a single generic_atomic_write_checks()
function?

--D

> +
>  #endif /* _LINUX_FS_H */
> -- 
> 2.31.1
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
