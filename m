Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1907D1AE6B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 19:52:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpwYKCuw0PXcWCD44MYavzW7wHdCPYIxivxTq6cdlPI=; b=XfxAUzTv2KZYy6I4cjKspCXV4V
	YZOfS5BYsb8iB/ZDU63iQjFbsd/ehtXrG57LZQrwCXgJkjm5C1EKynZ7A3+8MdsxbKQYHWZ2bJn/l
	rNyWkTPP9GZe8MAyJioQHQ4smB5kvNuN+AwQrZbkeCrNNQnGiaG07XWrIKqNKVOaIpac=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfjUs-0000xm-RT;
	Tue, 13 Jan 2026 18:52:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vfjUr-0000xd-2q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 18:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ROnb7o/XxF/fqYwZeIOgvJeBy1sEnTSqitnXwpzSH9o=; b=S22ZSwjzicVMrESUGGD80HeUiI
 JYJ+tkLlebdCHrU8J5/IwjFBjkIlgklkCex2lToxC4Z4zZbkucB9MHqD3xyxPwBFRp0rViEFviMIR
 MAXQ7mdTj5TDAEEG12tIZD6ctPaNzSf9k3LbweeylUx+uR+LGYdkm1K+VlXPe7T3GDUs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ROnb7o/XxF/fqYwZeIOgvJeBy1sEnTSqitnXwpzSH9o=; b=lX3x9K4XxnIiwOycg99tZGDUUF
 iz4eKn89hDFp13byzB7RFznIXzAexb63aMzdvg6tRWTucawkZwTiM45NxGmLLZd8GGwpnu86+yv2m
 3vaGSNO9qWBzO2vxkgRdwuvMQG8gCetuOuOqERYkrvdo1YqHknjjy+4IJjmY0X1KXRek=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfjUq-0004Gq-4O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 18:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ROnb7o/XxF/fqYwZeIOgvJeBy1sEnTSqitnXwpzSH9o=; b=UTCLlh/+4E7B0HUf5h8kfa8RkN
 u1K4dhvv5Tbfb+XNZdVsreMCMPxM2nd/7SV4P3WJZsMr8iDb+8t02bIy1SuQY/3kQYLgwvRRH5uVa
 wiucA7Ts9s7+PeFSKizbSZT07ASFF97aswnseBQt1oXL6xGmEEte+wCsYO5fd1JB7LSjWykY+7Cpn
 DlcLwePp+7CX74A2fBcag31DcaKGMU5XtUM7nglTRLj4jS6Z9yReI68SAnwJbO7kjre6KfUI0m2Gw
 VNCpoKtLZefcLPsnQuB6o+BSx8c0MvjYvHp51wP7VJW8025o37FZ4ELLrVcBMXbQ5DxoB6LQhhH2w
 H/Ypi71A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vfjC9-000000055R8-1B0x;
 Tue, 13 Jan 2026 18:32:45 +0000
Date: Tue, 13 Jan 2026 18:32:45 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aWaPzQ8JXNBdzb4U@casper.infradead.org>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260111100941.119765-2-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 11, 2026 at 06:09:40PM +0800, Nanzhe Zhao wrote:
 > @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode
 *inode, > } > trace_f2fs_read_folio(folio, DATA); > if (rac) { [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vfjUq-0004Gq-4O
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jan 11, 2026 at 06:09:40PM +0800, Nanzhe Zhao wrote:
> @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	}
>  	trace_f2fs_read_folio(folio, DATA);
>  	if (rac) {
> +		if (!folio_in_bio) {
> +			if (!ret)
> +				folio_mark_uptodate(folio);
> +			folio_unlock(folio);

		folio_end_read(folio, ret == 0);

surely?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
