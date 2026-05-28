Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FIaG2BWGGoQjQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:51:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2F5F3F53
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 16:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnKaSqQspW0N8BMfC3OAHy8n2wfS3xLHFmq8crbPXgo=; b=C8tUTu+ymOMLGWjfpqx8XUO1av
	ADrJebIev6m1Yhj/lLJF4+m1M3rrVahxZDRz6AU/QDydyWqjaVwnK+iay8GmreUuILzdooZa7yju7
	DO6uIJ9cArK6mLPBinpe3g5XD9Fa822XTWU5YsJKpqQO8/288i4v2MFlVC4JmAN0tRRc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSc4d-0005mZ-1y;
	Thu, 28 May 2026 14:51:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1wSc4b-0005mS-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=; b=DYljMnZg+7Om+rBOpL3F3Mpewe
 x2Htp5VIhg/et6rRv7aTMEuQt6+CPy6r5o0PEpNtrj4pyQV6BYv4qoqzsJgNLHnx4LOPg3dXOjTWX
 sBKpwhXTI7Gnx+uNUaH9ueIKg61rkwgw/mFx1VptEcX+T0mFz24JdFR/rqmVuiQwB2to=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=; b=itMvgAOVB7cMxNJH8x4OBWreny
 EY1odylr/TloPYsFpEry6Q5VGgDeLhmorKXQ84gq2wIsQWe74T7SkH5Fqw6ei4Gn0l2SaLNlG/dNE
 omsYL0Zqt03UxrwM7iiFsRvgONK1jysHBEWE1/o/tI1p+MPaU0NBebESfmYwUAg7z0t4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSc4X-0004in-GV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 14:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779979851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=;
 b=PDbLJxh8YRqrrvjPYxj7RmYcNHwPu8ivAXRe/GjNMqp4wmeIt8cOq6rsDtLD8BfGbqMFvr
 r64nMcVvuIi533I/RQ94DLnKs5BD2roybqHcaecVIpbQgFh/nRM4PlB0bJSJM1AzadWGWB
 wnToAyLctZe2sPbwe9eGX/s1U3cF2po=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-IVqL4iOeOhGciXYHaFk6Hg-1; Thu, 28 May 2026 10:50:50 -0400
X-MC-Unique: IVqL4iOeOhGciXYHaFk6Hg-1
X-Mimecast-MFC-AGG-ID: IVqL4iOeOhGciXYHaFk6Hg_1779979849
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-447f2ce5556so9564196f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2026 07:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779979849; x=1780584649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UBtkZg2KzsdpXCtGBF+S9Fg8Iz8UrMjxsxZEct4ck8E=;
 b=Y1eqagRYtXnR6+fgJqn+dEQnDvifI/skVWlGobMIbvdLhPH8H8oqnSkCb6SkJKqjTV
 3wKyeftPqxAlp/UaHt0ARlDTtvfrajjUoNw03xdb6uAMQ+xtxGv11DpF9Ria23/EN6IM
 lIv3julEDAJEGpglJXrMbX6m4Hfto5wY5SZ7dsek6lqSfHPvt4E/GbnIRz9MLAvQ7AYh
 9Bw8CZgydCtaeKYdZh2YDZB6TLcXt6Pbiy9kHBHxSNLO9WGrBueou844HqMH1jsjGecK
 MIqEMl4OJLTOF+VnrMDcpT/+8ta+yquUlF8foAY9X4HFY5Rky3sym7p0/hqPNEzcHfup
 fnWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eSWdZke+FJB/5qzokVS1t9ROpbZHGQNPNYDDvRN+hCT94ta9Qd6OEbZrdUv1BsME+2GDisohEbzCqggsvgCrQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5l+9c6qptsPQZxinKFewN6rfosdjLqpzCvqUDQMRnNi3u0Tkd
 OvSruNQ1mQuGR6Vpx7HtiX5rKD+YDN8b/sw5KrlbaX5fIpLcUyKpMrW8kLjwUHYWz9e7lUQ+BMT
 Dz7Oz3Ad8/BRbCGJ8ZxbsgfLlTF4huNmJPuDVz5CW+DzsLhqP2MhlVsijNLCCz9fibtKdKkPpXy
 o01feJt00lL9Uq
X-Gm-Gg: Acq92OENkZ6wSUIGvaSRLflIoHi9oYkPzeOhrUlqhdnuVGK1G2U2NWAq+FYRjqi6iUS
 fwxeky2yrIASqkSWtGXntXBzyFfaND6HToQw4ST9j+FvgqKQsWg2AL3KRHxJz09/XhWd5vhel5m
 sZD4aPr98AdhvwSGb5DbHERog7u6JL8VIi9dA2ElsRLcGREAYdCcwiNDswivy7991hKsdetuE1q
 1dGrrdVseRzKdx4N6fnkQuBmNqHjWDCX5fSDtdQIAqROY5yqVZBhDE3oGSm+ztQT3GRleOWcnmg
 U5nB13dgcP5LzjIhF7uM4wt/NxGK0+lkOh4m+H9/vcnKySkma66UXCeiV3H7QGJ6nwdW2ROLX7D
 t5moiB9Y/jHH+fizgcdwVCEC2n18Ky5foSOS9JCEULsTAahqguq8GvTh2DuNwEiAE2Q==
X-Received: by 2002:a05:6000:26c1:b0:44d:1338:46b4 with SMTP id
 ffacd0b85a97d-45eb36731d0mr47511220f8f.9.1779979848941; 
 Thu, 28 May 2026 07:50:48 -0700 (PDT)
X-Received: by 2002:a05:6000:26c1:b0:44d:1338:46b4 with SMTP id
 ffacd0b85a97d-45eb36731d0mr47511162f8f.9.1779979848360; 
 Thu, 28 May 2026 07:50:48 -0700 (PDT)
Received: from thinky (178-221-68-189.dynamic.isp.telekom.rs. [178.221.68.189])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eeb36c40asm3352619f8f.13.2026.05.28.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 07:50:47 -0700 (PDT)
Date: Thu, 28 May 2026 16:50:45 +0200
To: Christian Brauner <brauner@kernel.org>
Message-ID: <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
MIME-Version: 1.0
In-Reply-To: <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e3-WV_bViRJAXZ4tydZpwJ8Fp49WmGa6FHU0juQ4_Ww_1779979849
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-05-28 14:20:08, Christian Brauner wrote: > On Tue,
 May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote: > > On Fri, May
 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote: > > > On Fri, [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSc4X-0004in-GV
Subject: Re: [f2fs-dev] [PATCH v10 00/22] fs-verity support for XFS with
 post EOF merkle tree
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
 Carlos Maiolino <cem@kernel.org>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 9BC2F5F3F53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-28 14:20:08, Christian Brauner wrote:
> On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > agree.
> > > > 
> > > > You may take it through the xfs tree if there are no conflicts with
> > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > vfs-7.2.iomap that you can pull in.
> > > 
> > > Merging the iomap bits through the iomap branch might make sense, given
> > > that iomap usually tends to see quite a bit of activity.
> > > 
> > 
> > That sounds good to me. If you want to go ahead and pull in the iomap
> > bits, do so, and give me a heads up when you do it so I'll pull your
> > branch locally.
> 
> Great, can the series please be resent based on current vfs-7.2.iomap
> then please? Because the iomap changes in this series don't apply
> cleanly on vfs-7.2.iomap so we already have merge conflicts...
> 

hmm do you mean this branch?
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap

patches 07..09 seems to apply cleanly. The only conflict I see is in
the overlayfs patch 03. This is because [1] (is in -rc5) is missing
in vfs-7.2.iomap.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
