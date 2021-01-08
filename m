Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 407912EEF30
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Jan 2021 10:11:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxnnZ-0005z3-VC; Fri, 08 Jan 2021 09:11:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1kxnnW-0005ye-8r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aJE8/iI49JdNE9LdjKb2dA/GXgfep4SGnV6+vbIfjg8=; b=QQzsfHKUNho48czCBxp+3VIl+l
 juOgb1uoG2oM6noJ/6rJVg7pseQN6I5pFrPfNwbjCMrw5fX9Xg3+Hjv/f/p2CKBA6/5olILQE1vho
 sqpNu4gEqBtDxew4rZegwBoYdQpFBkJiAcyfp/RKYNqJKsa8LOHXVdz6WDj20rdlNGSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aJE8/iI49JdNE9LdjKb2dA/GXgfep4SGnV6+vbIfjg8=; b=MTrvKMF+45l3j06cvjeO/cyDab
 8wMKB/WLCVf2LbYDcqtm6o3n/NTjkjYnk3GE/WnVj/on08CVmUY1tVYldvDU6JXzYVTRFpadbJyLo
 Cvr2HMYvkpEbaU7RjYpwkg1FJ8AtzQ/s4gu1IMwBrEjDf5R9Hr5sVFk6XX1cxSnVheOg=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxnnO-009Y5q-MU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:11:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 74A2768C65; Fri,  8 Jan 2021 10:10:48 +0100 (CET)
Date: Fri, 8 Jan 2021 10:10:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210108091048.GA2587@lst.de>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105005452.92521-11-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kxnnO-009Y5q-MU
Subject: Re: [f2fs-dev] [PATCH 10/13] fs: clean up __mark_inode_dirty() a bit
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

On Mon, Jan 04, 2021 at 04:54:49PM -0800, Eric Biggers wrote:
> +	} else {
> +		/*
> +		 * Else it's either I_DIRTY_PAGES, I_DIRTY_TIME, or nothing.
> +		 * (We don't support setting both I_DIRTY_PAGES and I_DIRTY_TIME
> +		 * in one call to __mark_inode_dirty().)
> +		 */
> +		dirtytime = flags & I_DIRTY_TIME;
> +		WARN_ON_ONCE(dirtytime && (flags != I_DIRTY_TIME));

No need for the inner braces here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
