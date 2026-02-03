Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGWFJINIgWnNFQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 01:59:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39058D32F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 01:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00uLnF3p4eL+4msJ8U+Zme+4dTC86uZhWzVLIW5q1Nk=; b=dCh3vupD/pixrJQqmYX2NcBQVj
	FNRWzi2TpsQHy2wYKgg2R54lwefP6tWfaYCqWOp51M92ulArPlZocxEErLarQ85vKSQcKgWFvKCmd
	7NluJuORWZmxbAzYwoQC9qtwaATKVBLtD+A7HodgNngs3y5t21C7dUQo9FSl98KyPCQU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vn4lN-00018l-EH;
	Tue, 03 Feb 2026 00:59:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1vn4lL-00018V-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 00:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aUyJiVznOTfQ6pPxpOeT0GU34DTIGGka4AHQzI4bQCY=; b=Q6yQL/txUCiGWagBJxLFo0Skw9
 jJegiOJJQhj1DF2qv9tUoUtFI2rPHkfeAhcftgJa8RfK8cyhguHnW8JmZx98UZy1DeV89td901G3d
 wBR4j6uEk1m3rhR+we1qTXbbGurfLDAHsceldMX2Eo4hClxHT35dEuqxeg0PmCH6YvwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aUyJiVznOTfQ6pPxpOeT0GU34DTIGGka4AHQzI4bQCY=; b=RGKlfKVoDQRfkjh8/XVIJSfdxy
 YgkEmEDYn9jIe+0I50eq7uEp4LOr6u1UB+vnxpLyyASTXjMVg+XrCFBNI9iAhHeRXG+pT5lzHs/P5
 SQz05dgwQHvwMbytkbAuEMZjsix7zvmt6sf3XyKUAtDdtnLJbWKTPaWfNHNA6GmkcG98=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vn4lL-0007a9-75 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 00:59:27 +0000
Received: from macsyma.thunk.org (pool-173-48-123-50.bstnma.fios.verizon.net
 [173.48.123.50]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6130wZeK027056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Feb 2026 19:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1770080319; bh=aUyJiVznOTfQ6pPxpOeT0GU34DTIGGka4AHQzI4bQCY=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=oymjkyALcY2L6SOAuZbHGBaaZnFauHrclv6xQuVdOYpduatevDy6DEZzen76pSw5N
 XSQfkThuW5BRzrU06IYhabSdIPWNjwnQq3+jhdRbr25SpUVdQmkk5lNGOzd/uO747K
 5wJy84oHudJlo887rgejCF0q1QH5M51Hm5HrX5Qs3lHCepH4V3tn4Q2Mbopst+Bthx
 0C+l4IQPlMxaV2LUrSt8VQhwr0E8xmYuMjg6fdD9CnZNtwd7fmd+npl3qZ/la1AxRO
 KtkMvAXtqMqtkMjomn3aBlwVAqM9ZppQSr3aAmTcLg/UvUvgBZF6yKRoZrRsiGt2QT
 gDbA0NuZCVYXw==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id F2B815704A33; Mon,  2 Feb 2026 19:57:34 -0500 (EST)
Date: Mon, 2 Feb 2026 19:57:34 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260203005734.GB31420@macsyma.lan>
References: <20260202060754.270269-1-hch@lst.de>
 <20260202060754.270269-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202060754.270269-4-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 07:06:32AM +0100, Christoph Hellwig
 wrote: > Keep all the read into pagecache code in a single file. > >
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> Makes sense to me. Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vn4lL-0007a9-75
Subject: Re: [f2fs-dev] [PATCH 03/11] ext4: move ->read_folio and
 ->readahead to readahead.c
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macsyma.lan:mid,lst.de:email]
X-Rspamd-Queue-Id: 39058D32F6
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 07:06:32AM +0100, Christoph Hellwig wrote:
> Keep all the read into pagecache code in a single file.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes sense to me.  Thanks,

Acked-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
