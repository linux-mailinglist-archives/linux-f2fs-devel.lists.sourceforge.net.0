Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNG9OEr4cWmvZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:13:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58665153
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8XFdj7yYhVv5+UThzP+bsLcVyzJyu3eaGfBDynt87g=; b=VGzFgt8Pe3rIX14dvDGceqp9Kp
	erBY1D8Yw+kIfsOPP5OZ5BQ6r/zva1tExFpfV1pYUtpDNRIjgMdeYhR5hsZWcx8LJ8MA1FVDvSx8o
	2C8CxggugtAUirnYFiVGYM1xaj+CfQ+TMvKV50PHowtJc7V7yvdVknb13suM/pvYO8SU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1virgv-0001QF-1A;
	Thu, 22 Jan 2026 10:13:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1virgt-0001Q4-87
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=; b=Knk+v7ntQJWLm+I/hMawzCCyhA
 zcpvQ0QG1LRFaNeVmjlPmwe5r/Cq9HT/v9KZwSxUCPcZILROHf6LCB9bfKRC2PhSS5uWXIXY2SbKS
 L83EIk3KjRhDOMTn5NRbDYj7BsuTlf/afGT41EzzOLxdNwF0qWM6kXWB1899KmBXOQlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=; b=FDbPPAgePxpvvIL65MhRfEq2pd
 YC9ZzmAn93kVhat108PwUnxu4p618cI2nZiIpjRAUcNnFUDEOzPa9YF1hDTnUuCdkup264geFi86Q
 Vo9549Uc2/TO86Oi/rPyZ+u/Ut+vAgbHBNAFY1kxOiB2nk01WTDBthEcUhNz/6gukM3Q=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1virgs-0005bG-RZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769076795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=;
 b=XWCXsuZOsF99mYL8KILDVW2EFbl6CYdDV9JmLRm66EUXI5x7RK9DMf7KhLDja6WSQEaWSC
 XR5GsClxOzplgcBVCAwgyjvQPf0C5KAkCDdqx6a29G7ZBjhJDxGRlPGiYEDfA6/fTFTLHC
 if2vUb5aAQVB2jdv9jCWKO6XlnEN78I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-S9ZXL-bCMqeJ6FPnCADpRQ-1; Thu, 22 Jan 2026 05:13:14 -0500
X-MC-Unique: S9ZXL-bCMqeJ6FPnCADpRQ-1
X-Mimecast-MFC-AGG-ID: S9ZXL-bCMqeJ6FPnCADpRQ_1769076793
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779d8fd4ecso4986395e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 02:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769076793; x=1769681593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PvjpRuZOnSj4n9pyzBuctSprFCgwIRN8fXSvvKed5k=;
 b=PC8ZEW1n24xxaWOsMDv1rl4J9wKgKsMaRPsLMGQ9ZUvHCZSc6d4p5nG73T2PxJmjOO
 kWE0awJNTb6ZBZw/6+fcY27dv30p1HL21p5yZoQUBtM7VqHA/Ovdh9Jj+K8dQtyQcv/z
 56VcktQMgVZ1ONAuSOYZVmU8iyWqyWNyneefRQI6b8jJ1gSwDDDWZlOMHxQk1BSUQMbB
 bunBrBFetzczY8YKUvTLbzUxB7zt4RIZu6lqWGxMb9RYYcsPY3+VKAEluyaitrxveNyq
 89xnAIQO4Mtlia67sg2zfu+k5eQBVFwu07SryvHngD0En+oK3KNJu+Uu5o3ZbOwZhQ9e
 l10g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ROM/db2TWiKajg5ozgxlc1pU8eilT9UXPnWEt43F7WdPEUiV1BWVC1hkMau2Lrj3JJglxpRHS8rhe48Ea0LQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxEw9esXsZRJR2N1NnxmFPPyQF+cvb8a+2jGMPqGGeocYuOT4pZ
 DLwAoLr5NYEa3jZgn3zWMWnc00qQ0jVv/fZpFd3CsF7oP4NX5GqeCmlGXLhR+kS6kgp68SXYjHu
 m6MxzAZEc757OBM6FpQFiU878UhAsx7nMVqEIh7uOxjrRb+45EU3FV2Z3Lx+Qz/gp7exwvHZZvT
 3MNg==
X-Gm-Gg: AZuq6aL+CGqvru9LGYPuaZtGyzmNsnR8W26qO1waIkwLwXxdc0DeDOSiuO/6teSDFPQ
 CZ5AcAkx5rOX9VG1Pg/VtOZUhbsbsvaAhiqG+WZnY7MbrC5mvWcJOleve9C22/ViTQjufTklfK1
 iTRvIOspE3BhBlK/5bl9msZ11ed3k7BdySTP4bEYkl+wqJUUQhnVyu5faVy6SZ3f99L1LFWAXdM
 PbPx8VMt+YOR77LaWJ2a58u13QZkcrn5TcH1Xp/CgCNsgyCwnEs5BeKL1oCbICF6WhoIKN+JtOb
 OQrHFBo7pKyznf/NRjzrv2hLXHrmNtiWeo14qE6CPNxttOhf65uqsLplc82FR+5wvjGP38Rpmcs
 =
X-Received: by 2002:a05:600c:58d3:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-480470d4b5emr28224405e9.18.1769076792942; 
 Thu, 22 Jan 2026 02:13:12 -0800 (PST)
X-Received: by 2002:a05:600c:58d3:b0:47e:e48f:43b5 with SMTP id
 5b1f17b1804b1-480470d4b5emr28223915e9.18.1769076792425; 
 Thu, 22 Jan 2026 02:13:12 -0800 (PST)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804702fb04sm54550985e9.3.2026.01.22.02.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 02:13:12 -0800 (PST)
Date: Thu, 22 Jan 2026 11:12:41 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <a3oh6pju5fuodkmhb42o5t7qkqo5oqtwk3nu4wls57p5ihz2rh@q7mt6lpuprvd>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260122082214.452153-5-hch@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EMelLiQ-GOGgi9lDSF3asOvi97EJRfv7-6oz3KQV8C8_1769076793
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-01-22 09:22:00, Christoph Hellwig wrote: > ext4 and
 f2fs are largely using the same code to read a page full > of Merkle tree
 blocks from the page cache, and the upcoming xfs > fsverity suppor [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
X-Headers-End: 1virgs-0005bG-RZ
Subject: Re: [f2fs-dev] [PATCH 04/11] fsverity: start consolidating
 pagecache code
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 4C58665153
X-Rspamd-Action: no action

On 2026-01-22 09:22:00, Christoph Hellwig wrote:
> ext4 and f2fs are largely using the same code to read a page full
> of Merkle tree blocks from the page cache, and the upcoming xfs
> fsverity support would add another copy.
> 
> Move the ext4 code to fs/verity/ and use it in f2fs as well.  For f2fs
> this removes the previous f2fs-specific error injection, but otherwise
> the behavior remains unchanged.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

looks good to me
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
