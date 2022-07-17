Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C957751A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 10:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCztp-0004rh-81; Sun, 17 Jul 2022 08:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fmdefrancesco@gmail.com>) id 1oCzti-0004rX-ID
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 08:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ng6rzazS6Tk6UvbQ3R5jjWEIXMg8N4bQvPfxnlyfNbo=; b=ag14R5sbsyKk9hvyaLHD2pK3sb
 vrjtv0jaCbR2Pd6N2RqG97Zqrq9MUAuy1vIPFQtX4dFMb01g7hu+M7UptI0ZC0eu/dOo4Nyl0Cg9L
 ujDe8z2jMTrk5bwwr/HfihECZBYWxKg6urRGxyi0maO1MQjnayXrdWqD6WAzC7q62am4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ng6rzazS6Tk6UvbQ3R5jjWEIXMg8N4bQvPfxnlyfNbo=; b=WMlJ8zuOcvVxlaZA5I2mJWf22E
 nnS3r7BiuElNTgifMTjpIwwozoA8nC63N/7i5icB538lvw4fXGJh9dbnYcWg7LuPwWKPkB5ij1AfP
 0degBu3ChHSPQD+3h5z8ToHpva87S750AANdnVU8DHr+EGGMshrwp/1rO1IqTJZEPUgw=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oCzti-0007Kc-GZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 08:45:07 +0000
Received: by mail-wr1-f50.google.com with SMTP id z12so12829992wrq.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ng6rzazS6Tk6UvbQ3R5jjWEIXMg8N4bQvPfxnlyfNbo=;
 b=CmxKx+nQvad3HTpNlJ+avnudMtN9Xm9fUthF9bwqnIyq4X2u5I1j5jJ291kh14HPOX
 hWcHS0gJKQyuWaTG8JR5BewIbjlvCzHQUf9ThjOi9vax59L8X7IOHcOnSUcUmO++MWMQ
 rw0hSi1NyV6t0l8nVrcpGoQs0DnW3cD58YkAc+YKINqm4+bqKGD3JyIxKM6E+FjkNO0L
 NAF04D/Rb9NJkS9CjbdJYHWw6uZT2ZXWJMiaHOHRGS76ccA+NqDeSftnSBQ6kojdeQeC
 RAXTnf7+jwyc1ff8/awsOdy71tRoHnTecbTPgwg3u+Oc46bithtxnCI30Q3QVbbAJrr9
 fMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ng6rzazS6Tk6UvbQ3R5jjWEIXMg8N4bQvPfxnlyfNbo=;
 b=vLWd4176zjfSr9xsYZqtul2aXVR4qRJcF5GF+SHRt8Qetfx0HhaXRQfS6jdIfFGEz4
 RNkKTjKMvJKhTm6V8Y76+23hXX7pC72RExK+t6fbFzBHsm9Nm+CSRxl4MVO9pnmJBtRj
 LKex97aztGDaEmvsIueN58AFaJiEF9BABix+sINqqxRSL15TjV6/o0cPXpdVC70n/GGr
 8iy/HjyDktt0ddLKRMdRncCfG1ArErDwz3TAUrZ1dcWaT60s5cCfA3tSELHVyvYhWcIc
 peCcnSwdrbUSxYUIeKojkMXp3D+5f5bNi7CPxs5ie5mam1cmnsQ2cuAlVYjp5XMVh88f
 vzFQ==
X-Gm-Message-State: AJIora/WOpHgmxE2s7Qek3rk3zyIIN/rC8q5OC5DSOMHOcIJinkBQzrO
 FE733/4D+TkDQwlQl+Z9Gl8=
X-Google-Smtp-Source: AGRyM1tlcDXmc2ygbyHwkdkHRrUNbu0SA9UGzRD63/Giacky8V4oJwhQ/b+B6fBr0vh5CYemqnykiQ==
X-Received: by 2002:a05:6000:508:b0:21d:4105:caf9 with SMTP id
 a8-20020a056000050800b0021d4105caf9mr19435437wrf.699.1658047500076; 
 Sun, 17 Jul 2022 01:45:00 -0700 (PDT)
Received: from opensuse.localnet (host-95-235-102-55.retail.telecomitalia.it.
 [95.235.102.55]) by smtp.gmail.com with ESMTPSA id
 f2-20020a1c6a02000000b003a2e89d1fb5sm14360941wmc.42.2022.07.17.01.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 01:44:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Sun, 17 Jul 2022 10:44:57 +0200
Message-ID: <4431767.LvFx2qVVIh@opensuse>
In-Reply-To: <YtOyWOKFN9ramUyb@infradead.org>
References: <20220716204353.22049-1-fmdefrancesco@gmail.com>
 <YtOyWOKFN9ramUyb@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On domenica 17 luglio 2022 08:55:20 CEST Christoph Hellwig
 wrote: > On Sat, Jul 16, 2022 at 10:43:53PM +0200, Fabio M. De Francesco
 wrote: > > static inline void f2fs_copy_page(struct page *src, struc [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oCzti-0007Kc-GZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use memcpy_page() in f2fs_copy_page()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Nick Terrell <terrelln@fb.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On domenica 17 luglio 2022 08:55:20 CEST Christoph Hellwig wrote:
> On Sat, Jul 16, 2022 at 10:43:53PM +0200, Fabio M. De Francesco wrote:
> >  static inline void f2fs_copy_page(struct page *src, struct page *dst)
> >  {
> > -	char *src_kaddr = kmap(src);
> > -	char *dst_kaddr = kmap(dst);
> >  
> > -	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > -	kunmap(dst);
> > -	kunmap(src);
> > +	memcpy_page(dst, 0, src, 0, PAGE_SIZE);
> 
> Please remove f2fs_copy_page entirely and open code this in the only
> caller.
> 
I've changed the subject of the new patch, therefore we won't have a second 
version of this:

"f2fs: Delete f2fs_copy_page() and replace with memcpy_page()" is at
https://lore.kernel.org/lkml/20220717083613.3861-1-fmdefrancesco@gmail.com/

Thanks for your suggestion,

Fabio




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
