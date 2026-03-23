Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKupGvMIwWmtPwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:33:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2842EF224
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 10:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFRxJDdTlxYgQC1pt0o/f4CU4PLqTIwCjrgtfa8Zwzo=; b=J8W0AAg4lJqcRj6KeutE9Idnvg
	8mi/sArY+vWYNrixYq4Nx2uxIbXMkX6rCm/JvgGMlQOiZ94p9iwwsX6JcUiWIsnq0MKhKa9oUNASd
	vfTj201fC8PKuhS99HtQzgGN5rGVi23f3OCUZ8dMvs6JFsGtCrMgYt3/rmvTy4E6AIlw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4bfA-0005kb-AJ;
	Mon, 23 Mar 2026 09:33:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w4bf8-0005kP-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/Idg58yVGJ7rPFgJI2WsYlcpNKHgP5/otgeXsKnhOc=; b=k7bXSjsrilNsyZ90ouDF5tNBU9
 PiSTczQ1wZ/6cpLCLrD2qJZzzfVcxvi6Cgyd7rrraLM6cJaJwEDhW6aq56Nl35q8mgWPxLz2H9WGs
 HabVkJeWFYIVlslWXkR2fg2MUKl/IOg8A3Wi/M5QEeV/E1P9d7MwTczLikrGbt/IV0y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/Idg58yVGJ7rPFgJI2WsYlcpNKHgP5/otgeXsKnhOc=; b=D28SglvFhZW4iXRjhzCVjVVRqY
 hPocIsBKCDTVKOs4+n66Xrj7a7XNbLuSJqS78gcUsPYPcrZ58NmneH7YBcqaKlE1xBelJUiJKRwk8
 RfZVLrgZw+Tg/4u28Q0mBGYQpDC/1grAtYRuoaF+35N9zC9ZWMlL2tOug9rUop8xA49E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4bf8-0000X7-AP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 09:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 049BE441D7;
 Mon, 23 Mar 2026 09:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DFBC2BC87;
 Mon, 23 Mar 2026 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774258399;
 bh=aEC5dWkA0rIyPgo2hxJ9DDKSgMEcqjUjpQZE+kWDD7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Af3CMvJsRfLjd31u4zatk/jTZVxWTGGMU8Eyj7bop2HOhwGzVyaAjdG/ZYAsJgiBv
 DVpKvqjbmCQhzCdGJkgXFj/Wz/F77Mg37BGVTMZlhM6Vblsu88rsdjZwh+YAtsoBMy
 1jTQtgVcBQnhKsmHYQNeNC+HLwjtVf0heSO+7Mus=
Date: Mon, 23 Mar 2026 10:32:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: George Saad <geoo115@gmail.com>
Message-ID: <2026032340-proposal-sedation-7225@gregkh>
References: <2026032354-country-saddlebag-5331@gregkh>
 <20260323090306.757911-1-geoo115@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260323090306.757911-1-geoo115@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 23, 2026 at 09:03:06AM +0000, George Saad wrote:
 > In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
 > can bring the F2FS_WB_CP_DATA counter to zero, unblocking > f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4bf8-0000X7-AP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [3.49 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geoo115@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linuxfoundation.org:s=korg];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 1E2842EF224
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:03:06AM +0000, George Saad wrote:
> In f2fs_compress_write_end_io(), dec_page_count(sbi, type) at line 1492
> can bring the F2FS_WB_CP_DATA counter to zero, unblocking
> f2fs_wait_on_all_pages() in f2fs_put_super() on a concurrent unmount
> CPU. The unmount path then proceeds to call
> f2fs_destroy_page_array_cache(sbi) and kfree(sbi). Meanwhile, the bio
> completion callback is still executing: when it reaches
> page_array_free(sbi, ...), it dereferences sbi->page_array_slab_size
> and sbi->page_array_slab within the now-freed f2fs_sb_info structure.
> 
> This is the same class of bug as CVE-2026-23234 (which fixed the
> equivalent race in f2fs_write_end_io() in data.c), but in the
> compressed writeback completion path that was not covered by that fix.
> 
> Fix this by caching sbi->page_array_slab and sbi->page_array_slab_size
> into local variables at function entry, before dec_page_count(). At
> function entry, sbi is guaranteed valid because the F2FS_WB_CP_DATA
> counter is still nonzero (this invocation has not yet decremented it),
> preventing the unmount path from proceeding past
> f2fs_wait_on_all_pages(). The cached values are then used in place of
> the post-decrement sbi dereference.
> 
> Fixes: 4c8ff709c6 ("f2fs: support data compression")

This commit id is not in Linus's tree, are you sure it is correct?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
