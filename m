Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLtXItNtr2m6YQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:03:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D427F243427
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:03:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRjMPSpASvb2Ts+YBLAB8vS5TwT8fSTEsw1WxZVee9Y=; b=N7x3ZUcWhRZlBTTt3rTOwP+V3O
	Kvptg7b9VLfr8qFfJMood2W5J0v1dWfnMprLSaeZI2NCR1+WUN9qP9qfXPwphb8362wp6CMkHosvQ
	iouchIDrx1uPQXNF95hWTgbS5ADat3fg6zEYFwwOFw/LVXCwyrTtkuKGC0kq0I8y/9+k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlV7-0000Is-Ue;
	Tue, 10 Mar 2026 01:03:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlV7-0000Ik-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OBKnppm+MuPhdo9LP2ejPB2yenBqD0DqsdfHN+DET18=; b=afKQItExK/6nWmEHEgVJYgcR6w
 Pb1E3KEhn8fR1dHxn0FevLd8992pbSDzgSEZUbpPp8u4payau36EtoUaZ66EiOPBK6w+oYCfOv3pu
 dZ648sD1IANEzSvxLCiiPsskthiizdakTSIuOXLPcYG5rM+1NG6sGSkYuk6kF5B5NOxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OBKnppm+MuPhdo9LP2ejPB2yenBqD0DqsdfHN+DET18=; b=NjHDmUsd4kbhvuYct9YLGXKd8T
 W9D/FZtF3qWoWGIYzVE4xaOeNi1k5mdrT6fQcjzAtRhSvuQE/fogYB6XqiBi3sDXcfExpeMinAEid
 fzphR3oPGEcwpNy8O6E1X3Dcd3VR+Qfqq1AEtBDshQpk7pdaq6P9EsKt7pgWbsp2nQtM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlV6-00077n-Ew for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA34860097;
 Tue, 10 Mar 2026 01:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67613C4CEF7;
 Tue, 10 Mar 2026 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773104577;
 bh=RVuB7nL5vj0XzNceaDtFQbkVjrVe5Wkilj7bEZBUmyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UWmzXTk+6L3q58RyT+GHE41CHeJTsbgAe/+dNUeEwFjNs9jN8MjJVYSZdQTThvJMj
 DFpGf/XWW40M2u6nklyGk0UDhDZr3tIcfw8FRISggJCkfPzbEyoxM4buDPBDS6ke+N
 Jejt1Vzzk/k7PL7d7h28QF8ymTmRjSwDQIo2mHMgVGhCsQyh9qiTd7P4/6eKkXEj4N
 R3AmSSjy6qPwN4yhRvVJR1BqAA0kXWTpn5Bfox4k5rMP9/7EmNckrGttO+EhzBHjDo
 QDRNKO0G3CFPJyhj5VaYaatnvvbQtKo8x2R5tcBZmiKYmgbIuw/An8PWE2HE7B7QLJ
 Csx3ELQ4lAbCw==
Date: Mon, 9 Mar 2026 18:02:56 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310010256.GA1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-12-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-12-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:26PM +0100, Andrey Albershteyn
 wrote: > This is just a wrapper around iomap_file_buffered_write() to create
 > necessary iterator over metadata. > > Signed-off-by: Andrey [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlV6-00077n-Ew
Subject: Re: [f2fs-dev] [PATCH v4 11/25] iomap: introduce
 iomap_fsverity_write() for writing fsverity metadata
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: D427F243427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:26PM +0100, Andrey Albershteyn wrote:
> This is just a wrapper around iomap_file_buffered_write() to create
> necessary iterator over metadata.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/iomap/buffered-io.c | 25 +++++++++++++++++++++++++
>  include/linux/iomap.h  |  3 +++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 31e39ab93a2e..88fe4723bb22 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1259,6 +1259,31 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  
> +ssize_t iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
> +		const void *buf, const struct iomap_ops *ops,
> +		const struct iomap_write_ops *write_ops)
> +{
> +	int			ret;

ret should be ssize_t.

> +	struct iov_iter		iiter;
> +	struct kvec		kvec = {
> +		.iov_base	= (void *)buf,
> +		.iov_len	= length,
> +	};
> +	struct kiocb		iocb = {
> +		.ki_filp	= file,
> +		.ki_ioprio	= get_current_ioprio(),
> +		.ki_pos		= pos,
> +	};
> +
> +	iov_iter_kvec(&iiter, WRITE, &kvec, 1, length);
> +
> +	ret = iomap_file_buffered_write(&iocb, &iiter, ops, write_ops, NULL);
> +	if (ret < 0)
> +		return ret;

Nit: If we're not returning the number of bytes written, then the return
type of this function ought to be int, not ssize_t.

Also ... if there's a short write, shouldn't we return some sort of
error instead of zero for success?

	ssize_t written = iomap_file_buffered_write(...);
	if (written < 0)
		return written;
	return ret == length ? 0 : -EIO;

--D

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(iomap_fsverity_write);
> +
>  static void iomap_write_delalloc_ifs_punch(struct inode *inode,
>  		struct folio *folio, loff_t start_byte, loff_t end_byte,
>  		struct iomap *iomap, iomap_punch_t punch)
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index 89e5a7abc012..844fc8414363 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -356,6 +356,9 @@ static inline bool iomap_want_unshare_iter(const struct iomap_iter *iter)
>  ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
>  		const struct iomap_ops *ops,
>  		const struct iomap_write_ops *write_ops, void *private);
> +ssize_t iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
> +		const void *buf, const struct iomap_ops *ops,
> +		const struct iomap_write_ops *write_ops);
>  void iomap_read_folio(const struct iomap_ops *ops,
>  		struct iomap_read_folio_ctx *ctx, void *private);
>  void iomap_readahead(const struct iomap_ops *ops,
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
