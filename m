Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 771792F1905
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 16:00:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyygG-0007qF-2F; Mon, 11 Jan 2021 15:00:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyygF-0007q1-7V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iey68WWVjyploGx2KyESkUwhn2c202bhiDX092f/qEk=; b=EAB+slbLBRJlJvNyoAm8fAna3e
 SEou61EpDpigKEa1woI0qBqMs98cqoO0yRHM0T/YDzMntq/5vRHVgJ9b8XkBT7qZCw99/Yvt5yM0N
 TYltu7vlMDnVdMh3WMvfSwu4BkYnPbyBf5wdrEP2ZjjE+Jb1n7mAB10KK4yHoBAQsCUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iey68WWVjyploGx2KyESkUwhn2c202bhiDX092f/qEk=; b=FDFJkC25/cOitU3//7+cu2rVLq
 U2t4vrPod3rfIkt+GCXr8owHKw9rQuZ4v17dRAXlpQeDazAYab9ZKOa5HNENtOe6t+WBgz2QDrve2
 /8ZWqxM/dE6X7Ff7shMML/2hoxAc39GuYRJNus3p4/bI5geyyL16qJGvF7jKrQiSInhc=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyg7-009bMe-0U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:00:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E4B4AFA7;
 Mon, 11 Jan 2021 15:00:05 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1B8AF1E0807; Mon, 11 Jan 2021 16:00:05 +0100 (CET)
Date: Mon, 11 Jan 2021 16:00:05 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111150005.GG18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-9-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyg7-009bMe-0U
Subject: Re: [f2fs-dev] [PATCH v2 08/12] fs: drop redundant check from
 __writeback_single_inode()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 08-01-21 23:58:59, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> wbc->for_sync implies wbc->sync_mode == WB_SYNC_ALL, so there's no need
> to check for both.  Just check for WB_SYNC_ALL.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fs-writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 80ee9816d9df5..cee1df6e3bd43 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1479,7 +1479,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
>  	 */
>  	if ((inode->i_state & I_DIRTY_TIME) &&
> -	    (wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
> +	    (wbc->sync_mode == WB_SYNC_ALL ||
>  	     time_after(jiffies, inode->dirtied_time_when +
>  			dirtytime_expire_interval * HZ))) {
>  		trace_writeback_lazytime(inode);
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
