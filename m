Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P+MAg6c6GlNNQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 11:59:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1944457A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 11:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBzqtszDNSV9hVEzw3ByduaMj2HdY1u0BgxIeBLkFa4=; b=XRXUvQ5j8/YjhhKjkEXuNhFoLn
	//Vd5rr9Fa7zxUA9xgmtHvPK6CR6dD9UzA9SGgCjTUGmVU2fkHJfBaI3er1pjmEgoiCmdp/zGiEhM
	UsBWk/HaDFdejYmVw7qD0YhJe4psnQGolpACn4R/8ZGQ4fY/ps+ngVoAbFDLsSZEpdPM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFUMk-0002yo-Ct;
	Wed, 22 Apr 2026 09:59:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1wFUMh-0002yg-TD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=; b=IeEbuSi984mjPONS/vjhpN2r6g
 jBST23MWzHUl0C36dP2IWPCdCO79gY4HWeiqgSZ7d8vSJW3yzlVxAMiLCq5gDA7T6AOIt/mrsj3wk
 jBY7nks2cDLcQGJ4d+++S4ZiZyvI3CqC8/qIeDzy2W9ghh8KL7NX2CohuMTMH/owMLng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=; b=YslRkiBc4l4Mew70wfCqfl+6wd
 hZqaedjmeGizks/81qdFYSIcdx48HftRwDwW7I3O1h/B1OoUJjY8nY8KiXCHRdAQPQcYqoQd5pmYD
 atJhIfm8E7K/MIY033QQTih6+Ya0g+RpTkI3YwpkXxqcpjK5muL2WsaADV++j38DyUmc=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFUMh-0004Rg-EV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 09:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776851956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=;
 b=QOu1lDi6VUFBgOsXhgnJG+Df4lJek8huCUy/k3Qh9pCXS+3ZUh/+cwNQ3X5qJRWw6TJYHn
 uWi9XX6eTozNyQFR8VshXHDw90Oc9b611BG/TKQqMECUGC+An/bshBFsC6M/NtoAvr505j
 bsUpA1Hk0uUiuUpv7YBycMCbfRvswbg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-iuBVugmdOKylQmthttU0sg-1; Wed, 22 Apr 2026 05:59:14 -0400
X-MC-Unique: iuBVugmdOKylQmthttU0sg-1
X-Mimecast-MFC-AGG-ID: iuBVugmdOKylQmthttU0sg_1776851954
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48a55d82e0eso11243005e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Apr 2026 02:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776851954; x=1777456754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVpt6cL/XFUpoSbUgEFsp9E/b8gj4ghVTxVOycpPEPQ=;
 b=GYPLSGnV8QO4lkKb+VNlA3o7uw8eANTu9LyMxyvYFjjYq+0m81UjYLsFYJA38RJmxg
 UIAXdtyoeHgXLG1kRVUz/W99NLcTSIa5K1FbB1GyFsqV95dhmNOQ+I7RuNrukiPbO1p1
 VBi7T1PhTkz9UrfsRX2T9G2WdZBQgfm7tc+wa+2mW9iYSmo6Soy092AL71f21ANRDOBR
 pPJbC6L20smYePoskaGohVxqWIZkXZg6b/PRzdoLxCqrcUN2cssaSAv0WXjDOv0ehZY4
 iY1C9WA5HdBle9Cy+UXo5V2cLkLfFQqzraDONWQAOJHxqCyq39Jgb2+7hAuv8uVRQkN5
 COaw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2LYxW/M7L8DA7lKbTdsQ3zg9zlilsV6chX86kY9IhQtx3EDeECnrNuQXsWFeSkZmxZDKaib4nfzQmqIU4A5Wi@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxY2dzzrO/UK2E3ClUjHFGBzgoiU5GXUdzbeS9ehbhxG1xAfD/a
 TalTc1XiuPYU/KeRGfqXt244Sp5VFsFnhBxJS/nYWo6aTUh6z7jju+HqpWbFsQi7TbQWkfQwJw1
 Sh1DwbCvF5DSZGw1m1zSGyCX81r9sD0zmYpmfnM1HWDm6WhiPFAMWCA4wSLxMe9wWtqrF+gugYq
 sTUw==
X-Gm-Gg: AeBDievjz7BImuONIxuj2qtK+ZUGMC7lZc5Snt3+5WZcfM6V1hjExzMVtt9z9CC3MwP
 oHrl2WvCYWAMQkIcx1BvVvAbfanP0hNKX3Rl/CexZeeSirqPtuFik3+lnMZRO+nRzFU1ZVNle4g
 XOsl1TCNpZ94JPMhjDHVBF3xr5C8L9XqXoLJDDIc3GR/xBMKNVI9A7PSS4lk+OXYeEUKNGpnq/q
 du6ZhJif3XINoZapADntJ1FwR8hPOAuWRiMQNYxnfGQCB8GRAJPlyWhPdaW+fLP16xc8kH4gOIV
 xp2hKCqrmEkhl8ennTeRSRN5e8TFqkaWWmOdg78M7d5QvQABUnQjAsVXI9vAnckrhOyp9AdvlM7
 EszqUN2aOlMY8pMurDuXhKA==
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id
 5b1f17b1804b1-489149afa2bmr214250945e9.27.1776851953570; 
 Wed, 22 Apr 2026 02:59:13 -0700 (PDT)
X-Received: by 2002:a05:600c:8b8a:b0:489:149a:f9e7 with SMTP id
 5b1f17b1804b1-489149afa2bmr214250425e9.27.1776851953134; 
 Wed, 22 Apr 2026 02:59:13 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc5e3f4sm222129625e9.2.2026.04.22.02.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 02:59:12 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:59:11 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <gpmgtg2wkoo4vozzaaouhdp2df6zlifwi6gy4jvq7xc22zo7om@t3f2bl374nlr>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260420114714.1621982-4-aalbersh@kernel.org>
 <20260421214457.GC37143@quark>
MIME-Version: 1.0
In-Reply-To: <20260421214457.GC37143@quark>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f07yq0_UxsDwtyL3_aSL5gZLYT4RRDetuisfPc4ErFc_1776851954
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-04-21 14:44:57, Eric Biggers wrote: > On Mon, Apr
 20, 2026 at 01:46:50PM +0200,
 Andrey Albershteyn wrote: > > int ovl_ensure_verity_loaded(const
 struct path *datapath) > > { > > struct inode * [...] 
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFUMh-0004Rg-EV
Subject: Re: [f2fs-dev] [PATCH v8 03/22] ovl: use core fsverity ensure info
 interface
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
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>,
 djwong@kernel.org, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:aalbersh@kernel.org,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net,lst.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 46D1944457A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-21 14:44:57, Eric Biggers wrote:
> On Mon, Apr 20, 2026 at 01:46:50PM +0200, Andrey Albershteyn wrote:
> >  int ovl_ensure_verity_loaded(const struct path *datapath)
> >  {
> >  	struct inode *inode = d_inode(datapath->dentry);
> > -	struct file *filp;
> >  
> > -	if (!fsverity_active(inode) && IS_VERITY(inode)) {
> > -		/*
> > -		 * If this inode was not yet opened, the verity info hasn't been
> > -		 * loaded yet, so we need to do that here to force it into memory.
> > -		 */
> > -		filp = kernel_file_open(datapath, O_RDONLY, current_cred());
> > -		if (IS_ERR(filp))
> > -			return PTR_ERR(filp);
> > -		fput(filp);
> > -	}
> > +	if (fsverity_active(inode))
> > +		return fsverity_ensure_verity_info(inode);
> 
> Not sure whether I should review this version or the version in git, but
> both seem wrong.  

Sorry, I forgot to push, this one is the latest, the one on git is
v7. I will push v8 now.

> The 'if (!fsverity_active(inode) && IS_VERITY(inode)) {' condition
> should stay

Why? With recent changes, the fsverity_active() now checks for
IS_VERITY() instead of verity_descriptor.

> , but fsverity_ensure_verity_info() will need to
> gain a !CONFIG_FS_VERITY stub to fix the build error.

With "if (fsverity_active(inode))" I think this is not necessary as
this fsverity_active() will be always false, and this if-case is
optimized.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
