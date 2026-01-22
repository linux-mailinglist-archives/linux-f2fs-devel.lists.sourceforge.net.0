Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIFrI3j9cWmvZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:35:36 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660F65525
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 11:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:Message-ID:Date:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7abbKbVEna+AYjZp0Q4CJHpJIqFNMd/wOxqIbDQ+fxQ=; b=D2Ehe2zIw1k58iA3eXMfbADU4W
	dHcBT0Up2x07GJmjC2ZBmvgpTM3WR4tQw3MdHUxz/vArs6txboHnveomJlzjN/ZoJey7zpC0DHy1o
	H8aYUkNU1JQYR4bjTJcxMpV67JNU+r6h5yCD51gaej14FiT4GmUYeqkjRX/FeV8AwBkw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vis2C-000298-Ej;
	Thu, 22 Jan 2026 10:35:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1vis2A-00028y-0r
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOX8ifNT4vfzjSb3CXebmqamN/hgdkioL7GJrURlahQ=; b=aVkKa/UGgJQD0Y/FIdhQ++Bwyw
 2EQvov7MMh+l2ZnoBnFxAK5tVc80Vtd0/PnPUi8XJKynDJvLYDVo+Cp7Kv+j3CP58PQ8vUr4GchYn
 txgTg1KeAv08iAX4DBu2aNNVAHfScJKZLEPEqSPpROuG8x0/ndAzcw1B2tzl5idwUlew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FOX8ifNT4vfzjSb3CXebmqamN/hgdkioL7GJrURlahQ=; b=a+HTd6sa5l/6PqYNO+HMxDBt0M
 FVgyzUJhlO7u6tYkkcq/DXw1sESyQJGTqjWrFU6V2RugJekJKjZk+PFfBnj/U/Ox+1FcvBcP0wcKy
 RtlwJuwC5kTdka5Z6j1mNbmJFPTV7ez2lrbmCSusApdGg0dLf1sXayIZYDA+BI3opqy0=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vis28-00070V-V8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 10:35:25 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20260122103517epoutp04e9177fc67dbae55f2811eeadd310d243~NByzVCjn00544905449epoutp04R
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 10:35:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20260122103517epoutp04e9177fc67dbae55f2811eeadd310d243~NByzVCjn00544905449epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1769078117;
 bh=FOX8ifNT4vfzjSb3CXebmqamN/hgdkioL7GJrURlahQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=L4qN4SryCHgfBWyt8YhTWVITdWCaadO5GB3ePoeloCTlUI0UIFJDkMaURjnD0YGMA
 N0IJFnYKavrBaB76nGmam4heFRdType/KzYNZtoDdob/8Nnn0v6AERckLL1ggV5Ag6
 lkHHZOZEBMFF96TVQaiYYpixXnwI67JGOQYygBv4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
 20260122103517epcas1p1bca288d0d1d75018061a8715b6cf3c57~NByy0Ae860688406884epcas1p1j;
 Thu, 22 Jan 2026 10:35:17 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.38.191]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4dxcs0701pz6B9m5; Thu, 22 Jan
 2026 10:35:16 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260122103516epcas1p20b6bdbe818bf1bf3e06a94ed91893a75~NByyCIk290495704957epcas1p2l;
 Thu, 22 Jan 2026 10:35:16 +0000 (GMT)
Received: from youngjingil03 (unknown [10.253.98.35]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260122103516epsmtip18962457fa26a0e6f0ce1d583e7c60256~NByx-CUCS2334523345epsmtip1d;
 Thu, 22 Jan 2026 10:35:16 +0000 (GMT)
From: "Yeongjin Gil" <youngjin.gil@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>, <jyh429@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
In-Reply-To: <8a00c027-d14d-44c8-9105-b385fabb37f2@kernel.org>
Date: Thu, 22 Jan 2026 19:35:16 +0900
Message-ID: <000101dc8b8a$cc342770$649c7650$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNImu6Q1q6EEabpvPETJlu1g52f/wGoyplJATaj3pOybuQsIA==
Content-Language: ko
X-CMS-MailID: 20260122103516epcas1p20b6bdbe818bf1bf3e06a94ed91893a75
X-Msg-Generator: CA
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260116102347epcas1p46ed8360e1a69831f382dcf9d9ee486b0
References: <CGME20260116102347epcas1p46ed8360e1a69831f382dcf9d9ee486b0@epcas1p4.samsung.com>
 <20260116102346.992546-1-youngjin.gil@samsung.com>
 <8a00c027-d14d-44c8-9105-b385fabb37f2@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 1/16/2026 6:23 PM,
 Yeongjin Gil wrote: > > When overwriting
 already allocated blocks, f2fs_iomap_begin() calls > > f2fs_overwrite_io()
 to check block mappings. However, > > f2fs_overwrite_io() it [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vis28-00070V-V8
Subject: Re: [f2fs-dev] [PATCH RESEND] f2fs: optimize f2fs_overwrite_io()
 for f2fs_iomap_begin
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:jyh429@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:sj1557.seo@samsung.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.sourceforge.net,vger.kernel.org];
	FORGED_SENDER(0.00)[youngjin.gil@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,samsung.com:mid,samsung.com:email];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youngjin.gil@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4660F65525
X-Rspamd-Action: no action

> On 1/16/2026 6:23 PM, Yeongjin Gil wrote:
> > When overwriting already allocated blocks, f2fs_iomap_begin() calls
> > f2fs_overwrite_io() to check block mappings. However,
> > f2fs_overwrite_io() iterates through all mapped blocks in the range,
> > which can be inefficient for fragmented files with large I/O requests.
> >
> > This patch optimizes f2fs_overwrite_io() by adding a 'check_first'
> > parameter and introducing __f2fs_overwrite_io() helper. When called
> > from f2fs_iomap_begin(), we only check the first mapping to determine
> > if the range is already allocated, which is sufficient for setting
> > map.m_may_create.
> >
> > This optimization significantly reduces the number of
> > f2fs_map_blocks() calls in f2fs_overwrite_io() when called from
> > f2fs_iomap_begin(), especially for fragmented files with large I/O
> requests.
> >
> > Fixes: 351bc761338d ("f2fs: optimize f2fs DIO overwrites")
> > Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> > Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> > Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
> > ---
> >   fs/f2fs/data.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index
> > 2e133a723b99..bfbd717e628a 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1851,7 +1851,8 @@ int f2fs_map_blocks(struct inode *inode, struct
> f2fs_map_blocks *map, int flag)
> >   	return err;
> >   }
> >
> > -bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
> > +static bool __f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t
> len,
> > +				bool check_first)
> 
> Yeongjin,
> 
> You may missed to add logic related to check_first parameter?
> 
> Thanks,
I made a mistake. I will resend the v2 patch.
Thank you for the review.
> 
> >   {
> >   	struct f2fs_map_blocks map;
> >   	block_t last_lblk;
> > @@ -1877,6 +1878,11 @@ bool f2fs_overwrite_io(struct inode *inode,
> loff_t pos, size_t len)
> >   	return true;
> >   }
> >
> > +bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len) {
> > +	return __f2fs_overwrite_io(inode, pos, len, false); }
> > +
> >   static int f2fs_xattr_fiemap(struct inode *inode,
> >   				struct fiemap_extent_info *fieinfo)
> >   {
> > @@ -4443,7 +4449,7 @@ static int f2fs_iomap_begin(struct inode *inode,
> loff_t offset, loff_t length,
> >   	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
> >   	 */
> >   	if ((flags & IOMAP_WRITE) &&
> > -		!f2fs_overwrite_io(inode, offset, length))
> > +		!__f2fs_overwrite_io(inode, offset, length, true))
> >   		map.m_may_create = true;
> >
> >   	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
