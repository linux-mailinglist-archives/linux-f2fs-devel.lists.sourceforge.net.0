Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HCt2Ho4PMWrxawUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 10:55:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609C68D544
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 10:55:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DbYKEgPM;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mDFVxAun;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="Xe+t/G//";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Onlv5oOi;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRQbN+IPvivrwFjYErpVB+oKObF2iK5PzHB1djwkCMU=; b=DbYKEgPMsVcDyyhIZOC9f15+OC
	vp9VS9vrMNdLKe5sgnS/T/7DB+ddScB9Gyq3YwZdhGOrE+tT/mS++m/H4FFZbrHiCrSNI1LY8ARI7
	yaa6JAsn1fDecc9XyL06YOFgaQf6klLigiNK0gAZTMRKpiKcfFxo+nKCC/gr4u5nRrgE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZPZw-0003BS-Kn;
	Tue, 16 Jun 2026 08:55:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZPZl-0003BF-Lh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 08:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GLH8stHXoCSzvmMoSuouXVXmnZLFHxqXEnOUUBsu2w0=; b=mDFVxAunnum1YpPvC1DqY10dKO
 BxNKJtfEJ2h95Ssh7Hk1GLVuSsUdMpbM24r4/cTsmzewvMnaLqxNnmCjRRP/+g+h5l/2avZ+M42j2
 Gl28qzDDskyZw1L+Z6dCnaU5nCn5DB9K87es4KhivlfTCWrCt/u7lxEIwy9Skptr2t0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GLH8stHXoCSzvmMoSuouXVXmnZLFHxqXEnOUUBsu2w0=; b=Xe+t/G//3L5Z0WZJnS9pNfnoul
 U2ppZG/r7vhQnm31thd9EMh0iN5QBSLsFSkJ1mEZFck+FihwS4RfYRLtdxd5kJC77QbypoeJ4TSCD
 uvLDodKOCiY8p5LFOblahfoUheCsjLphl1W+LOQJQ1L2bmvulxxh53o2r0xoH6ZN/f/o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZPZj-0000i1-7G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 08:55:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 13A16600AB;
 Tue, 16 Jun 2026 08:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5691F000E9;
 Tue, 16 Jun 2026 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781600104;
 bh=GLH8stHXoCSzvmMoSuouXVXmnZLFHxqXEnOUUBsu2w0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Onlv5oOib2oLQlgWoVfzpnt7aqIuxb0EkgTVv8u6Yfpy7ZTi2mvU7EgTYfEGOUnFQ
 sa2aV/dFGhCOr88+3QkiYOv90F5A9Ijx+P0dsjCRVZlsBA6A9ZU7l/joI2qwIPlZp6
 sDFFuQptsgoBZCl8IxsOjeEQhZh8JKF1bxrMCoydbrRTGZpptBb7iSbnYV9REBrXkF
 TR2Jxj/2Fmh9Xc5xmGO8/042a5nBwrV25NS8sm4n3fGRh/uhjp9HAX0g9klaSzYGiO
 RYDlXeRbxTXK57FbelnPu6LKyqvtaDStosXnU9AoaXHwaC5fXN1m1mYF5HiMIRK+i4
 muNj3fXWEljvA==
Message-ID: <4e9c61d4-c942-4291-96cb-02455da05257@kernel.org>
Date: Tue, 16 Jun 2026 16:55:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hexlabsecurity@proton.me, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260611-b4-disp-155e8807-v1-1-5d14dcc72b15@proton.me>
Content-Language: en-US
In-Reply-To: <20260611-b4-disp-155e8807-v1-1-5d14dcc72b15@proton.me>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/26 12:00, Bryam Vargas via B4 Relay wrote: > From:
 Bryam Vargas <hexlabsecurity@proton.me> > > When the flexible_inline_xattr
 feature is enabled, do_read_inode() loads > the on-disk i_inline_x [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
X-Headers-End: 1wZPZj-0000i1-7G
Subject: Re: [f2fs-dev] [PATCH] f2fs: bound i_inline_xattr_size for
 non-inline-xattr inodes
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hexlabsecurity@proton.me,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9609C68D544

On 6/12/26 12:00, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> When the flexible_inline_xattr feature is enabled, do_read_inode() loads
> the on-disk i_inline_xattr_size unconditionally:
> 
> 	if (f2fs_sb_has_flexible_inline_xattr(sbi))
> 		fi->i_inline_xattr_size = le16_to_cpu(ri->i_inline_xattr_size);
> 
> but sanity_check_inode() only range-checks it when the inode also has the
> FI_INLINE_XATTR flag set.  An inode that carries an inline dentry or inline
> data but not FI_INLINE_XATTR -- the normal layout for an inline
> directory -- therefore keeps a fully attacker-controlled
> i_inline_xattr_size from a crafted image.
> 
> get_inline_xattr_addrs() returns that value with no flag gating, so it
> feeds the inode geometry:
> 
> 	MAX_INLINE_DATA()  = 4 * (CUR_ADDRS_PER_INODE - i_inline_xattr_size - 1)
> 	NR_INLINE_DENTRY() = MAX_INLINE_DATA() * BITS_PER_BYTE / (...)
> 	addrs_per_page()   = CUR_ADDRS_PER_INODE - i_inline_xattr_size
> 
> A large i_inline_xattr_size drives MAX_INLINE_DATA() and NR_INLINE_DENTRY()
> negative, so make_dentry_ptr_inline() sets d->max (int) to a negative
> value.  The inline directory walk then compares an unsigned long bit_pos
> against that negative d->max, which is promoted to a huge unsigned bound,
> and reads far past the inline area:
> 
> 	while (bit_pos < d->max)		/* fs/f2fs/dir.c */
> 		... test_bit_le(bit_pos, d->bitmap) / d->dentry[bit_pos] ...
> 
> Mounting a crafted image and reading such a directory triggers an
> out-of-bounds read in f2fs_fill_dentries(); the same underflow also
> corrupts ADDRS_PER_INODE for regular files.
> 
> Validate i_inline_xattr_size against MAX_INLINE_XATTR_SIZE whenever the
> flexible_inline_xattr feature is enabled -- i.e. whenever the value is
> loaded from disk and consumed -- and keep the lower MIN_INLINE_XATTR_SIZE
> bound gated on inodes that actually carry an inline xattr, so legitimate
> inodes with i_inline_xattr_size == 0 are still accepted.
> 
> Fixes: 6afc662e68b5 ("f2fs: support flexible inline xattr size")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
