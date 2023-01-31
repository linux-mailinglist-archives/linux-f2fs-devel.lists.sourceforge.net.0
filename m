Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE968389B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 22:27:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMyAV-0002by-FQ;
	Tue, 31 Jan 2023 21:27:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1pMyAT-0002bs-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 21:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AzK7zbHqMHdeBmanV3yZyUjocxSjOS0P2zK4GlPV5fg=; b=KnWU31hSYW0wn3CeRgz2+NBkok
 yi5j0/t+cq0yXuCTBkUkg97WznqVshXjL6jQsDN0rkRSoZ4VMqiE6uv2t6tdc+zjOmloP9DTApHqN
 dTU9r+uYW8CCH4psKDVOjCEZeEHfDHaTdmqXRkVWu7HyipePwjD6qjAbwszSscFqIOKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AzK7zbHqMHdeBmanV3yZyUjocxSjOS0P2zK4GlPV5fg=; b=GclA5xlPa+TIXgDOgg0c0BaZo7
 5aPKBxV7/CBf2MJYLAg0F9udv0+oew5DXg+/dmdYnvPMNR2M0HrvPbl6+d47daPwUHdCBc+HTj8Yc
 8QV6N2Xn2ObgiJU6otU9FnNppfcwb7omi/c70hd3xB4pyXS5PAau7rIOd3G00LV0HtcE=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pMyAR-00026X-6s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 21:27:52 +0000
Received: by mail-pf1-f171.google.com with SMTP id g9so11195693pfo.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 13:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=AzK7zbHqMHdeBmanV3yZyUjocxSjOS0P2zK4GlPV5fg=;
 b=D6wvD2En7fL/J4jxZGOIQBNq1r2srmO4HOmSSPNUtrliYfnfu+LBoGk5BxIcMiuq2I
 +zwJ+mRwxgYtBtoDsGT1p7nE5JifYqFUf8hP1sgEtkOKyHfWhW4umWi9ewBl4h6lpann
 1FKRMTut+C+QYs/Mg9T/XGdMWHxAvc4vm7coGsd3WvOgoQt73PDTLpV3MfO+X+lC2HD/
 QNpAi6vLbe5SEo1NIxJIxqYOYG4hgDKEIE7e8sbyQhb8Yes6j5hPRgz/GjUPNoMDssZL
 IfTNvheB70L2NHCzBcWcOzJp3YlrWN80ciuNtnhhN2fCo38Ky5KInmRB9oeQm46P5CX+
 WVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AzK7zbHqMHdeBmanV3yZyUjocxSjOS0P2zK4GlPV5fg=;
 b=bWR6Kw3gfPGYmpwRXoW/B3pLsKa0Qni/gEOTu09Myq16IOybNZeC8ejKvyV9P8HgYk
 ZrDF6E44dusX+04dr0e+s/pjiZAwJzMDmznYkrkKI5+cA56401rh2oD2m5q88JHy6QQV
 Pey39bvhuQBt8NlFtdGrh+5EcOsZyci0YP9Up7CMHRSKXa0EAtMn2dWL5C2DexXxezog
 Bdk9KpsQvgDOdhhoArFpepBZlgTdiHC5t60TDP0Q7yLtawu+/2b32wiXvuiiAT6PLn8k
 x/HO9UoaTJ53l3PJFh/S2+x7KvFWQbjIw8AOUmpnC1GCHw0kZpcFYF1Mcm2TOusAE42r
 X3gA==
X-Gm-Message-State: AO0yUKUEp0CNM5aFNUkRuQ2tbz6g4qtfKfD1IDdohwEne0D+0Q4Jt65J
 CBNlvNtXzjlGY09WTvLfRPo=
X-Google-Smtp-Source: AK7set+AB9728U0/MEi1UBcwr36wg/R1RBbFv281U6594rkVfdnrCQy9OnZENcOw/xOdf9mhMZ4riA==
X-Received: by 2002:a62:7b0e:0:b0:593:a131:3692 with SMTP id
 w14-20020a627b0e000000b00593a1313692mr4489pfc.13.1675200466095; 
 Tue, 31 Jan 2023 13:27:46 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::5:1ad6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a62e90e000000b00590684f016bsm9913968pfh.137.2023.01.31.13.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 13:27:45 -0800 (PST)
Date: Tue, 31 Jan 2023 11:27:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y9mH0PCcZoGPryXw@slm.duckdns.org>
References: <20230129121851.2248378-1-willy@infradead.org>
 <Y9a2m8uvmXmCVYvE@sol.localdomain>
 <Y9bkoasmAmtQ2nSV@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9bkoasmAmtQ2nSV@casper.infradead.org>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Sun, Jan 29, 2023 at 09:26:57PM +0000,
 Matthew Wilcox
 wrote: > > > diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c > > > index
 e78be66bbf01..a4e76f96f291 100644 > > > --- a/fs/crypto/crypto.c [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pMyAR-00026X-6s
Subject: Re: [f2fs-dev] [PATCH] fscrypt: Copy the memcg information to the
 ciphertext page
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, cgroups@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Sun, Jan 29, 2023 at 09:26:57PM +0000, Matthew Wilcox wrote:
> > > diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> > > index e78be66bbf01..a4e76f96f291 100644
> > > --- a/fs/crypto/crypto.c
> > > +++ b/fs/crypto/crypto.c
> > > @@ -205,6 +205,9 @@ struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
> > >  	}
> > >  	SetPagePrivate(ciphertext_page);
> > >  	set_page_private(ciphertext_page, (unsigned long)page);
> > > +#ifdef CONFIG_MEMCG
> > > +	ciphertext_page->memcg_data = page->memcg_data;
> > > +#endif
> > >  	return ciphertext_page;
> > >  }
> > 
> > Nothing outside mm/ and include/linux/memcontrol.h does anything with memcg_data
> > directly.  Are you sure this is the right thing to do here?
> 
> Nope ;-)  Happy to hear from people who know more about cgroups than I
> do.  Adding some more ccs.
> 
> > Also, this patch causes the following:
> 
> Oops.  Clearly memcg_data needs to be set to NULL before we free it.

These can usually be handled by explicitly associating the bio's to the
desired cgroups using one of bio_associate_blkg*() or
bio_clone_blkg_association(). It is possible to go through memcg ownership
too using set_active_memcg() so that the page is owned by the target cgroup;
however, the page ownership doesn't directly map to IO ownership as the
relationship depends on the type of the page (e.g. IO ownership for
pagecache writeback is determined per-inode, not per-page). If the in-flight
pages are limited, it probably is better to set bio association directly.

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
