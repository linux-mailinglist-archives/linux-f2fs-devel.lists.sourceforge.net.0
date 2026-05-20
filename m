Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFXdGnqwDWpy1gUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 15:00:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF9058E63F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 15:00:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2QkrZ+fjh1Js3xPsKGeEZCdm3beDCEcbANfPAmMkYA=; b=Qy+7ovduCwyeh9mTwpSpuG0ycv
	Uf9ZaUttJ2NURhOZbE7xT4givehmAjAe2rpvMzu0XSOQYYlil6rI5PP5RJz2609i93Xlo9LhAqwr8
	awpwbzFrBdyZQjyf3vo7BsEsZiTMLKVxEjFZcub7bldteQdNlrUMe/fMk8aTjlWCxvpQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPgXL-0000sC-QX;
	Wed, 20 May 2026 13:00:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wPgXA-0000kc-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 13:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ClG4/C+5mYq+t59LC5XHz2fpJbwcGP5l3m4ymgEXWGM=; b=VKkc/WdNH7pdN5F9IlhpZlrUuU
 G0sH+ssoR3RWjc54cb6A7TUHPLCIE9Rf5s9eDlkFXq3jDC6mhYhjgYhZPdDsv5+eSIdavRHOqwi+x
 8t7iUNYV9kE1fNqqte0PMPApb5rwG4iWDCV131L4KahZ85rINgKrIiBeVvycB8uyMl68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ClG4/C+5mYq+t59LC5XHz2fpJbwcGP5l3m4ymgEXWGM=; b=k8VyOdZre0f30ktmc6fdBxkt/X
 ryTmTnOywk+pcy7Y//b8PRHFfFoOfOhwbfNXf/fsOMo37LEAVhGFOyhw1tNOlJbIL82HnPWg8erqK
 x0iXoMWBIJAipoWfccwhouEI3GdKhBNdds3hRYb3KuHWtTzOcSB/5CNuyWM+0/cfxSUs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPgX3-00086o-Av for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 13:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2604660126;
 Wed, 20 May 2026 13:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCC31F000E9;
 Wed, 20 May 2026 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779282006;
 bh=ClG4/C+5mYq+t59LC5XHz2fpJbwcGP5l3m4ymgEXWGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Ti+uanOk1Mddxg6MKm+ncOXW/DoVwhy9VmgC3mCcz8cQuS+PwtF9TGv1Y6HZO9dlY
 HsWVLD+oYLtIBrmd5/6qgK9p4k3cii8fQKC7nkEQ1a2xqCUZrXTK8bCfGPYnHGlHDv
 HbWdWMEaCyD/mchbv+/sQT+iKYUIe895dfHoK/Mn0PZDO8XDY1IyM6rvHBPzoKm7Nf
 SYNOb7o9Eq7VgjkES2e+MsC4ThxtpDVkMsXJPrYkChycGfa0xR07MlaQYCiM1D/4j2
 4zr2JyovgsoxabqZ+wfeOemswpAVRNJa8R0F/u9tqqZ0p8ggmMO8a6Pb6pGWCx19GZ
 eOUC0vBeti5cQ==
Date: Wed, 20 May 2026 15:00:01 +0200
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org, amir73il@gmail.com
Message-ID: <oqipgmsueopp53xpegpvjgff3mac5npn6llwxz6l2cudfl5kwv@6fyn6qxr72eo>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260520123722.405752-4-aalbersh@kernel.org>
 <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <n67pde3prjxt2c2u2pvjytfw7uzwbeij2yljlrwh7fixcgnzhp@piqsltgpcc4v>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > the last patch missing a review oh sorry, the 04 patch is
 also one without -- - Andrey 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wPgX3-00086o-Av
Subject: Re: [f2fs-dev] [PATCH v10 03/22] ovl: use core fsverity ensure info
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
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: djwong@kernel.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.linux.dev,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:amir73il@gmail.com,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 0EF9058E63F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> the last patch missing a review

oh sorry, the 04 patch is also one without

-- 
- Andrey


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
