Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLuNAoC6AWocjAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 13:16:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CD50C948
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 13:16:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctAmTzjLEWej3Ug5zXhNuU/dsiGYHuh6r4FpZeMUg5g=; b=AcGY8MYIELsOpmzWDIGGSLKAdx
	sIMiMHnGYH6xq9t+Tp9aqvsKin1PMvrlNOmji2OxaxZcUYytn5QcLZTCi/yCuGXVsx5+Fpb4LouJO
	McO3NjX1YzTd/eauU2EgVY44U2CEdDNFOo1djsj4ugcOGXw4lKuzlugDjidOI4lQJpJQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMOcD-0003Oj-Jl;
	Mon, 11 May 2026 11:15:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1wMOcC-0003O5-4e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 11:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=; b=MMcU/Gn6cq2jZxnXaTDsdFVMeJ
 8JXLajxLR9lwVkBLoKnJpMYK3yFBjKNT4HOx3pV8Gn9bIE1whkW7BH549yFYX51b1HUYAq+LBHg+N
 HIhfB0WmB5qBtktm5bOVuiAwPML4Ws7wNK8HqtM1mQcvkeupq4NtoxCJkXKJYDvoitxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=; b=JekECoCOmt2Ev3v49CGT3ts1pZ
 ZCPaYKH6ZRP5j1EELpVB2PKTdYKDZLaqbXLjVgJye37BwiJJodFgdmr3pwqrchWWYxqzeDSkuNAa8
 uat4LGMzyo4FWCzeO5CYdtUrjMtQkrbxk2xht1LNZDzMpDcCxK/HUX225A1L2xuCqT5s=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMOc8-0003gr-8T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 11:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778498144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=;
 b=eiOXnVzB/pI21G1epMBuoDXb6oNlBBDexTMU4Pa0JCBceD31HbvlXiXC/IZQa1Fj8l9LKV
 pw5PgOlAYz+3TPAX39WKLM4LkRWOgM1cChU19NATJtSHTy8eIWrTpo/2dvzXU9R2NFykm3
 lwEojr5JQKwtDDdhTXGyrl+BoIaiuCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-J3wdKejwPJGrVzaIQyqkSg-1; Mon, 11 May 2026 07:15:43 -0400
X-MC-Unique: J3wdKejwPJGrVzaIQyqkSg-1
X-Mimecast-MFC-AGG-ID: J3wdKejwPJGrVzaIQyqkSg_1778498143
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48d0889c1ecso26355575e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 May 2026 04:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778498142; x=1779102942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQi40JXMVWHDZRjke+rHrQlcRrLFkKa2WRv/wpGjnDg=;
 b=APjcmrnJrkm9anYg3bjJW8OwpolBG8S7YJb8Tr33NQkHYxb83kirk+BwMrhfrc/gS/
 DsnVbxRo1Fl5c13eqwGriCm4gCxSKTvKmDFE+vBdoqh6t/ypHTYeFBcCGo0hUuDSFzcS
 8wKdWIFV+nn29A9kUkCJRHQzAKvAhUh6VqHGA8BCdw0U16F+bIPhqyGgbR1jOblFHcdn
 0INVjSAmMBDl97sLtAqrtDUxTpaYz85E17NAHPU1fSBqyfG0PY0o1rtowDXxgIt/QQ16
 Q3tU/Uk++c+hkEykYOU8hcob9SIuUBQc5O5cdDkuQRLuP8DUUtGOlxP80g3m+IlPAvIW
 dVsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+fLrYhnhWOJKocC0hwEmUi6GSJfHTvutOWFlfjLCZCtGX88hWac+IJvwDBllSMCoklqhSdrxay8FirPV0L7SK9@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yya4GunhHSctJSRSoWYGXFWCnl0Uxb4kn6qIgqyEJxS5QRmvAgd
 4mkRL7GA0de+LmhVM1tKewJI5ptOVYMwiFPh0AZlAY/TdW5UH5W34gdAf0caNK6P3Qo0sYZ3kpc
 4E8n/2UnktbEpHNSlo6jIWj60eQuRRbl/zDasbC7HdN9lGF1CsSwD7c06LXe4Vw4In/pj4rKyJt
 ysQg==
X-Gm-Gg: Acq92OEc7E28ezZwaQhSi68P6mb+SL0eH0HHIPAV8byd2SViffOwhaMj9/G/d3rEBnS
 0nBbcy2/1vb60OQWsk0DGMLcxASeLUzYKxWKfBAr69plcMP1gaTl+6jJJ5hM9/dxGPJ5BvlnTBT
 ZxyJpFBNUr2/uG1d9aYXba6HSrdPPNuICbH9WF0XpccBl7GbJrSUlJOgTf2fGv1l9wBUKKGXuWu
 dk7jLq5icHjwG1hg8kueAOFjHNzEQOjVbnnxeXaRf5jia9fsT5af0ttxe+nmTPnSg4BcaVXgiu5
 St3HTnZXDPx3NGi8Vrf/I4cJvgxEZKcqkZB0JWNgNx8qqLotbTk1C7UXOTgc12xrz+yRQuc449w
 PDx0zpZ4zWQI=
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd4c with SMTP id
 5b1f17b1804b1-48e8741ff98mr21083625e9.18.1778498141653; 
 Mon, 11 May 2026 04:15:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd4c with SMTP id
 5b1f17b1804b1-48e8741ff98mr21082605e9.18.1778498140980; 
 Mon, 11 May 2026 04:15:40 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e7040a9a9sm309872515e9.9.2026.05.11.04.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 04:15:40 -0700 (PDT)
Date: Mon, 11 May 2026 13:15:39 +0200
To: Christoph Hellwig <hch@lst.de>
Message-ID: <hnsxzymuydf5evoxw4chao7rkixm4eafolebxfjtsqschgfazh@nll3fdfnsigx>
References: <20260428083332.768693-1-aalbersh@kernel.org>
 <20260507055217.GA19888@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260507055217.GA19888@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i71rrZXnVj_9oya5TQfBAAzlJMpmqdYIodDSX7suRHc_1778498143
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-05-07 07:52:17, Christoph Hellwig wrote: > On Tue,
 Apr 28, 2026 at 10:33:06AM +0200, Andrey Albershteyn wrote: > > This series
 based on v7.0 with Christoph's read ioends patchset [1]. > > That [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wMOc8-0003gr-8T
Subject: Re: [f2fs-dev] [PATCH v9 00/22] fs-verity support for XFS with post
 EOF merkle tree
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2A4CD50C948
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com]
X-Rspamd-Action: no action

On 2026-05-07 07:52:17, Christoph Hellwig wrote:
> On Tue, Apr 28, 2026 at 10:33:06AM +0200, Andrey Albershteyn wrote:
> > This series based on v7.0 with Christoph's read ioends patchset [1].
> 
> That's not a good baseline.  We'll need it on the -rc that has everything
> from the current merge window at least.  It might also interact with
> the fsverity fix that just went in.

Sure, I will sent v10 with a latest master and that fix soon.

> 
> This might also be time to come up with a merge plan to figure out through
> what tree(s) to merge it as there don't seem to be any maintainer
> objections.
> 
> 

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
