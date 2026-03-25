Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yELeIKX7w2k/vQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:13:41 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329F327A0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 16:13:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQHLJPilqZPVY5kTi9bLTKofWxUXdKoPbrFIB5K8qFU=; b=Gip1VtTGmbodizWVafkxw9m7tr
	7bguClxAumY+RTJ5Vm3P56y1if/TFfPyk5RNmbVXSA+AT0nUbU1VXFenyC1Oh0VgDLgvwM9mY/wqv
	CFkDXswgxYqh7XMJ7RdojtOX4TS+LE1VWlHuAlUqh+zsy8ZONdrnxL2LC4riHFMHTpzw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PvP-0002vh-R9;
	Wed, 25 Mar 2026 15:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1w5PvO-0002vb-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+19C0e82RyTBkkeFT9u8iv2756DNPQteV+mA0Dh+pEs=; b=B1w6kbs5uZ1u0Ae27HUns1GaFR
 gBJykcPK8PZqDogreP7r12NsiGG6J5lSrHBip9aivLeA/KlzNQZcias5imtpWClwUE6JsOEsHCcT/
 ue3TYg4oat77XbUjDoc4Lu/NNLgAXhUljVbO21PPOGV7oPj5e5PNrGd6u6NM8k5I9ocQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+19C0e82RyTBkkeFT9u8iv2756DNPQteV+mA0Dh+pEs=; b=P0Nc1QFsq1AcO6sBpA1iYpdwC+
 xL4nXKtGc1OiKeOok3wPWXI8QMoWydMw+y+5bPfVBE0FJJtYdh/zuiHVJyDdP+JYk0PntKINHIpPq
 uHLCyhRJjUdfhqzGVy9NIwZQshh7gRYJMqlBYFoQnauJEC4LKmcTILJmKz9N3gMLthPM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5PvN-0007l5-Sv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 15:13:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A106768D07; Wed, 25 Mar 2026 09:05:25 +0100 (CET)
Date: Wed, 25 Mar 2026 09:05:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260325080525.GH952@lst.de>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-12-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319170231.1455553-12-aalbersh@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 19, 2026 at 06:01:58PM +0100, Andrey Albershteyn
 wrote: > This is just a wrapper around iomap_file_buffered_write() to create
 > necessary iterator over metadata. Looks good: Reviewed-by: Christoph Hellwig
 <hch@lst.de> 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
X-Headers-End: 1w5PvN-0007l5-Sv
Subject: Re: [f2fs-dev] [PATCH v5 11/25] iomap: introduce
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 3329F327A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 06:01:58PM +0100, Andrey Albershteyn wrote:
> This is just a wrapper around iomap_file_buffered_write() to create
> necessary iterator over metadata.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
