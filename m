Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0D2634DD3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 03:26:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxfSy-0003W3-Oc;
	Wed, 23 Nov 2022 02:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oxfSx-0003Vw-WA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 02:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=00RzDuciGC3lT3xwhCdi5LokzQVvWdDHLPqjXqGdFJg=; b=hblDelGsmGgFBzLQFTlZ2SjMsP
 DsHAxGYeNc5GwWUxi2z2b71+mQcyvwY4Rf+8mTixyxuqdfxSfvZ+pahzF4AUkzR9GBb57YyXOf+DB
 iMcYXFnS33KfiBylYSlWY051ETHE39m/g0NZl0lfHJtA4w2dCpgIqwCAl4l8/4sMm4do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=00RzDuciGC3lT3xwhCdi5LokzQVvWdDHLPqjXqGdFJg=; b=TR4mIdVNKRMel4ENw1yg2oUNIe
 UVsrR5TqsT6JyEAk9uayX8yV+hZC/Vf3lNkMbntawoX7cibzLA13+HJkbNhLFNY8FNDBC55xA3fG0
 lRqT1ngUf4Ogc6b9HiuzPD6nL+TM52FCcmfI3jsVvaRdtk5ba1QATJUiHBImqdZSbfd8=;
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oxfSx-00E14z-DI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 02:26:23 +0000
Received: by mail-yb1-f182.google.com with SMTP id i131so19426835ybc.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 18:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=00RzDuciGC3lT3xwhCdi5LokzQVvWdDHLPqjXqGdFJg=;
 b=XxOYWYfkLXZKqUD3n+fJDAFgrClq2Sb81DA9yBIghAtY0oN4Nicw54fBJN26uBoMAW
 CGE2l0OYqyl+K9YgzLCMSLDmPTBonACWL1AQ5Up02om+CQMp1m9X6OHp2UQGg1ZoJNDm
 Gzk4QLk6AWIvfTz+i+IWzkn7gG94jmKX0BAJI/VKczV+onDlpPyEZSVe/XX5/qoS8r5i
 zF9LRUyS0/9vEXBOXQuIV3vLk6ajTk73xwa83CRhfT7AyZQkEQulpme3Z+a++WxExI0e
 TCDYAL/8MldvAoBL6L6IFvTle63L4kzodOdmgc8aEoxGPbGRslThdQ2XdvF6Rwm561RZ
 zJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00RzDuciGC3lT3xwhCdi5LokzQVvWdDHLPqjXqGdFJg=;
 b=ukKlfURg5/vNuhaYy9u/LNAYf6a1KbiAYuTBN826WYHZNJ2KuKt27ppLtnuBXHxvRX
 MSuKym++nyCGIaqPWu0jjZZqZSI/ihqSkJ7zFoYMLWBwl1dxuK4aAdb6rVPT8NQShXd9
 nwFlsvDhCjwekQovBxL9SjDo049lbUeY9QMEMgCAMgfK+f2SgxJagq8P/ZTOuK1n+vCH
 YgccfSvm+yjz5ZhjRMNoAPwoLz+Y49VIH/DvIWWP8E0ZuqdMdfjXcHyP5IOqETJGxUiD
 Cbuytr9a7/oGKDSXSAMzfUNhVcsrlauc4MtIXy6tcsF31yt+EPA3e8kxv38z3abfa8nB
 jiLg==
X-Gm-Message-State: ANoB5pmnySSrHMY2Gcier4+xn194n7mhmHr+6pRa+ah7+UsJjZwMINV3
 EXNUjah6dyH4nucDOUZp6a76m2EnOz2j+9ntSGI=
X-Google-Smtp-Source: AA0mqf477e8qpxV1bYLLR0R8Ks97SHy8PTkHSXaEkM6HfXKb5dxC5qoWucYbvDF6OuQ91KCwyLIaUcmFQhpCw1GYqmA=
X-Received: by 2002:a25:e70f:0:b0:6ef:aa80:9083 with SMTP id
 e15-20020a25e70f000000b006efaa809083mr2100761ybh.407.1669170377646; Tue, 22
 Nov 2022 18:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-15-vishal.moola@gmail.com>
 <9c01bb74-97b3-d1c0-6a5f-dc8b11113e1a@kernel.org>
 <CAOzc2pweRFtsUj65=U-N-+ASf3cQybwMuABoVB+ciHzD1gKWhQ@mail.gmail.com>
In-Reply-To: <CAOzc2pweRFtsUj65=U-N-+ASf3cQybwMuABoVB+ciHzD1gKWhQ@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 22 Nov 2022 18:26:05 -0800
Message-ID: <CAOzc2pzoG1CN3Bpx5oe37GwRv71TpTQmFH6m58kTqOmeW7KLOw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 14, 2022 at 1:38 PM Vishal Moola wrote: > > On
 Sun, Nov 13, 2022 at 11:02 PM Chao Yu wrote: > > > > On 2022/10/18 4:24,
 Vishal Moola (Oracle) wrote: > > > Converted the function to use [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.182 listed in wl.mailspike.net]
X-Headers-End: 1oxfSx-00E14z-DI
Subject: Re: [f2fs-dev] [PATCH v3 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 14, 2022 at 1:38 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>
> On Sun, Nov 13, 2022 at 11:02 PM Chao Yu <chao@kernel.org> wrote:
> >
> > On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> > > Converted the function to use a folio_batch instead of pagevec. This is in
> > > preparation for the removal of find_get_pages_range_tag().
> > >
> > > Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
> > > of pagevec. This does NOT support large folios. The function currently
> >
> > Vishal,
> >
> > It looks this patch tries to revert Fengnan's change:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01fc4b9a6ed8eacb64e5609bab7ac963e1c7e486
> >
> > How about doing some tests to evaluate its performance effect?
>
> Yeah I'll play around with it to see how much of a difference it makes.

I did some testing. Looks like reverting Fengnan's change allows for
occasional, but significant, spikes in write latency. I'll work on a variation
of the patch that maintains the use of F2FS_ONSTACK_PAGES and send
that in the next version of the patch series. Thanks for pointing that out!

How do the remaining f2fs patches in the series look to you?
Patch 16/23 f2fs_sync_meta_pages() in particular seems like it may
be prone to problems. If there are any changes that need to be made to
it I can include those in the next version as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
