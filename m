Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B36534E8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 18:17:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p82j1-0002OU-RY;
	Wed, 21 Dec 2022 17:17:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1p82iy-0002OO-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 17:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obPoXeoGwnXe5CqGdFwqw1lMSLFBWN5B3Ufm/DPfw6U=; b=B/kVfKKnTtC2GEGQemStuKTJkW
 DhF09cG2BD0aMgaxs5jUZqxlyoDXyLur/JY/Qv6xQHbhX9NNg/oHnlvVEtT65eLdRWo2US7efVuue
 hnGWytG7ic2Cjf+SXUea4jD/muANpGXd26px51AU98nlziHXyuZDKrZuvtY64Xeq+wZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=obPoXeoGwnXe5CqGdFwqw1lMSLFBWN5B3Ufm/DPfw6U=; b=inThDzRBXqG1+daobAqwJAupob
 T8GgQs3fvhE2rOQiYeocfJOHri6UIevYlYRRYyVbrBUVQcBj7zofGcPCPoFGDfn/Y/+ICoGG6mTLc
 3WiB+hMAlBpdFld+yhDLJraZC0kjlw/uTzjoboFGHsCYyF+fVs6UpHsoia9R4OuG2GsA=;
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p82ix-006rMS-MF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 17:17:48 +0000
Received: by mail-yb1-f174.google.com with SMTP id e141so17246038ybh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 09:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=obPoXeoGwnXe5CqGdFwqw1lMSLFBWN5B3Ufm/DPfw6U=;
 b=hBa2jQX+YX2How1HUjfStPdAV3ULq0M3X5sJVB0HPxl6WZtflb+yvVtaXKtIe03h11
 +tRUjiQl40NP+Na+qEt+ivcTx3vCoCewMUDQAaodyaKBDxh4if2ET1+dtz0F0pATAs5/
 +L4mco6VjT9x0iMoCnAkAkKUUKBfJPLV9gTwyqtrELDs7Y/weYhOLvFaP1C2bEOKjOtx
 ElNFX9E77xkLUqa81LUSQpLxsk9xGe2PR9HlZHkUYhvnxezZOzV18ENSfyIlqO2YKoah
 t421pTE9AJrZBgwKlx+QP1h0rrSizVfLngo4/ai8yZDwTdjCNkvxsGhYXECd+YjUOm/x
 WSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=obPoXeoGwnXe5CqGdFwqw1lMSLFBWN5B3Ufm/DPfw6U=;
 b=pa5JEkbfKrN0VqiB2XsIy4/ZHzlGsG62zlxpInzkSTxCRIAJXc0T3CAQY+xDBtbgCo
 HMViNxuhEYV/Fcax26czgPLbfHcz4hY2ZiHHagOph1EwI2nhQN+YMPKhdZxMr8NxnkIG
 +PnM5FJmi129wPIabmtFkvPoOPAh+S9EPVzcK4/YOnb4pszt5sQFM4r+JNX4nmI8Pe0v
 wi0jHP6s/7UODvKJ0QZLx2iHJNHgO/GIuzDDxHviRjbp0qOmDiZgIqi6Ln4c9/2q5d4P
 Tc/nvWPGX/oKbctbiYJa1wzs7xha6xkzbuQpRbwJA67ZS1xCu60oeFO8i2nknR9zKpPI
 UROQ==
X-Gm-Message-State: AFqh2kotAAYyiWVBmppLa6LcdV7rg1sefUQ+eU63DVrUoySyDzKrYLwg
 YHoxF2XWwNQOxPBZOKmuP5Y0pLguSmoIbqSJfO4=
X-Google-Smtp-Source: AMrXdXtveEC2+hgy7ihrRHqxFTx3SQ7hEr55PWvD3HSbqv1EZNCaA/UJLaeerK30Q6U0Ho5qcXvBgkxSvXY5yoOTtr0=
X-Received: by 2002:a25:dd83:0:b0:758:65d6:915f with SMTP id
 u125-20020a25dd83000000b0075865d6915fmr188536ybg.582.1671643061860; Wed, 21
 Dec 2022 09:17:41 -0800 (PST)
MIME-Version: 1.0
References: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
 <20221212191317.9730-1-vishal.moola@gmail.com>
 <6770f692-490e-34fc-46f8-4f65aa071f58@kernel.org>
 <Y5trNfldXrM4FIyU@casper.infradead.org>
In-Reply-To: <Y5trNfldXrM4FIyU@casper.infradead.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Wed, 21 Dec 2022 09:17:30 -0800
Message-ID: <CAOzc2pzoyBg=jgYNNfsmum9tKFOAy65zVsEyDE3vKoiti7FZDA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 15, 2022 at 10:45 AM Matthew Wilcox wrote: > >
 On Thu, Dec 15, 2022 at 09:48:41AM +0800, Chao Yu wrote: > > On 2022/12/13
 3:13, Vishal Moola (Oracle) wrote: > > > +add_more: > > > + page [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.174 listed in wl.mailspike.net]
X-Headers-End: 1p82ix-006rMS-MF
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: Convert f2fs_write_cache_pages()
 to use filemap_get_folios_tag()
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
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 15, 2022 at 10:45 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Dec 15, 2022 at 09:48:41AM +0800, Chao Yu wrote:
> > On 2022/12/13 3:13, Vishal Moola (Oracle) wrote:
> > > +add_more:
> > > +                   pages[nr_pages] = folio_page(folio,idx);
> > > +                   folio_ref_inc(folio);
> >
> > It looks if CONFIG_LRU_GEN is not set, folio_ref_inc() does nothing. For those
> > folios recorded in pages array, we need to call folio_get() here to add one more
> > reference on each of them?
>
> static inline void folio_get(struct folio *folio)
> {
>         VM_BUG_ON_FOLIO(folio_ref_zero_or_close_to_overflow(folio), folio);
>         folio_ref_inc(folio);
> }
>
> That said, folio_ref_inct() is very much MM-internal and filesystems
> should be using folio_get(), so please make that modification in the
> next revision, Vishal.

Ok, I'll go through and fix all of those in the next version.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
